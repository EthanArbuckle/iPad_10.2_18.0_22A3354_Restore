@implementation NMSMediaPinningManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NMSMediaPinningManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager___sharedMananger;
}

void __39__NMSMediaPinningManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager___sharedMananger;
  sharedManager___sharedMananger = v0;

}

- (NMSMediaPinningManager)init
{
  NMSMediaPinningManager *v2;
  uint64_t v3;
  NMSyncDefaults *sharedDefaults;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  NMSPodcastsDownloadableContentProvider *v12;
  NMSPodcastsDownloadableContentProvider *podcastsDownloadableContentProvider;
  NMSPodcastsDownloadableContentController_Legacy *v14;
  NMSPodcastsDownloadableContentController_Legacy *legacy_podcastsDownloadableContentController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)NMSMediaPinningManager;
  v2 = -[NMSMediaPinningManager init](&v24, sel_init);
  if (v2)
  {
    +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NMSyncDefaults *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.NanoMusicSync.MediaPinning", v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NMSMediaPinningManager _shouldCalculateCachedIdentifiers](v2, "_shouldCalculateCachedIdentifiers")
      || !-[NMSMediaPinningManager _shouldSkipQuotaManagerEvaluation](v2, "_shouldSkipQuotaManagerEvaluation"))
    {
      if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](v2, "_deviceSupportsPodcastsPinningSettingsV2"))
      {
        v12 = objc_alloc_init(NMSPodcastsDownloadableContentProvider);
        podcastsDownloadableContentProvider = v2->_podcastsDownloadableContentProvider;
        v2->_podcastsDownloadableContentProvider = v12;

        -[NMSPodcastsDownloadableContentProvider setDelegate:](v2->_podcastsDownloadableContentProvider, "setDelegate:", v2);
LABEL_10:
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handlePodcastsPinningSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.podcasts-pinning-selections"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleMusicPinningSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.music-pinning-selections"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleRecommendationLibraryContentsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.reco-library"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleRecommendationsDidUpdateNotification_, CFSTR("NMSMusicRecommendationsDidUpdateNotification"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleAudiobooksPinningSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.audiobooks-pinning-selections"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleAudiobooksRecommendationsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.audiobooks-recommendations"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleICAgeVerificationStateDidChangeNotification_, *MEMORY[0x24BEC84C8], 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleRecommendationSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.reco-selections"), 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handlePairedDeviceDidBecomeActiveNotification_, *MEMORY[0x24BE6B420], 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleMediaLibraryDidChangeNotification_, *MEMORY[0x24BDDBCF0], 0);
        objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleMediaLibraryDynamicPropertiesDidChangeNotification_, *MEMORY[0x24BDDBD00], 0);
        objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "beginGeneratingLibraryChangeNotifications");

        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__handleMediaPinningMusicContentsInvalidatedNotification_, CFSTR("NMSMediaPinningMusicContentsInvalidatedNotification"), 0);

        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel__handleMediaPinningPodcastsContentsInvalidatedNotification_, CFSTR("NMSMediaPinningPodcastsContentsInvalidatedNotification"), 0);

        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__handleMediaPinningAudiobooksContentsInvalidatedNotification_, CFSTR("NMSMediaPinningAudiobooksContentsInvalidatedNotification"), 0);

        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObserver:selector:name:object:", v2, sel__handleMediaPinningManagerMusicIdentifiersDidChangeNotification_, CFSTR("NMSMediaPinningManagerMusicIdentifiersDidChangeNotification"), 0);

        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification_, CFSTR("NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification"), 0);

        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification_, CFSTR("NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification"), 0);

        return v2;
      }
      v14 = objc_alloc_init(NMSPodcastsDownloadableContentController_Legacy);
      legacy_podcastsDownloadableContentController = v2->_legacy_podcastsDownloadableContentController;
      v2->_legacy_podcastsDownloadableContentController = v14;

      -[NMSPodcastsDownloadableContentController_Legacy setDelegate:](v2->_legacy_podcastsDownloadableContentController, "setDelegate:", v2);
      objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:](v9, "addObserver:", v2);
    }
    else
    {
      NMLogForCategory(5);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[NMSMediaPinningManager _shouldCalculateCachedIdentifiers](v2, "_shouldCalculateCachedIdentifiers");
        v11 = -[NMSMediaPinningManager _shouldSkipQuotaManagerEvaluation](v2, "_shouldSkipQuotaManagerEvaluation");
        *(_DWORD *)buf = 67109376;
        v26 = v10;
        v27 = 1024;
        v28 = v11;
        _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "Not creating NMSPodcastsDownloadableContentProvider. _shouldCalculateCachedIdentifiers %x _shouldSkipQuotaManagerEvaluation %x", buf, 0xEu);
      }
    }

    goto LABEL_10;
  }
  return v2;
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
  v5.super_class = (Class)NMSMediaPinningManager;
  -[NMSMediaPinningManager dealloc](&v5, sel_dealloc);
}

- (id)downloadInfoWithinAvailableSpace:(unint64_t)a3
{
  -[NMSMediaPinningManager setAvailableSpace:](self, "setAvailableSpace:", a3);
  return -[NMSMediaPinningManager downloadInfo](self, "downloadInfo");
}

- (void)setAvailableSpace:(unint64_t)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__NMSMediaPinningManager_setAvailableSpace___block_invoke;
  v4[3] = &unk_24D6477E8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

uint64_t __44__NMSMediaPinningManager_setAvailableSpace___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend((id)objc_opt_class(), "_mediaStorageSizeForCurrentDevice");
  if (v2 >= *(_QWORD *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = v2;
  result = objc_msgSend(*(id *)(a1 + 32), "_mediaQuota");
  if (result - v3 >= 0x4C4B41)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    return objc_msgSend(*(id *)(a1 + 32), "_invalidateAddedItemsCache");
  }
  return result;
}

- (NMSMediaDownloadInfo)downloadInfo
{
  NSObject *internalQueue;
  _QWORD *v4;
  id v5;
  _QWORD v7[6];
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2"))
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__NMSMediaPinningManager_downloadInfo__block_invoke_2;
    v7[3] = &unk_24D6476D8;
    v7[4] = self;
    v7[5] = &v9;
    v4 = v7;
  }
  else
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__NMSMediaPinningManager_downloadInfo__block_invoke;
    block[3] = &unk_24D6476D8;
    block[4] = self;
    block[5] = &v9;
    v4 = block;
  }
  dispatch_sync(internalQueue, v4);
  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NMSMediaDownloadInfo *)v5;
}

