@implementation URLCompletionDatabase

- (URLCompletionDatabase)initWithCloudTabStore:(id)a3 profileIdentifier:(id)a4 searchableCollectionsMask:(int)a5 bookmarkProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  URLCompletionDatabase *v14;
  URLCompletionDatabase *v15;
  uint64_t v16;
  NSString *profileIdentifier;
  dispatch_queue_t v18;
  OS_dispatch_queue *cloudTabsAccessQueue;
  void *v20;
  NSCache *v21;
  NSCache *bookmarksCache;
  void *v23;
  void *v24;
  URLCompletionDatabase *v25;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)URLCompletionDatabase;
  v14 = -[WBSURLCompletionDatabase init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    -[WBSURLCompletionDatabase setDataSource:](v14, "setDataSource:", v14);
    v15->_searchableCollectionsMask = a5;
    v16 = objc_msgSend(v12, "copy");
    profileIdentifier = v15->_profileIdentifier;
    v15->_profileIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_cloudTabStore, a3);
    v18 = dispatch_queue_create("com.apple.mobilesafari.iCloudTabsAccessQueue", 0);
    cloudTabsAccessQueue = v15->_cloudTabsAccessQueue;
    v15->_cloudTabsAccessQueue = (OS_dispatch_queue *)v18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__updateCloudDevices_, CFSTR("CloudTabStoreDidUpdateNotification"), 0);
    v21 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    bookmarksCache = v15->_bookmarksCache;
    v15->_bookmarksCache = v21;

    -[NSCache setCountLimit:](v15->_bookmarksCache, "setCountLimit:", 1);
    objc_storeStrong((id *)&v15->_bookmarkProvider, a6);
    +[Application sharedApplication](Application, "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tabGroupManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addCloudTabsObserver:", v15);

    v25 = v15;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)URLCompletionDatabase;
  -[URLCompletionDatabase dealloc](&v4, sel_dealloc);
}

- (void)clearBookmarksCache
{
  -[NSCache removeAllObjects](self->_bookmarksCache, "removeAllObjects");
}

- (void)_updateCloudDevices:(id)a3
{
  NSObject *cloudTabsAccessQueue;
  _QWORD block[5];

  cloudTabsAccessQueue = self->_cloudTabsAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__URLCompletionDatabase__updateCloudDevices___block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_sync(cloudTabsAccessQueue, block);
}

void __45__URLCompletionDatabase__updateCloudDevices___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "syncedRemoteCloudTabDevicesForProfileWithIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
  -[URLCompletionDatabase _updateCloudDevices:](self, "_updateCloudDevices:", 0, a4);
}

- (void)enumerateMatchDataForTypedStringHint:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 options:(unint64_t)a5 withBlock:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  int searchableCollectionsMask;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  NSObject *cloudTabsAccessQueue;
  NSCache *bookmarksCache;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char hasMatchWithOptions;
  NSString *v31;
  WBSHistory *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  WBBookmarkProvider *bookmarkProvider;
  id v40;
  id v41;
  NSCache *v42;
  void *v43;
  dispatch_time_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  URLCompletionDatabase *v59;
  id v60;
  void *v61;
  NSObject *group;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  unint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD block[5];
  id v79;
  id v80;
  unint64_t v81;
  _QWORD v82[4];
  id v83;
  NSObject *v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v60 = a4;
  v10 = a6;
  +[Application sharedApplication](Application, "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "historyController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "historyForProfileIdentifier:loadIfNeeded:", v60, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  group = dispatch_group_create();
  searchableCollectionsMask = self->_searchableCollectionsMask;
  v59 = self;
  if ((searchableCollectionsMask & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(group);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v17 = v16;
    v18 = MEMORY[0x1E0C809B0];
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke;
    v85[3] = &unk_1E9CF9CF8;
    v86 = v58;
    v19 = v14;
    v87 = v19;
    v82[0] = v18;
    v82[1] = 3221225472;
    v82[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2;
    v82[3] = &unk_1E9CF9D20;
    v83 = v63;
    v84 = group;
    objc_msgSend(v86, "searchForUserTypedString:options:currentTime:enumerationBlock:completionHandler:", v83, a5, v85, v82, v17);

    self = v59;
    searchableCollectionsMask = v59->_searchableCollectionsMask;
    v61 = v19;
    if ((searchableCollectionsMask & 2) == 0)
    {
LABEL_3:
      if ((searchableCollectionsMask & 1) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else
  {
    v61 = 0;
    if ((searchableCollectionsMask & 2) == 0)
      goto LABEL_3;
  }
  cloudTabsAccessQueue = self->_cloudTabsAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_258;
  block[3] = &unk_1E9CF9D48;
  block[4] = self;
  v79 = v63;
  v81 = a5;
  v80 = v10;
  dispatch_sync(cloudTabsAccessQueue, block);

  self = v59;
  searchableCollectionsMask = v59->_searchableCollectionsMask;
  if ((searchableCollectionsMask & 1) == 0)
  {
LABEL_4:
    if ((searchableCollectionsMask & 4) == 0)
      goto LABEL_37;
    goto LABEL_24;
  }
LABEL_8:
  bookmarksCache = self->_bookmarksCache;
  objc_msgSend(v63, "normalizedString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](bookmarksCache, "objectForKey:", v22);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v23 = v57;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v75 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v27, "address", v57);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "title");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          hasMatchWithOptions = SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions();

          if ((hasMatchWithOptions & 1) != 0)
          {
            matchDataWithBookmark((WebBookmark *)v27, v31, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v10 + 2))(v10, v33);

          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
      }
      while (v24);
    }
  }
  else
  {
    objc_msgSend(v63, "components");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;
    }
    else
    {
      objc_msgSend(v63, "normalizedString");
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v37;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 16);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    bookmarkProvider = v59->_bookmarkProvider;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_261;
    v68[3] = &unk_1E9CF9D70;
    v40 = v63;
    v69 = v40;
    v73 = a5;
    v41 = v38;
    v70 = v41;
    v72 = v10;
    v71 = v58;
    -[WBBookmarkProvider enumerateBookmarks:andReadingListItems:matchingString:usingBlock:](bookmarkProvider, "enumerateBookmarks:andReadingListItems:matchingString:usingBlock:", 1, 1, v23, v68);
    v42 = v59->_bookmarksCache;
    objc_msgSend(v40, "normalizedString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](v42, "setObject:forKey:", v41, v43);

  }
  if ((v59->_searchableCollectionsMask & 4) != 0)
  {
LABEL_24:
    v44 = dispatch_time(0, 2000000000);
    if (dispatch_group_wait(group, v44))
    {
      v45 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[URLCompletionDatabase enumerateMatchDataForTypedStringHint:filterResultsUsingProfileIdentifier:options:withBlock:].cold.2(v45);
      v46 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[URLCompletionDatabase enumerateMatchDataForTypedStringHint:filterResultsUsingProfileIdentifier:options:withBlock:].cold.1((uint64_t)v63, v46, v47, v48, v49, v50, v51, v52);
    }
    else
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v53 = v61;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v54; ++j)
          {
            if (*(_QWORD *)v65 != v55)
              objc_enumerationMutation(v53);
            (*((void (**)(id, _QWORD))v10 + 2))(v10, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j));
          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v88, 16);
        }
        while (v54);
      }

    }
  }
