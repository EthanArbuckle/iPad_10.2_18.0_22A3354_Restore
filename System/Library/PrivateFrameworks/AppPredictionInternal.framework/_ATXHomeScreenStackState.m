@implementation _ATXHomeScreenStackState

- (_ATXHomeScreenStackState)initWithPageState:(id)a3 stackConfig:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _ATXHomeScreenStackState *v17;
  _ATXHomeScreenStackState *v18;
  id *p_config;
  _ATXWidgetSuggesting *topOfStackSuggestion;
  void *v21;
  void *v22;
  uint64_t v23;
  _ATXWidgetSuggesting *previousTopOfStackSuggestion;
  uint64_t v25;
  NSMutableArray *suggestedWidgets;
  uint64_t v27;
  NSMutableArray *previousSuggestedWidgets;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  NSMutableDictionary *suggestionsWidgetSuggestionsByWidgetUniqueId;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  int v46;
  _ATXSuggestionsWidgetSuggestion *v47;
  NSMutableDictionary *v48;
  void *v49;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v64.receiver = self;
  v64.super_class = (Class)_ATXHomeScreenStackState;
  v17 = -[_ATXHomeScreenStackState init](&v64, sel_init);
  v18 = v17;
  if (!v17)
    goto LABEL_30;
  v52 = v16;
  objc_storeWeak((id *)&v17->_page, v12);
  p_config = (id *)&v18->_config;
  objc_storeStrong((id *)&v18->_config, a4);
  objc_storeStrong((id *)&v18->_stackStateTracker, a5);
  objc_storeStrong((id *)&v18->_suggestionDeduplicator, a6);
  objc_storeStrong((id *)&v18->_hyperParameters, a7);
  topOfStackSuggestion = v18->_topOfStackSuggestion;
  v18->_topOfStackSuggestion = 0;

  if ((-[ATXHomeScreenStackConfig isAppPredictionPanel](v18->_config, "isAppPredictionPanel") & 1) != 0
    || objc_msgSend(*p_config, "isPinnedSuggestionsWidget"))
  {
    -[ATXHomeScreenStackConfig widgets](v18->_config, "widgets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:](v18, "_previousSuggestionForMemberWidget:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    previousTopOfStackSuggestion = v18->_previousTopOfStackSuggestion;
    v18->_previousTopOfStackSuggestion = (_ATXWidgetSuggesting *)v23;

  }
  else
  {
    if ((objc_msgSend(*p_config, "allowsSmartRotate") & 1) == 0
      && !objc_msgSend(*p_config, "allowsNewWidget"))
    {
      goto LABEL_6;
    }
    -[_ATXHomeScreenStackState previousTopWidget](v18, "previousTopWidget");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:](v18, "_previousSuggestionForMemberWidget:", v21);
    v51 = objc_claimAutoreleasedReturnValue();
    v22 = v18->_previousTopOfStackSuggestion;
    v18->_previousTopOfStackSuggestion = (_ATXWidgetSuggesting *)v51;
  }