void __38__NMSMediaPinningManager_downloadInfo__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_legacy_quotaManagerWithDownloadedItemsOnly:", objc_msgSend(v3, "isCharging") ^ 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "downloadInfoWithinQuota");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __38__NMSMediaPinningManager_downloadInfo__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_quotaManagerWithDownloadedItemsOnly:", objc_msgSend(v3, "isCharging") ^ 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "downloadInfoWithinQuota");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)downloadInfoForBundleIdentifier:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *internalQueue;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v5 = -[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  internalQueue = self->_internalQueue;
  if (v5)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke_2;
    v11[3] = &unk_24D647810;
    v12 = v4;
    v13 = &v17;
    v11[4] = self;
    v7 = v4;
    dispatch_sync(internalQueue, v11);
    v8 = (id)v18[5];
    v9 = v12;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke;
    block[3] = &unk_24D647810;
    v15 = v4;
    v16 = &v17;
    block[4] = self;
    v7 = v4;
    dispatch_sync(internalQueue, block);
    v8 = (id)v18[5];
    v9 = v15;
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadInfoWithinQuotaForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58__NMSMediaPinningManager_downloadInfoForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_quotaManagerWithDownloadedItemsOnly:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadInfoWithinQuotaForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)isItemGroupWithinQuota:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NMSItemGroupEnumerator *v7;
  uint64_t v8;
  void *v9;
  NSObject *internalQueue;
  uint64_t v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2"))
  {
    -[NMSMediaPinningManager _quotaManagerWithDownloadedItemsOnly:](self, "_quotaManagerWithDownloadedItemsOnly:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "downloadInfoWithinQuota");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[NMSItemGroupEnumerator initWithItemGroup:]([NMSItemGroupEnumerator alloc], "initWithItemGroup:", v4);
    -[NMSItemGroupEnumerator nextItem](v7, "nextItem");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      do
      {
        LODWORD(internalQueue) = objc_msgSend(v6, "containsItem:", v9);
        if (!(_DWORD)internalQueue)
          break;
        -[NMSItemGroupEnumerator nextItem](v7, "nextItem");
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      while (v11);

    }
    else
    {
      LOBYTE(internalQueue) = 1;
    }

  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__NMSMediaPinningManager_isItemGroupWithinQuota___block_invoke;
    block[3] = &unk_24D647810;
    v15 = &v16;
    block[4] = self;
    v14 = v4;
    dispatch_sync(internalQueue, block);
    LOBYTE(internalQueue) = *((_BYTE *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return (char)internalQueue;
}

void __49__NMSMediaPinningManager_isItemGroupWithinQuota___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isItemGroupWithinQuota:", *(_QWORD *)(a1 + 40));

}

- (void)invalidateMusicCache
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__NMSMediaPinningManager_invalidateMusicCache__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __46__NMSMediaPinningManager_invalidateMusicCache__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Music cache. [External]", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 1);
}

- (NSNumber)workoutPlaylistID
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "workoutPlaylistID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 113))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "longLongValue")
      && (objc_msgSend((id)objc_opt_class(), "_playlistPIDValidForPinning:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) == 0)
    {
      NMLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke_cold_1(a1 + 40, v6, v7, v8, v9, v10, v11, v12);

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

      objc_msgSend(*(id *)(a1 + 32), "_setWorkoutPlaylistID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
  }
}

- (void)invalidatePodcastsCache
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__NMSMediaPinningManager_invalidatePodcastsCache__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __49__NMSMediaPinningManager_invalidatePodcastsCache__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Podcasts cache. [External]", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (NMSPodcastsDownloadSettings)podcastsUpNextDownloadSettings
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__NMSMediaPinningManager_podcastsUpNextDownloadSettings__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSPodcastsDownloadSettings *)v3;
}

void __56__NMSMediaPinningManager_podcastsUpNextDownloadSettings__block_invoke(uint64_t a1)
{
  NMSPodcastsDownloadSettings *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("PodcastsUpNextDownloadSettings"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 0, v5);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPodcastsUpNextDownloadSettings:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__NMSMediaPinningManager_setPodcastsUpNextDownloadSettings___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __60__NMSMediaPinningManager_setPodcastsUpNextDownloadSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NMSPodcastsDownloadSettings *v4;

  v4 = -[NMSPodcastsDownloadSettings initWithCollectionType:legacyDownloadSettings:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:legacyDownloadSettings:", 0, *(_QWORD *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  -[NMSPodcastsDownloadSettings dictionaryRepresentation](v4, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("PodcastsUpNextDownloadSettings"));

  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (NMSPodcastsDownloadSettings)podcastsSavedEpisodesDownloadSettings
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__NMSMediaPinningManager_podcastsSavedEpisodesDownloadSettings__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSPodcastsDownloadSettings *)v3;
}

void __63__NMSMediaPinningManager_podcastsSavedEpisodesDownloadSettings__block_invoke(uint64_t a1)
{
  NMSPodcastsDownloadSettings *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("PodcastsSavedEpisodesDownloadSettings"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 1, v5);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPodcastsSavedEpisodesDownloadSettings:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NMSMediaPinningManager_setPodcastsSavedEpisodesDownloadSettings___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __67__NMSMediaPinningManager_setPodcastsSavedEpisodesDownloadSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NMSPodcastsDownloadSettings *v4;

  v4 = -[NMSPodcastsDownloadSettings initWithCollectionType:legacyDownloadSettings:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:legacyDownloadSettings:", 1, *(_QWORD *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  -[NMSPodcastsDownloadSettings dictionaryRepresentation](v4, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("PodcastsSavedEpisodesDownloadSettings"));

  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (id)podcastsDownloadSettingsForStationUUID:(id)a3
{
  id v4;
  NSObject *internalQueue;
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NMSMediaPinningManager_podcastsDownloadSettingsForStationUUID___block_invoke;
  block[3] = &unk_24D647860;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__NMSMediaPinningManager_podcastsDownloadSettingsForStationUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  NMSPodcastsDownloadSettings *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", CFSTR("PodcastsStationDownloadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 2, v6);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setPodcastsDownloadSettings:(id)a3 forStationUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NMSMediaPinningManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forStationUUID___block_invoke;
  block[3] = &unk_24D647888;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forStationUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NMSPodcastsDownloadSettings *v10;

  v10 = -[NMSPodcastsDownloadSettings initWithCollectionType:legacyDownloadSettings:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:legacyDownloadSettings:", 2, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", CFSTR("PodcastsStationDownloadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[NMSPodcastsDownloadSettings dictionaryRepresentation](v10, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *(_QWORD *)(a1 + 48));

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("PodcastsStationDownloadSettings"));

  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (NSSet)podcastsSelectedStationUUIDs
{
  void *v3;
  NSObject *internalQueue;
  id v5;
  void *v6;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  NMSMediaPinningManager *v14;
  id v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    internalQueue = self->_internalQueue;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_2;
    v13 = &unk_24D647838;
    v14 = self;
    v15 = v3;
    v5 = v3;
    dispatch_sync(internalQueue, &v10);
    v6 = (void *)objc_msgSend(v5, "copy", v10, v11, v12, v13, v14);

    return (NSSet *)v6;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__3;
    v21 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v8 = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke;
    block[3] = &unk_24D646EB8;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(v8, block);
    v9 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

    return (NSSet *)v9;
  }
}

void __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPodcastStationUUIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("PodcastsStationDownloadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_3;
  v3[3] = &unk_24D6478B0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __54__NMSMediaPinningManager_podcastsSelectedStationUUIDs__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NMSPodcastsDownloadSettings *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 2, v5);

  if (-[NMSPodcastsDownloadSettings isEnabled](v6, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (id)podcastsDownloadSettingsForShowFeedURL:(id)a3
{
  id v4;
  NSObject *internalQueue;
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__NMSMediaPinningManager_podcastsDownloadSettingsForShowFeedURL___block_invoke;
  block[3] = &unk_24D647860;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __65__NMSMediaPinningManager_podcastsDownloadSettingsForShowFeedURL___block_invoke(_QWORD *a1)
{
  void *v2;
  NMSPodcastsDownloadSettings *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", CFSTR("PodcastsShowDownloadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 3, v6);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setPodcastsDownloadSettings:(id)a3 forShowFeedURL:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NMSMediaPinningManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forShowFeedURL___block_invoke;
  block[3] = &unk_24D647888;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __69__NMSMediaPinningManager_setPodcastsDownloadSettings_forShowFeedURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NMSPodcastsDownloadSettings *v10;

  v10 = -[NMSPodcastsDownloadSettings initWithCollectionType:legacyDownloadSettings:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:legacyDownloadSettings:", 3, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", CFSTR("PodcastsShowDownloadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[NMSPodcastsDownloadSettings dictionaryRepresentation](v10, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, *(_QWORD *)(a1 + 48));

  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("PodcastsShowDownloadSettings"));

  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (NSSet)podcastsSelectedShowFeedURLs
{
  void *v3;
  NSObject *internalQueue;
  id v5;
  void *v6;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  NMSMediaPinningManager *v14;
  id v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    internalQueue = self->_internalQueue;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_2;
    v13 = &unk_24D647838;
    v14 = self;
    v15 = v3;
    v5 = v3;
    dispatch_sync(internalQueue, &v10);
    v6 = (void *)objc_msgSend(v5, "copy", v10, v11, v12, v13, v14);

    return (NSSet *)v6;
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__3;
    v21 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v8 = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke;
    block[3] = &unk_24D646EB8;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(v8, block);
    v9 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

    return (NSSet *)v9;
  }
}

void __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPodcastFeedURLs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", CFSTR("PodcastsShowDownloadSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_3;
  v3[3] = &unk_24D6478B0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __54__NMSMediaPinningManager_podcastsSelectedShowFeedURLs__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NMSPodcastsDownloadSettings *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:]([NMSPodcastsDownloadSettings alloc], "initWithCollectionType:dictionary:", 3, v5);

  if (-[NMSPodcastsDownloadSettings isEnabled](v6, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (BOOL)pinnedPodcastsAreUserSet
{
  NSObject *internalQueue;
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
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__NMSMediaPinningManager_pinnedPodcastsAreUserSet__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__NMSMediaPinningManager_pinnedPodcastsAreUserSet__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPodcastsAreUserSet");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setPinnedPodcastsAreUserSet:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__NMSMediaPinningManager_setPinnedPodcastsAreUserSet___block_invoke;
  v4[3] = &unk_24D6478D8;
  v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __54__NMSMediaPinningManager_setPinnedPodcastsAreUserSet___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPodcastsAreUserSet");
  if (v2 != (_DWORD)result)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "Setting new pinned podcasts are user set value %x", (uint8_t *)v6, 8u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPinnedPodcastsAreUserSet:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 2);
  }
  return result;
}

- (BOOL)savedEpisodesEnabled
{
  void *v3;
  char v4;
  NSObject *internalQueue;
  char v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2"))
  {
    -[NMSMediaPinningManager podcastsSavedEpisodesDownloadSettings](self, "podcastsSavedEpisodesDownloadSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEnabled");

    return v4;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    internalQueue = self->_internalQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__NMSMediaPinningManager_savedEpisodesEnabled__block_invoke;
    v8[3] = &unk_24D6476D8;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(internalQueue, v8);
    v7 = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

uint64_t __46__NMSMediaPinningManager_savedEpisodesEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPodcastsAreUserSet");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "savedEpisodesEnabled");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setSavedEpisodesEnabled:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__NMSMediaPinningManager_setSavedEpisodesEnabled___block_invoke;
  v4[3] = &unk_24D6478D8;
  v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __50__NMSMediaPinningManager_setSavedEpisodesEnabled___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "savedEpisodesEnabled");
  if (v2 != (_DWORD)result)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "Setting new saved episodes enabled value %x", (uint8_t *)v6, 8u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSavedEpisodesEnabled:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 2);
  }
  return result;
}

- (NSArray)podcastFeedURLs
{
  void *v2;
  void *v3;

  -[NMSMediaPinningManager podcastsSelectedShowFeedURLs](self, "podcastsSelectedShowFeedURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)podcastStationUUIDs
{
  void *v2;
  void *v3;

  -[NMSMediaPinningManager podcastsSelectedStationUUIDs](self, "podcastsSelectedStationUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_refreshPodcastsIdentifiers
{
  NSDictionary *v3;
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary **p_cachedUpNextDownloadSettings;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary **p_cachedSavedEpisodesDownloadSettings;
  NSDictionary *v10;
  NSDictionary *v11;
  NSDictionary **p_cachedStationDownloadSettings;
  NSDictionary *v13;
  NSDictionary *v14;
  int v15;
  NSDictionary **p_cachedShowDownloadSettings;
  NSDictionary *cachedShowDownloadSettings;
  NSDictionary *v18;
  NSDictionary *v19;
  int v20;
  void *v21;
  uint64_t v22;
  NSDictionary *obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (-[NMSMediaPinningManager _deviceSupportsPodcastsPinningSettingsV2](self, "_deviceSupportsPodcastsPinningSettingsV2"))
  {
    -[NMSyncDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", CFSTR("PodcastsUpNextDownloadSettings"));
    obj = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", CFSTR("PodcastsSavedEpisodesDownloadSettings"));
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", CFSTR("PodcastsStationDownloadSettings"));
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NMSyncDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", CFSTR("PodcastsShowDownloadSettings"));
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    p_cachedUpNextDownloadSettings = &self->_cachedUpNextDownloadSettings;
    v7 = self->_cachedUpNextDownloadSettings;
    v8 = v7;
    if (v7 == obj)
      HIDWORD(v22) = 0;
    else
      HIDWORD(v22) = -[NSDictionary isEqual:](v7, "isEqual:") ^ 1;

    p_cachedSavedEpisodesDownloadSettings = &self->_cachedSavedEpisodesDownloadSettings;
    v10 = self->_cachedSavedEpisodesDownloadSettings;
    v11 = v10;
    if (v10 == v3)
      LODWORD(v22) = 0;
    else
      LODWORD(v22) = -[NSDictionary isEqual:](v10, "isEqual:", v3) ^ 1;

    p_cachedStationDownloadSettings = &self->_cachedStationDownloadSettings;
    v13 = self->_cachedStationDownloadSettings;
    v14 = v13;
    if (v13 == v4)
      v15 = 0;
    else
      v15 = -[NSDictionary isEqual:](v13, "isEqual:", v4) ^ 1;

    cachedShowDownloadSettings = self->_cachedShowDownloadSettings;
    p_cachedShowDownloadSettings = &self->_cachedShowDownloadSettings;
    v18 = cachedShowDownloadSettings;
    v19 = v18;
    if (v18 == v5)
      v20 = 0;
    else
      v20 = -[NSDictionary isEqual:](v18, "isEqual:", v5) ^ 1;

    objc_storeStrong((id *)p_cachedUpNextDownloadSettings, obj);
    objc_storeStrong((id *)p_cachedSavedEpisodesDownloadSettings, v3);
    objc_storeStrong((id *)p_cachedStationDownloadSettings, v4);
    objc_storeStrong((id *)p_cachedShowDownloadSettings, v5);
    if (((HIDWORD(v22) | v22 | v15) & 1) != 0 || v20)
    {
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification"), 0);

    }
  }
  else
  {
    -[NMSMediaPinningManager _legacy_refreshPodcastsIdentifiers](self, "_legacy_refreshPodcastsIdentifiers");
  }
}

- (void)pinPodcastWithFeedURL:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__NMSMediaPinningManager_pinPodcastWithFeedURL___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __48__NMSMediaPinningManager_pinPodcastWithFeedURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Pinning podcast <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastFeedURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedPodcastFeedURLs:", v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastsAreUserSet"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);

}

- (void)unpinPodcastWithFeedURL:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__NMSMediaPinningManager_unpinPodcastWithFeedURL___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __50__NMSMediaPinningManager_unpinPodcastWithFeedURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning podcast <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastFeedURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedPodcastFeedURLs:", v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastsAreUserSet"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);

}

- (void)pinPodcastStationWithUUID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__NMSMediaPinningManager_pinPodcastStationWithUUID___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __52__NMSMediaPinningManager_pinPodcastStationWithUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Pinning podcast station <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastStationUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedPodcastStationUUIDs:", v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastsAreUserSet"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);

}

- (void)unpinPodcastStationWithUUID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__NMSMediaPinningManager_unpinPodcastStationWithUUID___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __54__NMSMediaPinningManager_unpinPodcastStationWithUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning podcast station <%{public}@>", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastStationUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedPodcastStationUUIDs:", v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPodcastsAreUserSet"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 2);

}

- (void)invalidateAudiobooksCache
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__NMSMediaPinningManager_invalidateAudiobooksCache__block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __51__NMSMediaPinningManager_invalidateAudiobooksCache__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Audiobooks cache. [External]", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 4);
}

