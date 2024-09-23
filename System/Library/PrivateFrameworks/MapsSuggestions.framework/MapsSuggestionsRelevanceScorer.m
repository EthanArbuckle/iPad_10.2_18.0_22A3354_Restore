@implementation MapsSuggestionsRelevanceScorer

- (MapsSuggestionsRelevanceScorer)init
{
  MapsSuggestionsRelevanceScorer *v2;
  NSMutableArray *v3;
  NSMutableArray *scorers;
  uint64_t v5;
  NSDate *scorersUpdatedAt;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsRelevanceScorer;
  v2 = -[MapsSuggestionsRelevanceScorer init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scorers = v2->_scorers;
    v2->_scorers = v3;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = objc_claimAutoreleasedReturnValue();
    scorersUpdatedAt = v2->_scorersUpdatedAt;
    v2->_scorersUpdatedAt = (NSDate *)v5;

  }
  return v2;
}

- (void)addScorer:(id)a3
{
  -[NSMutableArray addObject:](self->_scorers, "addObject:", a3);
}

- (id)confidenceForMapItems:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _RelevanceScorerData *v14;
  void *v15;
  _RelevanceScorerData *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "name", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[NSObject addObject:](v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v6, "addObject:", v13);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v9);
    }

    v14 = [_RelevanceScorerData alloc];
    v15 = (void *)objc_msgSend(v7, "mutableCopy");
    v16 = -[_RelevanceScorerData initWithNames:addresses:mapItems:](v14, "initWithNames:addresses:mapItems:", v6, 0, v15);

    -[MapsSuggestionsRelevanceScorer _confidenceForData:]((uint64_t)self, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "No mapItems to calculate score for", buf, 2u);
    }
    v17 = 0;
  }

  return v17;
}

- (id)_confidenceForData:(uint64_t)a1
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  dispatch_group_t v40;
  void *v41;
  void *v42;
  id *v43;
  uint8_t buf[16];

  v4 = a2;
  v5 = v4;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v4, "names");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputCount:", objc_msgSend(v6, "count"));

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "setFinalRelevanceScores:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "setIndexMapping:", v8);

  v9 = v5;
  v10 = *(void **)(a1 + 8);
  if (!v10 || !objc_msgSend(v10, "count"))
  {
    GEOFindOrCreateLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A427D000, v32, OS_LOG_TYPE_ERROR, "No _scorers added.", buf, 2u);
    }

    goto LABEL_33;
  }
  v43 = (id *)a1;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "inputCount"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v9, "finalRelevanceScores");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v14);
      objc_msgSend(v9, "finalRelevanceScores");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v12);

      objc_sync_exit(v14);
      objc_msgSend(v9, "names");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", v12);

      if (!v17)
        goto LABEL_12;
      objc_msgSend(v9, "addresses");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v2 = (void *)v18;
        objc_msgSend(v9, "addresses");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v12);

        if (!v21)
          goto LABEL_12;
      }
      objc_msgSend(v9, "mapItems");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_11;
      v2 = (void *)v22;
      objc_msgSend(v9, "mapItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", v13);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", v12);

      if (v25)
      {
LABEL_11:
        objc_msgSend(v11, "addIndex:", v13);
      }
      else
      {
LABEL_12:
        objc_msgSend(v9, "indexMapping");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v13);
        objc_msgSend(v2, "addObject:", v26);

      }
      ++v13;
    }
    while (v13 < objc_msgSend(v9, "inputCount"));
  }
  objc_msgSend(v9, "names");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "removeObjectsAtIndexes:", v11);

  objc_msgSend(v9, "addresses");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeObjectsAtIndexes:", v11);

  objc_msgSend(v9, "mapItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeObjectsAtIndexes:", v11);

  objc_msgSend(v9, "names");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30 || (objc_msgSend(v9, "names"), v2 = (void *)objc_claimAutoreleasedReturnValue(), !objc_msgSend(v2, "count")))
  {
    objc_msgSend(v9, "addresses");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v9, "addresses");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v34, "count"))
      {
        v31 = 0;
        goto LABEL_29;
      }
      v41 = v34;
    }
    objc_msgSend(v9, "mapItems", v41, v43);
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      objc_msgSend(v9, "mapItems");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v37, "count") == 0;

    }
    else
    {
      v31 = 1;
    }
    v34 = v42;
    if (!v33)
    {
LABEL_30:
      if (!v30)
        goto LABEL_32;
      goto LABEL_31;
    }