LABEL_6:
  v53 = v14;
  v54 = v13;
  v55 = v12;
  v25 = objc_opt_new();
  suggestedWidgets = v18->_suggestedWidgets;
  v18->_suggestedWidgets = (NSMutableArray *)v25;

  v27 = objc_opt_new();
  previousSuggestedWidgets = v18->_previousSuggestedWidgets;
  v18->_previousSuggestedWidgets = (NSMutableArray *)v27;

  if (-[ATXHomeScreenStackConfig allowsNewWidget](v18->_config, "allowsNewWidget"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(*p_config, "widgets");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v61 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (objc_msgSend(v34, "isSuggestedWidget"))
          {
            -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:](v18, "_previousSuggestionForMemberWidget:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              -[NSMutableArray addObject:](v18->_previousSuggestedWidgets, "addObject:", v35);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v31);
    }

  }
  v36 = objc_opt_new();
  suggestionsWidgetSuggestionsByWidgetUniqueId = v18->_suggestionsWidgetSuggestionsByWidgetUniqueId;
  v18->_suggestionsWidgetSuggestionsByWidgetUniqueId = (NSMutableDictionary *)v36;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[ATXHomeScreenStackConfig widgets](v18->_config, "widgets");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v57;
    v42 = *MEMORY[0x1E0CF9480];
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(v38);
        v44 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
        if ((objc_msgSend(v44, "isSuggestedWidget") & 1) == 0)
        {
          objc_msgSend(v44, "extensionBundleId");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", v42);

          if (v46)
          {
            v47 = -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:]([_ATXSuggestionsWidgetSuggestion alloc], "initWithSuggestionsWidget:containingStack:suggestionDeduplicator:hyperParameters:", v44, v18, v18->_suggestionDeduplicator, v18->_hyperParameters);
            v48 = v18->_suggestionsWidgetSuggestionsByWidgetUniqueId;
            objc_msgSend(v44, "widgetUniqueId");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v48, "setObject:forKeyedSubscript:", v47, v49);

          }
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v40);
  }

  v13 = v54;
  v12 = v55;
  v14 = v53;
  v16 = v52;
LABEL_30:

  return v18;
}

- (_ATXWidgetSuggesting)topOfStackSuggestion
{
  return self->_topOfStackSuggestion;
}

- (void)setTopOfStackSuggestion:(id)a3
{
  id v5;
  void *v6;
  _ATXWidgetSuggesting *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *suggestedWidgets;
  void *v11;
  NSMutableDictionary *suggestionsWidgetSuggestionsByWidgetUniqueId;
  void *v13;
  void *v14;
  _ATXWidgetSuggesting *topOfStackSuggestion;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _ATXWidgetSuggesting *v20;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52___ATXHomeScreenStackState_setTopOfStackSuggestion___block_invoke;
    v19[3] = &unk_1E82DD9C0;
    v7 = (_ATXWidgetSuggesting *)v5;
    v20 = v7;
    -[_ATXHomeScreenStackState _firstWidgetPassingTest:considerSuggestedWidgets:](self, "_firstWidgetPassingTest:considerSuggestedWidgets:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = -[NSMutableArray count](self->_suggestedWidgets, "count");
      suggestedWidgets = self->_suggestedWidgets;
      if (v9 == 1)
      {
        -[NSMutableArray objectAtIndexedSubscript:](suggestedWidgets, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          suggestionsWidgetSuggestionsByWidgetUniqueId = self->_suggestionsWidgetSuggestionsByWidgetUniqueId;
          objc_msgSend(v11, "widget");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "widgetUniqueId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](suggestionsWidgetSuggestionsByWidgetUniqueId, "removeObjectForKey:", v14);

        }
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_suggestedWidgets, "replaceObjectAtIndex:withObject:", 0, v7);

      }
      else
      {
        -[NSMutableArray addObject:](suggestedWidgets, "addObject:", v7);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = self->_suggestionsWidgetSuggestionsByWidgetUniqueId;
      -[_ATXWidgetSuggesting widget](v7, "widget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "widgetUniqueId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v7, v18);

    }
    objc_storeStrong((id *)&self->_topOfStackSuggestion, a3);

    topOfStackSuggestion = v20;
  }
  else
  {
    topOfStackSuggestion = self->_topOfStackSuggestion;
    self->_topOfStackSuggestion = 0;
  }

}

- (BOOL)isStale
{
  ATXStackStateTracker *stackStateTracker;
  void *v3;

  stackStateTracker = self->_stackStateTracker;
  -[ATXHomeScreenStackConfig identifier](self->_config, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stackStateTracker) = -[ATXStackStateTracker stackIsStale:](stackStateTracker, "stackIsStale:", v3);

  return (char)stackStateTracker;
}

