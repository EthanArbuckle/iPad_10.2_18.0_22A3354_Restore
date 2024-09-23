@implementation CPAnalyticsBiomeDestination

- (CPAnalyticsBiomeDestination)initWithConfig:(id)a3 cpAnalyticsInstance:(id)a4
{
  id v5;
  CPAnalyticsBiomeDestination *v6;
  NSMutableArray *v7;
  NSMutableArray *eventMatchers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPAnalyticsBiomeDestination;
  v6 = -[CPAnalyticsBiomeDestination init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    eventMatchers = v6->_eventMatchers;
    v6->_eventMatchers = v7;

    -[CPAnalyticsBiomeDestination _updateWithConfig:](v6, "_updateWithConfig:", v5);
  }

  return v6;
}

- (void)_updateWithConfig:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CPAnalyticsCoreDuetEventMatcher *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("events"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = -[CPAnalyticsCoreDuetEventMatcher initWithConfig:]([CPAnalyticsCoreDuetEventMatcher alloc], "initWithConfig:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          if (v10)
            -[NSMutableArray addObject:](self->_eventMatchers, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPAnalyticsBiomeDestination eventMatchers](self, "eventMatchers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
      if (objc_msgSend(v10, "doesMatch:", v4))
      {
        -[CPAnalyticsBiomeDestination _sendBiomeEvent:matcher:](self, "_sendBiomeEvent:matcher:", v4, v10);
        if (!objc_msgSend(v10, "matchNextEvent"))
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_baseSampleFromEvent:(id)a3 matcher:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CPAnalyticsBiomeBaseSample *v12;
  void *v13;
  CPAnalyticsBiomeBaseSample *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifierPropertyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subsetPropertyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subsetPropertyValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "propertyForKey:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v12 = [CPAnalyticsBiomeBaseSample alloc];
  objc_msgSend(v5, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CPAnalyticsBiomeBaseSample initWithIdentifier:andDate:forSubset:](v12, "initWithIdentifier:andDate:forSubset:", v8, v13, v10);

  return v14;
}

- (void)_sendBiomeEvent:(id)a3 matcher:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CPAnalyticsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "datasetName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_20AB22000, v8, OS_LOG_TYPE_INFO, "Enter with matcher %@", (uint8_t *)&v13, 0xCu);

  }
  objc_msgSend(v7, "datasetName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPAnalyticsBiomeDestination _baseSampleFromEvent:matcher:](self, "_baseSampleFromEvent:matcher:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPAnalyticsBiomeDestination _datasetNameInMemoryCuration:](self, "_datasetNameInMemoryCuration:", v10))
  {
    -[CPAnalyticsBiomeDestination _donateMemoryCurationWithBaseSample:andEvent:](self, "_donateMemoryCurationWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/memories/moviePlayed")))
  {
    -[CPAnalyticsBiomeDestination _donateMemoryMoviePlayedWithBaseSample:andEvent:](self, "_donateMemoryMoviePlayedWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/memories/notification")))
  {
    -[CPAnalyticsBiomeDestination _dondateMemoryNotificationWithBaseSample:andEvent:](self, "_dondateMemoryNotificationWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("/photos/memories/share")))
  {
    -[CPAnalyticsBiomeDestination _donateMemorySharedWithBaseSample:andEvent:](self, "_donateMemorySharedWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("/photos/memories/viewed")))
  {
    -[CPAnalyticsBiomeDestination _donateMemoryViewedWithBaseSample:andEvent:](self, "_donateMemoryViewedWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("/photos/generativeMemory/create")))
  {
    -[CPAnalyticsBiomeDestination _donateGenerativeMemoryCreationWithBaseSample:andEvent:](self, "_donateGenerativeMemoryCreationWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/deletes")))
  {
    -[CPAnalyticsBiomeDestination _donatePhotoDeleteEventWithBaseSample:andEvent:](self, "_donatePhotoDeleteEventWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/edit")))
  {
    -[CPAnalyticsBiomeDestination _donatePhotoEditEventWithBaseSample:andEvent:](self, "_donatePhotoEditEventWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/engagement")))
  {
    -[CPAnalyticsBiomeDestination _donatePhotoEngagmentEventWithBaseSample:andEvent:](self, "_donatePhotoEngagmentEventWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/favorites")))
  {
    -[CPAnalyticsBiomeDestination _donatePhotoFavoritesEventWithBaseSample:andEvent:](self, "_donatePhotoFavoritesEventWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/share")))
  {
    -[CPAnalyticsBiomeDestination _donatePhotoShareEventWithBaseSample:andEvent:](self, "_donatePhotoShareEventWithBaseSample:andEvent:", v11, v6);
  }
  else if (objc_msgSend(v10, "hasPrefix:", CFSTR("/photos/search")))
  {
    -[CPAnalyticsBiomeDestination _donatePhotoSearchEventWithBaseSample:andEvent:](self, "_donatePhotoSearchEventWithBaseSample:andEvent:", v11, v6);
  }
  else
  {
    CPAnalyticsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v10;
      _os_log_error_impl(&dword_20AB22000, v12, OS_LOG_TYPE_ERROR, "No donation method implemented for %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (BOOL)_datasetNameInMemoryCuration:(id)a3
{
  return objc_msgSend(&unk_24C374980, "containsObject:", a3);
}

- (void)_donateMemoryCurationWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionDeleted"));

  if ((v8 & 1) != 0)
  {
    v9 = 4;
  }
  else
  {
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionBlocked"));

    if ((v11 & 1) != 0)
    {
      v9 = 3;
    }
    else
    {
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionUnfavorited"));

      if ((v13 & 1) != 0)
      {
        v9 = 2;
      }
      else
      {
        objc_msgSend(v6, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionFavorited"));

      }
    }
  }
  BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Photos");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "Memories");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "Curation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x24BE0C590]);
  objc_msgSend(v5, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithIdentifier:subset:type:", v21, v22, v9);

  objc_msgSend(v5, "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  v26 = v25;

  objc_msgSend(v19, "sendEvent:timestamp:", v23, v26);
  CPAnalyticsLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412290;
    v30 = v28;
    _os_log_impl(&dword_20AB22000, v27, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryCuration] Sent a memory curation event with uuid: %@", (uint8_t *)&v29, 0xCu);

  }
}

- (void)_donateMemoryMoviePlayedWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Photos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Memories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MoviePlayed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE0C5D0]);
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithIdentifier:subset:", v11, v12);

  objc_msgSend(v4, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v16 = v15;

  objc_msgSend(v9, "sendEvent:timestamp:", v13, v16);
  CPAnalyticsLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_20AB22000, v17, OS_LOG_TYPE_INFO, "[Biome][Donation][MoviePlayed] Sent a movie played event with uuid: %@", (uint8_t *)&v19, 0xCu);

  }
}

