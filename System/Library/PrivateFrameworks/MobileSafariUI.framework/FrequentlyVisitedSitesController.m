@implementation FrequentlyVisitedSitesController

- (id)frequentlyVisitedSites
{
  -[FrequentlyVisitedSitesController _updateCachedFrequentlyVisitesSitesIfNecessary](self, "_updateCachedFrequentlyVisitesSitesIfNecessary");
  return self->_cachedFrequentlyVisitedBookmarks;
}

- (id)_canonicalizedFavoritesURLStringSet
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WebBookmarkCollection bookmarksInFavoritesList](self->_bookmarkCollection, "bookmarksInFavoritesList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "address", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safari_canonicalURLStringForFrequentlyVisitedSites");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

void __82__FrequentlyVisitedSitesController__saveFrequentlyVisitedSites_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id obj;
  uint64_t v32;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v34 = a1;
  v3 = *(id *)(*(_QWORD *)(a1 + 40) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v8, "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(v34 + 32);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v10)
  {
    v11 = v10;
    v32 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v13, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "urlString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc(MEMORY[0x1E0DCCB98]);
        v18 = v17;
        if (v16)
        {
          v19 = (void *)objc_msgSend(v17, "initFrequentlyVisitedSiteWithWebBookmark:title:", v16, v14);
        }
        else
        {
          v20 = *(unsigned int *)(v34 + 56);
          objc_msgSend(*(id *)(*(_QWORD *)(v34 + 40) + 48), "configuration");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", v14, v15, v20, 5, 0, objc_msgSend(v21, "collectionType"));

        }
        v22 = *(void **)(*(_QWORD *)(v34 + 40) + (int)*MEMORY[0x1E0D8AE08]);
        v23 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v19, "address");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "URLWithString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "itemForURL:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHistoryItem:", v26);

        objc_msgSend(v33, "addObject:", v19);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v11);
  }

  v27 = *(_QWORD *)(v34 + 40);
  v28 = *(void **)(v27 + 64);
  *(_QWORD *)(v27 + 64) = v33;
  v29 = v33;

  *(_BYTE *)(*(_QWORD *)(v34 + 40) + 56) = 1;
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "scheduleLowPriorityRequestForBookmarks:", *(_QWORD *)(*(_QWORD *)(v34 + 40) + 64));

  (*(void (**)(void))(*(_QWORD *)(v34 + 48) + 16))();
}

- (FrequentlyVisitedSitesController)initWithBookmarkCollection:(id)a3 history:(id)a4 bannedURLStore:(id)a5 tabCollection:(id)a6 profileIdentifier:(id)a7
{
  id v13;
  id v14;
  FrequentlyVisitedSitesController *v15;
  FrequentlyVisitedSitesController *v16;
  id *p_bookmarkCollection;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *cachedFrequentlyVisitedBookmarks;
  uint64_t v23;
  NSMapTable *frequentlyVisitedBookmarksToMetadataTokens;
  void *v25;
  FrequentlyVisitedSitesController *v26;
  objc_super v28;

  v13 = a3;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)FrequentlyVisitedSitesController;
  v15 = -[WBSFrequentlyVisitedSitesController initWithHistory:bannedURLStore:profileIdentifier:](&v28, sel_initWithHistory_bannedURLStore_profileIdentifier_, a4, a5, a7);
  v16 = v15;
  if (v15)
  {
    p_bookmarkCollection = (id *)&v15->_bookmarkCollection;
    objc_storeStrong((id *)&v15->_bookmarkCollection, a3);
    objc_storeStrong((id *)&v16->_tabCollection, a6);
    if (objc_msgSend(*(id *)((char *)&v16->super.super.isa + (int)*MEMORY[0x1E0D8AE10]), "isEqualToString:", *MEMORY[0x1E0D89E20]))
    {
      objc_msgSend(*p_bookmarkCollection, "frequentlyVisitedSitesList");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "bookmarkArray");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "mutableCopy");
        cachedFrequentlyVisitedBookmarks = v16->_cachedFrequentlyVisitedBookmarks;
        v16->_cachedFrequentlyVisitedBookmarks = (NSMutableArray *)v21;

        v16->_bookmarksNeedToSave = 1;
        objc_msgSend(*p_bookmarkCollection, "deleteFrequentlyVisitedSitesFolder");
        -[FrequentlyVisitedSitesController _postFrequentlyVisitedSitesDidChangeNotification](v16, "_postFrequentlyVisitedSitesDidChangeNotification");
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    frequentlyVisitedBookmarksToMetadataTokens = v16->_frequentlyVisitedBookmarksToMetadataTokens;
    v16->_frequentlyVisitedBookmarksToMetadataTokens = (NSMapTable *)v23;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v16, sel__historyWasLoaded_, *MEMORY[0x1E0D8B100], 0);

    v26 = v16;
  }

  return v16;
}