- (BOOL)mostRecentRotationOfStackIsSystemInitiated
{
  ATXStackStateTracker *stackStateTracker;
  void *v3;

  stackStateTracker = self->_stackStateTracker;
  -[ATXHomeScreenStackConfig identifier](self->_config, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(stackStateTracker) = -[ATXStackStateTracker mostRecentRotationOfStackIsSystemInitiated:](stackStateTracker, "mostRecentRotationOfStackIsSystemInitiated:", v3);

  return (char)stackStateTracker;
}

- (id)previousTopWidget
{
  ATXHomeScreenStackConfig **p_config;
  void *v4;
  id v5;
  ATXStackStateTracker *stackStateTracker;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_config = &self->_config;
  if (-[ATXHomeScreenStackConfig isPinnedWidget](self->_config, "isPinnedWidget"))
  {
    -[ATXHomeScreenStackConfig widgets](*p_config, "widgets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    stackStateTracker = self->_stackStateTracker;
    -[ATXHomeScreenStackConfig identifier](self->_config, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXStackStateTracker topWidgetUniqueIdOfStack:](stackStateTracker, "topWidgetUniqueIdOfStack:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[ATXHomeScreenStackConfig widgets](*p_config, "widgets", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v13, "widgetUniqueId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v4);

            if ((v15 & 1) != 0)
            {
              v5 = v13;
              goto LABEL_17;
            }
          }
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ATXHomeScreenStackState previousTopWidget].cold.1((id *)p_config, (uint64_t)v4, v8);
    v5 = 0;
LABEL_17:

  }
  return v5;
}

- (BOOL)containsWidgetForIntent:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ATXHomeScreenStackConfig widgets](self->_config, "widgets");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "isSuggestedWidget") & 1) == 0)
      {
        objc_msgSend(v10, "intent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "intent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = +[ATXActionToWidgetConverter isWidgetIntent:validConversionFromActionIntent:](ATXActionToWidgetConverter, "isWidgetIntent:validConversionFromActionIntent:", v12, v4);

          if (v13)
            goto LABEL_20;
        }
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_suggestedWidgets;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
LABEL_13:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v15)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "widget", (_QWORD)v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = +[ATXActionToWidgetConverter isWidgetIntent:validConversionFromActionIntent:](ATXActionToWidgetConverter, "isWidgetIntent:validConversionFromActionIntent:", v18, v4);

      if (v19)
        break;
      if (v14 == ++v16)
      {
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
          goto LABEL_13;
        goto LABEL_21;
      }
    }
LABEL_20:
    LOBYTE(v14) = 1;
  }
LABEL_21:

  return v14;
}

- (BOOL)containsWidgetForApp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ATXHomeScreenStackConfig widgets](self->_config, "widgets", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isSuggestedWidget") & 1) == 0)
        {
          objc_msgSend(v10, "appBundleId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v4);

          if ((v12 & 1) != 0)
          {

            v13 = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = -[_ATXHomeScreenStackState containsSuggestedWidgetForApp:](self, "containsSuggestedWidgetForApp:", v4);
LABEL_12:

  return v13;
}

- (BOOL)containsSuggestedWidgetForApp:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_suggestedWidgets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "widget", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appBundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsIdenticalContentOfSuggestion:(id)a3 ignoreDuplicatesInSGWidget:(BOOL)a4 ignoreDuplicatesInPanels:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  BOOL v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v5 = a5;
  v6 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (-[ATXHomeScreenStackConfig isAppPredictionPanel](self->_config, "isAppPredictionPanel"))
  {
    v9 = -[_ATXHomeScreenStackState topWidgetIsShowingIdenticalContentOfSuggestion:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:](self, "topWidgetIsShowingIdenticalContentOfSuggestion:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v8, v6, v5);
    goto LABEL_35;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[ATXHomeScreenStackConfig widgets](self->_config, "widgets");
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
      if ((objc_msgSend(v15, "isSuggestedWidget") & 1) == 0
        && (-[ATXSuggestionDeduplicatorProtocol isWidget:showingIdenticalContentOfSuggestion:](self->_suggestionDeduplicator, "isWidget:showingIdenticalContentOfSuggestion:", v15, v8) & 1) != 0)
      {
        goto LABEL_33;
      }
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v12)
          goto LABEL_5;
        break;
      }
    }
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = self->_suggestedWidgets;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
LABEL_14:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v18)
        objc_enumerationMutation(v10);
      v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v19);
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if ((objc_msgSend(v20, "containsIdenticalContentOfSuggestion:", v8) & 1) != 0)
          break;
      }
      if (v17 == ++v19)
      {
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v17)
          goto LABEL_14;
        goto LABEL_22;
      }
    }
