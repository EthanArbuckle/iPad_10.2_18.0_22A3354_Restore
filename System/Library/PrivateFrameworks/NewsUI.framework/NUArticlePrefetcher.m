@implementation NUArticlePrefetcher

- (NUArticlePrefetcher)initWithArticleFactory:(id)a3 articleDataProviderFactory:(id)a4
{
  id v7;
  id v8;
  NUArticlePrefetcher *v9;
  NUArticlePrefetcher *v10;
  uint64_t v11;
  FCKeyedOperationQueue *prefetchQueue;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v17;
  NSMutableDictionary *articleDataProviderCache;
  NSMutableSet *v19;
  NSMutableSet *failedArticleIDs;
  NSCountedSet *v21;
  NSCountedSet *interestedArticleIDs;
  NSMutableDictionary *v23;
  NSMutableDictionary *headlinesForArticles;
  NSMutableDictionary *v25;
  NSMutableDictionary *interestModificationDates;
  void *v27;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)NUArticlePrefetcher;
  v9 = -[NUArticlePrefetcher init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_articleFactory, a3);
    objc_storeStrong((id *)&v10->_articleDataProviderFactory, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CC30]), "initWithDelegate:maxConcurrentOperationCount:", v10, 1);
    prefetchQueue = v10->_prefetchQueue;
    v10->_prefetchQueue = (FCKeyedOperationQueue *)v11;

    -[FCKeyedOperationQueue setExecutionQueue:](v10->_prefetchQueue, "setExecutionQueue:", MEMORY[0x24BDAC9B8]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("NUArticlePrefetcher.work", v14);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    articleDataProviderCache = v10->_articleDataProviderCache;
    v10->_articleDataProviderCache = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    failedArticleIDs = v10->_failedArticleIDs;
    v10->_failedArticleIDs = v19;

    v21 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    interestedArticleIDs = v10->_interestedArticleIDs;
    v10->_interestedArticleIDs = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    headlinesForArticles = v10->_headlinesForArticles;
    v10->_headlinesForArticles = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    interestModificationDates = v10->_interestModificationDates;
    v10->_interestModificationDates = v25;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v10, sel__revisitSuspendedState, *MEMORY[0x24BDD1160], 0);

    -[NUArticlePrefetcher _revisitSuspendedState](v10, "_revisitSuspendedState");
  }

  return v10;
}

- (void)_revisitSuspendedState
{
  FCPerformBlockOnMainThread();
}

void __45__NUArticlePrefetcher__revisitSuspendedState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isLowPowerModeEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSuspended:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSuspended:", objc_msgSend(v2, "isLowDataModeEnabled"));

  }
}

uint64_t __82__NUArticlePrefetcher_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NUArticleDataProviderFactory)articleDataProviderFactory
{
  return self->_articleDataProviderFactory;
}

- (id)keyedOperationQueue:(id)a3 performAsyncOperationForKey:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD17F0];
  v9 = a4;
  objc_msgSend(v8, "isMainThread");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__NUArticlePrefetcher_keyedOperationQueue_performAsyncOperationForKey_completion___block_invoke;
  v13[3] = &unk_24D5A3928;
  v14 = v7;
  v10 = v7;
  -[NUArticlePrefetcher _prefetchDataProviderWithArticleID:completion:](self, "_prefetchDataProviderWithArticleID:completion:", v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_reprocessInterestedArticleIDs
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v3 = -[NUArticlePrefetcher highWaterMark](self, "highWaterMark");
  -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 <= v5)
    v6 = v5;
  else
    v6 = v3;
  -[NUArticlePrefetcher setHighWaterMark:](self, "setHighWaterMark:", v6);
  v7 = (void *)MEMORY[0x24BDBCF00];
  -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticlePrefetcher prefetchQueue](self, "prefetchQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyQueue:", v10);

  -[NUArticlePrefetcher reprocessTimer](self, "reprocessTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[NUArticlePrefetcher setReprocessTimer:](self, "setReprocessTimer:", 0);
}

- (void)setHighWaterMark:(unint64_t)a3
{
  self->_highWaterMark = a3;
}

- (FCKeyedOperationQueue)prefetchQueue
{
  return self->_prefetchQueue;
}

- (void)addPrefetchInterestInArticleID:(id)a3 headline:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countForObject:", v6);

  -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v6);

  -[NUArticlePrefetcher interestModificationDates](self, "interestModificationDates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v12, v6);

  if (v7)
  {
    -[NUArticlePrefetcher _flushDataProviderIfNeededForHeadline:](self, "_flushDataProviderIfNeededForHeadline:", v7);
    -[NUArticlePrefetcher headlinesForArticles](self, "headlinesForArticles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v7, v6);

  }
  if (!v9)
  {
    NUSharedLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_impl(&dword_216817000, v14, OS_LOG_TYPE_DEFAULT, "added prefetch interest in article ID %{public}@", (uint8_t *)&v15, 0xCu);
    }

    -[NUArticlePrefetcher _didChangeInterestedArticleIDs](self, "_didChangeInterestedArticleIDs");
  }

}