- (id)_frequentlyVisitedSitesURLStringSet
{
  void *v2;
  void *v3;

  -[FrequentlyVisitedSitesController frequentlyVisitedSites](self, "frequentlyVisitedSites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_41);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_saveFrequentlyVisitedSites:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FrequentlyVisitedSitesController *v13;
  id v14;
  int v15;

  v6 = a3;
  v7 = a4;
  v8 = -[WBTabCollection frequentlyVisitedSitesFolderIDForProfileWithIdentifier:](self->_tabCollection, "frequentlyVisitedSitesFolderIDForProfileWithIdentifier:", *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE10]));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__FrequentlyVisitedSitesController__saveFrequentlyVisitedSites_completionHandler___block_invoke;
  v11[3] = &unk_1E9CF6C58;
  v12 = v6;
  v13 = self;
  v15 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

- (NSString)providerSectionIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0D8B608];
}

- (id)_frequentlyVisitedBookmarksToCachedLinkMetadata
{
  void *v3;

  objc_getAssociatedObject(self, &frequentlyVisitedBookmarksToCachedLinkMetadataKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(self, &frequentlyVisitedBookmarksToCachedLinkMetadataKey, v3, (void *)1);
  }
  return v3;
}

- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(self, &suggestionsProviderDelegateKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSStartPageSuggestionsProviderDelegate *)v3;
}

- (void)setSuggestionsProviderDelegate:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D89D20], "wrapperWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(self, &suggestionsProviderDelegateKey, v4, (void *)1);

}

- (NSArray)suggestions
{
  void *v2;
  void *v3;

  -[FrequentlyVisitedSitesController frequentlyVisitedSites](self, "frequentlyVisitedSites");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)_frequentlyVisitedSitesDidLoadHistory
{
  void *v3;
  id v4;

  -[FrequentlyVisitedSitesController _updateFrequentlyVisitedBookmarksToCachedLinkMetadata](self, "_updateFrequentlyVisitedBookmarksToCachedLinkMetadata");
  -[FrequentlyVisitedSitesController suggestionsProviderDelegate](self, "suggestionsProviderDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FrequentlyVisitedSitesController frequentlyVisitedSites](self, "frequentlyVisitedSites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startPageSuggestionsProvider:forceReloadSuggestions:", self, v3);

}

- (void)_postFrequentlyVisitedSitesDidChangeNotification
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FrequentlyVisitedSitesController;
  -[WBSFrequentlyVisitedSitesController _postFrequentlyVisitedSitesDidChangeNotification](&v5, sel__postFrequentlyVisitedSitesDidChangeNotification);
  -[FrequentlyVisitedSitesController _updateFrequentlyVisitedBookmarksToCachedLinkMetadata](self, "_updateFrequentlyVisitedBookmarksToCachedLinkMetadata");
  -[FrequentlyVisitedSitesController suggestionsProviderDelegate](self, "suggestionsProviderDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FrequentlyVisitedSitesController frequentlyVisitedSites](self, "frequentlyVisitedSites");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPageSuggestionsProvider:didUpdateSuggestions:", self, v4);

}

- (void)_updateFrequentlyVisitedBookmarksToCachedLinkMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[FrequentlyVisitedSitesController frequentlyVisitedSites](self, "frequentlyVisitedSites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FrequentlyVisitedSitesController _frequentlyVisitedBookmarksToCachedLinkMetadata](self, "_frequentlyVisitedBookmarksToCachedLinkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(void *, _QWORD);
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  void (**v23)(id, void *);
  id v24;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = v6;
  -[FrequentlyVisitedSitesController _frequentlyVisitedBookmarksToCachedLinkMetadata](self, "_frequentlyVisitedBookmarksToCachedLinkMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v7[2](v7, v10);
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke;
    aBlock[3] = &unk_1E9CF5280;
    objc_copyWeak(&v24, &location);
    v11 = v8;
    v21 = v11;
    v22 = v9;
    v23 = v7;
    v12 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0D4EF88], "hasSharedSiteMetadataManager"))
    {
      v13 = objc_alloc(MEMORY[0x1E0D8A9F0]);
      v14 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v11, "address");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithURL:", v16);

      objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "registerOneTimeRequest:priority:responseHandler:", v17, 2, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable setObject:forKey:](self->_frequentlyVisitedBookmarksToMetadataTokens, "setObject:forKey:", v19, v11);
    }
    else
    {
      v12[2](v12, 0);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

void __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke_2;
  block[3] = &unk_1E9CF5258;
  objc_copyWeak(&v10, a1 + 7);
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained[5], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v11, "frequentlyVisitedSites");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

    WeakRetained = v11;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D8A9E8], "unpackMetadataFromResponse:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 48);
      if (v5)
      {
        objc_msgSend(v6, "setObject:forKey:", v5, *(_QWORD *)(a1 + 32));
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 32));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 32));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        }
        else
        {
          objc_msgSend(v11, "_createEmptyMetadataWithBookmark:", *(_QWORD *)(a1 + 32));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v10, *(_QWORD *)(a1 + 32));
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        }
      }

      WeakRetained = v11;
    }
  }

}