LABEL_29:

    goto LABEL_30;
  }
  v31 = 0;
LABEL_31:

LABEL_32:
  if (!v31)
  {
    v40 = dispatch_group_create();
    -[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:](v43, v9, 0, v40);
    dispatch_group_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
    -[MapsSuggestionsRelevanceScorer _postProcessConfidences:](v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }
LABEL_33:
  -[MapsSuggestionsRelevanceScorer _postProcessConfidences:](v9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v38;
}

- (id)confidenceForContacts:(id)a3 addresses:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  _RelevanceScorerData *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  MapsSuggestionsRelevanceScorer *v37;
  id v38;
  id v39;
  uint64_t v40;
  id obj;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRelevanceScorer.m";
      v55 = 1024;
      v56 = 105;
      v57 = 2082;
      v58 = "-[MapsSuggestionsRelevanceScorer confidenceForContacts:addresses:]";
      v59 = 2082;
      v60 = "count != [addresses count]";
      v32 = "At %{public}s:%d, %{public}s forbids: %{public}s. Information mismatch!! No. of contacts is different from n"
            "o. of addresses passed.";
      v33 = v29;
      v34 = OS_LOG_TYPE_ERROR;
      v35 = 38;
LABEL_29:
      _os_log_impl(&dword_1A427D000, v33, v34, v32, buf, v35);
    }
LABEL_30:
    v31 = 0;
    goto LABEL_31;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v32 = "No contacts to calculate score for";
      v33 = v29;
      v34 = OS_LOG_TYPE_DEBUG;
      v35 = 2;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v37 = self;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v39 = v6;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "givenName", v37);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v10;
        -[NSObject addObject:](v9, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v13);
  }
  v42 = v9;

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v7);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v38 = v7;
  obj = v7;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v44;
    v40 = *MEMORY[0x1E0C97070];
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v44 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_msgSend(v25, "label"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "isEqualToString:", v40),
              v26,
              v27))
        {
          objc_msgSend(v19, "setObject:atIndexedSubscript:", v10, v22 + j, v37);
          -[NSObject setObject:atIndexedSubscript:](v42, "setObject:atIndexedSubscript:", v10, v22 + j);
        }
        else
        {
          objc_msgSend(v25, "value");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:atIndexedSubscript:", v28, v22 + j);

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      v22 += j;
    }
    while (v21);
  }

  v29 = v42;
  v30 = -[_RelevanceScorerData initWithNames:addresses:mapItems:]([_RelevanceScorerData alloc], "initWithNames:addresses:mapItems:", v42, v19, 0);
  -[MapsSuggestionsRelevanceScorer _confidenceForData:]((uint64_t)v37, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v38;
  v6 = v39;
LABEL_31:

  return v31;
}

- (void)preLoadAllScorers
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  NSDate *v14;
  NSDate *scorersUpdatedAt;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
    dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
  if (s_verbose)
  {
    GEOFindOrCreateLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315138;
      v20 = "-[MapsSuggestionsRelevanceScorer preLoadAllScorers]";
      _os_log_impl(&dword_1A427D000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v19, 0xCu);
    }

  }
  MapsSuggestionsNow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_scorersUpdatedAt);
  v6 = v5;

  GEOConfigGetDouble();
  if (v6 < v7)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      v9 = "Ignoring preLoad";
      v10 = v8;
      v11 = OS_LOG_TYPE_INFO;
LABEL_16:
      _os_log_impl(&dword_1A427D000, v10, v11, v9, (uint8_t *)&v19, 2u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v12 = -[NSMutableArray count](self->_scorers, "count");
  if (!v12)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v19) = 0;
      v9 = "No scorers to fetch data from";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEBUG;
      goto LABEL_16;
    }
LABEL_17:

    return;
  }
  v13 = v12;
  MapsSuggestionsNow();
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  scorersUpdatedAt = self->_scorersUpdatedAt;
  self->_scorersUpdatedAt = v14;

  v16 = 0;
  do
  {
    v17 = v16 + 1;
    -[NSMutableArray objectAtIndexedSubscript:](self->_scorers, "objectAtIndexedSubscript:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preLoad");

    v16 = v17;
  }
  while (v13 != v17);
}

