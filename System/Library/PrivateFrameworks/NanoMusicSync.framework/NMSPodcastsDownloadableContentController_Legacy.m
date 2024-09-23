@implementation NMSPodcastsDownloadableContentController_Legacy

- (NMSPodcastsDownloadableContentController_Legacy)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v15;
  _QWORD handler[4];
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NMSPodcastsDownloadableContentController_Legacy;
  v2 = -[NMSPodcastsDownloadableContentController_Legacy init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.NMSPodcastsDownloadableContentObserver.queue", v3);
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_initWeak(&location, v2);
    v6 = dispatch_source_create(MEMORY[0x24BDAC9C8], 0, 0, *((dispatch_queue_t *)v2 + 1));
    v7 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v6;

    v8 = *((_QWORD *)v2 + 2);
    v9 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __55__NMSPodcastsDownloadableContentController_Legacy_init__block_invoke;
    handler[3] = &unk_24D646E68;
    objc_copyWeak(&v17, &location);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 2));
    *((_BYTE *)v2 + 24) = 0;
    v10 = *((_QWORD *)v2 + 1);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __55__NMSPodcastsDownloadableContentController_Legacy_init__block_invoke_2;
    block[3] = &unk_24D646E68;
    objc_copyWeak(&v15, &location);
    dispatch_async(v10, block);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__handlePersistentStoreRemoteChangeNotification_, *MEMORY[0x24BDBB510], 0);
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel__handlePodcastsPinningSelectionsDidChangeNotification_, CFSTR("com.apple.nanomusicsync.podcasts-pinning-selections"), 0);
    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v2);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return (NMSPodcastsDownloadableContentController_Legacy *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__NMSPodcastsDownloadableContentController_Legacy_setDelegate___block_invoke;
  block[3] = &unk_24D646E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NMSPodcastsDownloadableContentControllerDelegate_Legacy)delegate
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__NMSPodcastsDownloadableContentController_Legacy_delegate__block_invoke;
  v5[3] = &unk_24D646EB8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NMSPodcastsDownloadableContentControllerDelegate_Legacy *)v3;
}

- (void)extensionAccessDidChange
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *queue;
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
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver can access PodcastsDB again", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__NMSPodcastsDownloadableContentController_Legacy_extensionAccessDidChange__block_invoke;
    block[3] = &unk_24D646E68;
    objc_copyWeak(&v8, buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
          _os_log_impl(&dword_216E27000, p_super, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver encountered error trying to fetch previous history token %@", buf, 0xCu);
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
        _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver has never processed persistent history data", buf, 2u);
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
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
        v11 = "NMSPodcastsDownloadableContentObserver set last processed persistent history token %@";
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
        v11 = "NMSPodcastsDownloadableContentObserver encountered error archiving last persistent history token %@";
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
    _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver set last processed persistent history token to nil. Removing default.", buf, 2u);
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

- (id)_relevantEpisodeProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[14];

  v12[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BE73988];
  v12[0] = *MEMORY[0x24BE739C0];
  v12[1] = v3;
  v4 = *MEMORY[0x24BE73928];
  v12[2] = *MEMORY[0x24BE73990];
  v12[3] = v4;
  v5 = *MEMORY[0x24BE738D0];
  v12[4] = *MEMORY[0x24BE73910];
  v12[5] = v5;
  v6 = *MEMORY[0x24BE739B0];
  v12[6] = *MEMORY[0x24BE73960];
  v12[7] = v6;
  v7 = *MEMORY[0x24BE73908];
  v12[8] = *MEMORY[0x24BE73950];
  v12[9] = v7;
  v8 = *MEMORY[0x24BE73900];
  v12[10] = *MEMORY[0x24BE73998];
  v12[11] = v8;
  v12[12] = *MEMORY[0x24BE73940];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_changeContainsRelevantEpisodeChanges:(id)a3
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

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE739E8]))
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
            -[NMSPodcastsDownloadableContentController_Legacy _relevantEpisodeProperties](self, "_relevantEpisodeProperties");
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

