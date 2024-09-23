@implementation _CDSpotlightEventIndexer

- (_CDSpotlightEventIndexer)initWithDataSource:(id)a3
{
  id v5;
  objc_class *CSSearchableIndexClass;
  objc_class *v7;
  _CDSpotlightEventIndexer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  CSSearchableIndex *index;
  _CDSpotlightEventIndexer *v16;
  NSObject *v17;
  objc_super v19;

  v5 = a3;
  CSSearchableIndexClass = getCSSearchableIndexClass();
  if (CSSearchableIndexClass
    && (v7 = CSSearchableIndexClass,
        (-[objc_class isIndexingAvailable](CSSearchableIndexClass, "isIndexingAvailable") & 1) != 0))
  {
    v19.receiver = self;
    v19.super_class = (Class)_CDSpotlightEventIndexer;
    v8 = -[_CDSpotlightEventIndexer init](&v19, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "stream");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.coreduet:%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = [v7 alloc];
      v14 = objc_msgSend(v13, "initWithName:protectionClass:", v12, *MEMORY[0x1E0CB2AC0]);
      index = v8->_index;
      v8->_index = (CSSearchableIndex *)v14;

      objc_storeStrong((id *)&v8->_dataSource, a3);
    }
    self = v8;
    v16 = self;
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_CDSpotlightEventIndexer initWithDataSource:].cold.1();

    v16 = 0;
  }

  return v16;
}

- (BOOL)isIndexing
{
  void *v2;
  BOOL v3;

  -[_CDSpotlightEventIndexer context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)beginIndexingWithBatchSize:(unint64_t)a3 completion:(id)a4
{
  id v6;
  _CDSpotlightEventIndexer *v7;
  NSObject *v8;
  NSObject *v9;
  _CDSpotlightEventIndexerDataSource *dataSource;
  _CDSpotlightEventIndexerDataSource *v11;
  void *v12;
  void *v13;
  _CDEventIndexerContext *v14;
  _QWORD *v15;
  void *v16;
  const char *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (-[_CDSpotlightEventIndexer isIndexing](v7, "isIndexing"))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Spotlight event indexer is already in the process of indexing", (uint8_t *)&v19, 2u);
    }

    objc_sync_exit(v7);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7)
        dataSource = v7->_dataSource;
      else
        dataSource = 0;
      v11 = dataSource;
      -[_CDSpotlightEventIndexerDataSource stream](v11, "stream");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v13;
      _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Begin indexing %@ events with spotlight", (uint8_t *)&v19, 0xCu);

    }
    v14 = objc_alloc_init(_CDEventIndexerContext);
    -[_CDSpotlightEventIndexer setContext:](v7, "setContext:", v14);

    objc_sync_exit(v7);
    -[_CDSpotlightEventIndexer context](v7, "context");
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v15[3] = a3;

    -[_CDSpotlightEventIndexer context](v7, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    if (v16)
      objc_setProperty_nonatomic_copy(v16, v17, v6, 32);

    -[_CDSpotlightEventIndexer _beginIndexingFromLatestSpotlightClientState]((uint64_t)v7);
  }

}

- (uint64_t)_beginIndexingFromLatestSpotlightClientState
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 16);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke;
    v2[3] = &unk_1E26E66A8;
    v2[4] = result;
    return objc_msgSend(v1, "fetchLastClientStateWithCompletionHandler:", v2);
  }
  return result;
}

- (void)finishIndexing
{
  id *v1;
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  int v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = v1[3];
      objc_msgSend(v3, "stream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "context");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
        v8 = *(const __CFString **)(v6 + 8);
      else
        v8 = 0;
      if (!v8)
        v8 = CFSTR("<never fetched>");
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Finished indexing %@ events with spotlight, final bookmark: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(v1, "context");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = v9[4];
    else
      v10 = 0;

    if (v10)
    {
      objc_msgSend(v1, "context");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = *(void **)(v11 + 32);
      else
        v13 = 0;
      v14 = v13;
      v14[2]();

    }
    objc_msgSend(v1, "setContext:", 0);
    objc_sync_exit(v1);

  }
}

- (void)indexDeletionsAsBatch
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Spotlight event indexer data source failed to fetch earliest event creation date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)resetIndex
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "beginIndexBatch");
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v4 = v3;

    objc_msgSend(*(id *)(a1 + 16), "_deleteActionsBeforeTime:completionHandler:", 0, v4);
    v5 = (void *)objc_msgSend((id)objc_opt_class(), "currentVersion");
    +[_CDEventIndexerBookmark baseBookmarkWithVersion:]((uint64_t)_CDEventIndexerBookmark, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _CDClientStateFromEventIndexerBookmark((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38___CDSpotlightEventIndexer_resetIndex__block_invoke;
    v10[3] = &unk_1E26E3190;
    v10[4] = a1;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v8, "endIndexBatchWithClientState:completionHandler:", v7, v10);

  }
}

- (void)indexAdditionsAsBatch
{
  id v5;
  void *v6;
  void *v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  objc_msgSend(v5, "stream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "[Spotlight Indexer] Spotlight event indexer data source failed to fetch %@ events: %@", v8, 0x16u);

}

- (_CDEventIndexerContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithDataSource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Spotlight indexing is not supported on this device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
