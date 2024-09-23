@implementation NMSSyncManager

+ (NMSSyncManager)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_13);
  return (NMSSyncManager *)(id)sharedManager_sharedManager;
}

void __31__NMSSyncManager_sharedManager__block_invoke()
{
  NMSSyncManager *v0;
  void *v1;

  v0 = objc_alloc_init(NMSSyncManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (NMSSyncManager)init
{
  NMSSyncManager *v2;
  NMSSyncManager *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *syncProgressInfoByAssetType;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NMSSyncManager;
  v2 = -[NMSSyncManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NMSSyncManager _defaultProgressInfoDict](v2, "_defaultProgressInfoDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    syncProgressInfoByAssetType = v3->_syncProgressInfoByAssetType;
    v3->_syncProgressInfoByAssetType = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__updateSyncProgress, *MEMORY[0x24BDDBCF0], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__updateObservedSyncSession, *MEMORY[0x24BE03970], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__handleSyncStateDidChangeNotification, CFSTR("com.apple.nanomusicsync.sync-state"), 0);
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginGeneratingLibraryChangeNotifications");

    -[NMSSyncManager _updateObservedSyncSession](v3, "_updateObservedSyncSession");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endGeneratingLibraryChangeNotifications");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)NMSSyncManager;
  -[NMSSyncManager dealloc](&v5, sel_dealloc);
}

- (id)_defaultProgressInfoDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("Music");
  -[NMSSyncManager _defaultSyncProgressInfoForAssetType:](self, "_defaultSyncProgressInfoForAssetType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("Podcast");
  -[NMSSyncManager _defaultSyncProgressInfoForAssetType:](self, "_defaultSyncProgressInfoForAssetType:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("Audiobook");
  -[NMSSyncManager _defaultSyncProgressInfoForAssetType:](self, "_defaultSyncProgressInfoForAssetType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_defaultSyncProgressInfoForAssetType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAssetType:", v4);
  objc_msgSend(v5, "setAggregateAssetItemBytesAdded:", -[NMSSyncManager _aggregateAssetItemBytesAddedForMediaType:](self, "_aggregateAssetItemBytesAddedForMediaType:", objc_msgSend((id)objc_opt_class(), "_mediaTypeForAssetType:", v4)));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Music")))
  {
    +[NMSMediaPinningManager sharedManager](NMSMediaPinningManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("com.apple.NanoMusic");
LABEL_7:
    objc_msgSend(v6, "downloadInfoForBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfAssetItems:", objc_msgSend(v9, "totalItemCount"));

    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Podcast")))
  {
    +[NMSMediaPinningManager sharedManager](NMSMediaPinningManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("com.apple.podcasts");
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Audiobook")))
  {
    +[NMSMediaPinningManager sharedManager](NMSMediaPinningManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("com.apple.NanoBooks");
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v5, "setNumberOfAssetItemsSynced:", objc_msgSend(v5, "numberOfAssetItems"));

  return v5;
}

- (id)_tracksQueryWithPredicate:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BE6B1F8];
    v4 = (void *)MEMORY[0x24BE6B1D0];
    v5 = a3;
    objc_msgSend(v4, "autoupdatingSharedLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unrestrictedAllItemsQueryWithlibrary:predicate:orderingTerms:", v6, v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_addedTracksPredicateForMediaType:(unsigned int)a3
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("com.apple.podcasts");
  if (a3 != 4)
    v6 = 0;
  if (a3 == 8)
    v6 = CFSTR("com.apple.NanoMusic");
  v7 = v6;
  +[NMSMediaPinningManager sharedManager](NMSMediaPinningManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadInfoForBundleIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__NMSSyncManager__addedTracksPredicateForMediaType___block_invoke;
  v13[3] = &unk_24D647548;
  v14 = v5;
  v10 = v5;
  objc_msgSend(v9, "enumerateMediaItemsUsingBlock:", v13);

  -[NMSSyncManager _tracksPredicateWithPersistentIDs:](self, "_tracksPredicateWithPersistentIDs:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __52__NMSSyncManager__addedTracksPredicateForMediaType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "mediaLibraryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "mediaLibraryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)_addedTracksQueryForMediaType:(unsigned int)a3
{
  void *v4;
  void *v5;

  -[NMSSyncManager _addedTracksPredicateForMediaType:](self, "_addedTracksPredicateForMediaType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSyncManager _tracksQueryWithPredicate:](self, "_tracksQueryWithPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_estimatedAssetAggregateItemSizeInBytesWithQuery:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "valueForAggregateFunction:onEntitiesForProperty:", *MEMORY[0x24BE6B120], *MEMORY[0x24BE6B158]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unint64_t)_aggregateAssetItemBytesAddedForMediaType:(unsigned int)a3
{
  void *v4;
  unint64_t v5;

  -[NMSSyncManager _addedTracksQueryForMediaType:](self, "_addedTracksQueryForMediaType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NMSSyncManager _estimatedAssetAggregateItemSizeInBytesWithQuery:](self, "_estimatedAssetAggregateItemSizeInBytesWithQuery:", v4);

  return v5;
}

- (id)_assetTypeForMediaType:(unsigned int)a3
{
  if (a3 - 2 > 6)
    return &stru_24D648498;
  else
    return off_24D648248[a3 - 2];
}

+ (unsigned)_mediaTypeForAssetType:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcast")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Audiobook")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0xFFFFFF;
  }

  return v4;
}

- (id)progressInfoForMediaType:(unsigned int)a3
{
  void *v4;
  void *v5;

  -[NMSSyncManager _assetTypeForMediaType:](self, "_assetTypeForMediaType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSSyncManager _syncProgressInfoByAssetType:](self, "_syncProgressInfoByAssetType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)musicProgressInfo
{
  return -[NMSSyncManager progressInfoForMediaType:](self, "progressInfoForMediaType:", 8);
}

- (id)podcastsProgressInfo
{
  return -[NMSSyncManager progressInfoForMediaType:](self, "progressInfoForMediaType:", 4);
}

- (id)audiobooksProgressInfo
{
  return -[NMSSyncManager progressInfoForMediaType:](self, "progressInfoForMediaType:", 2);
}

- (void)beginReceivingSyncProgressUpdates
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE03978]);
  objc_msgSend(v2, "openDeviceMessageLink");

}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NMSSyncManager_session_willBeginSessionTask___block_invoke;
  v4[3] = &unk_24D646F30;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __47__NMSSyncManager_session_willBeginSessionTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

- (void)session:(id)a3 didBeginSessionTask:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__NMSSyncManager_session_didBeginSessionTask___block_invoke;
  v4[3] = &unk_24D646F30;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __46__NMSSyncManager_session_didBeginSessionTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

- (void)session:(id)a3 didUpdateSessionTask:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NMSSyncManager_session_didUpdateSessionTask___block_invoke;
  v4[3] = &unk_24D646F30;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __47__NMSSyncManager_session_didUpdateSessionTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

- (void)session:(id)a3 didFinishSessionTask:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NMSSyncManager_session_didFinishSessionTask___block_invoke;
  v4[3] = &unk_24D646F30;
  v4[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v4, a4);
}

uint64_t __47__NMSSyncManager_session_didFinishSessionTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

- (void)sessionWillBegin:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__NMSSyncManager_sessionWillBegin___block_invoke;
  v3[3] = &unk_24D646F30;
  v3[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v3);
}

uint64_t __35__NMSSyncManager_sessionWillBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

- (void)sessionDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__NMSSyncManager_sessionDidFinish___block_invoke;
  v3[3] = &unk_24D646F30;
  v3[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v3);
}

uint64_t __35__NMSSyncManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

- (void)_updateObservedSyncSession
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__NMSSyncManager__updateObservedSyncSession__block_invoke;
  v2[3] = &unk_24D646F30;
  v2[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v2);
}

void __44__NMSSyncManager__updateObservedSyncSession__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_stopObservingSyncSession");
  objc_msgSend(MEMORY[0x24BE03980], "sessionsWithSessionTypeIdentifier:dataClass:", *MEMORY[0x24BE03968], CFSTR("Media"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

  if (v6 != *(id *)(*(_QWORD *)(a1 + 32) + 32) && (objc_msgSend(v6, "isEqual:") & 1) == 0)
  {
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "Active sync session identifier changed (%{public}@, previously %{public}@)", (uint8_t *)&v12, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_startObservingSyncSession");

}

- (void)_stopObservingSyncSession
{
  NSObject *v3;
  ATSession *observedSession;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  ATSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    observedSession = self->_observedSession;
    *(_DWORD *)buf = 138412290;
    v16 = observedSession;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "Stopping observation of sync session: %@", buf, 0xCu);
  }

  -[ATSession removeObserver:](self->_observedSession, "removeObserver:", self);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_syncProgressInfoByAssetType, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "setNumberOfAssetItemsSynced:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "numberOfAssetItems"));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NMSSyncManager _updateSyncProgress](self, "_updateSyncProgress");
}

- (void)_startObservingSyncSession
{
  NSObject *v3;
  ATSession *observedSession;
  int v5;
  ATSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    observedSession = self->_observedSession;
    v5 = 138412290;
    v6 = observedSession;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "Starting observation of sync session: %@", (uint8_t *)&v5, 0xCu);
  }

  -[ATSession removeObserver:](self->_observedSession, "removeObserver:", self);
  -[ATSession addObserver:](self->_observedSession, "addObserver:", self);
  -[NMSSyncManager _updateSyncProgress](self, "_updateSyncProgress");
}

- (void)_invokeOnMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)_handleSyncStateDidChangeNotification
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__NMSSyncManager__handleSyncStateDidChangeNotification__block_invoke;
  v2[3] = &unk_24D646F30;
  v2[4] = self;
  -[NMSSyncManager _invokeOnMainThread:](self, "_invokeOnMainThread:", v2);
}