- (id)_createEmptyMetadataWithBookmark:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CC11A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginalURL:", v8);

  objc_msgSend(v5, "originalURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setURL:", v9);

  objc_msgSend(v4, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:", v10);
  return v5;
}

+ (FrequentlyVisitedSitesController)sharedController
{
  void *v2;
  void *v3;
  void *v4;

  -[objc_class sharedApplication](NSClassFromString((NSString *)CFSTR("Application")), "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "historyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "frequentlyVisitedSitesControllerForProfileIdentifier:loadIfNeeded:", *MEMORY[0x1E0D89E20], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (FrequentlyVisitedSitesController *)v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (objc_msgSend(MEMORY[0x1E0D4EF88], "hasSharedSiteMetadataManager"))
  {
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectEnumerator](self->_frequentlyVisitedBookmarksToMetadataTokens, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequestsWithTokens:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)FrequentlyVisitedSitesController;
  -[FrequentlyVisitedSitesController dealloc](&v7, sel_dealloc);
}

- (void)_updateCachedFrequentlyVisitesSitesIfNecessary
{
  NSMutableArray *v3;
  NSMutableArray *cachedFrequentlyVisitedBookmarks;
  WBTabCollection *tabCollection;
  uint64_t v6;
  _QWORD v7[5];

  if (!self->_cachedFrequentlyVisitedBookmarks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
    self->_cachedFrequentlyVisitedBookmarks = v3;

    tabCollection = self->_tabCollection;
    v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE10]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke;
    v7[3] = &unk_1E9CF1C48;
    v7[4] = self;
    -[WBTabCollection frequentlyVisitedSitesForProfileWithIdentifier:completionHandler:](tabCollection, "frequentlyVisitedSitesForProfileWithIdentifier:completionHandler:", v6, v7);
  }
}

void __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke_2;
    v5[3] = &unk_1E9CF1830;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_associateHistoryToFrequentlyVisitedSites");
  return objc_msgSend(*(id *)(a1 + 32), "_postFrequentlyVisitedSitesDidChangeNotification");
}

- (void)clearFrequentlyVisitedSites
{
  NSMutableArray *cachedFrequentlyVisitedBookmarks;
  objc_super v4;

  cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
  self->_cachedFrequentlyVisitedBookmarks = 0;

  -[FrequentlyVisitedSitesController _clearFrequentlyVisitedSitesInBookmarksDB](self, "_clearFrequentlyVisitedSitesInBookmarksDB");
  v4.receiver = self;
  v4.super_class = (Class)FrequentlyVisitedSitesController;
  -[WBSFrequentlyVisitedSitesController clearFrequentlyVisitedSites](&v4, sel_clearFrequentlyVisitedSites);
}

- (void)promoteFrequentlyVisitedSite:(id)a3 toFavoriteAtIndex:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WebBookmarkCollection *bookmarkCollection;
  void *v14;
  id v15;

  v6 = (objc_class *)MEMORY[0x1E0DCCB98];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection configuration](self->_bookmarkCollection, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v8, "initWithTitle:address:collectionType:", v9, v10, objc_msgSend(v11, "collectionType"));

  objc_msgSend(v7, "iconData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIconData:", v12);

  objc_msgSend(v15, "setFetchedIconData:", objc_msgSend(v7, "fetchedIconData"));
  -[FrequentlyVisitedSitesController _deleteFrequentlyVisistedSiteInCurrentPofile:](self, "_deleteFrequentlyVisistedSiteInCurrentPofile:", v7);
  bookmarkCollection = self->_bookmarkCollection;
  -[WebBookmarkCollection favoritesFolder](bookmarkCollection, "favoritesFolder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection moveBookmark:toFolderWithID:](bookmarkCollection, "moveBookmark:toFolderWithID:", v15, objc_msgSend(v14, "identifier"));

  -[WebBookmarkCollection saveBookmark:](self->_bookmarkCollection, "saveBookmark:", v15);
  -[WebBookmarkCollection reorderBookmark:toIndex:](self->_bookmarkCollection, "reorderBookmark:toIndex:", v15, a4);
  LOBYTE(a4) = objc_msgSend(v7, "isInserted");

  if ((a4 & 1) == 0)
    -[FrequentlyVisitedSitesController _postFrequentlyVisitedSitesDidChangeNotification](self, "_postFrequentlyVisitedSitesDidChangeNotification");

}