- (NSCountedSet)interestedArticleIDs
{
  return self->_interestedArticleIDs;
}

- (NSMutableDictionary)headlinesForArticles
{
  return self->_headlinesForArticles;
}

- (NSMutableDictionary)interestModificationDates
{
  return self->_interestModificationDates;
}

- (void)_flushUnusedDataProvidersIfNeeded
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[NUArticlePrefetcher highWaterMark](self, "highWaterMark");

  if (v4 > v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countForObject:", v12);

          if (!v14)
            objc_msgSend(v6, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__NUArticlePrefetcher__flushUnusedDataProvidersIfNeeded__block_invoke;
    v21[3] = &unk_24D5A3A18;
    v21[4] = self;
    objc_msgSend(v6, "sortUsingComparator:", v21);
    while (objc_msgSend(v6, "count"))
    {
      -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = -[NUArticlePrefetcher highWaterMark](self, "highWaterMark");

      if (v16 <= v17)
        break;
      objc_msgSend(v6, "fc_popFirstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", v18);

      -[NUArticlePrefetcher failedArticleIDs](self, "failedArticleIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v18);

    }
  }
}

- (NSMutableDictionary)articleDataProviderCache
{
  return self->_articleDataProviderCache;
}

- (unint64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (void)_flushDataProviderIfNeededForHeadline:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v14, "isDisplayingAsNativeAd") & 1) == 0)
    {
      objc_msgSend(v7, "article");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "headline");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v14)
      {
        -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectForKey:", v11);

        -[NUArticlePrefetcher failedArticleIDs](self, "failedArticleIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v13);

      }
    }

  }
}

- (void)_didChangeInterestedArticleIDs
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUArticlePrefetcher reprocessTimer](self, "reprocessTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__reprocessInterestedArticleIDs, 0, 0, 0.01);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NUArticlePrefetcher setReprocessTimer:](self, "setReprocessTimer:", v4);

  }
}

- (void)setReprocessTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reprocessTimer, a3);
}

- (NSTimer)reprocessTimer
{
  return self->_reprocessTimer;
}

- (NUArticleFactory)articleFactory
{
  return self->_articleFactory;
}

- (NUArticlePrefetcher)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NUArticlePrefetcher init]";
    v9 = 2080;
    v10 = "NUArticlePrefetcher.m";
    v11 = 1024;
    v12 = 89;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_216817000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NUArticlePrefetcher init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)removePrefetchInterestInArticleID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v4);

  -[NUArticlePrefetcher interestedArticleIDs](self, "interestedArticleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

  -[NUArticlePrefetcher interestModificationDates](self, "interestModificationDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v4);

  -[NUArticlePrefetcher headlinesForArticles](self, "headlinesForArticles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v4);

  if (v6 == 1)
  {
    NUSharedLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_216817000, v11, OS_LOG_TYPE_DEFAULT, "removed prefetch interest in article ID %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[NUArticlePrefetcher _didChangeInterestedArticleIDs](self, "_didChangeInterestedArticleIDs");
  }

}

- (void)prefetchArticleID:(id)a3 headline:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  NUArticlePrefetcher *v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17F0];
  v11 = a4;
  objc_msgSend(v10, "isMainThread");
  -[NUArticlePrefetcher addPrefetchInterestInArticleID:headline:](self, "addPrefetchInterestInArticleID:headline:", v8, v11);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke;
  v15[3] = &unk_24D5A3900;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = -[NUArticlePrefetcher _prefetchDataProviderWithArticleID:completion:](self, "_prefetchDataProviderWithArticleID:completion:", v13, v15);

}