uint64_t __55__NMSSyncManager__handleSyncStateDidChangeNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSyncProgress");
}

+ (unint64_t)_syncStateForProgressInfo:(id)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientPinningSettingsToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncStateDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CompanionToken"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || v11 && (objc_msgSend(v8, "isEqual:", v11) & 1) != 0)
  {
    if (a4)
    {
      v12 = objc_msgSend(v6, "numberOfAssetItemsSynced");
      if (v12 < objc_msgSend(v6, "numberOfAssetItems"))
      {
        NMLogForCategory(5);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_INFO, "[SyncStatus] Asset Syncing", (uint8_t *)&v20, 2u);
        }
        v14 = 99;
        goto LABEL_18;
      }
      if (!objc_msgSend(v6, "numberOfAssetItems")
        || (v15 = objc_msgSend(v6, "numberOfAssetItemsSynced"), v15 == objc_msgSend(v6, "numberOfAssetItems")))
      {
        NMLogForCategory(5);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_216E27000, v16, OS_LOG_TYPE_INFO, "[SyncStatus] Asset Syncing done", (uint8_t *)&v20, 2u);
        }

      }
    }
    objc_msgSend(a1, "_gizmoSyncStates");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v18, "unsignedIntegerValue");

    goto LABEL_18;
  }
  NMLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Mismatched tokens; resolvedMusicSyncState & resolvedPodcastsSyncState -> pending (local: %{public}@; "
      "remote: %{public}@)",
      (uint8_t *)&v20,
      0x16u);
  }
  v14 = 2;