- (void)_dondateMemoryNotificationWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.memoryNotificationSeen"));

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.memoryNotificationResponded"));

    if (v11)
      v9 = 2;
    else
      v9 = 0;
  }
  BiomeLibrary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "Photos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "Memories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Notification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BE0C5D8]);
  objc_msgSend(v5, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithIdentifier:subset:type:", v18, v19, v9);

  objc_msgSend(v5, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  v23 = v22;

  objc_msgSend(v16, "sendEvent:timestamp:", v20, v23);
  CPAnalyticsLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138412290;
    v27 = v25;
    _os_log_impl(&dword_20AB22000, v24, OS_LOG_TYPE_INFO, "[Biome][Donation][Notifications] Sent a memory notifications event with uuid: %@", (uint8_t *)&v26, 0xCu);

  }
}

- (void)_donateMemorySharedWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("isThirdPartyShareDestination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Photos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Memories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BE0C5B8]);
  objc_msgSend(v5, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithIdentifier:subset:isThirdPartyShareDestination:", v13, v14, v6);

  objc_msgSend(v5, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v17;

  objc_msgSend(v11, "sendEvent:timestamp:", v15, v18);
  CPAnalyticsLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v20;
    _os_log_impl(&dword_20AB22000, v19, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryShare] Sent a memory share event with uuid: %@", (uint8_t *)&v21, 0xCu);

  }
}

- (void)_donateMemoryViewedWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  SEL v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[8];
  int v25;
  id v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "propertyForKey:", CFSTR("playTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v6, "propertyForKey:", CFSTR("didPlayToEnd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v9;
  v10 = NSSelectorFromString(CFSTR("initWithIdentifier:viewedDurationBucket:watchedToEnd:"));
  if (!objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", v10))
    goto LABEL_11;
  if ((v8 - 6) < 0xF)
  {
    v11 = 2;
LABEL_6:
    v25 = v11;
    goto LABEL_7;
  }
  if (v8 <= 5)
  {
    v11 = 1;
    goto LABEL_6;
  }
  if (v8 >= 22)
  {
    v11 = 3;
    goto LABEL_6;
  }
  v25 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x24BE0C5C0], "instanceMethodSignatureForSelector:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BE0C5C0]);
  objc_msgSend(v13, "setTarget:", v14);
  objc_msgSend(v13, "setSelector:", v10);
  objc_msgSend(v13, "setArgument:atIndex:", buf, 2);
  objc_msgSend(v13, "setArgument:atIndex:", &v25, 3);
  objc_msgSend(v13, "setArgument:atIndex:", &v26, 4);
  objc_msgSend(v13, "invoke");
  v23 = 0;
  objc_msgSend(v13, "getReturnValue:", &v23);
  v15 = v23;

  if (v15)
  {
    BiomeLibrary();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "Photos");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "Memories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "Viewed");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "source");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    objc_msgSend(v20, "sendEvent:timestamp:", v15);

    CPAnalyticsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AB22000, v22, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryViewed] Sent a memory viewed event", buf, 2u);
    }

  }