- (id)_postProcessConfidences:(void *)a1
{
  unint64_t i;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  id obj;
  MapsSuggestionsRelevanceScore *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  const char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v23 = a1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MapsSuggestionsRelevanceScore initWithConfidence:]([MapsSuggestionsRelevanceScore alloc], "initWithConfidence:", MapsSuggestionsConfidenceDontKnow());
  objc_msgSend(v23, "finalRelevanceScores");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  for (i = 0; i < objc_msgSend(v23, "inputCount", obj); ++i)
  {
    objc_msgSend(v23, "finalRelevanceScores");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndexedSubscript:", i);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22 == v3)
    {
      objc_msgSend(v23, "finalRelevanceScores");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v21, i);

    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v23, "finalRelevanceScores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (s_verbose)
        {
          GEOFindOrCreateLog();
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v9, "confidence");
            v12 = v11;
            objc_msgSend(v9, "lastInteractionTime");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v29 = v12;
            v30 = 2112;
            *(_QWORD *)v31 = v13;
            _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_DEBUG, "finalConfidence: %f, Time: %@", buf, 0x16u);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v6);
  }

  objc_msgSend(v23, "finalRelevanceScores");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  v16 = v15 == objc_msgSend(v23, "inputCount");

  if (v16)
  {
    objc_msgSend(v23, "finalRelevanceScores");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = -[NSObject copy](v17, "copy");
  }
  else
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRelevanceScorer.m";
      v30 = 1024;
      *(_DWORD *)v31 = 356;
      *(_WORD *)&v31[4] = 2082;
      *(_QWORD *)&v31[6] = "-[MapsSuggestionsRelevanceScorer _postProcessConfidences:]";
      v32 = 2082;
      v33 = "[data.finalRelevanceScores count] != data.inputCount";
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. ERROR! Mismatch in input and finalRelevanceScores count. Returning nil", buf, 0x26u);
    }
    v18 = 0;
  }

  objc_sync_exit(obj);
  return v18;
}