- (NSArray)audiobookIdentifiers
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__NMSMediaPinningManager_audiobookIdentifiers__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__NMSMediaPinningManager_audiobookIdentifiers__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[13])
  {
    v3 = objc_msgSend(v2, "_shouldCalculateCachedIdentifiers");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "_refreshAudiobooksIdentifiers");
    else
      objc_msgSend(v4, "_fetchAudiobooksIdentifiers");
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)_fetchAudiobooksIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Failed to unarchive cached audiobookIdentifiers due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_refreshAudiobooksIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Failed to archive audiobookIdentifiers due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isWantToReadEnabled
{
  NSObject *internalQueue;
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
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__NMSMediaPinningManager_isWantToReadEnabled__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__NMSMediaPinningManager_isWantToReadEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "wantToReadEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setWantToReadEnabled:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NMSMediaPinningManager_setWantToReadEnabled___block_invoke;
  v4[3] = &unk_24D6478D8;
  v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __47__NMSMediaPinningManager_setWantToReadEnabled___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "wantToReadEnabled");
  if (v2 != (_DWORD)result)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "Setting new wantToReadEnabled value: %x", (uint8_t *)v6, 8u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setWantToReadEnabled:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 4);
  }
  return result;
}

- (NSOrderedSet)wantToReadAudiobooks
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__NMSMediaPinningManager_wantToReadAudiobooks__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

void __46__NMSMediaPinningManager_wantToReadAudiobooks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "wantToReadAudiobooks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setWantToReadAudiobooks:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__NMSMediaPinningManager_setWantToReadAudiobooks___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __50__NMSMediaPinningManager_setWantToReadAudiobooks___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "wantToReadAudiobooks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "isEqual:", v3);

    if ((v5 & 1) == 0)
    {
      NMLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Setting wantToReadAudiobooks %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setWantToReadAudiobooks:", v2);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "wantToReadEnabled"))
        objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 4);
    }
  }

}

- (BOOL)isReadingNowEnabled
{
  NSObject *internalQueue;
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
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__NMSMediaPinningManager_isReadingNowEnabled__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__NMSMediaPinningManager_isReadingNowEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "readingNowEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setReadingNowEnabled:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NMSMediaPinningManager_setReadingNowEnabled___block_invoke;
  v4[3] = &unk_24D6478D8;
  v5 = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

uint64_t __47__NMSMediaPinningManager_setReadingNowEnabled___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "readingNowEnabled");
  if (v2 != (_DWORD)result)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl(&dword_216E27000, v4, OS_LOG_TYPE_DEFAULT, "Setting new readingNowEnabled value: %x", (uint8_t *)v6, 8u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setReadingNowEnabled:", *(unsigned __int8 *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 4);
  }
  return result;
}

- (NSOrderedSet)readingNowAudiobooks
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__NMSMediaPinningManager_readingNowAudiobooks__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

void __46__NMSMediaPinningManager_readingNowAudiobooks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "readingNowAudiobooks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setReadingNowAudiobooks:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__NMSMediaPinningManager_setReadingNowAudiobooks___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __50__NMSMediaPinningManager_setReadingNowAudiobooks___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "readingNowAudiobooks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "isEqual:", v3);

    if ((v5 & 1) == 0)
    {
      NMLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Setting readingNowAudiobooks %{public}@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setReadingNowAudiobooks:", v2);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "readingNowEnabled"))
        objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 4);
    }
  }

}

- (NSOrderedSet)pinnedAudiobooks
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__NMSMediaPinningManager_pinnedAudiobooks__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

void __42__NMSMediaPinningManager_pinnedAudiobooks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedAudiobooks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)isAudiobookPinned:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__NMSMediaPinningManager_isAudiobookPinned___block_invoke;
  block[3] = &unk_24D647810;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __44__NMSMediaPinningManager_isAudiobookPinned___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isAudiobookPinned:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)pinAudiobook:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__NMSMediaPinningManager_pinAudiobook___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __39__NMSMediaPinningManager_pinAudiobook___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Pinning audiobook <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedAudiobooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedAudiobooks:", v6);

  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 4);
}

- (void)unpinAudiobook:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__NMSMediaPinningManager_unpinAudiobook___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __41__NMSMediaPinningManager_unpinAudiobook___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning audiobook <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedAudiobooks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedAudiobooks:", v6);

  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 4);
}

- (double)audiobookDownloadLimit
{
  NSObject *internalQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__NMSMediaPinningManager_audiobookDownloadLimit__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__NMSMediaPinningManager_audiobookDownloadLimit__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_audiobookDownloadLimit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setAudiobookDownloadLimit:(double)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__NMSMediaPinningManager_setAudiobookDownloadLimit___block_invoke;
  v4[3] = &unk_24D6477E8;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  dispatch_async(internalQueue, v4);
}

void __52__NMSMediaPinningManager_setAudiobookDownloadLimit___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "audiobookDownloadLimit");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {

  }
  else
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "isEqual:", v3);

    if ((v5 & 1) == 0)
    {
      NMLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = 134217984;
        v9 = v7;
        _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Setting new audiobookDownloadLimit value: %f", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAudiobookDownloadLimit:", v2);
      objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 4);
    }
  }

}

+ (id)_tokenForInstance:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("Instance");
  v8[1] = CFSTR("Date");
  v9[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)_persistNewClientToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientPinningSettingsToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Instance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "unsignedLongLongValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tokenForInstance:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NMLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[SyncStatus] Generated new syncState stateToken: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClientPinningSettingsToken:", v7);

}

- (void)_notePinningSettingsChangedLocally
{
  objc_msgSend((id)objc_opt_class(), "_persistNewClientToken");
}

- (void)_handleMusicPinningSelectionsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__NMSMediaPinningManager__handleMusicPinningSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __77__NMSMediaPinningManager__handleMusicPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("another");
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
      v6 = CFSTR("local");
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 40);
  if (v4)
    return objc_msgSend(v8, "_notePinningSettingsChangedLocally");
  else
    return objc_msgSend(v8, "_invalidateMediaCacheForAppIdentifiers:", 1);
}

- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__NMSMediaPinningManager__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __80__NMSMediaPinningManager__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("another");
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
      v6 = CFSTR("local");
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v8, 0x16u);
  }

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "_notePinningSettingsChangedLocally");
}

- (void)_handleAudiobooksPinningSelectionsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__NMSMediaPinningManager__handleAudiobooksPinningSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __82__NMSMediaPinningManager__handleAudiobooksPinningSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("another");
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
      v6 = CFSTR("local");
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 40);
  if (v4)
    return objc_msgSend(v8, "_notePinningSettingsChangedLocally");
  else
    return objc_msgSend(v8, "_invalidateMediaCacheForAppIdentifiers:", 4);
}

- (void)_handleAudiobooksRecommendationsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__NMSMediaPinningManager__handleAudiobooksRecommendationsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __80__NMSMediaPinningManager__handleAudiobooksRecommendationsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("another");
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
      v6 = CFSTR("local");
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(void **)(a1 + 40);
  if (v4)
    return objc_msgSend(v8, "_notePinningSettingsChangedLocally");
  else
    return objc_msgSend(v8, "_invalidateMediaCacheForAppIdentifiers:", 4);
}

- (void)_handleRecommendationLibraryContentsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__NMSMediaPinningManager__handleRecommendationLibraryContentsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __84__NMSMediaPinningManager__handleRecommendationLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 1);
}

- (void)_handleRecommendationsDidUpdateNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__NMSMediaPinningManager__handleRecommendationsDidUpdateNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __70__NMSMediaPinningManager__handleRecommendationsDidUpdateNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 1);
}

- (void)_handleMediaLibraryEntitiesAddedOrRemovedNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__NMSMediaPinningManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __80__NMSMediaPinningManager__handleMediaLibraryEntitiesAddedOrRemovedNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 7);
}

- (void)_handleMediaLibraryDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NMSMediaPinningManager__handleMediaLibraryDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __67__NMSMediaPinningManager__handleMediaLibraryDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 7);
}

- (void)_handleMediaLibraryDynamicPropertiesDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__NMSMediaPinningManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __84__NMSMediaPinningManager__handleMediaLibraryDynamicPropertiesDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 7);
}

- (void)_handlePodcastSizeInfoDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__NMSMediaPinningManager__handlePodcastSizeInfoDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __70__NMSMediaPinningManager__handlePodcastSizeInfoDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateAddedItemsCache");
}

- (void)_handleICAgeVerificationStateDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__NMSMediaPinningManager__handleICAgeVerificationStateDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __77__NMSMediaPinningManager__handleICAgeVerificationStateDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 1);
}

- (void)_handleRecommendationSelectionsDidChangeNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__NMSMediaPinningManager__handleRecommendationSelectionsDidChangeNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __79__NMSMediaPinningManager__handleRecommendationSelectionsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("another");
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
      v6 = CFSTR("local");
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@ from %@ process", (uint8_t *)&v8, 0x16u);
  }

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "_notePinningSettingsChangedLocally");
}

- (void)_handlePairedDeviceDidBecomeActiveNotification:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  NMSMediaPinningManager *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__NMSMediaPinningManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke;
  v7[3] = &unk_24D647838;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __73__NMSMediaPinningManager__handlePairedDeviceDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_INFO, "NMSMediaPinningManager got %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 7);
}

- (void)_handleMediaPinningMusicContentsInvalidatedNotification:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldCalculateCachedIdentifiers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_fetchMusicIdentifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __82__NMSMediaPinningManager__handleMediaPinningMusicContentsInvalidatedNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningMusicContentsInvalidatedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleMediaPinningPodcastsContentsInvalidatedNotification:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __85__NMSMediaPinningManager__handleMediaPinningPodcastsContentsInvalidatedNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningPodcastsContentsInvalidatedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleMediaPinningAudiobooksContentsInvalidatedNotification:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldCalculateCachedIdentifiers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_fetchAudiobooksIdentifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __87__NMSMediaPinningManager__handleMediaPinningAudiobooksContentsInvalidatedNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningAudiobooksContentsInvalidatedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleMediaPinningManagerMusicIdentifiersDidChangeNotification:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldCalculateCachedIdentifiers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_fetchMusicIdentifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __90__NMSMediaPinningManager__handleMediaPinningManagerMusicIdentifiersDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerMusicIdentifiersDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __93__NMSMediaPinningManager__handleMediaPinningManagerPodcastsIdentifiersDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldCalculateCachedIdentifiers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_fetchAudiobooksIdentifiers");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke_2;
  block[3] = &unk_24D646F30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __95__NMSMediaPinningManager__handleMediaPinningManagerAudiobooksIdentifiersDidChangeNotification___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (void)downloadableContentProviderDidChangeContent:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (self->_podcastsDownloadableContentProvider == a3)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__NMSMediaPinningManager_downloadableContentProviderDidChangeContent___block_invoke;
    block[3] = &unk_24D646F30;
    block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __70__NMSMediaPinningManager_downloadableContentProviderDidChangeContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (BOOL)_isAppDownloadingDormantForBundleIdentifier:(id)a3
{
  return 0;
}

- (BOOL)_shouldIncludeMusicManualDownloadsInQuotaEvaluation
{
  return 0;
}

