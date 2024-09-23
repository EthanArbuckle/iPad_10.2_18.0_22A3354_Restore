@implementation _CDSpotlightIntentIndexerDataSource

+ (unint64_t)currentVersion
{
  return objc_msgSend(MEMORY[0x1E0CBD9A8], "_searchableItemVersion") + 2;
}

- (_CDSpotlightIntentIndexerDataSource)initWithKnowledgeStore:(id)a3
{
  id v4;
  void *v5;
  _CDSpotlightIntentIndexerDataSource *v6;
  objc_super v8;

  v4 = a3;
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_CDSpotlightIntentIndexerDataSource;
  v6 = -[_CDSpotlightEventIndexerDataSource initWithKnowledgeStore:eventStream:](&v8, sel_initWithKnowledgeStore_eventStream_, v4, v5);

  return v6;
}

- (id)bundleIDToSearchableItemsDictionaryFromEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = v3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x193FEE914]();
        objc_msgSend(v8, "interaction");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "_indexingHash"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
        {
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v8;
            _os_log_debug_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEBUG, "[Spotlight Indexer] Skipping indexing event into Spotlight because CDSpotlightIntentIndexerIntentShouldBeIndexed says so: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

  v13 = (void *)objc_msgSend(v15, "copy");
  return v13;
}

@end