- (void)_deleteFrequentlyVisistedSiteInCurrentPofile:(id)a3
{
  -[NSMutableArray removeObject:](self->_cachedFrequentlyVisitedBookmarks, "removeObject:", a3);
  -[WBTabCollection setFrequentlyVisitedSites:forProfileWithIdentifier:completionHandler:](self->_tabCollection, "setFrequentlyVisitedSites:forProfileWithIdentifier:completionHandler:", self->_cachedFrequentlyVisitedBookmarks, *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE10]), 0);
  -[FrequentlyVisitedSitesController _postFrequentlyVisitedSitesDidChangeNotification](self, "_postFrequentlyVisitedSitesDidChangeNotification");
}

- (void)banFrequentlyVisitedSite:(id)a3 inMemoryBookmarkChangeTrackingAvailable:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE00]);
  v7 = a3;
  objc_msgSend(v7, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addURLString:", v6);

  -[FrequentlyVisitedSitesController _deleteFrequentlyVisistedSiteInCurrentPofile:](self, "_deleteFrequentlyVisistedSiteInCurrentPofile:", v7);
}

- (void)_clearFrequentlyVisitedSitesInBookmarksDB
{
  -[WBTabCollection setFrequentlyVisitedSites:forProfileWithIdentifier:completionHandler:](self->_tabCollection, "setFrequentlyVisitedSites:forProfileWithIdentifier:completionHandler:", MEMORY[0x1E0C9AA60], *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE10]), 0);
}

uint64_t __71__FrequentlyVisitedSitesController__frequentlyVisitedSitesURLStringSet__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "address");
}

- (void)saveFrequentlyVisitedSitesToBookmarksDBWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  WBTabCollection *tabCollection;
  NSMutableArray *cachedFrequentlyVisitedBookmarks;
  uint64_t v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_bookmarksNeedToSave)
  {
    tabCollection = self->_tabCollection;
    cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
    v8 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE10]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__FrequentlyVisitedSitesController_saveFrequentlyVisitedSitesToBookmarksDBWithCompletion___block_invoke;
    v9[3] = &unk_1E9CF6C30;
    v10 = v4;
    -[WBTabCollection setFrequentlyVisitedSites:forProfileWithIdentifier:completionHandler:](tabCollection, "setFrequentlyVisitedSites:forProfileWithIdentifier:completionHandler:", cachedFrequentlyVisitedBookmarks, v8, v9);
    self->_bookmarksNeedToSave = 0;

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __90__FrequentlyVisitedSitesController_saveFrequentlyVisitedSitesToBookmarksDBWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)bookmarkIsFrequentlyVistedSite:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "parentID");
  return v4 == -[WBTabCollection frequentlyVisitedSitesFolderIDForProfileWithIdentifier:](self->_tabCollection, "frequentlyVisitedSitesFolderIDForProfileWithIdentifier:", *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D8AE10]));
}

- (void)_historyWasLoaded:(id)a3
{
  -[FrequentlyVisitedSitesController _associateHistoryToFrequentlyVisitedSites](self, "_associateHistoryToFrequentlyVisitedSites", a3);
  -[FrequentlyVisitedSitesController _frequentlyVisitedSitesDidLoadHistory](self, "_frequentlyVisitedSitesDidLoadHistory");
}

- (void)_associateHistoryToFrequentlyVisitedSites
{
  NSMutableArray *cachedFrequentlyVisitedBookmarks;
  _QWORD v3[5];

  cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__FrequentlyVisitedSitesController__associateHistoryToFrequentlyVisitedSites__block_invoke;
  v3[3] = &unk_1E9CF6C80;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](cachedFrequentlyVisitedBookmarks, "enumerateObjectsUsingBlock:", v3);
}

void __77__FrequentlyVisitedSitesController__associateHistoryToFrequentlyVisitedSites__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D8AE08]);
  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a2;
  objc_msgSend(v4, "address");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHistoryItem:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_cachedFrequentlyVisitedBookmarks, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedBookmarksToMetadataTokens, 0);
}

@end