LABEL_18:

  return v14;
}

+ (unint64_t)_syncWaitingSubstateForProgressInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v3 = a3;
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncStateDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DetailsDict"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WaitingSubstatesByMediaType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  return v10;
}

- (id)_syncProgressInfoByAssetType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *syncProgressInfoByAssetType;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_syncProgressInfoByAssetType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_syncProgressInfoByAssetType, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setAssetType:", v4);
    syncProgressInfoByAssetType = self->_syncProgressInfoByAssetType;
    objc_msgSend(v6, "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](syncProgressInfoByAssetType, "setObject:forKey:", v6, v8);

  }
  return v6;
}

- (id)_updateProgressInfoForAssetType:(id)a3 assetItemsTotal:(int64_t)a4 assetItemsSyncedForSyncSession:(int64_t)a5 bytesToSyncTotal:(unint64_t)a6 bytesSyncedThisSyncSession:(unint64_t)a7
{
  void *v11;
  NSObject *v12;
  float v13;
  NSObject *v14;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  double v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[NMSSyncManager _syncProgressInfoByAssetType:](self, "_syncProgressInfoByAssetType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfAssetItems:", a4);
  objc_msgSend(v11, "setNumberOfAssetItemsSynced:", a5);
  objc_msgSend(v11, "setAggregateAssetItemBytesAdded:", a6);
  NMLogForCategory(5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v21 = 134218752;
    v22 = a4;
    v23 = 2048;
    v24 = a5;
    v25 = 2048;
    v26 = *(double *)&a6;
    v27 = 2048;
    v28 = a7;
    _os_log_debug_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEBUG, "numberOfAssetItems = %li,numberOfAssetItemsSynced = %li, aggregateAssetItemBytesAdded = %llu, aggregateAssetItemBytesSynced = %llu", (uint8_t *)&v21, 0x2Au);
  }

  v13 = (double)a7 / (double)(unint64_t)objc_msgSend(v11, "aggregateAssetItemBytesAdded");
  NMLogForCategory(5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v11, "aggregateAssetItemBytesAdded");
    v15 = v13;
    v21 = 134218496;
    v22 = a7;
    v23 = 2048;
    v24 = v19;
    v25 = 2048;
    v26 = v13;
    _os_log_debug_impl(&dword_216E27000, v14, OS_LOG_TYPE_DEBUG, "estimatedSyncProgress = %llu / %llu = %f", (uint8_t *)&v21, 0x20u);
  }
  else
  {
    v15 = v13;
  }

  if (v13 > 1.0)
  {
    NMLogForCategory(5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v11, "aggregateAssetItemBytesAdded");
      v21 = 134218496;
      v22 = a7;
      v23 = 2048;
      v24 = v20;
      v25 = 2048;
      v26 = v15;
      _os_log_error_impl(&dword_216E27000, v17, OS_LOG_TYPE_ERROR, "[SyncStatus] estimatedSyncProgress > 1.0, %llu / %llu = %f; pinning at 1.0",
        (uint8_t *)&v21,
        0x20u);
    }

    v13 = 1.0;
  }
  *(float *)&v16 = fmaxf(v13, 0.0);
  objc_msgSend(v11, "setEstimatedSyncProgress:", v16);
  return v11;
}