LABEL_11:

}

- (void)_donateGenerativeMemoryCreationWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  SEL v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  int v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "propertyForKey:", CFSTR("cpa_media_uuid"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasPerson"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasActivity"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasTime"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasLocation"));
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasTrip"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasArtist"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasSong"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasGenre"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("queryHasMood"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("memoryIsGenerated"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("sampledGlobalTraitsForFedStats"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertyForKey:", CFSTR("memoryAssetCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  if ((unint64_t)v8 > 0x28)
    goto LABEL_15;
  if (((1 << v8) & 0x7FFFC000) != 0)
  {
    v9 = 2;
LABEL_8:
    v22 = v9;
    goto LABEL_9;
  }
  if (((1 << v8) & 0x3FFE) == 0)
  {
    if (((1 << v8) & 0x1FF80000000) != 0)
    {
      v9 = 3;
      goto LABEL_8;
    }
LABEL_15:
    if (v8 < 42)
    {
      v22 = 0;
      goto LABEL_9;
    }
    v9 = 4;
    goto LABEL_8;
  }
  v22 = 1;
LABEL_9:
  v10 = NSSelectorFromString(&CFSTR("initWithIdentifier:queryContainsPersonEntity:queryContainsActivityEntity:queryContainsTime"
                                    "Entity:queryContainsLocationEntity:queryContainsTripEntity:queryContainsMusicArtist:"
                                    "queryContainsMusicSong:queryContainsMusicGenre:queryContainsMusicMood:globalTraits:m"
                                    "emoryGenerated:memoryAssetCount:").isa);
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", v10))
  {
    objc_msgSend(MEMORY[0x24BE0C5C8], "instanceMethodSignatureForSelector:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x24BE0C5C8]);
    objc_msgSend(v12, "setTarget:", v13);
    objc_msgSend(v12, "setSelector:", v10);
    objc_msgSend(v12, "setArgument:atIndex:", &v34, 2);
    objc_msgSend(v12, "setArgument:atIndex:", &v33, 3);
    objc_msgSend(v12, "setArgument:atIndex:", &v32, 4);
    objc_msgSend(v12, "setArgument:atIndex:", &v31, 5);
    objc_msgSend(v12, "setArgument:atIndex:", &v30, 6);
    objc_msgSend(v12, "setArgument:atIndex:", &v29, 7);
    objc_msgSend(v12, "setArgument:atIndex:", &v28, 8);
    objc_msgSend(v12, "setArgument:atIndex:", &v27, 9);
    objc_msgSend(v12, "setArgument:atIndex:", &v26, 10);
    objc_msgSend(v12, "setArgument:atIndex:", &v25, 11);
    objc_msgSend(v12, "setArgument:atIndex:", &v23, 12);
    objc_msgSend(v12, "setArgument:atIndex:", &v24, 13);
    objc_msgSend(v12, "setArgument:atIndex:", &v22, 14);
    objc_msgSend(v12, "invoke");
    v21 = 0;
    objc_msgSend(v12, "getReturnValue:", &v21);
    v14 = v21;

    if (v14)
    {
      BiomeLibrary();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "Photos");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "MemoryCreation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "source");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
      objc_msgSend(v18, "sendEvent:timestamp:", v14);

      CPAnalyticsLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_20AB22000, v20, OS_LOG_TYPE_INFO, "[Biome][Donation][MemoryCreation] Sent a memory creation event", (uint8_t *)&v21, 2u);
      }

    }
  }

}

- (void)_donatePhotoDeleteEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("cpa_media_ageInMinutes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 > 0.0 && v8 < 2.0)
  {
    v10 = 1;
  }
  else if (v8 > 262800.0)
  {
    v10 = 2;
  }
  else
  {
    v10 = 3;
  }
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Photos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "Delete");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BE0C598]);
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithIdentifier:subset:type:", v16, v17, v10);

  objc_msgSend(v5, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "sendEvent:timestamp:", v18);

  CPAnalyticsLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_20AB22000, v20, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Delete] Sent a photo delete event with uuid: %@", (uint8_t *)&v22, 0xCu);

  }
}