void __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a4;
  if (a3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_cold_1(a1);
  objc_initWeak(&location, *(id *)(a1 + 40));
  v7 = objc_alloc(MEMORY[0x24BE6CC10]);
  v8 = MEMORY[0x24BDAC9B8];
  v9 = MEMORY[0x24BDAC9B8];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_20;
  v11[3] = &unk_24D5A38D8;
  objc_copyWeak(&v13, &location);
  v12 = *(id *)(a1 + 32);
  v10 = (void *)objc_msgSend(v7, "initWithCallbackQueue:removeInterestBlock:", v8, v11);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_20(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removePrefetchInterestInArticleID:", *(_QWORD *)(a1 + 32));

}

- (id)prefetchedArticleDataProviderForArticleID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  -[NUArticlePrefetcher failedArticleIDs](self, "failedArticleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_prefetchDataProviderWithArticleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD block[4];
  id v30;
  NUArticlePrefetcher *v31;
  id v32;
  void (**v33)(_QWORD, _QWORD);
  _QWORD *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NUArticlePrefetcher *v38;
  id v39;
  _QWORD v40[3];
  char v41;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CC88]), "initWithOptions:", 1);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v9 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke;
  v35[3] = &unk_24D5A39A0;
  v10 = v6;
  v36 = v10;
  v11 = v8;
  v37 = v11;
  v12 = v7;
  v38 = self;
  v39 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199FC190](v35);
  -[NUArticlePrefetcher articleDataProviderCache](self, "articleDataProviderCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    ((void (**)(_QWORD, void *))v13)[2](v13, v15);
  }
  else
  {
    -[NUArticlePrefetcher headlinesForArticles](self, "headlinesForArticles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUArticlePrefetcher workQueue](self, "workQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_3;
    block[3] = &unk_24D5A39F0;
    v30 = v17;
    v31 = self;
    v32 = v10;
    v34 = v40;
    v33 = v13;
    v19 = v17;
    dispatch_async(v18, block);

  }
  v20 = (void *)MEMORY[0x24BE6CB10];
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_6;
  v25[3] = &unk_24D5A1AC8;
  v28 = v40;
  v21 = v11;
  v26 = v21;
  v22 = v12;
  v27 = v22;
  objc_msgSend(v20, "cancelHandlerWithBlock:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v40, 8);
  return v23;
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NUSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_216817000, v4, OS_LOG_TYPE_DEFAULT, "will prefetch contents of article ID %{public}@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_29;
  v9[3] = &unk_24D5A3978;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v12 = v3;
  v13 = v7;
  v14 = v6;
  v8 = v3;
  objc_msgSend(v8, "loadContextWithCompletionBlock:", v9);

}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  _QWORD v22[2];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  NUSharedLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_29_cold_1(a1, v7);

    v8 = MEMORY[0x24BDAC760];
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_31;
    v21 = &unk_24D5A3790;
    v9 = (id *)v22;
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v22[0] = v10;
    v22[1] = v11;
    v23 = *(id *)(a1 + 32);
    FCPerformBlockOnMainThread();
    v12 = *(void **)(a1 + 40);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_2;
    v15[3] = &unk_24D5A3950;
    v17 = *(id *)(a1 + 64);
    v16 = v5;
    objc_msgSend(v12, "executeOnce:", v15);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&dword_216817000, v7, OS_LOG_TYPE_DEFAULT, "did prefetch contents of article ID %{public}@", buf, 0xCu);
    }

    v14 = *(void **)(a1 + 40);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_30;
    v24[3] = &unk_24D5A2108;
    v9 = &v25;
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v14, "executeOnce:", v24);
  }

}

uint64_t __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_31(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "articleDataProviderCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "failedArticleIDs");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 48));

  }
}

uint64_t __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "articleFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "createArticleForHeadline:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createArticlesForArticleIDs:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v8 = v5;
  FCPerformBlockOnMainThread();

}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "articleDataProviderFactory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createArticleDataProviderWithArticle:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "articleDataProviderCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "_flushUnusedDataProvidersIfNeeded");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_6(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_7;
  v2[3] = &unk_24D5A2108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "executeOnce:", v2);

}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE6C9A8], 1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v1 + 16))(v1, 0, 1, v2);

}

uint64_t __56__NUArticlePrefetcher__flushUnusedDataProvidersIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "interestModificationDates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "interestModificationDates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "compare:", v11);
  return v12;
}

- (void)setArticleFactory:(id)a3
{
  objc_storeStrong((id *)&self->_articleFactory, a3);
}

- (void)setArticleDataProviderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_articleDataProviderFactory, a3);
}

- (void)setPrefetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchQueue, a3);
}

- (void)setArticleDataProviderCache:(id)a3
{
  objc_storeStrong((id *)&self->_articleDataProviderCache, a3);
}

- (NSMutableSet)failedArticleIDs
{
  return self->_failedArticleIDs;
}

- (void)setFailedArticleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_failedArticleIDs, a3);
}

- (void)setInterestedArticleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_interestedArticleIDs, a3);
}

- (void)setHeadlinesForArticles:(id)a3
{
  objc_storeStrong((id *)&self->_headlinesForArticles, a3);
}

- (void)setInterestModificationDates:(id)a3
{
  objc_storeStrong((id *)&self->_interestModificationDates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reprocessTimer, 0);
  objc_storeStrong((id *)&self->_interestModificationDates, 0);
  objc_storeStrong((id *)&self->_headlinesForArticles, 0);
  objc_storeStrong((id *)&self->_interestedArticleIDs, 0);
  objc_storeStrong((id *)&self->_failedArticleIDs, 0);
  objc_storeStrong((id *)&self->_articleDataProviderCache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_articleDataProviderFactory, 0);
  objc_storeStrong((id *)&self->_articleFactory, 0);
}

void __61__NUArticlePrefetcher_prefetchArticleID_headline_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint8_t buf[4];
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("prefetch unexpectedly cancelled for article ID %@"), *(_QWORD *)(a1 + 32));
  *(_DWORD *)buf = 136315906;
  v3 = "-[NUArticlePrefetcher prefetchArticleID:headline:completion:]_block_invoke";
  v4 = 2080;
  v5 = "NUArticlePrefetcher.m";
  v6 = 1024;
  v7 = 141;
  v8 = 2114;
  v9 = v1;
  _os_log_error_impl(&dword_216817000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

void __69__NUArticlePrefetcher__prefetchDataProviderWithArticleID_completion___block_invoke_29_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_216817000, a2, OS_LOG_TYPE_ERROR, "failed to prefetch contents of article ID %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
