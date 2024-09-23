@implementation FCFeedItemInventory

- (FCFeedItemInventory)initWithContext:(id)a3 feedItemService:(id)a4 readingHistory:(id)a5 filePath:(id)a6 version:(unsigned int)a7 refreshInterval:(double)a8 loggingKey:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FCFeedItemInventory *v22;
  FCFeedItemInventory *v23;
  uint64_t v24;
  NSString *filePath;
  uint64_t v26;
  NSString *loggingKey;
  FCOnce *v28;
  FCOnce *loadFromCacheOnce;
  FCAsyncSerialQueue *v30;
  FCAsyncSerialQueue *feedItemsRefreshSerialQueue;
  uint64_t v32;
  NFUnfairLock *articleIDsToRescoreLock;
  uint64_t v34;
  NSMutableSet *articleIDsToRescore;
  FCTimedOperationThrottler *v36;
  FCOperationThrottler *targetedRescoreThrottler;
  objc_super v39;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)FCFeedItemInventory;
  v22 = -[FCFeedItemInventory init](&v39, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_context, a3);
    objc_storeStrong((id *)&v23->_feedItemService, a4);
    v24 = objc_msgSend(v20, "copy");
    filePath = v23->_filePath;
    v23->_filePath = (NSString *)v24;

    v23->_version = a7;
    v23->_refreshInterval = a8;
    v26 = objc_msgSend(v21, "copy");
    loggingKey = v23->_loggingKey;
    v23->_loggingKey = (NSString *)v26;

    v28 = -[FCOnce initWithOptions:]([FCOnce alloc], "initWithOptions:", 1);
    loadFromCacheOnce = v23->_loadFromCacheOnce;
    v23->_loadFromCacheOnce = v28;

    v30 = -[FCAsyncSerialQueue initWithQualityOfService:]([FCAsyncSerialQueue alloc], "initWithQualityOfService:", 25);
    feedItemsRefreshSerialQueue = v23->_feedItemsRefreshSerialQueue;
    v23->_feedItemsRefreshSerialQueue = v30;

    objc_msgSend(v19, "addObserver:", v23);
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    articleIDsToRescoreLock = v23->_articleIDsToRescoreLock;
    v23->_articleIDsToRescoreLock = (NFUnfairLock *)v32;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v34 = objc_claimAutoreleasedReturnValue();
    articleIDsToRescore = v23->_articleIDsToRescore;
    v23->_articleIDsToRescore = (NSMutableSet *)v34;

    v36 = -[FCTimedOperationThrottler initWithDelegate:]([FCTimedOperationThrottler alloc], "initWithDelegate:", v23);
    -[FCTimedOperationThrottler setCooldownTime:](v36, "setCooldownTime:", 5.0);
    targetedRescoreThrottler = v23->_targetedRescoreThrottler;
    v23->_targetedRescoreThrottler = (FCOperationThrottler *)v36;

  }
  return v23;
}