- (void)_updateSyncProgress
{
  ATSession *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  NSObject *v42;
  NSMutableDictionary *syncProgressInfoByAssetType;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  ATSession *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  id obj;
  uint64_t v54;
  _QWORD block[5];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v2 = self->_observedSession;
  -[ATSession sessionTasks](v2, "sessionTasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[ATSession sessionIdentifier](v2, "sessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = (uint64_t)v5;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "Start updating sync progress - session identifier is %{public}@", buf, 0xCu);

  }
  if (v2)
  {
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v3, "count");
      v8 = -[ATSession isCancelled](v2, "isCancelled");
      *(_DWORD *)buf = 134218240;
      v73 = v7;
      v74 = 1024;
      v75 = v8;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Num session tasks: %lu; isCancelled: %d", buf, 0x12u);
    }

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v66;
    v14 = *MEMORY[0x24BE03988];
    *(_QWORD *)&v11 = 138543362;
    v44 = v11;
    v47 = v9;
    v48 = v2;
    v45 = *MEMORY[0x24BE03988];
    v46 = *(_QWORD *)v66;
    do
    {
      v15 = 0;
      v49 = v12;
      do
      {
        if (*(_QWORD *)v66 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v15);
        if (objc_msgSend(v16, "isCancelled", v44))
        {
          NMLogForCategory(5);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v16, "sessionTaskIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v73 = (uint64_t)v18;
            _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_DEFAULT, "Task %@ is cancelled", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v16, "sessionGroupingKey");
          v52 = v15;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v14);

          v15 = v52;
          if (!v20)
            goto LABEL_29;
          objc_msgSend(v16, "properties");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("DetailedProgressByAssetType"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v51, "count"))
          {
            v50 = v17;
            NMLogForCategory(5);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v44;
              v73 = (uint64_t)v51;
              _os_log_impl(&dword_216E27000, v21, OS_LOG_TYPE_DEFAULT, "Detailed sync progress by asset type <%{public}@>", buf, 0xCu);
            }

            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v51, "allValues");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
            if (v22)
            {
              v23 = v22;
              v54 = *(_QWORD *)v62;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v62 != v54)
                    objc_enumerationMutation(obj);
                  v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("AssetType"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TotalAssetsToSync"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "integerValue");
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TotalAssetsSynced"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "integerValue");
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TotalBytesToSync"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "unsignedLongLongValue");
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("TotalBytesSynced"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = -[NMSSyncManager _updateProgressInfoForAssetType:assetItemsTotal:assetItemsSyncedForSyncSession:bytesToSyncTotal:bytesSyncedThisSyncSession:](self, "_updateProgressInfoForAssetType:assetItemsTotal:assetItemsSyncedForSyncSession:bytesToSyncTotal:bytesSyncedThisSyncSession:", v26, v28, v30, v32, objc_msgSend(v33, "unsignedLongLongValue"));

                }
                v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
              }
              while (v23);
            }

            v9 = v47;
            v2 = v48;
            v12 = v49;
            v14 = v45;
            v13 = v46;
            v15 = v52;
            v17 = v50;
          }

        }
