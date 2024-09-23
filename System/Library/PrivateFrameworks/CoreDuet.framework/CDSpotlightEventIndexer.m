@implementation CDSpotlightEventIndexer

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  _BYTE v30[12];
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_5();

    v8 = *(id *)(a1 + 32);
LABEL_5:
    -[_CDSpotlightEventIndexer finishIndexing](v8);
    goto LABEL_34;
  }
  v9 = (id *)(a1 + 32);
  v10 = (void *)objc_msgSend((id)objc_opt_class(), "currentVersion");
  objc_msgSend(*v9, "context");
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v11[2] = v10;

  v12 = v5;
  v13 = v12;
  if (!v12 || !objc_msgSend(v12, "length"))
    goto LABEL_15;
  *(_QWORD *)v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v13, v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(id *)v30;
  if (v15)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_4();

  }
  if (!v14)
  {
LABEL_15:
    +[_CDEventIndexerBookmark baseBookmarkWithVersion:]((uint64_t)_CDEventIndexerBookmark, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*v9, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPredictionTimeline setStartDate:]((uint64_t)v17, v14);

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = &stru_1E26E9728;
    if (v13 && objc_msgSend(v13, "length"))
      v19 = CFSTR("non-");
    objc_msgSend(*v9, "context");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = *(_QWORD *)(v20 + 8);
    else
      v22 = 0;
    *(_DWORD *)v30 = 138412546;
    *(_QWORD *)&v30[4] = v19;
    v31 = 2112;
    v32 = v22;
    _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_INFO, "[Spotlight Indexer] Success fetching %@nil client state from spotlight, resulting bookmark: %@", v30, 0x16u);

  }
  objc_msgSend(*v9, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_CDEventIndexerContext isBookmarkValid]((uint64_t)v23);

  if (v24)
  {
    -[_CDSpotlightEventIndexer indexDeletionsAsBatch]((uint64_t)*v9);
    goto LABEL_34;
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_3(v9, v25);

  objc_msgSend(*v9, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_CDEventIndexerContext isBookmarkValidInRecoverableThreshold]((uint64_t)v26);

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_1();

    v8 = *v9;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_2();

  -[_CDSpotlightEventIndexer resetIndex]((uint64_t)*v9);
LABEL_34:

}

void __49___CDSpotlightEventIndexer_indexDeletionsAsBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49___CDSpotlightEventIndexer_indexDeletionsAsBatch__block_invoke_cold_1();

  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v6, v5);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7[3];

      if (v8)
      {
        -[_CDSpotlightEventIndexer indexAdditionsAsBatch](*(id **)(a1 + 32));
        goto LABEL_9;
      }
    }
  }
  -[_CDSpotlightEventIndexer finishIndexing](*(void **)(a1 + 32));
LABEL_9:

}

void __49___CDSpotlightEventIndexer_indexAdditionsAsBatch__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49___CDSpotlightEventIndexer_indexAdditionsAsBatch__block_invoke_cold_1();

  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v6, v5);

    if (*(_BYTE *)(a1 + 48))
    {
      -[_CDSpotlightEventIndexer indexAdditionsAsBatch](*(_QWORD *)(a1 + 32));
      goto LABEL_8;
    }
  }
  -[_CDSpotlightEventIndexer finishIndexing](*(void **)(a1 + 32));
LABEL_8:

}

void __38___CDSpotlightEventIndexer_resetIndex__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a2;
  if (v3)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __38___CDSpotlightEventIndexer_resetIndex__block_invoke_cold_1();

  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v6, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CDEventIndexerContext isBookmarkValid]((uint64_t)v7);

  v9 = *(void **)(a1 + 32);
  if (v8)
    -[_CDSpotlightEventIndexer indexDeletionsAsBatch]((uint64_t)v9);
  else
    -[_CDSpotlightEventIndexer finishIndexing](v9);

}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Bookmark is within recoverable threshold", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Bookmark is outside of recoverable threshold or has an unknown version, resetting spotlight index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_3(id *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "[Spotlight Indexer] Bookmark is invalid: %@", v4, 0xCu);

}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Error unarchiving event indexer bookmark: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __72___CDSpotlightEventIndexer__beginIndexingFromLatestSpotlightClientState__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Error fetching client state from spotlight: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __49___CDSpotlightEventIndexer_indexDeletionsAsBatch__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Spotlight event indexer failed to index batch deletions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __49___CDSpotlightEventIndexer_indexAdditionsAsBatch__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Spotlight event indexer failed to index batch additions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __38___CDSpotlightEventIndexer_resetIndex__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[Spotlight Indexer] Spotlight event indexer failed to reset index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