- (id)_newMusicEnumeratorWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  NMSItemGroupEnumerator *v8;
  void *v9;
  NMSItemGroupEnumerator *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NMSItemGroupEnumerator *v19;
  void *v20;
  NMSItemGroupEnumerator *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  NMSItemGroupEnumerator *v30;
  void *v31;
  NMSItemGroupEnumerator *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  char v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  NMSItemGroupEnumerator *v46;
  void *v47;
  NMSItemGroupEnumerator *v48;
  id v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  int v56;
  NSObject *v57;
  _BOOL4 v58;
  NMSItemGroupEnumerator *v59;
  NMSItemGroupEnumerator *v60;
  NMSSequentialItemEnumerator *v61;
  void *v62;
  NMSSequentialItemEnumerator *v63;
  __int128 v65;
  __int128 v66;
  id obj;
  id obja;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  void *v90;
  uint64_t v91;

  v3 = a3;
  v91 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaPinningManager _shouldIncludeMusicManualDownloadsInQuotaEvaluation](self, "_shouldIncludeMusicManualDownloadsInQuotaEvaluation"))
  {
    -[NMSyncDefaults workoutPlaylistID](self->_sharedDefaults, "workoutPlaylistID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v6;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) workoutPlaylistID: %{public}@", buf, 0xCu);
    }

    if (objc_msgSend(v6, "longLongValue"))
    {
      v8 = [NMSItemGroupEnumerator alloc];
      +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSyncedPlaylistID:downloadedItemsOnly:", v6, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NMSItemGroupEnumerator initWithItemGroup:](v8, "initWithItemGroup:", v9);
      objc_msgSend(v5, "addObject:", v10);

    }
    -[NMSyncDefaults pinnedPlaylists](self->_sharedDefaults, "pinnedPlaylists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v11;
      _os_log_impl(&dword_216E27000, v12, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedPlaylists %{public}@", buf, 0xCu);
    }
    obj = v6;

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v82 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
          v19 = [NMSItemGroupEnumerator alloc];
          +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSyncedPlaylistID:downloadedItemsOnly:", v18, v3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[NMSItemGroupEnumerator initWithItemGroup:](v19, "initWithItemGroup:", v20);
          objc_msgSend(v5, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
      }
      while (v15);
    }

    -[NMSyncDefaults pinnedAlbums](self->_sharedDefaults, "pinnedAlbums");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v90 = v22;
      _os_log_impl(&dword_216E27000, v23, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedAlbums %{public}@", buf, 0xCu);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v78 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * j);
          v30 = [NMSItemGroupEnumerator alloc];
          +[NMSMediaItemGroup itemGroupWithSyncedAlbumID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSyncedAlbumID:downloadedItemsOnly:", v29, v3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[NMSItemGroupEnumerator initWithItemGroup:](v30, "initWithItemGroup:", v31);
          objc_msgSend(v5, "addObject:", v32);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      }
      while (v26);
    }

  }
  objc_msgSend((id)objc_opt_class(), "_fetchMusicRecommendations");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obja = v33;
  v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v74;
    *(_QWORD *)&v36 = 138543362;
    v65 = v36;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v74 != v38)
          objc_enumerationMutation(obja);
        v40 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
        objc_msgSend(v40, "identifier", v65);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", NMSRecommendationRecentMusicIdentifier);

        if ((v42 & 1) != 0)
        {
          objc_msgSend(v34, "addObject:", v40);
        }
        else
        {
          v43 = objc_msgSend(v40, "isSelected");
          NMLogForCategory(5);
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          if (v43)
          {
            if (v45)
            {
              *(_DWORD *)buf = v65;
              v90 = v40;
              _os_log_impl(&dword_216E27000, v44, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled store recommendation %{public}@", buf, 0xCu);
            }

            v46 = [NMSItemGroupEnumerator alloc];
            +[NMSMediaItemGroup itemGroupWithRecommendation:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithRecommendation:downloadedItemsOnly:", v40, v3);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[NMSItemGroupEnumerator initWithItemGroup:](v46, "initWithItemGroup:", v47);
            objc_msgSend(v5, "addObject:", v48);

          }
          else
          {
            if (v45)
            {
              *(_DWORD *)buf = v65;
              v90 = v40;
              _os_log_impl(&dword_216E27000, v44, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) NOT including disabled store recommendation %{public}@", buf, 0xCu);
            }

          }
        }
      }
      v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    }
    while (v37);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v49 = v34;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (v50)
  {
    v52 = v50;
    v53 = *(_QWORD *)v70;
    *(_QWORD *)&v51 = 138543362;
    v66 = v51;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v70 != v53)
          objc_enumerationMutation(v49);
        v55 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * m);
        v56 = objc_msgSend(v55, "isSelected", v66);
        NMLogForCategory(5);
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        if (v56)
        {
          if (v58)
          {
            *(_DWORD *)buf = v66;
            v90 = v55;
            _os_log_impl(&dword_216E27000, v57, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled recommendation %{public}@", buf, 0xCu);
          }

          v59 = [NMSItemGroupEnumerator alloc];
          +[NMSMediaItemGroup itemGroupWithRecommendation:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithRecommendation:downloadedItemsOnly:", v55, v3);
          v57 = objc_claimAutoreleasedReturnValue();
          v60 = -[NMSItemGroupEnumerator initWithItemGroup:](v59, "initWithItemGroup:", v57);
          objc_msgSend(v5, "addObject:", v60);

        }
        else if (v58)
        {
          *(_DWORD *)buf = v66;
          v90 = v55;
          _os_log_impl(&dword_216E27000, v57, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) NOT including disabled recommendation %{public}@", buf, 0xCu);
        }

      }
      v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    }
    while (v52);
  }

  v61 = [NMSSequentialItemEnumerator alloc];
  v62 = (void *)objc_msgSend(v5, "copy");
  v63 = -[NMSSequentialItemEnumerator initWithItemEnumerators:](v61, "initWithItemEnumerators:", v62);

  return v63;
}

- (id)_newAudiobooksEnumeratorWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NMSItemGroupEnumerator *v16;
  void *v17;
  NMSItemGroupEnumerator *v18;
  NSObject *v19;
  NMSMediaPinningManager *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  NMSItemGroupEnumerator *v26;
  void *v27;
  NMSItemGroupEnumerator *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  NMSItemGroupEnumerator *v35;
  void *v36;
  NMSItemGroupEnumerator *v37;
  NSObject *v38;
  NMSSequentialItemEnumerator *v39;
  void *v40;
  NMSSequentialItemEnumerator *v41;
  NMSMediaPinningManager *v43;
  id obj;
  id obja;
  id objb;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint8_t v61[128];
  uint8_t buf[4];
  _BYTE v63[10];
  uint64_t v64;

  v3 = a3;
  v64 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NMSyncDefaults wantToReadEnabled](self->_sharedDefaults, "wantToReadEnabled");
    v7 = -[NMSyncDefaults readingNowEnabled](self->_sharedDefaults, "readingNowEnabled");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v63 = v6;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = v7;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobooks containers) wantToReadEnabled: %x, readingNowEnabled: %x", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaPinningManager _audiobookDownloadLimit](self, "_audiobookDownloadLimit");
  v10 = v9;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v43 = self;
  -[NMSyncDefaults pinnedAudiobooks](self->_sharedDefaults, "pinnedAudiobooks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v16 = [NMSItemGroupEnumerator alloc];
        +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:", v15, (unint64_t)v10, 0, v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NMSItemGroupEnumerator initWithItemGroup:](v16, "initWithItemGroup:", v17);
        objc_msgSend(v8, "addObject:", v18);

        NMLogForCategory(5);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v63 = v15;
          _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding pinned audiobook %{public}@", buf, 0xCu);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v12);
  }

  v20 = v43;
  if (-[NMSyncDefaults readingNowEnabled](v43->_sharedDefaults, "readingNowEnabled"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[NMSyncDefaults readingNowAudiobooks](v43->_sharedDefaults, "readingNowAudiobooks");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v52 != v23)
            objc_enumerationMutation(obja);
          v25 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
          v26 = [NMSItemGroupEnumerator alloc];
          +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:", v25, (unint64_t)v10, 0, v3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[NMSItemGroupEnumerator initWithItemGroup:](v26, "initWithItemGroup:", v27);
          objc_msgSend(v8, "addObject:", v28);

          NMLogForCategory(5);
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v63 = v25;
            _os_log_impl(&dword_216E27000, v29, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding readingNow audiobook %{public}@", buf, 0xCu);
          }

        }
        v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v22);
    }

    v20 = v43;
  }
  if (-[NMSyncDefaults wantToReadEnabled](v20->_sharedDefaults, "wantToReadEnabled"))
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[NMSyncDefaults wantToReadAudiobooks](v20->_sharedDefaults, "wantToReadAudiobooks");
    objb = (id)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v48 != v32)
            objc_enumerationMutation(objb);
          v34 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
          v35 = [NMSItemGroupEnumerator alloc];
          +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:", v34, (unint64_t)v10, 0, v3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[NMSItemGroupEnumerator initWithItemGroup:](v35, "initWithItemGroup:", v36);
          objc_msgSend(v8, "addObject:", v37);

          NMLogForCategory(5);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v63 = v34;
            _os_log_impl(&dword_216E27000, v38, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding wantToRead audiobook %{public}@", buf, 0xCu);
          }

        }
        v31 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v31);
    }

  }
  v39 = [NMSSequentialItemEnumerator alloc];
  v40 = (void *)objc_msgSend(v8, "copy");
  v41 = -[NMSSequentialItemEnumerator initWithItemEnumerators:](v39, "initWithItemEnumerators:", v40);

  return v41;
}

- (id)_newItemEnumeratorForBundleIdentifier:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.NanoMusic")))
  {
    v7 = -[NMSMediaPinningManager _newMusicEnumeratorWithDownloadedItemsOnly:](self, "_newMusicEnumeratorWithDownloadedItemsOnly:", v4);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.podcasts")))
  {
    -[NMSPodcastsDownloadableContentProvider createItemEnumerator](self->_podcastsDownloadableContentProvider, "createItemEnumerator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.NanoBooks")))
    {
      v8 = 0;
      goto LABEL_8;
    }
    v7 = -[NMSMediaPinningManager _newAudiobooksEnumeratorWithDownloadedItemsOnly:](self, "_newAudiobooksEnumeratorWithDownloadedItemsOnly:", v4);
  }
  v8 = v7;
LABEL_8:

  return v8;
}