- (id)_relevantShowProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[14];

  v12[13] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BE73AE0];
  v12[0] = *MEMORY[0x24BE73AE8];
  v12[1] = v3;
  v4 = *MEMORY[0x24BE73AF0];
  v12[2] = *MEMORY[0x24BE73B48];
  v12[3] = v4;
  v5 = *MEMORY[0x24BE73AC8];
  v12[4] = *MEMORY[0x24BE73B28];
  v12[5] = v5;
  v6 = *MEMORY[0x24BE73AB0];
  v12[6] = *MEMORY[0x24BE73B20];
  v12[7] = v6;
  v7 = *MEMORY[0x24BE73B40];
  v12[8] = *MEMORY[0x24BE73AA0];
  v12[9] = v7;
  v8 = *MEMORY[0x24BE73B30];
  v12[10] = *MEMORY[0x24BE73B38];
  v12[11] = v8;
  v12[12] = *MEMORY[0x24BE73AD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_changeContainsRelevantShowChanges:(id)a3
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

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE739F8]))
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
            -[NMSPodcastsDownloadableContentController_Legacy _relevantShowProperties](self, "_relevantShowProperties");
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

- (id)_relevantStationProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BE73A80];
  v10[0] = *MEMORY[0x24BE73A88];
  v10[1] = v3;
  v4 = *MEMORY[0x24BE73A50];
  v10[2] = *MEMORY[0x24BE73A58];
  v10[3] = v4;
  v5 = *MEMORY[0x24BE73A78];
  v10[4] = *MEMORY[0x24BE73A70];
  v10[5] = v5;
  v6 = *MEMORY[0x24BE73A40];
  v10[6] = *MEMORY[0x24BE73A48];
  v10[7] = v6;
  v10[8] = *MEMORY[0x24BE73A60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_changeContainsRelevantStationChanges:(id)a3
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

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE739F0]))
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
            -[NMSPodcastsDownloadableContentController_Legacy _relevantStationProperties](self, "_relevantStationProperties");
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
            -[NMSPodcastsDownloadableContentController_Legacy _relevantChannelProperties](self, "_relevantChannelProperties");
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
        if (-[NMSPodcastsDownloadableContentController_Legacy _changeContainsRelevantEpisodeChanges:](self, "_changeContainsRelevantEpisodeChanges:", v9)|| -[NMSPodcastsDownloadableContentController_Legacy _changeContainsRelevantShowChanges:](self, "_changeContainsRelevantShowChanges:", v9)|| -[NMSPodcastsDownloadableContentController_Legacy _changeContainsRelevantStationChanges:](self, "_changeContainsRelevantStationChanges:", v9)|| -[NMSPodcastsDownloadableContentController_Legacy _changeContainsRelevantChannelChanges:](self, "_changeContainsRelevantChannelChanges:", v9))
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
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  id buf[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_delegateNotificationPending)
  {
    _MTLogCategoryDatabase();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_216E27000, v3, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver delegate notification pending.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    self->_delegateNotificationPending = 1;
    objc_initWeak(buf, self);
    v4 = dispatch_time(0, 8000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__NMSPodcastsDownloadableContentController_Legacy__notifyDelegateContentDidChange__block_invoke;
    block[3] = &unk_24D646E68;
    objc_copyWeak(&v7, buf);
    dispatch_after(v4, queue, block);
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (void)_notifyDelegateContentDidChangeImmediately
{
  id WeakRetained;
  char v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_delegateNotificationPending = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "podcastsDownloadableContentControllerContentDidChange:", self);

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
    _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_INFO, "NMSPodcastsDownloadableContentObserver received %@ with token %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isReady");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSPodcastsDownloadableContentController_Legacy _ctx](self, "_ctx");
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
      _os_log_impl(&dword_216E27000, v14, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver cannot open Podcasts DB. Will not respond to notification.", (uint8_t *)&v16, 2u);
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NMSPodcastsDownloadableContentController_Legacy _ctx](self, "_ctx");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  -[NMSPodcastsDownloadableContentController_Legacy lastMergedToken](self, "lastMergedToken");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v37[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultType:", 5);
  objc_msgSend(v4, "setFetchBatchSize:", 200);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__0;
  v28[4] = __Block_byref_object_dispose__0;
  v5 = MEMORY[0x24BDAC760];
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke;
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
      _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver encountered error trying to fetch store result %@", (uint8_t *)&buf, 0xCu);
    }

    _MTLogCategoryDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver clearing out persistent history token and performing a full persistent history run", (uint8_t *)&buf, 2u);
    }

    -[NMSPodcastsDownloadableContentController_Legacy setLastMergedToken:](self, "setLastMergedToken:", 0);
    v11 = (void *)v31[5];
    v31[5] = 0;

    objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setResultType:", 5);
    objc_msgSend(v12, "setFetchBatchSize:", 200);
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke_20;
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
        _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver encountered error trying to fetch store result after setting to nil %@", (uint8_t *)&buf, 0xCu);
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
  v17[2] = __88__NMSPodcastsDownloadableContentController_Legacy__processLatestPersistenHistoryChanges__block_invoke_21;
  v17[3] = &unk_24D646F08;
  v17[4] = self;
  v17[5] = v28;
  v17[6] = &buf;
  v17[7] = &v36;
  objc_msgSend(v6, "performBlockAndWait:", v17);
  -[NMSPodcastsDownloadableContentController_Legacy setLastMergedToken:](self, "setLastMergedToken:", v37[5]);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    _MTLogCategoryDatabase();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_216E27000, v15, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver notifying delegate", v16, 2u);
    }

    -[NMSPodcastsDownloadableContentController_Legacy _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
  }
  _Block_object_dispose(&buf, 8);