LABEL_33:

LABEL_34:
    v9 = 1;
    goto LABEL_35;
  }
LABEL_22:

  if (!v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NSMutableDictionary allValues](self->_suggestionsWidgetSuggestionsByWidgetUniqueId, "allValues", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "containsIdenticalContentOfSuggestion:", v8) & 1) != 0)
          {

            goto LABEL_34;
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        if (v23)
          continue;
        break;
      }
    }

  }
  v9 = 0;
LABEL_35:

  return v9;
}

- (BOOL)topWidgetIsShowingIdenticalContentOfSuggestion:(id)a3 ignoreDuplicatesInSGWidget:(BOOL)a4 ignoreDuplicatesInPanels:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  BOOL v9;
  char v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if ((-[ATXHomeScreenStackConfig allowsSmartRotate](self->_config, "allowsSmartRotate") & 1) == 0
    && (-[ATXHomeScreenStackConfig allowsNewWidget](self->_config, "allowsNewWidget") & 1) == 0
    && (-[ATXHomeScreenStackConfig isPinnedSuggestionsWidget](self->_config, "isPinnedSuggestionsWidget") & 1) == 0
    && !-[ATXHomeScreenStackConfig isAppPredictionPanel](self->_config, "isAppPredictionPanel"))
  {
    v10 = -[_ATXHomeScreenStackState previousTopWidgetWasShowingIdenticalContentOfSuggestion:](self, "previousTopWidgetWasShowingIdenticalContentOfSuggestion:", v8);
    goto LABEL_11;
  }
  if (!v5 || (-[ATXHomeScreenStackConfig isAppPredictionPanel](self->_config, "isAppPredictionPanel") & 1) == 0)
  {
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v10 = -[_ATXWidgetSuggesting containsIdenticalContentOfSuggestion:](self->_topOfStackSuggestion, "containsIdenticalContentOfSuggestion:", v8);
LABEL_11:
      v9 = v10;
      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)previousTopWidgetWasShowingIdenticalContentOfSuggestion:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;

  v4 = a3;
  if ((-[ATXHomeScreenStackConfig isPinnedSuggestionsWidget](self->_config, "isPinnedSuggestionsWidget") & 1) != 0
    || -[ATXHomeScreenStackConfig isAppPredictionPanel](self->_config, "isAppPredictionPanel"))
  {
    v5 = -[_ATXWidgetSuggesting containsIdenticalContentOfSuggestion:](self->_previousTopOfStackSuggestion, "containsIdenticalContentOfSuggestion:", v4);
  }
  else
  {
    -[_ATXHomeScreenStackState previousTopWidget](self, "previousTopWidget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "extensionBundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CF9480]);

      if (v9)
        v10 = -[_ATXWidgetSuggesting containsIdenticalContentOfSuggestion:](self->_previousTopOfStackSuggestion, "containsIdenticalContentOfSuggestion:", v4);
      else
        v10 = -[ATXSuggestionDeduplicatorProtocol isWidget:showingIdenticalContentOfSuggestion:](self->_suggestionDeduplicator, "isWidget:showingIdenticalContentOfSuggestion:", v7, v4);
      v5 = v10;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)previousSuggestedWidgetsContainIdenticalContentOfSuggestion:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  v5 = self->_previousSuggestedWidgets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsIdenticalContentOfSuggestion:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)widgetForSuggestion:(id)a3 considerSuggestedWidgets:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  ATXBlendingLayerHyperParameters *hyperParameters;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "executableSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "executableType");

  if (v8 != 3)
  {
    v10 = -[ATXHomeScreenStackConfig isAppPredictionPanel](self->_config, "isAppPredictionPanel");
    hyperParameters = self->_hyperParameters;
    if (v10)
    {
      if (-[ATXBlendingLayerHyperParameters isSuggestionEligibleForAppPredictionPanel:](hyperParameters, "isSuggestionEligibleForAppPredictionPanel:", v6))
      {
        -[ATXHomeScreenStackConfig widgets](self->_config, "widgets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    else if (-[ATXBlendingLayerHyperParameters isSuggestionEligibleForSuggestionsWidget:](hyperParameters, "isSuggestionEligibleForSuggestionsWidget:", v6))
    {
      -[_ATXHomeScreenStackState _firstWidgetPassingTest:considerSuggestedWidgets:](self, "_firstWidgetPassingTest:considerSuggestedWidgets:", &__block_literal_global_45, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!-[_ATXHomeScreenStackState sizeIsCompatibleWithWidgetSuggestion:](self, "sizeIsCompatibleWithWidgetSuggestion:", v6))goto LABEL_9;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73___ATXHomeScreenStackState_widgetForSuggestion_considerSuggestedWidgets___block_invoke;
  v14[3] = &unk_1E82DD9E8;
  v14[4] = self;
  v15 = v6;
  -[_ATXHomeScreenStackState _firstWidgetPassingTest:considerSuggestedWidgets:](self, "_firstWidgetPassingTest:considerSuggestedWidgets:", v14, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v9;
}

- (BOOL)sizeIsCompatibleWithWidgetSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[ATXHomeScreenStackConfig stackLayoutSize](self->_config, "stackLayoutSize");
  v6 = 0;
  v7 = 3;
  switch(v5)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v7 = 4;
      goto LABEL_6;
    case 2:
      v7 = 6;
      goto LABEL_6;
    case 3:
      goto LABEL_8;
    case 4:
      v7 = 7;
LABEL_6:
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811B8]), "initWithApplicableSuggestionLayout:", v7);
      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(v4, "uiSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredLayoutConfigs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v10, "containsObject:", v8);

LABEL_8:
  return v6;
}

- (id)_previousSuggestionForMemberWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _ATXAppPredictionPanelSuggestion *v11;
  _ATXSimpleWidgetSuggestion *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "extensionBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF89A8]);

    if (v7)
    {
      -[ATXStackStateTracker currentAppPredictionPanelLayouts](self->_stackStateTracker, "currentAppPredictionPanelLayouts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXHomeScreenStackConfig identifier](self->_config, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[_ATXAppPredictionPanelSuggestion initWithAppPredictionPanel:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:]([_ATXAppPredictionPanelSuggestion alloc], "initWithAppPredictionPanel:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:", v5, self, v10, self->_suggestionDeduplicator, self->_hyperParameters);
LABEL_9:
        v12 = (_ATXSimpleWidgetSuggestion *)v11;
LABEL_18:

        goto LABEL_19;
      }
      __atxlog_handle_blending();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:].cold.1((uint64_t)self, (id *)&self->_config, v17);

      goto LABEL_17;
    }
    objc_msgSend(v5, "extensionBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CF9480]);

    if (v14)
    {
      -[ATXStackStateTracker currentSuggestionsWidgetLayouts](self->_stackStateTracker, "currentSuggestionsWidgetLayouts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "widgetUniqueId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[_ATXSuggestionsWidgetSuggestion initWithSuggestionsWidget:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:]([_ATXSuggestionsWidgetSuggestion alloc], "initWithSuggestionsWidget:containingStack:suggestionLayout:suggestionDeduplicator:hyperParameters:", v5, self, v10, self->_suggestionDeduplicator, self->_hyperParameters);
        goto LABEL_9;
      }
      __atxlog_handle_blending();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_ATXHomeScreenStackState _previousSuggestionForMemberWidget:].cold.2((uint64_t)self, v18);

LABEL_17:
      v12 = 0;
      goto LABEL_18;
    }
    v12 = -[_ATXSimpleWidgetSuggestion initWithWidget:suggestion:stack:suggestionDeduplicator:]([_ATXSimpleWidgetSuggestion alloc], "initWithWidget:suggestion:stack:suggestionDeduplicator:", v5, 0, self, self->_suggestionDeduplicator);
  }
  else
  {
    v12 = 0;
  }