- (FCFeedItemInventory)init
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

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedItemInventory init]";
    v9 = 2080;
    v10 = "FCFeedItemInventory.m";
    v11 = 1024;
    v12 = 86;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCFeedItemInventory init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSArray)allFeedItems
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[FCFeedItemInventory _prepareForUse](self, "_prepareForUse");
  -[FCFeedItemInventory latestInventory](self, "latestInventory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (id)allFeedItemScoreProfilesForConfigurationSet:(int64_t)a3 scoringVersion:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  FCFeedPersonalizedItemScoreProfile *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  uint64_t v23;
  FCFeedItemInventory *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[FCFeedItemInventory _prepareForUse](self, "_prepareForUse");
  +[FCMapTable mapTableWithKeyOptions:valueOptions:](FCMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedItemInventory latestInventory](self, "latestInventory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v8, "feedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (!v10)
  {

    goto LABEL_22;
  }
  v11 = v10;
  v25 = self;
  v26 = v8;
  v12 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (a3 == 11)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "scoreProfiles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "forYouGroupScoreProfile");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
            *(_DWORD *)buf = 136315906;
            v32 = "-[FCFeedItemInventory allFeedItemScoreProfilesForConfigurationSet:scoringVersion:]";
            v33 = 2080;
            v34 = "FCFeedItemInventory.m";
            v35 = 1024;
            LODWORD(v36[0]) = 122;
            WORD2(v36[0]) = 2114;
            *(_QWORD *)((char *)v36 + 6) = v19;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          continue;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "scoreProfiles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "defaultScoreProfile");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v16;

      if (v17)
      {
        if (objc_msgSend(v17, "scoringVersion") != a4)
        {
          v20 = (void *)FCFeedItemInventoryLog;
          if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
          {
            v21 = v20;
            -[FCFeedItemInventory loggingKey](v25, "loggingKey");
            v22 = (char *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v17, "scoringVersion");
            *(_DWORD *)buf = 138543874;
            v32 = v22;
            v33 = 2048;
            v34 = (char *)v23;
            v35 = 2048;
            v36[0] = a4;
            _os_log_impl(&dword_1A1B90000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescoring inventory because cached scored version of %llu doesn't match %llu", buf, 0x20u);

          }
          v8 = v26;
          -[FCFeedItemInventory _rescoreInventoryIfNeeded:forScoringVersion:](v25, "_rescoreInventoryIfNeeded:forScoringVersion:", v26, a4);
          goto LABEL_22;
        }
        v18 = -[FCFeedPersonalizedItemScoreProfile initWithPBScoreProfile:]([FCFeedPersonalizedItemScoreProfile alloc], "initWithPBScoreProfile:", v17);
        objc_msgSend(v7, "setObject:forKey:", v18, v14);

      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v11)
      continue;
    break;
  }

  v8 = v26;
LABEL_22:

  return v7;
}

- (id)allFeedItemsWithTopic:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCFeedItemInventory allFeedItems](self, "allFeedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__FCFeedItemInventory_allFeedItemsWithTopic___block_invoke;
  v9[3] = &unk_1E4645E30;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __45__FCFeedItemInventory_allFeedItemsWithTopic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "topicIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)refreshIfNeededWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCFeedItemInventory _prepareForUse](self, "_prepareForUse");
  -[FCFeedItemInventory _refreshIfNeeded](self, "_refreshIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  zalgo();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__FCFeedItemInventory_refreshIfNeededWithCompletion___block_invoke;
  v9[3] = &unk_1E463B598;
  v10 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "alwaysOn:always:", v6, v9);

}

uint64_t __53__FCFeedItemInventory_refreshIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(void);
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__73;
  v23 = __Block_byref_object_dispose__73;
  v24 = 0;
  -[FCFeedItemInventory articleIDsToRescoreLock](self, "articleIDsToRescoreLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v18[3] = &unk_1E463AD80;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v8, "performWithLockSync:", v18);

  v10 = (id)FCFeedItemInventoryLog;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[FCFeedItemInventory loggingKey](self, "loggingKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend((id)v20[5], "count");
    *(_DWORD *)buf = 138543618;
    v26 = v11;
    v27 = 2048;
    v28 = v12;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing %ld article IDs for targeted rescoring", buf, 0x16u);

  }
  if (objc_msgSend((id)v20[5], "count"))
  {
    -[FCFeedItemInventory feedItemsRefreshSerialQueue](self, "feedItemsRefreshSerialQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2;
    v15[3] = &unk_1E4649928;
    v15[4] = self;
    v17 = &v19;
    v16 = v7;
    objc_msgSend(v13, "enqueueBlock:", v15);

  }
  else
  {
    v14 = (void (**)(void))v7;
    v14[2]();

  }
  _Block_object_dispose(&v19, 8);

}

void __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "articleIDsToRescore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "articleIDsToRescore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

void __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "latestInventory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3;
  v15[3] = &unk_1E4649900;
  v15[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "loggingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2048;
    v19 = v11;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] identified %ld feed items for targeted rescoring", buf, 0x16u);

  }
  if (objc_msgSend(v6, "count"))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v4, "feedItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_populateScoreProfilesForFeedItems:", v13);

    objc_msgSend(*(id *)(a1 + 32), "_adoptInventory:", v4);
    v3[2](v3);
    v14 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v3[2](v3);
  }
  (*(void (**)(uint64_t))(v14 + 16))(v14);

}

