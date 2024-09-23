@implementation _ATXHomeScreenPageState

- (_ATXHomeScreenPageState)initWithHomeScreenState:(id)a3 pageConfig:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _ATXHomeScreenPageState *v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _ATXHomeScreenStackState *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _ATXHomeScreenStackState *v30;
  NSArray *stacks;
  NSArray *v32;
  id v34;
  id v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v46.receiver = self;
  v46.super_class = (Class)_ATXHomeScreenPageState;
  v17 = -[_ATXHomeScreenPageState init](&v46, sel_init);
  if (v17)
  {
    v34 = a4;
    v35 = a5;
    obj = v12;
    v18 = (NSArray *)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v37 = v13;
    objc_msgSend(v13, "stacks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v43;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v43 != v22)
            objc_enumerationMutation(v19);
          v24 = -[_ATXHomeScreenStackState initWithPageState:stackConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:]([_ATXHomeScreenStackState alloc], "initWithPageState:stackConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:", v17, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v23), v14, v15, v16, v34, v35);
          -[NSArray addObject:](v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v21);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v37, "panels");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v25);
          v30 = -[_ATXHomeScreenStackState initWithPageState:stackConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:]([_ATXHomeScreenStackState alloc], "initWithPageState:stackConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:", v17, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v29), v14, v15, v16);
          -[NSArray addObject:](v18, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v27);
    }

    v12 = obj;
    objc_storeWeak((id *)&v17->_homeScreen, obj);
    objc_storeStrong((id *)&v17->_config, v34);
    stacks = v17->_stacks;
    v17->_stacks = v18;
    v32 = v18;

    objc_storeStrong((id *)&v17->_stackStateTracker, v35);
    v13 = v37;
  }

  return v17;
}

- (BOOL)isShowingDuplicatedContentForSuggestion:(id)a3 considerUnderStackContents:(BOOL)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  ATXHomeScreenPage **p_config;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  BOOL v29;
  id WeakRetained;
  void *v31;
  char v32;
  NSObject *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  id *v38;
  NSArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  NSArray *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  objc_msgSend(v12, "executableSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "executableType");

  if (v14 != 1)
    goto LABEL_18;
  objc_msgSend(v12, "executableSpecification");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "executableObject");
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();

  if (!-[NSArray length](v16, "length"))
  {
    __atxlog_handle_blending();
    obj = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&obj->super, OS_LOG_TYPE_FAULT))
      -[_ATXHomeScreenPageState isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:].cold.1(&obj->super);
LABEL_16:

    goto LABEL_17;
  }
  p_config = &self->_config;
  v18 = -[ATXHomeScreenPage pageIndex](self->_config, "pageIndex");
  if (v18 != *MEMORY[0x1E0CF9338])
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreen);
    objc_msgSend(WeakRetained, "appsOnDock");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "containsObject:", v16);

    if ((v32 & 1) == 0)
    {
      p_config = &self->_config;
      if (!-[_ATXHomeScreenPageState _isShowingApp:allowFolder:](self, "_isShowingApp:allowFolder:", v16, 0))
        goto LABEL_4;
      __atxlog_handle_blending();
      obj = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&obj->super, OS_LOG_TYPE_DEBUG))
        -[_ATXHomeScreenPageState isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:].cold.2((uint64_t)v16, (id *)&self->_config, &obj->super);
LABEL_37:

    }
LABEL_38:
    v29 = 1;
    goto LABEL_39;
  }