- (id)_quotaManagerWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v6;
  id *v7;
  NMSMediaQuotaManager *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const __CFString *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NMSMediaQuotaManager *v21;
  void *v22;
  id *location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _BYTE v30[128];
  _QWORD v31[3];
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  if (-[NMSMediaPinningManager _shouldSkipQuotaManagerEvaluation](self, "_shouldSkipQuotaManagerEvaluation"))
    return 0;
  v6 = 24;
  if (v3)
    v6 = 32;
  v7 = (id *)((char *)&self->super.isa + v6);
  v8 = (NMSMediaQuotaManager *)*(id *)((char *)&self->super.isa + v6);
  if (!v8)
  {
    location = v7;
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v10 = CFSTR("downloaded");
      else
        v10 = CFSTR("added");
      *(_DWORD *)buf = 138412546;
      v33 = v10;
      v34 = 2048;
      v35 = -[NMSMediaPinningManager _mediaQuota](self, "_mediaQuota");
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[QuotaManager Caching] Creating new %@ items quota manager for quota:%llu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = CFSTR("com.apple.NanoMusic");
    v31[1] = CFSTR("com.apple.podcasts");
    v31[2] = CFSTR("com.apple.NanoBooks");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(const __CFString **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (!-[NMSMediaPinningManager _isAppDownloadingDormantForBundleIdentifier:](self, "_isAppDownloadingDormantForBundleIdentifier:", v17))
          {
            v18 = -[NMSMediaPinningManager _newItemEnumeratorForBundleIdentifier:downloadedItemsOnly:](self, "_newItemEnumeratorForBundleIdentifier:downloadedItemsOnly:", v17, v3);
            if (!v18)
              goto LABEL_23;
LABEL_22:
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);
            goto LABEL_23;
          }
          v18 = -[NMSMediaPinningManager _newItemEnumeratorForBundleIdentifier:downloadedItemsOnly:](self, "_newItemEnumeratorForBundleIdentifier:downloadedItemsOnly:", v17, 1);
          NMLogForCategory(12);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v17;
            _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "Skipping downloading of %@ items because it is download-dormant.", buf, 0xCu);
          }

          if (v18)
            goto LABEL_22;
LABEL_23:

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v14);
    }

    v28[0] = CFSTR("com.apple.NanoMusic");
    v28[1] = CFSTR("com.apple.podcasts");
    v29[0] = &unk_24D655998;
    v29[1] = &unk_24D6559B0;
    v28[2] = CFSTR("com.apple.NanoBooks");
    v29[2] = &unk_24D6559C8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [NMSMediaQuotaManager alloc];
    v22 = (void *)objc_msgSend(v11, "copy");
    v8 = -[NMSMediaQuotaManager initWithItemEnumerators:estimatedItemSizes:quota:](v21, "initWithItemEnumerators:estimatedItemSizes:quota:", v22, v20, -[NMSMediaPinningManager _mediaQuota](self, "_mediaQuota"));

    objc_storeStrong(location, v8);
  }
  return v8;
}

- (BOOL)_shouldSkipQuotaManagerEvaluation
{
  if (_shouldSkipQuotaManagerEvaluation_onceToken != -1)
    dispatch_once(&_shouldSkipQuotaManagerEvaluation_onceToken, &__block_literal_global_4);
  return _shouldSkipQuotaManagerEvaluation_shouldSkipQuotaManagerEvaluation;
}

void __59__NMSMediaPinningManager__shouldSkipQuotaManagerEvaluation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("bookdatastored"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", CFSTR("com.apple.NanoNowPlaying"), CFSTR("com.apple.SessionTrackerApp"), CFSTR("com.apple.NanoSettings"), CFSTR("com.apple.NanoMusic"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.NanoBooks"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "containsObject:", v3))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executableURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v0, "containsObject:", v6);

    if (!v7)
      goto LABEL_7;
  }
  NMLogForCategory(5);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager not supported for this bundle identifier", buf, 2u);
  }

  _shouldSkipQuotaManagerEvaluation_shouldSkipQuotaManagerEvaluation = 1;
LABEL_7:

}

- (BOOL)_shouldCalculateCachedIdentifiers
{
  if (_shouldCalculateCachedIdentifiers_onceToken != -1)
    dispatch_once(&_shouldCalculateCachedIdentifiers_onceToken, &__block_literal_global_107);
  return _shouldCalculateCachedIdentifiers_shouldCalculateCachedIdentifiers;
}

void __59__NMSMediaPinningManager__shouldCalculateCachedIdentifiers__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _shouldCalculateCachedIdentifiers_shouldCalculateCachedIdentifiers = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Bridge"));

}

- (BOOL)_requiresICEnvironmentMonitor
{
  return !-[NMSMediaPinningManager _shouldSkipQuotaManagerEvaluation](self, "_shouldSkipQuotaManagerEvaluation");
}

- (void)_invalidateAddedItemsCache
{
  NSObject *v3;
  NMSMediaQuotaManager *addedItemsQuotaManager;
  NMSMediaQuotaManager *downloadedItemsQuotaManager;
  NMSMediaQuotaManager_Legacy *legacy_addedItemsQuotaManager;
  NMSMediaQuotaManager_Legacy *legacy_downloadedItemsQuotaManager;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[QuotaManager Caching] NMSMediaPinningManager invalidating addedItemsCache. [Internal]", v8, 2u);
  }

  addedItemsQuotaManager = self->_addedItemsQuotaManager;
  self->_addedItemsQuotaManager = 0;

  downloadedItemsQuotaManager = self->_downloadedItemsQuotaManager;
  self->_downloadedItemsQuotaManager = 0;

  legacy_addedItemsQuotaManager = self->_legacy_addedItemsQuotaManager;
  self->_legacy_addedItemsQuotaManager = 0;

  legacy_downloadedItemsQuotaManager = self->_legacy_downloadedItemsQuotaManager;
  self->_legacy_downloadedItemsQuotaManager = 0;

}

- (void)_invalidateMediaCacheForAppIdentifiers:(unint64_t)a3
{
  char v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!-[NMSMediaPinningManager _shouldSkipQuotaManagerEvaluation](self, "_shouldSkipQuotaManagerEvaluation"))
  {
    -[NMSMediaPinningManager _invalidateAddedItemsCache](self, "_invalidateAddedItemsCache");
    if (-[NMSMediaPinningManager _shouldCalculateCachedIdentifiers](self, "_shouldCalculateCachedIdentifiers"))
    {
      if ((v3 & 1) != 0)
      {
        NMLogForCategory(5);
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Music cache. Refreshing playlists and albums [Internal]", buf, 2u);
        }

        -[NMSMediaPinningManager _refreshMusicIdentifiers](self, "_refreshMusicIdentifiers");
        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "postNotificationName:object:", CFSTR("NMSMediaPinningMusicContentsInvalidatedNotification"), 0);

        if ((v3 & 2) == 0)
        {
LABEL_5:
          if ((v3 & 4) == 0)
          {
LABEL_16:
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __65__NMSMediaPinningManager__invalidateMediaCacheForAppIdentifiers___block_invoke;
            block[3] = &unk_24D646F30;
            block[4] = self;
            dispatch_async(MEMORY[0x24BDAC9B8], block);
            return;
          }
LABEL_13:
          NMLogForCategory(5);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Audiobooks cache. [Internal]", buf, 2u);
          }

          -[NMSMediaPinningManager _refreshAudiobooksIdentifiers](self, "_refreshAudiobooksIdentifiers");
          objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "postNotificationName:object:", CFSTR("NMSMediaPinningAudiobooksContentsInvalidatedNotification"), 0);

          goto LABEL_16;
        }
      }
      else if ((v3 & 2) == 0)
      {
        goto LABEL_5;
      }
      NMLogForCategory(5);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager invalidating Podcasts cache. Refreshing shows [Internal]", buf, 2u);
      }

      -[NMSMediaPinningManager _refreshPodcastsIdentifiers](self, "_refreshPodcastsIdentifiers");
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("NMSMediaPinningPodcastsContentsInvalidatedNotification"), 0);

      if ((v3 & 4) == 0)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
}

void __65__NMSMediaPinningManager__invalidateMediaCacheForAppIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerDownloadInfoDidInvalidateNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)_isAlbumPinned:(id)a3
{
  NSObject *internalQueue;
  id v5;
  void *v6;

  internalQueue = self->_internalQueue;
  v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  -[NMSyncDefaults pinnedAlbums](self->_sharedDefaults, "pinnedAlbums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(internalQueue) = objc_msgSend(v6, "containsObject:", v5);

  return (char)internalQueue;
}

- (BOOL)_isPlaylistPinned:(id)a3
{
  NSObject *internalQueue;
  id v5;
  void *v6;

  internalQueue = self->_internalQueue;
  v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  -[NMSyncDefaults pinnedPlaylists](self->_sharedDefaults, "pinnedPlaylists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(internalQueue) = objc_msgSend(v6, "containsObject:", v5);

  return (char)internalQueue;
}

- (BOOL)_isAudiobookPinned:(id)a3
{
  NSObject *internalQueue;
  id v5;
  void *v6;

  internalQueue = self->_internalQueue;
  v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  -[NMSyncDefaults pinnedAudiobooks](self->_sharedDefaults, "pinnedAudiobooks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(internalQueue) = objc_msgSend(v6, "containsObject:", v5);

  return (char)internalQueue;
}

- (double)_audiobookDownloadLimit
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NMSyncDefaults audiobookDownloadLimit](self->_sharedDefaults, "audiobookDownloadLimit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NMSyncDefaults audiobookDownloadLimit](self->_sharedDefaults, "audiobookDownloadLimit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

  }
  else
  {
    v6 = 18000.0;
  }

  return v6;
}

+ (id)_cachedPlaylistIdentifiersFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_cachedIdentifiersDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("playlists"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_cachedAlbumIdentifiersFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_cachedIdentifiersDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("albums"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_cachedAudiobookIdentifiersFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_cachedIdentifiersDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("audiobooks"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(".plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_cachedIdentifiersDirectoryPath
{
  if (_cachedIdentifiersDirectoryPath_onceToken != -1)
    dispatch_once(&_cachedIdentifiersDirectoryPath_onceToken, &__block_literal_global_118);
  return (id)_cachedIdentifiersDirectoryPath_path;
}

void __57__NMSMediaPinningManager__cachedIdentifiersDirectoryPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = CFSTR("Library");
  v4[2] = CFSTR("NanoMusicSync");
  v4[3] = CFSTR("CachedIdentifiers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_cachedIdentifiersDirectoryPath_path;
  _cachedIdentifiersDirectoryPath_path = v1;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _cachedIdentifiersDirectoryPath_path, 1, 0, 0);

}

+ (unint64_t)_mediaStorageSizeForCurrentDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedLongLongValue");
    _mediaStorageSizeForCurrentDevice_totalCapacity = v6;
  }
  else
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[NMSMediaPinningManager _mediaStorageSizeForCurrentDevice].cold.1();

    v6 = _mediaStorageSizeForCurrentDevice_totalCapacity;
  }
  v8 = 16000000000;
  if (v6 <= 0x3B9ACA000 && (v8 = 8000000000, v6 <= 0x1DCD65000))
    v8 = _mediaStorageSizeForCurrentDevice_mediaStorageSize;
  else
    _mediaStorageSizeForCurrentDevice_mediaStorageSize = v8;

  return v8;
}

- (unint64_t)_mediaQuota
{
  NSNumber *v3;
  NSNumber *mediaQuota;
  void *v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;
  unint64_t v9;

  if (!self->_mediaQuota)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend((id)objc_opt_class(), "_mediaStorageSizeForCurrentDevice"));
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    mediaQuota = self->_mediaQuota;
    self->_mediaQuota = v3;

  }
  -[NMSyncDefaults objectForKey:](self->_sharedDefaults, "objectForKey:", CFSTR("AutomaticDownloadsQuota"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "unsignedLongLongValue"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_mediaQuota;
    self->_mediaQuota = v7;

  }
  v9 = -[NSNumber unsignedLongLongValue](self->_mediaQuota, "unsignedLongLongValue");

  return v9;
}