uint64_t __78__FCFeedItemInventory_operationThrottler_performAsyncOperationWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke;
  v18[3] = &unk_1E46458D0;
  v8 = v6;
  v19 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v18);

  -[FCFeedItemInventory articleIDsToRescoreLock](self, "articleIDsToRescoreLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke_2;
  v16[3] = &unk_1E463AD10;
  v16[4] = self;
  v10 = v8;
  v17 = v10;
  objc_msgSend(v9, "performWithLockSync:", v16);

  v11 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[FCFeedItemInventory loggingKey](self, "loggingKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 138543618;
    v21 = v13;
    v22 = 2048;
    v23 = v14;
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueuing %ld article IDs for targeted rescoring", buf, 0x16u);

  }
  -[FCFeedItemInventory targetedRescoreThrottler](self, "targetedRescoreThrottler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tickle");

}

void __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "unsignedIntegerValue") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __67__FCFeedItemInventory_readingHistory_didChangeFeaturesForArticles___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "articleIDsToRescore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", *(_QWORD *)(a1 + 40));

}

- (void)_prepareForUse
{
  void *v3;
  _QWORD v4[5];

  -[FCFeedItemInventory loadFromCacheOnce](self, "loadFromCacheOnce");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__FCFeedItemInventory__prepareForUse__block_invoke;
  v4[3] = &unk_1E463AB18;
  v4[4] = self;
  objc_msgSend(v3, "executeOnce:", v4);

}

void __37__FCFeedItemInventory__prepareForUse__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadInventoryFromCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLatestInventory:", v2);

}

- (id)_refreshIfNeeded
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[5];

  if (-[FCFeedItemInventory _isRefreshNeeded](self, "_isRefreshNeeded"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2;
    v5[3] = &unk_1E463DAD0;
    v5[4] = self;
    return (id)objc_msgSend(v3, "initWithResolver:", v5);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke;
    v6[3] = &unk_1E463D3A8;
    v6[4] = self;
    __39__FCFeedItemInventory__refreshIfNeeded__block_invoke((uint64_t)v6);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __39__FCFeedItemInventory__refreshIfNeeded__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D60AF0]);
  objc_msgSend(*(id *)(a1 + 32), "latestInventory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithValue:", v3);

  return v4;
}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "feedItemsRefreshSerialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_3;
  v10[3] = &unk_1E46499A0;
  v11 = v5;
  v12 = v6;
  v10[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enqueueBlock:", v10);

}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_3(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FCFeedItemServiceCursor *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  FCFeedItemServiceCursor *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t v32;
  _QWORD v33[6];
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_4;
  aBlock[3] = &unk_1E4649950;
  v38 = a1[5];
  v5 = v3;
  v39 = v5;
  v6 = _Block_copy(aBlock);
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_5;
  v34[3] = &unk_1E4643418;
  v35 = a1[6];
  v7 = v5;
  v36 = v7;
  v8 = _Block_copy(v34);
  if ((objc_msgSend(a1[4], "_isRefreshNeeded") & 1) == 0)
  {
    v33[0] = v4;
    v33[1] = 3221225472;
    v33[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_6;
    v33[3] = &unk_1E463B2D0;
    v33[4] = a1[4];
    v33[5] = v6;
    v18 = v6;
    __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_6((uint64_t)v33);
    goto LABEL_16;
  }
  objc_msgSend(a1[4], "latestInventory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)FCFeedItemInventoryLog;
  v11 = os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v12 = a1[4];
      v13 = v10;
      objc_msgSend(v12, "loggingKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "latestInventory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastRefreshed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nsDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v14;
      v42 = 2114;
      v43 = v17;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] will refresh because last refresh was at %{public}@", buf, 0x16u);

LABEL_8:
    }
  }
  else if (v11)
  {
    v19 = a1[4];
    v13 = v10;
    objc_msgSend(v19, "loggingKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v14;
    _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] will refresh because there is no cached instance", buf, 0xCu);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v21 = v20;
  objc_msgSend(a1[4], "latestInventory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = [FCFeedItemServiceCursor alloc];
    objc_msgSend(v22, "lastRefreshed");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "feedItems");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = v25;
    else
      v27 = MEMORY[0x1E0C9AA60];
    v18 = -[FCFeedItemServiceCursor initWithLastRefreshed:feedItems:](v23, "initWithLastRefreshed:feedItems:", v24, v27);

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(a1[4], "feedItemService");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_26;
  v29[3] = &unk_1E4649978;
  v29[4] = a1[4];
  v30 = v8;
  v32 = v21;
  v31 = v6;
  objc_msgSend(v28, "fetchFeedItemsWithCursor:completion:", v18, v29);

LABEL_16:
}

uint64_t __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_alloc(MEMORY[0x1E0D60AF0]);
  objc_msgSend(*(id *)(a1 + 32), "latestInventory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithValue:", v5);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

}