LABEL_16:

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

- (void)_handlePodcastsPinningSelectionsDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsInProcessNotification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    _MTLogCategoryDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver pinning selections did change", buf, 2u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__NMSPodcastsDownloadableContentController_Legacy__handlePodcastsPinningSelectionsDidChangeNotification___block_invoke;
    block[3] = &unk_24D646F30;
    block[4] = self;
    dispatch_async(queue, block);
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReady");

  if ((v4 & 1) != 0)
  {
    *(_QWORD *)v17 = 0;
    v18 = v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v22 = 0;
    -[NMSPodcastsDownloadableContentController_Legacy _ctx](self, "_ctx");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __97__NMSPodcastsDownloadableContentController_Legacy__resetPersistentHistoryTokenAndNotifyObservers__block_invoke;
    v14 = &unk_24D646EB8;
    v16 = v17;
    v6 = v5;
    v15 = v6;
    objc_msgSend(v6, "performBlockAndWait:", &v11);
    -[NMSPodcastsDownloadableContentController_Legacy setLastMergedToken:](self, "setLastMergedToken:", *((_QWORD *)v18 + 5), v11, v12, v13, v14);
    _MTLogCategoryDatabase();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_QWORD *)v18 + 5);
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_216E27000, v7, OS_LOG_TYPE_DEFAULT, "NMSPodcastsDownloadableContentObserver resetting persistent history token and notifying observers. Latest token %@", buf, 0xCu);
    }

    -[NMSPodcastsDownloadableContentController_Legacy _notifyDelegateContentDidChange](self, "_notifyDelegateContentDidChange");
    _Block_object_dispose(v17, 8);

  }
  else
  {
    _MTLogCategoryDatabase();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_ERROR, "NMSPodcastsDownloadableContentObserver cannot open Podcasts DB. Will not reset persistent history.", v17, 2u);
    }

    objc_msgSend(MEMORY[0x24BE737F0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attemptToFix");

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastMergedToken, 0);
  objc_storeStrong((id *)&self->_persistentHistorySource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