LABEL_4:
  if (v9)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = self->_stacks;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    if (v19)
    {
      v20 = v19;
      v38 = (id *)p_config;
      v21 = *(_QWORD *)v45;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v45 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (objc_msgSend(v23, "containsWidgetForApp:", v16, v38))
          {
            __atxlog_handle_blending();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              v35 = objc_msgSend(*v38, "pageIndex");
              objc_msgSend(v23, "config");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v50 = v16;
              v51 = 2048;
              v52 = v35;
              v53 = 2112;
              v54 = v37;
              _os_log_debug_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEBUG, "[HSLS] Bundle id %@ is duplicate on page %ld due to widget in stack %@", buf, 0x20u);

            }
            goto LABEL_37;
          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        if (v20)
          continue;
        break;
      }
    }
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = self->_stacks;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v16);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        if (v10)
        {
          if ((objc_msgSend(v28, "containsIdenticalContentOfSuggestion:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v12, v8, v7) & 1) != 0)goto LABEL_38;
        }
        else if ((objc_msgSend(v28, "topWidgetIsShowingIdenticalContentOfSuggestion:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v12, v8, v7) & 1) != 0)
        {
          goto LABEL_38;
        }
      }
      v25 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v25);
  }
  v29 = 0;
LABEL_39:

  return v29;
}

- (BOOL)containsWidgetForIntent:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_stacks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsWidgetForIntent:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsSuggestedWidgetForApp:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_stacks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsSuggestedWidgetForApp:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsSGWidget
{
  void *v3;
  char v4;
  BOOL v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_ATXHomeScreenPageState config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsSuggestionsWidget");

  if ((v4 & 1) != 0)
    return 1;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_stacks;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v11, "suggestedWidgets", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v17, "isLayoutComplete") & 1) != 0)
              {

                v5 = 1;
                goto LABEL_22;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v5 = 0;
    }
    while (v8);
  }
  else
  {
    v5 = 0;
  }
LABEL_22:

  return v5;
}

- (BOOL)suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_stacks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "suggestionsWidgetSuggestionsByWidgetUniqueId", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "containsIdenticalContentOfSuggestion:", v4) & 1) != 0)
              {

                v17 = 1;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v7);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)isSeldomVisited
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATXStackStateTracker lastThreeUserVisitDatesOfPage:](self->_stackStateTracker, "lastThreeUserVisitDatesOfPage:", -[ATXHomeScreenPage pageIndex](self->_config, "pageIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "timeIntervalSinceNow");
        if (v8 > -86400.0)
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
    v9 = v5 < 3;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)pinnedSGWidgets
{
  return (id)-[NSArray _pas_filteredArrayWithTest:](self->_stacks, "_pas_filteredArrayWithTest:", &__block_literal_global_154);
}

- (id)pinnedAPPs
{
  return (id)-[NSArray _pas_filteredArrayWithTest:](self->_stacks, "_pas_filteredArrayWithTest:", &__block_literal_global_10_0);
}

- (BOOL)_isShowingApp:(id)a3 allowFolder:(BOOL)a4
{
  uint64_t v4;
  id v6;
  ATXHomeScreenPage *config;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a4;
  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  config = self->_config;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___ATXHomeScreenPageState__isShowingApp_allowFolder___block_invoke;
  v10[3] = &unk_1E82E6900;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  -[ATXHomeScreenPage enumerateAppsConsideringFolders:block:](config, "enumerateAppsConsideringFolders:block:", v4, v10);
  LOBYTE(v4) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (_ATXHomeScreenState)homeScreen
{
  return (_ATXHomeScreenState *)objc_loadWeakRetained((id *)&self->_homeScreen);
}

- (ATXHomeScreenPage)config
{
  return self->_config;
}

- (NSArray)stacks
{
  return self->_stacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stacks, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_homeScreen);
  objc_storeStrong((id *)&self->_stackStateTracker, 0);
}

- (void)isShowingDuplicatedContentForSuggestion:(os_log_t)log considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Found nil or empty string from ATXProactiveSuggestion with executable type App.", v1, 2u);
}

- (void)isShowingDuplicatedContentForSuggestion:(NSObject *)a3 considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:.cold.2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "pageIndex");
  v6 = 138412546;
  v7 = a1;
  v8 = 2048;
  v9 = v5;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "[HSLS] Bundle id %@ is duplicate on page %ld", (uint8_t *)&v6, 0x16u);
}

@end