- (void)_confidenceForData:(uint64_t)a3 scorerIndex:(void *)a4 group:
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  id v28[2];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(a1[1], "count") != a3)
  {
    objc_msgSend(v7, "names");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1[1], "objectAtIndexedSubscript:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "Processing scorer %@", buf, 0xCu);

      }
      dispatch_group_enter(v8);
      objc_initWeak((id *)buf, a1);
      objc_msgSend(a1[1], "objectAtIndexedSubscript:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "names");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v7, "addresses");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");
      objc_msgSend(v7, "mapItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      v22 = v13;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__MapsSuggestionsRelevanceScorer__confidenceForData_scorerIndex_group___block_invoke;
      v25[3] = &unk_1E4BD1FC8;
      objc_copyWeak(v28, (id *)buf);
      v18 = v7;
      v26 = v18;
      v21 = a3 + 1;
      v28[1] = (id)(a3 + 1);
      v19 = v8;
      v27 = v19;
      v20 = objc_msgSend(v24, "relevanceScoreForNames:addresses:mapItems:completion:", v23, v15, v17, v25);

      if ((v20 & 1) == 0)
      {
        -[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:](a1, v18, v21, v19);
        dispatch_group_leave(v19);
      }

      objc_destroyWeak(v28);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __71__MapsSuggestionsRelevanceScorer__confidenceForData_scorerIndex_group___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  __int128 v60;
  void *v61;
  uint64_t v62;
  char *v63;
  id v64;
  void *v65;
  void *v66;
  id WeakRetained;
  void *v68;
  id v69;
  uint64_t v70;
  id obj;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  uint8_t buf[4];
  char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  const char *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v66 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v65 = v5;
  if (WeakRetained)
  {
    v62 = a1;
    v7 = *(void **)(a1 + 32);
    v64 = v5;
    v69 = v7;
    v63 = (char *)v6;
    if (v63)
    {
      GEOFindOrCreateLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v63;
        _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "Scorer returned error %@", buf, 0xCu);
      }
    }
    else
    {
      if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
      if (s_verbose)
      {
        GEOFindOrCreateLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v81 = CFSTR("Scorer confidence is: ");
          _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obj = v64;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v73;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v73 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v14);
            if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
              dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
            if (s_verbose)
            {
              GEOFindOrCreateLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v15, "confidence");
                v18 = v17;
                objc_msgSend(v15, "lastInteractionTime");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v76 = 134218242;
                v77 = v18;
                v78 = 2112;
                v79 = v19;
                _os_log_impl(&dword_1A427D000, v16, OS_LOG_TYPE_DEBUG, "Confidence: %f, Time: %@", v76, 0x16u);

              }
            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, buf, 16);
        }
        while (v12);
      }

      if (!obj)
        goto LABEL_53;
      v70 = objc_msgSend(obj, "count");
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v70);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v70);
      v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v70);
      v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v70);
      if (v70)
      {
        v22 = 0;
        *(_QWORD *)&v21 = 134217984;
        v60 = v21;
        do
        {
          objc_msgSend(obj, "objectAtIndexedSubscript:", v22, v60);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "confidence");
          if (v24 == MapsSuggestionsConfidenceDefinitelyTrue())
          {
            GEOFindOrCreateLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v76 = v60;
              v77 = v22;
              _os_log_impl(&dword_1A427D000, v42, OS_LOG_TYPE_DEBUG, "Scorer returned high confidence for %lu", v76, 0xCu);
            }

            objc_msgSend(v69, "finalRelevanceScores");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_sync_enter(v40);
            objc_msgSend(v69, "finalRelevanceScores");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "indexMapping");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectAtIndexedSubscript:", v22);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "unsignedIntegerValue");
            objc_msgSend(obj, "objectAtIndexedSubscript:", v22);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "replaceObjectAtIndex:withObject:", v46, v47);

            objc_sync_exit(v40);
          }
          else
          {
            objc_msgSend(v69, "names");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              objc_msgSend(v69, "names");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "count") == 0;

              if (!v27)
              {
                objc_msgSend(v69, "names");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectAtIndexedSubscript:", v22);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v8, "addObject:", v29);

              }
            }
            objc_msgSend(v69, "addresses");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              objc_msgSend(v69, "addresses");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "count") == 0;

              if (!v32)
              {
                objc_msgSend(v69, "addresses");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectAtIndexedSubscript:", v22);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "addObject:", v34);

              }
            }
            objc_msgSend(v69, "mapItems");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              objc_msgSend(v69, "mapItems");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "count") == 0;

              if (!v37)
              {
                objc_msgSend(v69, "mapItems");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectAtIndexedSubscript:", v22);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "addObject:", v39);

              }
            }
            objc_msgSend(v69, "indexMapping");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectAtIndexedSubscript:", v22);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObject:", v41);

          }
          ++v22;
        }
        while (v70 != v22);
      }
      objc_msgSend(v69, "names");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48 == 0;

      if (!v49)
      {
        objc_msgSend(v69, "names");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "removeAllObjects");

        objc_msgSend(v69, "names");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObjectsFromArray:", v8);

      }
      objc_msgSend(v69, "addresses");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v52 == 0;

      if (!v53)
      {
        objc_msgSend(v69, "addresses");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "removeAllObjects");

        objc_msgSend(v69, "addresses");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObjectsFromArray:", v20);

      }
      objc_msgSend(v69, "mapItems");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v56 == 0;

      if (!v57)
      {
        objc_msgSend(v69, "mapItems");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "removeAllObjects");

        objc_msgSend(v69, "mapItems");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "addObjectsFromArray:", v61);

      }
      objc_msgSend(v69, "setIndexMapping:", v68);

    }
LABEL_53:

    v10 = WeakRetained;
    -[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:](WeakRetained, *(_QWORD *)(v62 + 32), *(_QWORD *)(v62 + 56), *(_QWORD *)(v62 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(v62 + 40));
    goto LABEL_54;
  }
  GEOFindOrCreateLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v81 = "MapsSuggestionsRelevanceScorer.m";
    v82 = 1026;
    v83 = 208;
    v84 = 2082;
    v85 = "-[MapsSuggestionsRelevanceScorer _confidenceForData:scorerIndex:group:]_block_invoke";
    _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

  v10 = 0;
LABEL_54:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorersUpdatedAt, 0);
  objc_storeStrong((id *)&self->_scorers, 0);
}

@end
