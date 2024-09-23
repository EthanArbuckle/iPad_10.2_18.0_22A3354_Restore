@implementation _DKKnowledgeStorageLogging

- (void)knowledgeStorage:(id)a3 didInsertLocalEventsWithStreamNameCounts:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestCounterInitialized;
  v6 = a4;
  v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestCounterInitialized, &__block_literal_global_26);
    v7 = v8;
  }
  -[_DKKnowledgeStorageLogging _updateCounter:streamNameCounts:](self, (void *)knowledgeStorage_didInsertLocalEventsWithStreamNameCounts__ingestLocalCounter, v7);
  -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:streamNameCounts:](self, CFSTR("_DKKnowledgeStorageDidInsertLocalEventsNotification"), v8);

}

- (void)knowledgeStorage:(id)a3 didInsertEventsWithStreamNameCounts:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounterInitialized;
  v6 = a4;
  v8 = v6;
  if (v5 == -1)
  {
    v7 = v6;
  }
  else
  {
    dispatch_once(&knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounterInitialized, &__block_literal_global_18_1);
    v7 = v8;
  }
  -[_DKKnowledgeStorageLogging _updateCounter:streamNameCounts:](self, (void *)knowledgeStorage_didInsertEventsWithStreamNameCounts__ingestCounter, v7);
  -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:streamNameCounts:](self, CFSTR("_DKKnowledgeStorageDidInsertEventsNotification"), v8);

}

- (void)_updateCounter:(void *)a3 streamNameCounts:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  __CFString *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a2;
  v5 = a3;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[_DKKnowledgeStorageLogging portraitStreamNames](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v12 = objc_msgSend(v5, "countForObject:", v11);
          if (v12)
          {
            v13 = v12;
            +[_CDPortraitStreams entityStream](_CDPortraitStreams, "entityStream");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v11, "isEqualToString:", v15);

            v17 = CFSTR("entity");
            if ((v16 & 1) != 0)
              goto LABEL_10;
            +[_CDPortraitStreams topicStream](_CDPortraitStreams, "topicStream", CFSTR("entity"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "name");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v11, "isEqualToString:", v19);

            v17 = CFSTR("topic");
            if (v20)
LABEL_10:
              -[_DKEventTypeStatsCounter incrementCountByNumber:typeValue:]((uint64_t)v21, v13, v17);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

  }
}

- (id)portraitStreamNames
{
  if (a1)
  {
    if (portraitStreamNames_initialized != -1)
      dispatch_once(&portraitStreamNames_initialized, &__block_literal_global_2_0);
    a1 = (id)portraitStreamNames_portraitStreamNames;
  }
  return a1;
}

- (void)_sendDistributedNotificationName:(void *)a3 streamNameCounts:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_DKKnowledgeStorageLogging streamNamesNotificationWhitelist](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v6, "countForObject:", v12))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_DKKnowledgeStorageLogging%@:%@"), v5, v12, (_QWORD)v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:object:throttledActivityName:]((uint64_t)a1, v5, v12, v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (id)streamNamesNotificationWhitelist
{
  _QWORD block[5];

  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62___DKKnowledgeStorageLogging_streamNamesNotificationWhitelist__block_invoke;
    block[3] = &unk_1E26E2F20;
    block[4] = a1;
    if (streamNamesNotificationWhitelist_initialized != -1)
      dispatch_once(&streamNamesNotificationWhitelist_initialized, block);
    a1 = (id)streamNamesNotificationWhitelist_streamNamesNotificationWhitelist;
  }
  return a1;
}

- (void)_sendDistributedNotificationName:(void *)a3 object:(void *)a4 throttledActivityName:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = a4;
    +[_DKThrottledActivity standardInstance](_DKThrottledActivity, "standardInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92___DKKnowledgeStorageLogging__sendDistributedNotificationName_object_throttledActivityName___block_invoke;
    v12[3] = &unk_1E26E3250;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v10, "performWithMinimumIntervalInSecondsOf:name:queue:activityBlock:", v9, v11, v12, 2.0);

  }
}

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_initialized_5 != -1)
    dispatch_once(&sharedInstance_initialized_5, &__block_literal_global_75);
  return (id)sharedInstance_logger;
}

- (_DKKnowledgeStorageLogging)init
{
  _DKKnowledgeStorageLogging *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *notificationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKKnowledgeStorageLogging;
  v2 = -[_DKKnowledgeStorageLogging init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.coreduet.KnowledgeStorageLogging.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)knowledgeStorage:(id)a3 didDeleteEventsWithStreamNameCounts:(id)a4
{
  -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:streamNameCounts:](self, CFSTR("_DKKnowledgeStorageDidDeleteEventsNotification"), a4);
}

- (void)knowledgeStorage:(id)a3 didTombstoneEventsWithStreamNameCounts:(id)a4
{
  -[_DKKnowledgeStorageLogging _sendDistributedNotificationName:streamNameCounts:](self, CFSTR("_DKKnowledgeStorageDidTombstoneEventsNotification"), a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