LABEL_29:
        ++v15;
      }
      while (v15 != v12);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v12);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[NSMutableDictionary allValues](self->_syncProgressInfoByAssetType, "allValues");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v58 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(v40, "assetType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setNumberOfAssetItemsNeedingDownload:", -[NMSSyncManager _numberOfItemsNeedingDownloadForAssetType:](self, "_numberOfItemsNeedingDownloadForAssetType:", v41));

        objc_msgSend(v40, "setSyncState:", objc_msgSend((id)objc_opt_class(), "_syncStateForProgressInfo:session:", v40, v2));
        objc_msgSend(v40, "setSyncWaitingSubstate:", objc_msgSend((id)objc_opt_class(), "_syncWaitingSubstateForProgressInfo:", v40));
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v37);
  }

  NMLogForCategory(5);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    syncProgressInfoByAssetType = self->_syncProgressInfoByAssetType;
    *(_DWORD *)buf = 138543362;
    v73 = (uint64_t)syncProgressInfoByAssetType;
    _os_log_impl(&dword_216E27000, v42, OS_LOG_TYPE_DEFAULT, "Finished updating sync progress: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__NMSSyncManager__updateSyncProgress__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __37__NMSSyncManager__updateSyncProgress__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSSyncManagerSyncStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (unint64_t)_numberOfItemsNeedingDownloadForAssetType:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Music")))
    return objc_msgSend(MEMORY[0x24BE03980], "activeSessionCountWithSessionTypeIdentifier:", CFSTR("MLWatchDownload"));
  else
    return 0;
}