+ (id)_fetchMusicRecommendations
{
  void *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  +[NMSMusicRecommendationManager sharedManager](NMSMusicRecommendationManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__NMSMediaPinningManager__fetchMusicRecommendations__block_invoke;
  v7[3] = &unk_24D647960;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v2, "fetchRecommendationsWithQueue:completion:", 0, v7);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __52__NMSMediaPinningManager__fetchMusicRecommendations__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSArray)albumIdentifiers
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__NMSMediaPinningManager_albumIdentifiers__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __42__NMSMediaPinningManager_albumIdentifiers__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[8])
  {
    v3 = objc_msgSend(v2, "_shouldCalculateCachedIdentifiers");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "_refreshMusicIdentifiers");
    else
      objc_msgSend(v4, "_fetchMusicIdentifiers");
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)_fetchMusicIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Failed to unarchive cached albumIdentifiers due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_refreshMusicIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Failed to archive albumIdentifiers due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));

}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));

}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = a2;
  objc_msgSend(v2, "workoutPlaylistID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v4, "longLongValue"));

}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v4, "persistentID"));

}

void __50__NMSMediaPinningManager__refreshMusicIdentifiers__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v4, "persistentID"));

}

- (NSArray)pinnedAlbums
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__NMSMediaPinningManager_pinnedAlbums__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __38__NMSMediaPinningManager_pinnedAlbums__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedAlbums");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)playlistIdentifiers
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__NMSMediaPinningManager_playlistIdentifiers__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__NMSMediaPinningManager_playlistIdentifiers__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[7])
  {
    v3 = objc_msgSend(v2, "_shouldCalculateCachedIdentifiers");
    v4 = *(void **)(a1 + 32);
    if (v3)
      objc_msgSend(v4, "_refreshMusicIdentifiers");
    else
      objc_msgSend(v4, "_fetchMusicIdentifiers");
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (NSArray)pinnedPlaylists
{
  NSObject *internalQueue;
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPlaylists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = a1 + 40;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 112))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_2;
    v15[3] = &unk_24D6479B0;
    v15[4] = v7;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    if (v10 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40), "count"))
    {
      NMLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_cold_1();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectsAtIndexes:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPinnedPlaylists:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 1;

  }
}

uint64_t __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "_playlistPIDValidForPinning:", v2);

  return v3;
}

- (BOOL)isAlbumPinned:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NMSMediaPinningManager_isAlbumPinned___block_invoke;
  block[3] = &unk_24D647810;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __40__NMSMediaPinningManager_isAlbumPinned___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isAlbumPinned:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)isPlaylistPinned:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__NMSMediaPinningManager_isPlaylistPinned___block_invoke;
  block[3] = &unk_24D647810;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __43__NMSMediaPinningManager_isPlaylistPinned___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isPlaylistPinned:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)pinAlbum:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NMSMediaPinningManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NMSMediaPinningManager_pinAlbum_completionHandler___block_invoke;
  block[3] = &unk_24D647098;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __53__NMSMediaPinningManager_pinAlbum_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Pinning album <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedAlbums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedAlbums:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 1);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);

}

- (void)pinPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__NMSMediaPinningManager_pinPlaylist_completionHandler___block_invoke;
  block[3] = &unk_24D647098;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __56__NMSMediaPinningManager_pinPlaylist_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_opt_class(), "_playlistPIDValidForPinning:", *(_QWORD *)(a1 + 40));
  NMLogForCategory(5);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    v5 = *(_QWORD *)(a1 + 40);
    if ((_DWORD)v2)
      v4 = CFSTR("YES");
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "[Pinning Validation] pinPlaylist: <%{public}@>, valid: %@", (uint8_t *)&v11, 0x16u);
  }

  if ((_DWORD)v2)
  {
    NMLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "Pinning playlist <%{public}@>", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pinnedPlaylists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPinnedPlaylists:", v9);
    objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 1);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v2);
  return result;
}

- (void)unpinAlbum:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NMSMediaPinningManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__NMSMediaPinningManager_unpinAlbum_completionHandler___block_invoke;
  block[3] = &unk_24D647098;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __55__NMSMediaPinningManager_unpinAlbum_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning album <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedAlbums");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedAlbums:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 1);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);

}

- (void)unpinPlaylist:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NMSMediaPinningManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NMSMediaPinningManager_unpinPlaylist_completionHandler___block_invoke;
  block[3] = &unk_24D647098;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

void __58__NMSMediaPinningManager_unpinPlaylist_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_216E27000, v2, OS_LOG_TYPE_DEFAULT, "Unpinning playlist <%{public}@>", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "pinnedPlaylists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setPinnedPlaylists:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_invalidateMediaCacheForAppIdentifiers:", 1);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);

}

+ (BOOL)_playlistPIDValidForPinning:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  if (objc_msgSend(v3, "longLongValue"))
  {
    objc_msgSend(MEMORY[0x24BE6B198], "predicateWithProperty:value:comparison:", *MEMORY[0x24BE6B088], v3, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BE6B1A0];
    objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unrestrictedQueryWithLibrary:predicate:orderingTerms:", v6, v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    *((_BYTE *)v23 + 24) = 1;
    v8 = *MEMORY[0x24BE6B0B0];
    v26[0] = *MEMORY[0x24BE6B0C8];
    v26[1] = v8;
    v9 = *MEMORY[0x24BE6B0A8];
    v26[2] = *MEMORY[0x24BE6B0E0];
    v26[3] = v9;
    v26[4] = *MEMORY[0x24BE6B0D8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__NMSMediaPinningManager__playlistPIDValidForPinning___block_invoke;
    v14[3] = &unk_24D6479D8;
    v16 = &v18;
    v15 = v3;
    v17 = &v22;
    objc_msgSend(v7, "enumeratePersistentIDsAndProperties:usingBlock:", v10, v14);

    if (v19[3] != 1)
    {
      NMLogForCategory(5);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[NMSMediaPinningManager _playlistPIDValidForPinning:].cold.2();

      *((_BYTE *)v23 + 24) = 0;
    }

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[NMSMediaPinningManager _playlistPIDValidForPinning:].cold.1();
  }

  v12 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __54__NMSMediaPinningManager__playlistPIDValidForPinning___block_invoke(_QWORD *a1, uint64_t a2, id *a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v5 = objc_msgSend(a3[1], "BOOLValue");
  v6 = objc_msgSend(a3[2], "BOOLValue");
  v7 = objc_msgSend(a3[3], "BOOLValue");
  v8 = objc_msgSend(a3[4], "BOOLValue");
  v9 = v8;
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (v7 & 1) != 0 || v8)
  {
    NMLogForCategory(5);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = a1[4];
      v12 = 138544386;
      v13 = v11;
      v14 = 1024;
      v15 = v5;
      v16 = 1024;
      v17 = v6;
      v18 = 1024;
      v19 = v7;
      v20 = 1024;
      v21 = v9;
      _os_log_error_impl(&dword_216E27000, v10, OS_LOG_TYPE_ERROR, "[Pinning Validation] Rejecting invalid Playlist PID: %{public}@ -- hidden:%d geniusPlaylist:%d geniusMix:%d folder:%d", (uint8_t *)&v12, 0x24u);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
}

- (void)_updateWorkoutSettingsPlaylistPIDTo:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
  if (objc_msgSend(v7, "longLongValue"))
  {
    objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("EnableMusicAutoStart"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("MusicPlaylistPersistentID"));
  }
  else
  {
    objc_msgSend(v3, "setBool:forKey:", 0, CFSTR("EnableMusicAutoStart"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("MusicPlaylistPersistentID"));
  }
  v4 = (id)objc_msgSend(v3, "synchronize");
  v5 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MusicPlaylistPersistentID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronizeNanoDomain:keys:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), v6);

}

- (void)_setWorkoutPlaylistID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  NMSKeepLocalRequestOptions *v13;
  void *v14;
  int v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("06FB3B8E-7CE9-4C98-A47E-87BCCCB70EC1"));
  v10 = objc_msgSend(v8, "supportsCapability:", v9);

  if ((v10 & 1) != 0)
  {
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "Setting workoutPlaylistID <%{public}@>", buf, 0xCu);
    }

    -[NMSyncDefaults setWorkoutPlaylistID:](self->_sharedDefaults, "setWorkoutPlaylistID:", v4);
    -[NMSMediaPinningManager _updateWorkoutSettingsPlaylistPIDTo:](self, "_updateWorkoutSettingsPlaylistPIDTo:", v4);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDDC948], "nms_modelObjectWithLibraryPersistentID:", objc_msgSend(v4, "integerValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(NMSKeepLocalRequestOptions);
      -[NMSKeepLocalRequestOptions setRequiresValidation:](v13, "setRequiresValidation:", 0);
      -[NMSKeepLocalRequestOptions setPowerPolicy:](v13, "setPowerPolicy:", 2);
      -[NMSKeepLocalRequestOptions setCellularPolicy:](v13, "setCellularPolicy:", 2);
      -[NMSKeepLocalRequestOptions setQualityOfService:](v13, "setQualityOfService:", 25);
      -[NMSKeepLocalRequestOptions setTimeout:](v13, "setTimeout:", 0.0);
      v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithModelObject:enableState:", v12, 1);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke;
      v19[3] = &unk_24D647A00;
      v20 = v4;
      objc_msgSend(v14, "performWithOptions:completion:", v13, v19);

    }
  }
  else
  {
    if (objc_msgSend(v4, "longLongValue"))
      v15 = objc_msgSend((id)objc_opt_class(), "_playlistPIDValidForPinning:", v4);
    else
      v15 = 1;
    NMLogForCategory(5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("NO");
      if (v15)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v22 = v4;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_216E27000, v16, OS_LOG_TYPE_DEFAULT, "[Pinning Validation] setWorkoutPlaylistID: <%{public}@>, valid: %@", buf, 0x16u);
    }

    if (v15)
    {
      NMLogForCategory(5);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v4;
        _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "Setting workoutPlaylistID <%{public}@>", buf, 0xCu);
      }

      -[NMSyncDefaults setWorkoutPlaylistID:](self->_sharedDefaults, "setWorkoutPlaylistID:", v4);
      -[NMSMediaPinningManager _updateWorkoutSettingsPlaylistPIDTo:](self, "_updateWorkoutSettingsPlaylistPIDTo:", v4);
      -[NMSMediaPinningManager _invalidateMediaCacheForAppIdentifiers:](self, "_invalidateMediaCacheForAppIdentifiers:", 1);
    }
  }

}

void __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    NMLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)setWorkoutPlaylistID:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__NMSMediaPinningManager_setWorkoutPlaylistID___block_invoke;
  v7[3] = &unk_24D647838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

uint64_t __47__NMSMediaPinningManager_setWorkoutPlaylistID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWorkoutPlaylistID:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_deviceSupportsPodcastsPinningSettingsV2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4E0], "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("D718E4BE-8067-432E-AF41-7342473499D5"));
  v7 = objc_msgSend(v5, "supportsCapability:", v6);

  return v7;
}

