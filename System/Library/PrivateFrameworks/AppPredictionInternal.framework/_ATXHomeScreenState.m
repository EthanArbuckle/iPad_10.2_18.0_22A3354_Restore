@implementation _ATXHomeScreenState

- (_ATXHomeScreenState)initWithSortedHomeScreenPagesByUserLastVisit:(id)a3 appsOnDock:(id)a4 stackStateTracker:(id)a5 suggestionDeduplicator:(id)a6 hyperParameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _ATXHomeScreenState *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _ATXHomeScreenPageState *v23;
  NSArray *sortedPagesByUserLastVisit;
  NSArray *v25;
  id v27;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v35.receiver = self;
  v35.super_class = (Class)_ATXHomeScreenState;
  v17 = -[_ATXHomeScreenState init](&v35, sel_init);
  if (v17)
  {
    v27 = a4;
    v28 = v13;
    v18 = (NSArray *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v12;
    obj = v12;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(obj);
          v23 = -[_ATXHomeScreenPageState initWithHomeScreenState:pageConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:]([_ATXHomeScreenPageState alloc], "initWithHomeScreenState:pageConfig:stackStateTracker:suggestionDeduplicator:hyperParameters:", v17, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v22), v14, v15, v16, v27);
          -[NSArray addObject:](v18, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v20);
    }

    sortedPagesByUserLastVisit = v17->_sortedPagesByUserLastVisit;
    v17->_sortedPagesByUserLastVisit = v18;
    v25 = v18;

    objc_storeStrong((id *)&v17->_appsOnDock, v27);
    v13 = v28;
    v12 = v29;
  }

  return v17;
}

- (BOOL)isShowingDuplicatedContentForSuggestion:(id)a3 considerUnderStackContents:(BOOL)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7 ignoreTodayPage:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v22;
  NSArray *obj;
  _BOOL4 v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v8 = a8;
  v24 = a7;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_sortedPagesByUserLastVisit;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    v22 = *MEMORY[0x1E0CF9338];
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "config");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "pageIndex");

          if (v19 == v22)
            continue;
        }
        if ((objc_msgSend(v17, "isShowingDuplicatedContentForSuggestion:considerUnderStackContents:dedupeAppSuggestionsByWidgets:ignoreDuplicatesInSGWidget:ignoreDuplicatesInPanels:", v25, v11, v10, v9, v24, v22) & 1) != 0)
        {
          v20 = 1;
          goto LABEL_13;
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_13:

  return v20;
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
  v5 = self->_sortedPagesByUserLastVisit;
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
  v5 = self->_sortedPagesByUserLastVisit;
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

- (NSArray)sortedPagesByUserLastVisit
{
  return self->_sortedPagesByUserLastVisit;
}

- (NSSet)appsOnDock
{
  return self->_appsOnDock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsOnDock, 0);
  objc_storeStrong((id *)&self->_sortedPagesByUserLastVisit, 0);
}

@end
