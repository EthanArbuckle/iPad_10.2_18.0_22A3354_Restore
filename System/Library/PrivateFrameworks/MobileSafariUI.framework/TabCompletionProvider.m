@implementation TabCompletionProvider

- (void)dealloc
{
  objc_super v3;

  -[WBSBrowserTabCompletionProvider invalidate](self->_browserTabCompletionProvider, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TabCompletionProvider;
  -[TabCompletionProvider dealloc](&v3, sel_dealloc);
}

- (id)bestTabCompletionMatchForQuery:(id)a3 withTopHitURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CompletionProvider completionsForQuery:](self, "completionsForQuery:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    -[WBSBrowserTabCompletionProvider bestTabCompletionMatchFromMatches:withTopHitURL:](self->_browserTabCompletionProvider, "bestTabCompletionMatchFromMatches:withTopHitURL:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setQueryToComplete:(id)a3
{
  void *v4;
  WBSBrowserTabCompletionProvider *browserTabCompletionProvider;
  WBSBrowserTabCompletionProvider *v6;
  WBSBrowserTabCompletionProvider *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  browserTabCompletionProvider = self->_browserTabCompletionProvider;
  if (!browserTabCompletionProvider)
  {
    v6 = (WBSBrowserTabCompletionProvider *)objc_alloc_init(MEMORY[0x1E0D8A7E8]);
    v7 = self->_browserTabCompletionProvider;
    self->_browserTabCompletionProvider = v6;

    -[WBSBrowserTabCompletionProvider setDataSource:](self->_browserTabCompletionProvider, "setDataSource:", self);
    -[WBSBrowserTabCompletionProvider setDelegate:](self->_browserTabCompletionProvider, "setDelegate:", self);
    browserTabCompletionProvider = self->_browserTabCompletionProvider;
  }
  -[WBSBrowserTabCompletionProvider setCurrentQuery:forQueryID:](browserTabCompletionProvider, "setCurrentQuery:forQueryID:", v4, objc_msgSend(v8, "queryID"));

}

- (void)invalidateCachedTabData
{
  -[WBSBrowserTabCompletionProvider invalidate](self->_browserTabCompletionProvider, "invalidate");
}

- (id)tabInfosForBrowserTabCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void *v24;
  id obj;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabCompletionProviderDataSource);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "windowUUIDsToTabsForTabCompletionProvider:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke;
  v35[3] = &unk_1E9CF4588;
  v7 = v5;
  v36 = v7;
  v23 = v6;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v35);
  objc_msgSend(WeakRetained, "currentWindowUUIDForTabCompletionProvider:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = WeakRetained;
  objc_msgSend(WeakRetained, "tabGroupsForTabCompletionProvider:", self);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

        objc_msgSend(v13, "displayTitle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tabs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_3;
        v26[3] = &unk_1E9CF45B0;
        v27 = v8;
        v28 = v16;
        v29 = v17;
        v30 = v7;
        v19 = v17;
        v20 = v16;
        objc_msgSend(v18, "enumerateObjectsUsingBlock:", v26);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }
  v21 = v7;

  return v21;
}

void __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_2;
  v7[3] = &unk_1E9CF4560;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D8A7D8]);
    objc_msgSend(v11, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v7, v8, 0, 0, a3, v5, v9, objc_msgSend(v11, "pageStatus"));

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }

}

void __65__TabCompletionProvider_tabInfosForBrowserTabCompletionProvider___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D8A7D8]);
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v18, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v18, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "title");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = a3;
    v16 = (void *)v14;
    v17 = (void *)objc_msgSend(v6, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v9, v10, v11, v12, v15, v13, v14, 0);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);
  }

}

- (id)selectedTabInfoForBrowserTabCompletionProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabCompletionProviderDataSource);
  objc_msgSend(WeakRetained, "selectedTabDocumentForTabCompletionProvider:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "browserController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tabController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentTabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObjectIdenticalTo:", v5);

    v10 = objc_alloc(MEMORY[0x1E0D8A7D8]);
    objc_msgSend(v5, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithUUID:windowUUID:tabGroupUUID:tabGroupTitle:tabIndex:url:title:pageStatus:", v11, v12, 0, 0, v9, v13, v14, objc_msgSend(v5, "pageStatus"));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:(id)a3
{
  void *v4;
  id v5;

  -[WBSBrowserTabCompletionProvider currentTabCompletionMatches](self->_browserTabCompletionProvider, "currentTabCompletionMatches", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSBrowserTabCompletionProvider currentQuery](self->_browserTabCompletionProvider, "currentQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionProvider setCompletions:forString:](self, "setCompletions:forString:", v5, v4);

}

- (BOOL)browserTabCompletionProvider:(id)a3 shouldExtensionURLAppearAsSwitchToTabItem:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[Application sharedApplication](Application, "sharedApplication", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allWebExtensionsControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "webExtensionForBaseURIHost:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)objc_msgSend(v12, "newTabOverridePageURL");
          LODWORD(v7) = objc_msgSend(v4, "isEqual:", v13) ^ 1;

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)browserTabCompletionProvider:(id)a3 alternativeDisplayTextForURLForExtensionURL:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[Application sharedApplication](Application, "sharedApplication", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allWebExtensionsControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "webExtensionForBaseURIHost:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "displayName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (TabCompletionProviderDataSource)tabCompletionProviderDataSource
{
  return (TabCompletionProviderDataSource *)objc_loadWeakRetained((id *)&self->_tabCompletionProviderDataSource);
}

- (void)setTabCompletionProviderDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_tabCompletionProviderDataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabCompletionProviderDataSource);
  objc_storeStrong((id *)&self->_browserTabCompletionProvider, 0);
}

@end