void __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  unint64_t v21;
  FCPBFeedItemInventory *v22;
  void *v23;
  _QWORD v24[7];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2_27;
    v24[3] = &unk_1E463CCB8;
    v8 = *(_QWORD *)(a1 + 40);
    v24[4] = *(_QWORD *)(a1 + 32);
    v24[5] = v6;
    v24[6] = v8;
    __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2_27(v24);
  }
  else
  {
    v9 = (void *)FCFeedItemInventoryLog;
    if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      objc_msgSend(v10, "loggingKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "count");
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v15 = (unint64_t)(fmax(v14 - *(double *)(a1 + 56), 0.0) * 1000.0);
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2048;
      v28 = v13;
      v29 = 2048;
      v30 = v15;
      _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully fetched %lu feed items in %llums, will generate score profiles", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_populateScoreProfilesForFeedItems:", v5);
    v16 = (void *)FCFeedItemInventoryLog;
    if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(a1 + 32);
      v18 = v16;
      objc_msgSend(v17, "loggingKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v21 = (unint64_t)(fmax(v20 - *(double *)(a1 + 56), 0.0) * 1000.0);
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2048;
      v28 = v21;
      _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully refreshed in %llums", buf, 0x16u);

    }
    v22 = objc_alloc_init(FCPBFeedItemInventory);
    -[FCPBFeedItemInventory setInventoryVersion:](v22, "setInventoryVersion:", objc_msgSend(*(id *)(a1 + 32), "version"));
    -[FCPBFeedItemInventory setFeedItemVersion:](v22, "setFeedItemVersion:", 24);
    objc_msgSend(MEMORY[0x1E0D62698], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPBFeedItemInventory setLastRefreshed:](v22, "setLastRefreshed:", v23);

    -[FCPBFeedItemInventory setFeedItems:](v22, "setFeedItems:", v5);
    objc_msgSend(*(id *)(a1 + 32), "_adoptInventory:", v22);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t __39__FCFeedItemInventory__refreshIfNeeded__block_invoke_2_27(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    v4 = v2;
    objc_msgSend(v3, "loggingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to refresh with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_adoptInventory:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[FCFeedItemInventory setLatestInventory:](self, "setLatestInventory:", a3);
  FCPersistenceQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FCFeedItemInventory__adoptInventory___block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(v4, block);

}

void __39__FCFeedItemInventory__adoptInventory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "latestInventory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = objc_msgSend(v3, "writeToFile:options:error:", v4, 1, &v16);
  v6 = v16;

  v7 = (void *)FCFeedItemInventoryLog;
  v8 = os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      v10 = v7;
      objc_msgSend(v9, "loggingKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v3, "length"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully persisted with size: %{public}@", buf, 0x16u);

    }
  }
  else if (v8)
  {
    v13 = *(void **)(a1 + 32);
    v14 = v7;
    objc_msgSend(v13, "loggingKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v15;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to persist with error: %{public}@", buf, 0x16u);

  }
}

- (BOOL)_isRefreshNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  -[FCFeedItemInventory latestInventory](self, "latestInventory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lastRefreshed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nsDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_timeIntervalUntilNow");
    v8 = v7;
    -[FCFeedItemInventory refreshInterval](self, "refreshInterval");
    v10 = v8 > v9;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_rescoreInventoryIfNeeded:(id)a3 forScoringVersion:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[FCFeedItemInventory feedItemsRefreshSerialQueue](self, "feedItemsRefreshSerialQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__FCFeedItemInventory__rescoreInventoryIfNeeded_forScoringVersion___block_invoke;
  v9[3] = &unk_1E46499C8;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "enqueueBlock:", v9);

}

