@implementation AVTStickerUserDefaultsBackend

- (AVTStickerUserDefaultsBackend)initWithWorkQueue:(id)a3 environment:(id)a4 userDefaults:(id)a5
{
  id v9;
  id v10;
  id v11;
  AVTStickerUserDefaultsBackend *v12;
  AVTStickerUserDefaultsBackend *v13;
  uint64_t v14;
  AVTUILogger *logger;
  uint64_t v16;
  NSURL *cacheLocation;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AVTStickerUserDefaultsBackend;
  v12 = -[AVTStickerUserDefaultsBackend init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_msgSend(v10, "logger");
    v14 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v14;

    objc_storeStrong((id *)&v13->_userDefaults, a5);
    objc_msgSend(v10, "stickerImageStoreLocation");
    v16 = objc_claimAutoreleasedReturnValue();
    cacheLocation = v13->_cacheLocation;
    v13->_cacheLocation = (NSURL *)v16;

    -[AVTStickerUserDefaultsBackend getStickersFromUserDefaults](v13, "getStickersFromUserDefaults");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)_RecentStickersChangedExternally, CFSTR("AVTRecentStickerChangedExternallyNotification"), 0, CFNotificationSuspensionBehaviorDrop);
  }

  return v13;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("AVTRecentStickerChangedExternallyNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)AVTStickerUserDefaultsBackend;
  -[AVTStickerUserDefaultsBackend dealloc](&v4, sel_dealloc);
}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  -[AVTStickerUserDefaultsBackend workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__AVTStickerUserDefaultsBackend_recentStickersForFetchRequest_error___block_invoke;
  block[3] = &unk_24DD32A30;
  block[4] = self;
  v14 = &v15;
  v8 = v6;
  v13 = v8;
  dispatch_sync(v7, block);

  v9 = (void *)v16[5];
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    *a4 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __69__AVTStickerUserDefaultsBackend_recentStickersForFetchRequest_error___block_invoke(uint64_t a1)
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
  uint64_t v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "stickers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
LABEL_8:

    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "criteria") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchAllStickers");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v4;
    goto LABEL_8;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "criteria") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchMostRecentStickersWithLimit:", objc_msgSend(*(id *)(a1 + 40), "resultLimit"));
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "criteria") == 3)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "avatarIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stickerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchStickersWithAvatarIdentifier:stickerIdentifier:", v13, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v6 = (void *)v13;
    goto LABEL_8;
  }
}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AVTStickerUserDefaultsBackend workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24DD31E68;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "stickers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke_2;
  v9 = &unk_24DD32A58;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &v6);

  v4 = *(void **)(a1 + 32);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "addStickerWithAvatarIdentifier:stickerIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6, v7, v8, v9, v10);
  else
    objc_msgSend(v4, "updateStickerAtIndex:", v3, v6, v7, v8, v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "saveStickersToUserDefaults");
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);

}

uint64_t __103__AVTStickerUserDefaultsBackend_didUseStickerWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "avatarRecordIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v3, "stickerConfigurationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[AVTStickerUserDefaultsBackend workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __110__AVTStickerUserDefaultsBackend_deleteRecentStickersWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24DD31E68;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

void __110__AVTStickerUserDefaultsBackend_deleteRecentStickersWithAvatarIdentifier_stickerIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "stickersIndexesMatchingAvatarIdentifier:stickerIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stickers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsAtIndexes:", v4);

  objc_msgSend(*(id *)(a1 + 32), "saveStickersToUserDefaults");
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 1, 0);

}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVTStickerUserDefaultsBackend logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke;
  v11[3] = &unk_24DD32020;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "deletingStickerRecentsForRemoteChanges:", v11);

}

void __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke_2;
  v9[3] = &unk_24DD32A80;
  v9[4] = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x22074B1E8](v9);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cacheLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v3, "processChangeTransactionsWithChangeTokenLocation:handler:error:", v4, v2, &v8);
  v6 = v8;

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);

}

uint64_t __88__AVTStickerUserDefaultsBackend_deleteRecentStickersForChangeTracker_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "changeType") == 1)
        {
          v9 = *(void **)(a1 + 32);
          objc_msgSend(v8, "recordIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, 0, 0);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return 1;
}

- (void)_recentStickersChangedExternally
{
  NSObject *v3;
  _QWORD block[5];

  -[AVTStickerUserDefaultsBackend workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__AVTStickerUserDefaultsBackend__recentStickersChangedExternally__block_invoke;
  block[3] = &unk_24DD31D38;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __65__AVTStickerUserDefaultsBackend__recentStickersChangedExternally__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "frequencyCounter");
  objc_msgSend(*(id *)(a1 + 32), "getStickersFromUserDefaults");
  if (objc_msgSend(*(id *)(a1 + 32), "frequencyCounter") != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "stickerBackendDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "stickerBackendDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recentStickersDidChange:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)getStickersFromUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *stickers;
  id v17;

  -[AVTStickerUserDefaultsBackend userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:inDomain:", CFSTR("AVTRecentStickers"), CFSTR("com.apple.animoji"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v10, v4, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTFrequencyCounter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerUserDefaultsBackend setFrequencyCounter:](self, "setFrequencyCounter:", objc_msgSend(v13, "unsignedIntegerValue"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTStickersArray"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v14);
  else
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  stickers = self->_stickers;
  self->_stickers = v15;

}

- (void)saveStickersToUserDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("AVTFrequencyCounter");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AVTStickerUserDefaultsBackend frequencyCounter](self, "frequencyCounter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("AVTStickersArray");
  v11[0] = v3;
  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerUserDefaultsBackend userDefaults](self, "userDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:inDomain:", v6, CFSTR("AVTRecentStickers"), CFSTR("com.apple.animoji"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AVTRecentStickerChangedExternallyNotification"), 0, 0, 1u);

}

- (id)fetchAllStickers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)fetchMostRecentStickersWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") < a3)
  {
    -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v6, "count");

  }
  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", 0, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)fetchStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AVTStickerUserDefaultsBackend stickersIndexesMatchingAvatarIdentifier:stickerIdentifier:](self, "stickersIndexesMatchingAvatarIdentifier:stickerIdentifier:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nextFrequencyCount
{
  -[AVTStickerUserDefaultsBackend setFrequencyCounter:](self, "setFrequencyCounter:", -[AVTStickerUserDefaultsBackend frequencyCounter](self, "frequencyCounter") + 1);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AVTStickerUserDefaultsBackend frequencyCounter](self, "frequencyCounter"));
}