LABEL_19:

  return v12;
}

- (id)_firstWidgetPassingTest:(id)a3 considerSuggestedWidgets:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t (**v6)(id, void *);
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  char v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ATXHomeScreenStackConfig widgets](self->_config, "widgets");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isSuggestedWidget") & 1) == 0 && (v6[2](v6, v12) & 1) != 0)
        {
          v19 = v12;
LABEL_21:
          v13 = v19;
          goto LABEL_22;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (v4)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_suggestedWidgets;
    v13 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v7);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v16, "widget", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v6[2](v6, v17);

          if ((v18 & 1) != 0)
          {
            objc_msgSend(v16, "widget");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
        }
        v13 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_22:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_ATXHomeScreenPageState)page
{
  return (_ATXHomeScreenPageState *)objc_loadWeakRetained((id *)&self->_page);
}

- (ATXHomeScreenStackConfig)config
{
  return self->_config;
}

- (_ATXWidgetSuggesting)previousTopOfStackSuggestion
{
  return self->_previousTopOfStackSuggestion;
}

- (NSMutableArray)suggestedWidgets
{
  return self->_suggestedWidgets;
}

- (NSArray)previousSuggestedWidgets
{
  return &self->_previousSuggestedWidgets->super;
}

- (NSMutableDictionary)suggestionsWidgetSuggestionsByWidgetUniqueId
{
  return self->_suggestionsWidgetSuggestionsByWidgetUniqueId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_suggestionsWidgetSuggestionsByWidgetUniqueId, 0);
  objc_storeStrong((id *)&self->_previousSuggestedWidgets, 0);
  objc_storeStrong((id *)&self->_suggestedWidgets, 0);
  objc_storeStrong((id *)&self->_previousTopOfStackSuggestion, 0);
  objc_storeStrong((id *)&self->_topOfStackSuggestion, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
  objc_storeStrong((id *)&self->_stackStateTracker, 0);
}

- (void)previousTopWidget
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[_ATXHomeScreenStackState previousTopWidget]";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = a2;
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a3, v6, "%s: Unable to find previous top widget for stack %@ (stackStateTracker returned topWidgetUniqueId %@)", (uint8_t *)&v7);

}

- (void)_previousSuggestionForMemberWidget:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12[40];

  v5 = OUTLINED_FUNCTION_3_6(a1);
  objc_msgSend(v5, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageIndex");
  objc_msgSend(*a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "widgets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widgetUniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a3, v11, "_ATXHomeScreenStackState: Unable to get layout for AppPredictionPanel on screen: page %lu, stackId %{public}@, widgetUniqueId %{public}@", v12);

  OUTLINED_FUNCTION_1_6();
}

- (void)_previousSuggestionForMemberWidget:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[40];

  v4 = OUTLINED_FUNCTION_3_6(a1);
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pageIndex");
  objc_msgSend(*(id *)(a1 + 80), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 80), "widgets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widgetUniqueId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_1C9A3B000, a2, v10, "_ATXHomeScreenStackState: Unable to get layout for SuggestionsWidget on screen: page %lu, stackId %{public}@, widgetUniqueId %{public}@", v11);

  OUTLINED_FUNCTION_1_6();
}

@end