void __67__FCFeedItemInventory__rescoreInventoryIfNeeded_forScoringVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "latestInventory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == *(void **)(a1 + 40))
  {
    objc_msgSend(v5, "feedItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scoreProfiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "defaultScoreProfile");
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (-[NSObject scoringVersion](v9, "scoringVersion") == *(_QWORD *)(a1 + 48))
      {
        v14 = (void *)FCFeedItemInventoryLog;
        if (!os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        v15 = *(void **)(a1 + 32);
        v16 = v14;
        objc_msgSend(v15, "loggingKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v17;
        v18 = "[%{public}@] not rescoring inventory due to version match";
      }
      else
      {
        v21 = *(void **)(a1 + 32);
        objc_msgSend(v6, "feedItems");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_populateScoreProfilesForFeedItems:", v22);

        objc_msgSend(*(id *)(a1 + 32), "_adoptInventory:", v6);
        v23 = (void *)FCFeedItemInventoryLog;
        if (!os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        v24 = *(void **)(a1 + 32);
        v16 = v23;
        objc_msgSend(v24, "loggingKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v17;
        v18 = "[%{public}@] rescored inventory";
      }
    }
    else
    {
      v19 = (void *)FCFeedItemInventoryLog;
      if (!os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v20 = *(void **)(a1 + 32);
      v16 = v19;
      objc_msgSend(v20, "loggingKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v17;
      v18 = "[%{public}@] not rescoring inventory due to no score profile";
    }
    _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, 0xCu);

    goto LABEL_13;
  }
  v7 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v7;
    objc_msgSend(v8, "loggingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] did not rescore inventory because it is no longer the latest", (uint8_t *)&v25, 0xCu);

LABEL_13:
  }
  v4[2](v4);

}

- (id)_loadInventoryFromCache
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  FCPBFeedItemInventory *v9;
  FCPBFeedItemInventory *v10;
  FCPBFeedItemInventory *v11;
  unsigned int v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  FCPBFeedItemInventory *v20;
  FCPBFeedItemInventory *v21;
  void *v23;
  char *v24;
  NSObject *log;
  _QWORD v26[5];
  FCPBFeedItemInventory *v27;
  _QWORD v28[5];
  FCPBFeedItemInventory *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  _BYTE v37[18];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCFeedItemInventory _loadInventoryFromCache]";
    v34 = 2080;
    v35 = "FCFeedItemInventory.m";
    v36 = 1024;
    *(_DWORD *)v37 = 378;
    *(_WORD *)&v37[4] = 2114;
    *(_QWORD *)&v37[6] = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0C99D50];
  -[FCFeedItemInventory filePath](self, "filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
    v9 = -[FCPBFeedItemInventory initWithData:]([FCPBFeedItemInventory alloc], "initWithData:", v8);
    v10 = v9;
    if (!v9)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_38;
      v30[3] = &unk_1E463B350;
      v30[4] = self;
      __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_38((uint64_t)v30);
      v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      goto LABEL_18;
    }
    v11 = v9;
    v12 = -[FCPBFeedItemInventory inventoryVersion](v11, "inventoryVersion");
    if (v12 == -[FCFeedItemInventory version](self, "version"))
    {
      if (-[FCPBFeedItemInventory feedItemVersion](v11, "feedItemVersion") == 24)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v14 = v13;
        v15 = (void *)FCFeedItemInventoryLog;
        if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
        {
          log = v15;
          -[FCFeedItemInventory loggingKey](self, "loggingKey");
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          -[FCPBFeedItemInventory feedItems](v11, "feedItems");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");
          -[FCPBFeedItemInventory lastRefreshed](v11, "lastRefreshed");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "nsDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v33 = v24;
          v34 = 2048;
          v35 = (char *)(fmax(v14 - v4, 0.0) * 1000.0);
          v36 = 2048;
          *(_QWORD *)v37 = v17;
          *(_WORD *)&v37[8] = 2114;
          *(_QWORD *)&v37[10] = v19;
          _os_log_impl(&dword_1A1B90000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] loaded cached data in %llums with %lu feed items and last-refresh date %{public}@", buf, 0x2Au);

        }
        v20 = v11;
        goto LABEL_16;
      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_40;
      v26[3] = &unk_1E463D4B8;
      v26[4] = self;
      v27 = v11;
      __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_40((uint64_t)v26);
      v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
      v21 = v27;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_39;
      v28[3] = &unk_1E463D4B8;
      v28[4] = self;
      v29 = v11;
      __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_39((uint64_t)v28);
      v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
      v21 = v29;
    }

LABEL_16:
    goto LABEL_17;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke;
  v31[3] = &unk_1E463B350;
  v31[4] = self;
  __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke((uint64_t)v31);
  v20 = (FCPBFeedItemInventory *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v20;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "loggingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] found no cached data on disk", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "loggingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] failed to initialize inventory from cached data", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_39(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v7;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "loggingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "inventoryVersion");
    v7 = objc_msgSend(*(id *)(a1 + 32), "version");
    v9 = 138543874;
    v10 = v5;
    v11 = 1024;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring cached data because its inventory version %u does not match the current version %u", (uint8_t *)&v9, 0x18u);

  }
  return 0;
}

uint64_t __46__FCFeedItemInventory__loadInventoryFromCache__block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "loggingKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "feedItemVersion");
    v8 = 138543874;
    v9 = v5;
    v10 = 1024;
    v11 = v6;
    v12 = 1024;
    v13 = 24;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring cached data because its feed item version %u does not match the current version %u", (uint8_t *)&v8, 0x18u);

  }
  return 0;
}