- (void)_donatePhotoEditEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Photos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Edit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE0C5A0]);
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:subset:type:", v10, v11, 0);

  objc_msgSend(v4, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "sendEvent:timestamp:", v12);

  CPAnalyticsLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v15;
    _os_log_impl(&dword_20AB22000, v14, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Edit] Sent a photo edit event with uuid: %@", (uint8_t *)&v16, 0xCu);

  }
}

- (void)_donatePhotoEngagmentEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  unsigned int v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("signpostDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 > 0.0 && v8 < 1.0)
  {
    v13 = 1;
  }
  else
  {
    if (v8 >= 3.0 || v8 <= 2.0)
      v11 = 0;
    else
      v11 = 3;
    if (v8 > 1.0 && v8 < 2.0)
      v13 = 2;
    else
      v13 = v11;
  }
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Photos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Engagement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BE0C5A8]);
  objc_msgSend(v5, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithIdentifier:subset:type:", v19, v20, v13);

  objc_msgSend(v5, "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "sendEvent:timestamp:", v21);

  CPAnalyticsLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v24;
    _os_log_impl(&dword_20AB22000, v23, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Engagement] Sent a photos engagement event with uuid: %@", (uint8_t *)&v25, 0xCu);

  }
}

- (void)_donatePhotoFavoritesEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("cpa_media_ageInMinutes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 > 0.0 && v8 < 2.0)
  {
    v10 = 1;
  }
  else if (v8 > 262800.0)
  {
    v10 = 2;
  }
  else
  {
    v10 = 3;
  }
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Photos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "Favorite");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x24BE0C5B0]);
  objc_msgSend(v5, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithIdentifier:subset:type:", v16, v17, v10);

  objc_msgSend(v5, "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v14, "sendEvent:timestamp:", v18);

  CPAnalyticsLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412290;
    v23 = v21;
    _os_log_impl(&dword_20AB22000, v20, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Favorite] Sent a photo favorite event with uuid: %@", (uint8_t *)&v22, 0xCu);

  }
}

- (void)_donatePhotoShareEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  _QWORD v26[9];
  _QWORD v27[10];

  v27[9] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v26[0] = CFSTR("PLActivityTypeUseAsWallpaper");
  v26[1] = CFSTR("com.apple.NanoTimeKit.CreateWatchFace");
  v27[0] = &unk_24C374888;
  v27[1] = &unk_24C3748A0;
  v26[2] = CFSTR("com.apple.Photos.actvity.AirPlay");
  v26[3] = CFSTR("com.apple.UIKit.activity.AirDrop");
  v27[2] = &unk_24C3748B8;
  v27[3] = &unk_24C3748D0;
  v26[4] = CFSTR("com.apple.DocumentManagerUICore.SaveToFiles");
  v26[5] = CFSTR("com.apple.UIKit.activity.AssignToContact");
  v27[4] = &unk_24C3748E8;
  v27[5] = &unk_24C374900;
  v26[6] = CFSTR("PUActivityTypeAddToAlbum");
  v26[7] = CFSTR("PLActivityTypeAlbumStream");
  v27[6] = &unk_24C374918;
  v27[7] = &unk_24C374930;
  v26[8] = CFSTR("PUActivityTypeHide");
  v27[8] = &unk_24C374948;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("activityType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "intValue");

  }
  BiomeLibrary();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "Photos");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Share");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BE0C5E8]);
  objc_msgSend(v5, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithIdentifier:subset:type:", v18, v19, v11);

  objc_msgSend(v5, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  objc_msgSend(v16, "sendEvent:timestamp:", v20);

  CPAnalyticsLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v23;
    _os_log_impl(&dword_20AB22000, v22, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Share] Sent a photo share event with uuid: %@", (uint8_t *)&v24, 0xCu);

  }
}

- (void)_donatePhotoSearchEventWithBaseSample:(id)a3 andEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Photos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Search");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE0C5E0]);
  objc_msgSend(v5, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithIdentifier:subset:type:", v12, v6, 1);

  objc_msgSend(v5, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "sendEvent:timestamp:", v13);

  CPAnalyticsLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_impl(&dword_20AB22000, v15, OS_LOG_TYPE_INFO, "[Biome][Donation][Photos][Search] Sent a photo search event with uuid: %@", (uint8_t *)&v17, 0xCu);

  }
}

- (NSMutableArray)eventMatchers
{
  return self->_eventMatchers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMatchers, 0);
}

@end