- (id)_tracksPredicateWithPersistentIDs:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BE6B1E8], "predicateWithPersistentIDs:shouldContain:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_gizmoSyncStates
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncStateDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v3;
    _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "[SyncStatus] sync state dict %{public}@", buf, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DetailsDict"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SyncStatesByMediaType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Music"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DetailsDict"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SyncStatesByMediaType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Podcast"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DetailsDict"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SyncStatesByMediaType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Audiobook"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v7;
  if (v7 || v10 || v13)
  {
    if (v7)
    {
      v16 = objc_msgSend(v7, "unsignedIntegerValue");
      NMLogForCategory(5);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v20;
        _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Music sync state from gizmo: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      NMLogForCategory(5);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = 2;
        _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestMusicSyncStateAsNumber; resolvedMusicSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        v16 = 2;
      }
    }

    if (v10)
    {
      v21 = objc_msgSend(v10, "unsignedIntegerValue");
      NMLogForCategory(5);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v23;
        _os_log_impl(&dword_216E27000, v22, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Podcasts sync state from gizmo: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      NMLogForCategory(5);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = 2;
        _os_log_impl(&dword_216E27000, v22, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestPodcastsSyncStateAsNumber; resolvedPodcastsSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        v21 = 2;
      }
    }

    if (v13)
    {
      v24 = objc_msgSend(v13, "unsignedIntegerValue");
      NMLogForCategory(5);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v25;
        _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Audiobooks sync state from gizmo: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      NMLogForCategory(5);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = 2;
        _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestAudiobooksSyncStateAsNumber; resolvedAudiobooksSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        v24 = 2;
      }
    }
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SyncState"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = -[NSObject unsignedIntegerValue](v14, "unsignedIntegerValue");
      NMLogForCategory(5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v18;
        _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Legacy Music sync state from gizmo: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      NMLogForCategory(5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = 2;
        _os_log_impl(&dword_216E27000, v17, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No latestSyncStateAsNumber; resolvedMusicSyncState -> pending",
          buf,
          2u);
      }
      else
      {
        v16 = 2;
      }
    }

    NMLogForCategory(5);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v26, OS_LOG_TYPE_DEFAULT, "[SyncStatus] No new sync state keys in sync state dict. Assuming pending Podcasts and Audiobooks sync state", buf, 2u);
    }

    v24 = 2;
    v21 = 2;
  }

  NMLogForCategory(5);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v43 = v28;
    v44 = 2048;
    v45 = v16;
    v46 = 2114;
    v47 = v29;
    v48 = 2048;
    v49 = v21;
    v50 = 2114;
    v51 = v30;
    v52 = 2048;
    v53 = v24;
    _os_log_impl(&dword_216E27000, v27, OS_LOG_TYPE_DEFAULT, "[SyncStatus] resolvedMusicSyncState: %{public}@ [%tu] -- resolvedPodcastsSyncState: %{public}@ [%tu] -- resolvedAudiobooksSyncState: %{public}@ [%tu]", buf, 0x3Eu);

  }
  if (v16)
  {
    if (v21)
      goto LABEL_37;
  }
  else
  {
    NMLogForCategory(5);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[NMSSyncManager _gizmoSyncStates].cold.3();

    v16 = 1;
    if (v21)
    {
LABEL_37:
      if (v24)
        goto LABEL_48;
      goto LABEL_45;
    }
  }
  NMLogForCategory(5);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    +[NMSSyncManager _gizmoSyncStates].cold.2();

  v21 = 1;
  if (!v24)
  {
LABEL_45:
    NMLogForCategory(5);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[NMSSyncManager _gizmoSyncStates].cold.1();

    v24 = 1;
  }
LABEL_48:
  v40[0] = CFSTR("Music");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v34;
  v40[1] = CFSTR("Podcast");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v35;
  v40[2] = CFSTR("Audiobook");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)activeSyncSessionIdentifier
{
  return self->_activeSyncSessionIdentifier;
}

- (void)setActiveSyncSessionIdentifier:(id)a3
{
  objc_storeStrong(&self->_activeSyncSessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activeSyncSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_syncProgressInfoByAssetType, 0);
  objc_storeStrong((id *)&self->_maskedPendingSyncStateRevealTimer, 0);
  objc_storeStrong((id *)&self->_observedSession, 0);
}

+ (void)_gizmoSyncStates
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  +[NMSSyncProgressInfo _stringFromSyncState:](NMSSyncProgressInfo, "_stringFromSyncState:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_216E27000, v1, v2, "[SyncStatus] Unexpected _gizmoSyncState (Music): %{public}@; syncStateDict:%{public}@; resolvedSyncState -> idle",
    v3,
    v4,
    v5,
    v6,
    v7);

  OUTLINED_FUNCTION_3_0();
}

@end