- (void)_populateScoreProfilesForFeedItems:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  -[FCFeedItemInventory _populateScoreProfilesForFeedItems:configurationSet:](self, "_populateScoreProfilesForFeedItems:configurationSet:", v4, 0);
  -[FCFeedItemInventory _populateScoreProfilesForFeedItems:configurationSet:](self, "_populateScoreProfilesForFeedItems:configurationSet:", v4, 11);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7;
  v9 = (void *)FCFeedItemInventoryLog;
  if (os_log_type_enabled((os_log_t)FCFeedItemInventoryLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[FCFeedItemInventory loggingKey](self, "loggingKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2048;
    v15 = (unint64_t)(fmax(v8 - v6, 0.0) * 1000.0);
    v16 = 2048;
    v17 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] took %llums to generate score profiles for %ld items", (uint8_t *)&v12, 0x20u);

  }
}

- (void)_populateScoreProfilesForFeedItems:(id)a3 configurationSet:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *context;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  context = (void *)MEMORY[0x1A8580B64]();
  -[FCFeedItemInventory context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedPersonalizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  objc_msgSend(v8, "sortItems:options:configurationSet:", v6, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v9;
  objc_msgSend(v9, "scoreProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    v14 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "scoreProfiles");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0D62818]);
          objc_msgSend(v16, "setScoreProfiles:", v19);

        }
        if (a4 == 11)
        {
          objc_msgSend(v17, "pbScoreProfile");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "scoreProfiles");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setForYouGroupScoreProfile:", v20);
          goto LABEL_12;
        }
        if (!a4)
        {
          objc_msgSend(v17, "pbScoreProfile");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "scoreProfiles");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setDefaultScoreProfile:", v20);
LABEL_12:

          goto LABEL_15;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
          *(_DWORD *)buf = 136315906;
          v31 = "-[FCFeedItemInventory _populateScoreProfilesForFeedItems:configurationSet:]";
          v32 = 2080;
          v33 = "FCFeedItemInventory.m";
          v34 = 1024;
          v35 = 444;
          v36 = 2114;
          v37 = v22;
          _os_log_error_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
LABEL_15:

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
}

- (FCCloudContext)context
{
  return self->_context;
}

- (FCFeedItemServiceType)feedItemService
{
  return self->_feedItemService;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unsigned)version
{
  return self->_version;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (NSString)loggingKey
{
  return self->_loggingKey;
}

- (FCOnce)loadFromCacheOnce
{
  return self->_loadFromCacheOnce;
}

- (FCPBFeedItemInventory)latestInventory
{
  return (FCPBFeedItemInventory *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLatestInventory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (FCAsyncSerialQueue)feedItemsRefreshSerialQueue
{
  return self->_feedItemsRefreshSerialQueue;
}

- (NSMutableSet)articleIDsToRescore
{
  return self->_articleIDsToRescore;
}

- (NFUnfairLock)articleIDsToRescoreLock
{
  return self->_articleIDsToRescoreLock;
}

- (FCOperationThrottler)targetedRescoreThrottler
{
  return self->_targetedRescoreThrottler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedRescoreThrottler, 0);
  objc_storeStrong((id *)&self->_articleIDsToRescoreLock, 0);
  objc_storeStrong((id *)&self->_articleIDsToRescore, 0);
  objc_storeStrong((id *)&self->_feedItemsRefreshSerialQueue, 0);
  objc_storeStrong((id *)&self->_latestInventory, 0);
  objc_storeStrong((id *)&self->_loadFromCacheOnce, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_feedItemService, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