- (void)_legacy_refreshMusicIdentifiers
{
  void *v3;
  void *v4;
  NSArray *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSArray **p_cachedPlaylistIdentifiers;
  NSArray *v17;
  NSArray *v18;
  char v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NMSMediaPinningManager _legacy_quotaManagerWithDownloadedItemsOnly:](self, "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupIteratorForBundleIdentifier:", CFSTR("com.apple.NanoMusic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiersForContainersOfType:", 1);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "groupIteratorForBundleIdentifier:", CFSTR("com.apple.NanoMusic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifiersForContainersOfType:", 0);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v8 = self->_cachedAlbumIdentifiers;
  if (v8 == v5)
  {

    goto LABEL_9;
  }
  v9 = v8;
  v10 = -[NSArray isEqual:](v8, "isEqual:", v5);

  if ((v10 & 1) != 0)
  {
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;
  if (v12)
  {
    NMLogForCategory(5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NMSMediaPinningManager _refreshMusicIdentifiers].cold.2();

  }
  objc_msgSend((id)objc_opt_class(), "_cachedAlbumIdentifiersFilePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 1;
  objc_msgSend(v11, "writeToFile:atomically:", v14, 1);

  objc_storeStrong((id *)&self->_cachedAlbumIdentifiers, v5);
LABEL_10:
  p_cachedPlaylistIdentifiers = &self->_cachedPlaylistIdentifiers;
  v17 = self->_cachedPlaylistIdentifiers;
  if (v17 == v7)
  {

  }
  else
  {
    v18 = v17;
    v19 = -[NSArray isEqual:](v17, "isEqual:", v7);

    if ((v19 & 1) == 0)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v25;
      if (v21)
      {
        NMLogForCategory(5);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[NMSMediaPinningManager _refreshMusicIdentifiers].cold.1();

      }
      objc_msgSend((id)objc_opt_class(), "_cachedPlaylistIdentifiersFilePath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "writeToFile:atomically:", v23, 1);

      objc_storeStrong((id *)p_cachedPlaylistIdentifiers, v7);
      goto LABEL_19;
    }
  }
  if (v15)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerMusicIdentifiersDidChangeNotification"), 0);

  }
}

- (void)_legacy_refreshPodcastsIdentifiers
{
  NSArray *v3;
  int v4;
  int v5;
  NSArray *v6;
  NSArray *v7;
  int v8;
  NSArray *v9;
  NSArray *v10;
  int v11;
  int legacy_cachedSavedEpisodesEnabled;
  int legacy_cachedPinnedPodcastsAreUserSet;
  void *v14;
  NSArray *obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NMSyncDefaults pinnedPodcastFeedURLs](self->_sharedDefaults, "pinnedPodcastFeedURLs");
  obj = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NMSyncDefaults pinnedPodcastStationUUIDs](self->_sharedDefaults, "pinnedPodcastStationUUIDs");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v4 = -[NMSyncDefaults savedEpisodesEnabled](self->_sharedDefaults, "savedEpisodesEnabled");
  v5 = -[NMSyncDefaults pinnedPodcastsAreUserSet](self->_sharedDefaults, "pinnedPodcastsAreUserSet");
  v6 = self->_legacy_cachedPodcastFeedURLs;
  v7 = v6;
  if (v6 == obj)
    v8 = 0;
  else
    v8 = -[NSArray isEqual:](v6, "isEqual:") ^ 1;

  v9 = self->_legacy_cachedPodcastStationUUIDs;
  v10 = v9;
  if (v9 == v3)
    v11 = 0;
  else
    v11 = -[NSArray isEqual:](v9, "isEqual:", v3) ^ 1;

  legacy_cachedSavedEpisodesEnabled = self->_legacy_cachedSavedEpisodesEnabled;
  legacy_cachedPinnedPodcastsAreUserSet = self->_legacy_cachedPinnedPodcastsAreUserSet;
  objc_storeStrong((id *)&self->_legacy_cachedPodcastFeedURLs, obj);
  objc_storeStrong((id *)&self->_legacy_cachedPodcastStationUUIDs, v3);
  self->_legacy_cachedSavedEpisodesEnabled = v4;
  self->_legacy_cachedPinnedPodcastsAreUserSet = v5;
  if (((v8 | v11) & 1) != 0 || legacy_cachedSavedEpisodesEnabled != v4 || legacy_cachedPinnedPodcastsAreUserSet != v5)
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification"), 0);

  }
}

- (void)_legacy_refreshAudiobooksIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray **p_cachedAudiobookIdentifiers;
  NSArray *v9;
  NSArray *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  NSArray *v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  -[NMSMediaPinningManager _legacy_quotaManagerWithDownloadedItemsOnly:](self, "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupIteratorForBundleIdentifier:", CFSTR("com.apple.NanoBooks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiersForContainersOfType:", 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__NMSMediaPinningManager__legacy_refreshAudiobooksIdentifiers__block_invoke;
  v18[3] = &unk_24D647A28;
  v7 = v6;
  v19 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);
  p_cachedAudiobookIdentifiers = &self->_cachedAudiobookIdentifiers;
  v9 = self->_cachedAudiobookIdentifiers;
  if (v9 == v7)
  {

  }
  else
  {
    v10 = v9;
    v11 = -[NSArray isEqual:](v9, "isEqual:", v7);

    if ((v11 & 1) == 0)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v17;
      if (v13)
      {
        NMLogForCategory(5);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[NMSMediaPinningManager _refreshAudiobooksIdentifiers].cold.1();

      }
      objc_msgSend((id)objc_opt_class(), "_cachedAudiobookIdentifiersFilePath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeToFile:atomically:", v15, 1);

      objc_storeStrong((id *)p_cachedAudiobookIdentifiers, v6);
      objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("NMSMediaPinningManagerAudiobooksIdentifiersDidChangeNotification"), 0);

    }
  }

}

void __62__NMSMediaPinningManager__legacy_refreshAudiobooksIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "universalStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "adamID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (BOOL)_legacy_musicIsOutOfSpace
{
  NSObject *internalQueue;
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
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__NMSMediaPinningManager__legacy_musicIsOutOfSpace__block_invoke;
  v5[3] = &unk_24D6476D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __51__NMSMediaPinningManager__legacy_musicIsOutOfSpace__block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_legacy_quotaManagerWithDownloadedItemsOnly:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "sizeOfNominatedItemsForBundleIdentifier:", CFSTR("com.apple.NanoMusic"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 > objc_msgSend(v3, "sizeOfItemsWithinQuotaForBundleIdentifier:", CFSTR("com.apple.NanoMusic"));

}

- (id)_legacy_newMusicGroupIteratorWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t k;
  NSObject *v32;
  void *v33;
  char v34;
  int v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  _BOOL4 v39;
  NSObject *v40;
  const char *v41;
  uint32_t v42;
  NSObject *v43;
  NSObject *v44;
  NMSSequentialMediaItemGroupIterator *v45;
  void *v46;
  NMSSequentialMediaItemGroupIterator *v47;
  __int128 v49;
  void *v50;
  NSObject *obj;
  id obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  NSObject *v66;
  __int16 v67;
  NSObject *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v3 = a3;
  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NMSMediaPinningManager _shouldIncludeMusicManualDownloadsInQuotaEvaluation](self, "_shouldIncludeMusicManualDownloadsInQuotaEvaluation"))
  {
    -[NMSyncDefaults workoutPlaylistID](self->_sharedDefaults, "workoutPlaylistID");
    v6 = objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v6;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) workoutPlaylistID: %{public}@", buf, 0xCu);
    }

    if (-[NSObject longLongValue](v6, "longLongValue"))
    {
      +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSyncedPlaylistID:downloadedItemsOnly:", v6, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    obj = v6;
    v9 = v5;
    -[NMSyncDefaults pinnedPlaylists](self->_sharedDefaults, "pinnedPlaylists");
    v10 = objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v10;
      _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedPlaylists %{public}@", buf, 0xCu);
    }

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v12 = v10;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v62 != v15)
            objc_enumerationMutation(v12);
          +[NMSMediaItemGroup itemGroupWithSyncedPlaylistID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSyncedPlaylistID:downloadedItemsOnly:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i), v3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v14);
    }

    -[NMSyncDefaults pinnedAlbums](self->_sharedDefaults, "pinnedAlbums");
    v18 = objc_claimAutoreleasedReturnValue();
    NMLogForCategory(5);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v18;
      _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) pinnedAlbums %{public}@", buf, 0xCu);
    }

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v20 = v18;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v58 != v23)
            objc_enumerationMutation(v20);
          +[NMSMediaItemGroup itemGroupWithSyncedAlbumID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSyncedAlbumID:downloadedItemsOnly:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j), v3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v25);

        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v22);
    }

    v5 = v9;
  }
  objc_msgSend((id)objc_opt_class(), "_fetchMusicRecommendations");
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  if (!v26)
    goto LABEL_52;
  v28 = v26;
  v50 = v5;
  v29 = 0;
  v30 = *(_QWORD *)v54;
  *(_QWORD *)&v27 = 138543618;
  v49 = v27;
  do
  {
    for (k = 0; k != v28; ++k)
    {
      if (*(_QWORD *)v54 != v30)
        objc_enumerationMutation(obja);
      v32 = *(NSObject **)(*((_QWORD *)&v53 + 1) + 8 * k);
      -[NSObject identifier](v32, "identifier", v49);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", NMSRecommendationRecentMusicIdentifier);

      v35 = -[NSObject isSelected](v32, "isSelected");
      v36 = v35;
      if ((v34 & 1) != 0)
      {
        if (v35)
        {
          if (v29)
          {
            NMLogForCategory(5);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v49;
              v66 = v29;
              v67 = 2114;
              v68 = v32;
              _os_log_error_impl(&dword_216E27000, v37, OS_LOG_TYPE_ERROR, "_quotaManager (Music containers) Multiple recentMusicRecommendation; have:%{public}@; got:%{public}@",
                buf,
                0x16u);
            }

          }
          v38 = v29;
          v29 = v32;
          goto LABEL_46;
        }
        NMLogForCategory(5);
        v38 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          goto LABEL_46;
        *(_WORD *)buf = 0;
        v40 = v38;
        v41 = "_quotaManager (Music containers) NOT including disabled Recent Music.";
        v42 = 2;
LABEL_45:
        _os_log_impl(&dword_216E27000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, v42);
        goto LABEL_46;
      }
      NMLogForCategory(5);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (!v36)
      {
        if (!v39)
          goto LABEL_46;
        *(_DWORD *)buf = 138543362;
        v66 = v32;
        v40 = v38;
        v41 = "_quotaManager (Music containers) NOT including disabled store recommendation %{public}@";
        v42 = 12;
        goto LABEL_45;
      }
      if (v39)
      {
        *(_DWORD *)buf = 138543362;
        v66 = v32;
        _os_log_impl(&dword_216E27000, v38, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled store recommendation %{public}@", buf, 0xCu);
      }

      +[NMSMediaItemGroup itemGroupWithRecommendation:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithRecommendation:downloadedItemsOnly:", v32, v3);
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "addObject:", v38);
LABEL_46:

    }
    v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  }
  while (v28);
  v5 = v50;
  if (v29)
  {
    NMLogForCategory(5);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v29;
      _os_log_impl(&dword_216E27000, v43, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) including enabled HR recommendation %{public}@", buf, 0xCu);
    }

    +[NMSMediaItemGroup itemGroupWithRecommendation:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithRecommendation:downloadedItemsOnly:", v29, v3);
    v44 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addObject:", v44);
    goto LABEL_55;
  }
LABEL_52:
  NMLogForCategory(5);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E27000, v44, OS_LOG_TYPE_DEFAULT, "_quotaManager (Music containers) skipping Recent Music because there is no enabled Recent Music recommendation.", buf, 2u);
  }
  v29 = 0;
LABEL_55:

  v45 = [NMSSequentialMediaItemGroupIterator alloc];
  objc_msgSend(v5, "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[NMSMediaItemGroupIterator initWithItemGroups:estimatedItemSize:](v45, "initWithItemGroups:estimatedItemSize:", v46, 7000000);

  return v47;
}