LABEL_37:

}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "originalURLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemForURLString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_cold_2(v5, (uint64_t)v13, v4);
    }

    v6 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_258(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  URLCompletionMatchBookmarkData *v17;
  void *v18;
  URLCompletionMatchBookmarkData *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 136))
  {
    objc_msgSend(*(id *)(v2 + 128), "syncedRemoteCloudTabDevicesForProfileWithIdentifier:", *(_QWORD *)(v2 + 168));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v4;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(v2 + 136);
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v24 = v7;
        objc_msgSend(v7, "tabs");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v27 != v9)
                objc_enumerationMutation(v25);
              v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v11, "url");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "absoluteString");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "title");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if ((SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions() & 1) != 0)
              {
                v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB98]), "initWithTitle:address:collectionType:", v14, v13, 0);
                v16 = *(_QWORD *)(a1 + 48);
                v17 = [URLCompletionMatchBookmarkData alloc];
                objc_msgSend(v24, "disambiguatedName");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = -[URLCompletionMatchBookmarkData initWithCloudTab:deviceName:](v17, "initWithCloudTab:deviceName:", v15, v18);
                (*(void (**)(uint64_t, URLCompletionMatchBookmarkData *))(v16 + 16))(v16, v19);

              }
            }
            v8 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v8);
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v22);
  }

}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_261(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(_QWORD);
  WebBookmark *v7;
  uint64_t v8;
  NSString *v9;
  WBSHistory *v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = a4;
  if ((SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions() & 1) != 0)
  {
    v6[2](v6);
    v7 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v8 = *(_QWORD *)(a1 + 56);
    matchDataWithBookmark(v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

  }
}

- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  URLCompletionMatchBookmarkData *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB98]), "initWithTitle:address:collectionType:", v8, v7, 0);
  v10 = -[URLCompletionMatchBookmarkData initWithBookmark:shouldPreload:]([URLCompletionMatchBookmarkData alloc], "initWithBookmark:shouldPreload:", v9, v5);

  return v10;
}

- (int)searchableCollectionsMask
{
  return self->_searchableCollectionsMask;
}

- (void)setSearchableCollectionsMask:(int)a3
{
  self->_searchableCollectionsMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
  objc_storeStrong((id *)&self->_bookmarksCache, 0);
  objc_storeStrong((id *)&self->_cloudTabsAccessQueue, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_cloudTabStore, 0);
}

- (void)enumerateMatchDataForTypedStringHint:(uint64_t)a3 filterResultsUsingProfileIdentifier:(uint64_t)a4 options:(uint64_t)a5 withBlock:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1D7CA3000, a2, a3, "User-typed string: %{private}@", a5, a6, a7, a8, 3u);
}

- (void)enumerateMatchDataForTypedStringHint:(os_log_t)log filterResultsUsingProfileIdentifier:options:withBlock:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Timeout while processing user-typed string", v1, 2u);
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_1D7CA3000, a2, a3, "User-typed string: %{private}@", a5, a6, a7, a8, 3u);
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1D7CA3000, a2, a3, "Error searching history: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_0();
}

@end