- (id)addNextFrequencyCountToFrequencySum:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  -[AVTStickerUserDefaultsBackend setFrequencyCounter:](self, "setFrequencyCounter:", -[AVTStickerUserDefaultsBackend frequencyCounter](self, "frequencyCounter") + 1);
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = -[AVTStickerUserDefaultsBackend frequencyCounter](self, "frequencyCounter") + v5;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
}

- (void)addStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  id v6;
  id v7;
  AVTStickerRecord *v8;
  void *v9;
  void *v10;
  void *v11;
  AVTStickerRecord *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  AVTStickerRecord *v17;
  _QWORD v18[4];
  AVTStickerRecord *v19;

  v6 = a4;
  v7 = a3;
  v8 = [AVTStickerRecord alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerUserDefaultsBackend nextFrequencyCount](self, "nextFrequencyCount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTStickerRecord initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:](v8, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v10, v7, v6, v11, &unk_24DD42508);

  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __82__AVTStickerUserDefaultsBackend_addStickerWithAvatarIdentifier_stickerIdentifier___block_invoke;
  v18[3] = &unk_24DD32860;
  v19 = v12;
  v17 = v12;
  v14 = objc_msgSend(v13, "indexOfObjectPassingTest:", v18);

  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v15, "addObject:", v17);
  else
    objc_msgSend(v15, "insertObject:atIndex:", v17, v14);

}

BOOL __82__AVTStickerUserDefaultsBackend_addStickerWithAvatarIdentifier_stickerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "frequencySum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frequencySum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "compare:", v5);
  return v6 < 2;
}

- (void)updateStickerAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  AVTStickerRecord *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AVTStickerRecord *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;

  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "frequencySum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerUserDefaultsBackend addNextFrequencyCountToFrequencySum:](self, "addNextFrequencyCountToFrequencySum:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [AVTStickerRecord alloc];
  objc_msgSend(v23, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "avatarRecordIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stickerConfigurationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "serializationVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AVTStickerRecord initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:](v8, "initWithIdentifier:avatarRecordIdentifier:stickerConfigurationIdentifier:frequencySum:serializationVersion:", v9, v10, v11, v7, v12);

  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:atIndexedSubscript:", v13, a3);

  v15 = a3 - 1;
  if (v15 >= 0)
  {
    while (1)
    {
      -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndex:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[AVTStickerRecord frequencySum](v13, "frequencySum");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frequencySum");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "compare:", v19);

      if (v20 != 1)
        break;
      -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "exchangeObjectAtIndex:withObjectAtIndex:", v15, v15 + 1);

      if (v15-- <= 0)
        goto LABEL_7;
    }

  }
LABEL_7:

}

- (id)stickersIndexesMatchingAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
    v8 = objc_msgSend(v7, "length") != 0;
  else
    v8 = 0;
  -[AVTStickerUserDefaultsBackend stickers](self, "stickers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __91__AVTStickerUserDefaultsBackend_stickersIndexesMatchingAvatarIdentifier_stickerIdentifier___block_invoke;
  v14[3] = &unk_24DD32AA8;
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __91__AVTStickerUserDefaultsBackend_stickersIndexesMatchingAvatarIdentifier_stickerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "avatarRecordIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(v4, "stickerConfigurationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "isEqualToString:", v8);
  if (*(_BYTE *)(a1 + 48))
    return v6 & v9;
  else
    return v6 | v9;
}

- (AVTStickerBackendDelegate)stickerBackendDelegate
{
  return (AVTStickerBackendDelegate *)objc_loadWeakRetained((id *)&self->_stickerBackendDelegate);
}

- (void)setStickerBackendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stickerBackendDelegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSURL)cacheLocation
{
  return self->_cacheLocation;
}

- (NSMutableArray)stickers
{
  return self->_stickers;
}

- (void)setStickers:(id)a3
{
  objc_storeStrong((id *)&self->_stickers, a3);
}

- (unint64_t)frequencyCounter
{
  return self->_frequencyCounter;
}

- (void)setFrequencyCounter:(unint64_t)a3
{
  self->_frequencyCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickers, 0);
  objc_storeStrong((id *)&self->_cacheLocation, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_stickerBackendDelegate);
}

@end