- (id)_legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  NMSAlternatingMediaItemGroupIterator *v29;
  NSObject *v30;
  NMSAlternatingMediaItemGroupIterator *v31;
  void *v32;
  NMSMediaPinningManager *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReady");

  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NMSyncDefaults pinnedPodcastsAreUserSet](self->_sharedDefaults, "pinnedPodcastsAreUserSet");
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v9;
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) pinnedPodcastsAreUserSet %x", buf, 8u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NMSyncDefaults pinnedPodcastsAreUserSet](self->_sharedDefaults, "pinnedPodcastsAreUserSet"))
    {
      if (-[NMSyncDefaults savedEpisodesEnabled](self->_sharedDefaults, "savedEpisodesEnabled"))
      {
        NMLogForCategory(5);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding Saved Episodes item group", buf, 2u);
        }

        +[NMSMediaItemGroup itemGroupWithSavedEpisodesDownloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithSavedEpisodesDownloadedItemsOnly:", v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v12);

      }
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v34 = self;
      -[NMSyncDefaults pinnedPodcastStationUUIDs](self->_sharedDefaults, "pinnedPodcastStationUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v40 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            NMLogForCategory(5);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v45 = v18;
              _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding station %{public}@", buf, 0xCu);
            }

            +[NMSMediaItemGroup itemGroupWithPodcastStationUUID:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithPodcastStationUUID:downloadedItemsOnly:", v18, v3);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v20);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        }
        while (v15);
      }

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[NMSyncDefaults pinnedPodcastFeedURLs](v34->_sharedDefaults, "pinnedPodcastFeedURLs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v21);
            v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
            NMLogForCategory(5);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v45 = v26;
              _os_log_impl(&dword_216E27000, v27, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding podcast with feed url %{public}@", buf, 0xCu);
            }

            +[NMSMediaItemGroup itemGroupWithCustomPodcastFeedURL:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithCustomPodcastFeedURL:downloadedItemsOnly:", v26, v3);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v28);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v23);
      }
    }
    else
    {
      NMLogForCategory(5);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216E27000, v30, OS_LOG_TYPE_DEFAULT, "_quotaManager (Podcasts containers) adding Up Next item group", buf, 2u);
      }

      +[NMSMediaItemGroup itemGroupWithUpNextEpisodesDownloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithUpNextEpisodesDownloadedItemsOnly:", v3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v21);
    }

    v31 = [NMSAlternatingMediaItemGroupIterator alloc];
    v32 = (void *)objc_msgSend(v10, "copy");
    v29 = -[NMSMediaItemGroupIterator initWithItemGroups:estimatedItemSize:](v31, "initWithItemGroups:estimatedItemSize:", v32, 50000000);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NMSMediaPinningManager _legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:].cold.1(v8);

    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attemptToFix");
    v29 = 0;
  }

  return v29;
}

- (id)_legacy_newAudiobooksGroupIteratorWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NMSMediaPinningManager *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NMSSequentialMediaItemGroupIterator *v36;
  void *v37;
  NMSSequentialMediaItemGroupIterator *v38;
  NMSMediaPinningManager *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  _BYTE v57[10];
  uint64_t v58;

  v3 = a3;
  v58 = *MEMORY[0x24BDAC8D0];
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NMSyncDefaults wantToReadEnabled](self->_sharedDefaults, "wantToReadEnabled");
    v7 = -[NMSyncDefaults readingNowEnabled](self->_sharedDefaults, "readingNowEnabled");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v57 = v6;
    *(_WORD *)&v57[4] = 1024;
    *(_DWORD *)&v57[6] = v7;
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobooks containers) wantToReadEnabled: %x, readingNowEnabled: %x", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMediaPinningManager _audiobookDownloadLimit](self, "_audiobookDownloadLimit");
  v10 = v9;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v40 = self;
  -[NMSyncDefaults pinnedAudiobooks](self->_sharedDefaults, "pinnedAudiobooks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:", v16, (unint64_t)v10, 0, v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        NMLogForCategory(5);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v57 = v16;
          _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding pinned audiobook %{public}@", buf, 0xCu);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v13);
  }

  v19 = v40;
  if (-[NMSyncDefaults readingNowEnabled](v40->_sharedDefaults, "readingNowEnabled"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[NMSyncDefaults readingNowAudiobooks](v40->_sharedDefaults, "readingNowAudiobooks");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:", v25, (unint64_t)v10, 0, v3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v26);

          NMLogForCategory(5);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v57 = v25;
            _os_log_impl(&dword_216E27000, v27, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding readingNow audiobook %{public}@", buf, 0xCu);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v22);
    }

    v19 = v40;
  }
  if (-[NMSyncDefaults wantToReadEnabled](v19->_sharedDefaults, "wantToReadEnabled"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[NMSyncDefaults wantToReadAudiobooks](v19->_sharedDefaults, "wantToReadAudiobooks");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
          +[NMSMediaItemGroup itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:](NMSMediaItemGroup, "itemGroupWithAudiobookIdentifier:downloadLimit:manuallyAdded:downloadedItemsOnly:", v33, (unint64_t)v10, 0, v3);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v34);

          NMLogForCategory(5);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v57 = v33;
            _os_log_impl(&dword_216E27000, v35, OS_LOG_TYPE_DEFAULT, "_quotaManager (Audiobook containers) adding wantToRead audiobook %{public}@", buf, 0xCu);
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v30);
    }

  }
  v36 = [NMSSequentialMediaItemGroupIterator alloc];
  objc_msgSend(v8, "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[NMSMediaItemGroupIterator initWithItemGroups:estimatedItemSize:](v36, "initWithItemGroups:estimatedItemSize:", v37, 143000000);

  return v38;
}

- (id)_legacy_newGroupIteratorForBundleIdentifier:(id)a3 downloadedItemsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.NanoMusic")))
  {
    -[NMSMediaPinningManager _legacy_newMusicGroupIteratorWithDownloadedItemsOnly:](self, "_legacy_newMusicGroupIteratorWithDownloadedItemsOnly:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.podcasts")))
  {
    -[NMSMediaPinningManager _legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:](self, "_legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.NanoBooks")))
    {
      v8 = 0;
      goto LABEL_8;
    }
    -[NMSMediaPinningManager _legacy_newAudiobooksGroupIteratorWithDownloadedItemsOnly:](self, "_legacy_newAudiobooksGroupIteratorWithDownloadedItemsOnly:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_8:

  return v8;
}

- (id)_legacy_quotaManagerWithDownloadedItemsOnly:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v6;
  id *v7;
  NMSMediaQuotaManager_Legacy *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const __CFString *v17;
  void *v18;
  NSObject *v19;
  NMSMediaQuotaManager_Legacy *v20;
  void *v21;
  id *location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[3];
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  if (-[NMSMediaPinningManager _shouldSkipQuotaManagerEvaluation](self, "_shouldSkipQuotaManagerEvaluation"))
    return 0;
  v6 = 128;
  if (v3)
    v6 = 136;
  v7 = (id *)((char *)&self->super.isa + v6);
  v8 = (NMSMediaQuotaManager_Legacy *)*(id *)((char *)&self->super.isa + v6);
  if (!v8)
  {
    location = v7;
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v10 = CFSTR("downloaded");
      else
        v10 = CFSTR("added");
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2048;
      v32 = -[NMSMediaPinningManager _mediaQuota](self, "_mediaQuota");
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[QuotaManager Caching] Creating new %@ items quota manager for quota:%llu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = CFSTR("com.apple.NanoMusic");
    v28[1] = CFSTR("com.apple.podcasts");
    v28[2] = CFSTR("com.apple.NanoBooks");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(const __CFString **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (!-[NMSMediaPinningManager _isAppDownloadingDormantForBundleIdentifier:](self, "_isAppDownloadingDormantForBundleIdentifier:", v17))
          {
            -[NMSMediaPinningManager _legacy_newGroupIteratorForBundleIdentifier:downloadedItemsOnly:](self, "_legacy_newGroupIteratorForBundleIdentifier:downloadedItemsOnly:", v17, v3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v18)
              goto LABEL_23;
LABEL_22:
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, v17);
            goto LABEL_23;
          }
          -[NMSMediaPinningManager _legacy_newGroupIteratorForBundleIdentifier:downloadedItemsOnly:](self, "_legacy_newGroupIteratorForBundleIdentifier:downloadedItemsOnly:", v17, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NMLogForCategory(12);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v17;
            _os_log_impl(&dword_216E27000, v19, OS_LOG_TYPE_DEFAULT, "Skipping downloading of %@ items because it is download-dormant.", buf, 0xCu);
          }

          if (v18)
            goto LABEL_22;
LABEL_23:

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v20 = [NMSMediaQuotaManager_Legacy alloc];
    v21 = (void *)objc_msgSend(v11, "copy");
    v8 = -[NMSMediaQuotaManager_Legacy initWithGroupIterators:quota:](v20, "initWithGroupIterators:quota:", v21, -[NMSMediaPinningManager _mediaQuota](self, "_mediaQuota"));

    objc_storeStrong(location, v8);
  }
  return v8;
}

- (void)extensionAccessDidChange
{
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReady");

  if (v4)
  {
    NMLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "NMSMediaPinningManager can open PodcastsDB again. Invalidating added items and kicking off syncs", v6, 2u);
    }

    -[NMSMediaPinningManager invalidatePodcastsCache](self, "invalidatePodcastsCache");
  }
}

- (void)podcastsDownloadableContentControllerContentDidChange:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NMSMediaPinningManager_podcastsDownloadableContentControllerContentDidChange___block_invoke;
  block[3] = &unk_24D646F30;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __80__NMSMediaPinningManager_podcastsDownloadableContentControllerContentDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateMediaCacheForAppIdentifiers:", 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacy_cachedPodcastStationUUIDs, 0);
  objc_storeStrong((id *)&self->_legacy_cachedPodcastFeedURLs, 0);
  objc_storeStrong((id *)&self->_legacy_downloadedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_legacy_addedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_legacy_podcastsDownloadableContentController, 0);
  objc_storeStrong((id *)&self->_cachedAudiobookIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedShowDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedStationDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedSavedEpisodesDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedUpNextDownloadSettings, 0);
  objc_storeStrong((id *)&self->_cachedAlbumIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedPlaylistIdentifiers, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_mediaQuota, 0);
  objc_storeStrong((id *)&self->_downloadedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_addedItemsQuotaManager, 0);
  objc_storeStrong((id *)&self->_podcastsDownloadableContentProvider, 0);
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

void __43__NMSMediaPinningManager_workoutPlaylistID__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_216E27000, a2, a3, "[Pinning Validation] Removing invalid workoutPlaylistID %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_mediaStorageSizeForCurrentDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Could not get total storage information from the active watch: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __41__NMSMediaPinningManager_pinnedPlaylists__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Pinning Validation] Removing invalid pinnedPlaylists; validPlaylistIndices: %{public}@, original pinnedPlaylists: %{public}@");
  OUTLINED_FUNCTION_1();
}

+ (void)_playlistPIDValidForPinning:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "[Pinning Validation] Rejecting invalid Playlist PID: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_playlistPIDValidForPinning:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Pinning Validation] Rejecting invalid Playlist PID: %{public}@ -- matchedObjects:%tu");
  OUTLINED_FUNCTION_1();
}

void __48__NMSMediaPinningManager__setWorkoutPlaylistID___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_216E27000, a2, a3, "Failed to set keep local for workoutPlaylistID <%{public}@>.  Error=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_legacy_newPodcastsGroupIteratorWithDownloadedItemsOnly:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216E27000, log, OS_LOG_TYPE_ERROR, "NMSMediaPinningManager cannot open PodcastsDB. Not adding Podcasts iterator.", v1, 2u);
}

@end
