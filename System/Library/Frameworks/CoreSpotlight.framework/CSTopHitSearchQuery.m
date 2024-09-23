@implementation CSTopHitSearchQuery

- (CSTopHitSearchQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CSTopHitSearchQuery *v18;
  CSTopHitSearchQuery *v19;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  logForCSLogCategoryQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSTopHitSearchQuery initWithQueryString:context:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  objc_msgSend(v7, "setUserQuery:", v6);
  objc_msgSend(v7, "setLowPriority:", 0);
  objc_msgSend(v7, "setRankingType:", 1);
  objc_msgSend(v7, "setGrouped:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_retainAutorelease(v16);
  if (!strcmp((const char *)objc_msgSend(v17, "UTF8String"), "com.apple.mobilenotes")
    || !strcmp((const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"), "com.apple.Notes"))
  {
    objc_msgSend(v7, "setUserQueryOptions:", objc_msgSend(v7, "userQueryOptions") | 0x10);
  }
  v21.receiver = self;
  v21.super_class = (Class)CSTopHitSearchQuery;
  v18 = -[CSUserQuery initWithQueryString:context:](&v21, sel_initWithQueryString_context_, &stru_1E2406B38, v7);
  v19 = v18;
  if (v18)
    commonInit_0(v18);

  return v19;
}

- (CSTopHitSearchQuery)initWithUserString:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  CSUserQueryContext *v8;
  void *v9;
  CSUserQueryContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CSTopHitSearchQuery *v18;
  objc_super v20;

  v6 = a4;
  v7 = a3;
  v8 = [CSUserQueryContext alloc];
  objc_msgSend(v6, "xpc_dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CSSearchQueryContext initWithXPCDictionary:](v8, "initWithXPCDictionary:", v9);

  objc_msgSend(v6, "filterQueries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setFilterQueries:](v10, "setFilterQueries:", v11);

  objc_msgSend(v6, "fetchAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setFetchAttributes:](v10, "setFetchAttributes:", v12);

  objc_msgSend(v6, "keyboardLanguage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setKeyboardLanguage:](v10, "setKeyboardLanguage:", v13);

  objc_msgSend(v6, "protectionClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setProtectionClasses:](v10, "setProtectionClasses:", v14);

  objc_msgSend(v6, "bundleIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setBundleIDs:](v10, "setBundleIDs:", v15);

  objc_msgSend(v6, "disableBundles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setDisableBundles:](v10, "setDisableBundles:", v16);

  -[CSSearchQueryContext setMaxCount:](v10, "setMaxCount:", objc_msgSend(v6, "maxCount"));
  v17 = objc_msgSend(v6, "maxSuggestionCount");

  -[CSSearchQueryContext setMaxSuggestionCount:](v10, "setMaxSuggestionCount:", v17);
  -[CSSearchQueryContext setLowPriority:](v10, "setLowPriority:", 0);
  -[CSSearchQueryContext setRankingType:](v10, "setRankingType:", 1);
  v20.receiver = self;
  v20.super_class = (Class)CSTopHitSearchQuery;
  v18 = -[CSUserQuery initWithUserString:queryContext:](&v20, sel_initWithUserString_queryContext_, v7, v10);

  if (v18)
    commonInit_0(v18);

  return v18;
}

- (CSTopHitSearchQuery)initWithSearchString:(id)a3 keyboardLanguage:(id)a4 attributes:(id)a5 hitCount:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CSTopHitSearchQuery *v21;
  CSTopHitSearchQuery *v22;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  logForCSLogCategoryQuery();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[CSTopHitSearchQuery initWithSearchString:keyboardLanguage:attributes:hitCount:].cold.1((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);

  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setKeyboardLanguage:", v12);

  objc_msgSend(v20, "setFetchAttributes:", v11);
  objc_msgSend(v20, "setMaxCount:", a6);
  v21 = -[CSTopHitSearchQuery initWithQueryString:context:](self, "initWithQueryString:context:", v10, v20);
  v22 = v21;
  if (v21)
    commonInit_0(v21);

  return v22;
}

- (void)_handleBatches:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  unint64_t v25;
  void *v26;
  CSTopHitSearchQuery *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  id v30;
  unint64_t v31;
  CSTopHitSearchQuery *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = self;
  -[CSUserQuery queryContext](self, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "maxCount");

  logForCSLogCategoryQuery();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[CSTopHitQuery handleBatches:].cold.1();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v7);
        v10 += objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "count", v31);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v13, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v31);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v16);
  }

  objc_msgSend(v13, "objectEnumerator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "nextObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = 0;
    v34 = 0;
    v22 = 0;
    v23 = 1;
    while (1)
    {
      objc_msgSend(v20, "bundleID", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23 && (!v22 || objc_msgSend(v22, "isEqualToString:", v24)))
      {
        ++v21;
      }
      else
      {
        if (v21 >= v31)
          v25 = v31;
        else
          v25 = v21;
        if (!v25)
          -[CSTopHitSearchQuery _handleBatches:].cold.1();
        objc_msgSend(v13, "subarrayWithRange:", v34, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v32;
        objc_sync_enter(v27);
        v27->super.super._foundItemCount += v25;
        objc_sync_exit(v27);

        -[CSSearchQuery foundItemsHandler](v27, "foundItemsHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[CSSearchQuery foundItemsHandler](v27, "foundItemsHandler");
          v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v29)[2](v29, v26);

        }
        -[CSUserQuery processInstantAnswersWithFoundItems:](v27, "processInstantAnswersWithFoundItems:", v26);
        v34 += v21;
        v21 = v23;

      }
      v30 = v24;

      objc_msgSend(v33, "nextObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v20 != 0;
      v22 = v30;
      if (!v20)
      {
        v22 = v30;
        if (!v21)
          break;
      }
    }

  }
}

- (unint64_t)dispatchApplyWidth
{
  return 1;
}

- (void)handleFoundItems:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSTopHitQuery handleFoundItems:].cold.1();

  -[NSMutableArray addObject:](self->_batches, "addObject:", v4);
}

- (BOOL)isTopHitQuery
{
  return 1;
}

- (void)handleCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSTopHitQuery handleCompletion:].cold.1();

  if (!v4)
    -[CSTopHitSearchQuery _handleBatches:](self, "_handleBatches:", self->_batches);
  v6.receiver = self;
  v6.super_class = (Class)CSTopHitSearchQuery;
  -[CSUserQuery handleCompletion:](&v6, sel_handleCompletion_, v4);

}

- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSTopHitSearchQuery;
  -[CSUserQuery userEngagedWithResult:interactionType:](&v4, sel_userEngagedWithResult_interactionType_, a3, *(_QWORD *)&a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batches, 0);
}

- (void)initWithQueryString:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "initWithQueryString:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithSearchString:(uint64_t)a3 keyboardLanguage:(uint64_t)a4 attributes:(uint64_t)a5 hitCount:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "initWithSearchString:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_handleBatches:.cold.1()
{
  __assert_rtn("-[CSTopHitSearchQuery _handleBatches:]", "CSTopHitSearchQuery.m", 154, "foundCount");
}

@end
