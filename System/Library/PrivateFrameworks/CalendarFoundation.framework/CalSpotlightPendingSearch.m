@implementation CalSpotlightPendingSearch

+ (id)_queue
{
  if (_queue_onceToken != -1)
    dispatch_once(&_queue_onceToken, &__block_literal_global_30);
  return (id)_queue_queue;
}

void __35__CalSpotlightPendingSearch__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.calendar.foundation.spotlightquerycontroller.internalqueue", 0);
  v1 = (void *)_queue_queue;
  _queue_queue = (uint64_t)v0;

}

+ (id)_createSearchQueryWithPredicate:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)EKWeakLinkClass(CFSTR("MDSearchQuery"), 0xBuLL)), "initWithPredicate:options:", v6, v5);

  return v7;
}

- (CalSpotlightPendingSearch)initWithString:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CalSpotlightPendingSearch *v11;
  CalSpotlightPendingSearch *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CalSpotlightPendingSearch;
  v11 = -[CalSpotlightPendingSearch init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CalSpotlightPendingSearch setClientBundleID:](v11, "setClientBundleID:", v9);
    v13 = (void *)objc_opt_new();
    -[CalSpotlightPendingSearch setSearchableItemIdentifiers:](v12, "setSearchableItemIdentifiers:", v13);

    v14 = (void *)objc_opt_new();
    -[CalSpotlightPendingSearch setSearchableItems:](v12, "setSearchableItems:", v14);

    -[CalSpotlightPendingSearch setCompletionHandler:](v12, "setCompletionHandler:", v10);
    -[CalSpotlightPendingSearch searchWithString:](v12, "searchWithString:", v8);
  }

  return v12;
}

+ (id)_pendingSearches
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_pendingSearches_pendingSearches;
  if (!_pendingSearches_pendingSearches)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)_pendingSearches_pendingSearches;
    _pendingSearches_pendingSearches = (uint64_t)v3;

    v2 = (void *)_pendingSearches_pendingSearches;
  }
  return v2;
}

- (void)_startSearchWithQuery:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_pendingSearches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);

  -[CalSpotlightPendingSearch setQuery:](self, "setQuery:", v5);
  objc_msgSend(v5, "start");

}

- (void)_searchEnded
{
  id v3;

  -[CalSpotlightPendingSearch setQuery:](self, "setQuery:", 0);
  objc_msgSend((id)objc_opt_class(), "_pendingSearches");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

}

- (CalSpotlightPendingSearch)searchWithString:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  CalSpotlightPendingSearch *result;
  void *v10;
  _QWORD v11[4];
  id v12;
  CalSpotlightPendingSearch *v13;

  v5 = a3;
  -[CalSpotlightPendingSearch query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalSpotlightQueryController.m"), 110, CFSTR("searchWithString: called multiple times"));

  }
  objc_msgSend((id)objc_opt_class(), "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__CalSpotlightPendingSearch_searchWithString___block_invoke;
  v11[3] = &unk_1E2A83E68;
  v12 = v5;
  v13 = self;
  v8 = v5;
  dispatch_async(v7, v11);

  return result;
}

void __46__CalSpotlightPendingSearch_searchWithString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    EKWeakLinkStringConstant("MDSearchQueryOptionFetchAttributes", 0xBuLL);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v2;
    EKWeakLinkStringConstant("MDItemIdentifier", 0xBuLL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    EKWeakLinkStringConstant("MDItemTitle", 0xBuLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend((id)*MEMORY[0x1E0CEC478], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("kMDItemContentType == %@ && kMDItemTitle contains[cd] %@"), v8, *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_createSearchQueryWithPredicate:options:", v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClientBundleID:", v11);

    objc_msgSend(v10, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "_startSearchWithQuery:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, MEMORY[0x1E0C9AA60], 0);

  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CalSpotlightPendingSearch_cancel__block_invoke;
  block[3] = &unk_1E2A84760;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __35__CalSpotlightPendingSearch_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "query");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "_searchEnded");
  }
}

+ (id)_resultForSearchableItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = 0;
    if (v5 && v6)
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setIdentifier:", v5);
      objc_msgSend(v8, "setTitle:", v7);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_resultsForSearchableItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_resultForSearchableItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)searchQuery:(id)a3 didReturnItems:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke;
  block[3] = &unk_1E2A853B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke_cold_1(a1);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "attributeSet", (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(*(id *)(a1 + 32), "searchableItemIdentifiers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "containsObject:", v11);

            if ((v13 & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 32), "searchableItemIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addObject:", v11);

              objc_msgSend(*(id *)(a1 + 32), "searchableItems");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v9);

            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
}

- (void)searchQuery:(id)a3 statusChanged:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke;
  block[3] = &unk_1E2A853D8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke_cold_1(a1);

    if (*(_QWORD *)(a1 + 48) == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_searchEnded");
      v4 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "searchableItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_resultsForSearchableItems:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v7, 0);

    }
  }
}

- (void)searchQuery:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke;
  block[3] = &unk_1E2A853B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_searchEnded");
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke_cold_1(a1, v3);

    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 48));

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableOrderedSet)searchableItemIdentifiers
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchableItemIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableOrderedSet)searchableItems
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchableItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MDSearchQuery)query
{
  return (MDSearchQuery *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchableItems, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

void __56__CalSpotlightPendingSearch_searchQuery_didReturnItems___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_3_2(a1), "predicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_8(&dword_18FC12000, v2, v3, "Spotlight query %@ with predicate %@ did return items: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __55__CalSpotlightPendingSearch_searchQuery_statusChanged___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend((id)OUTLINED_FUNCTION_3_2(a1), "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8(&dword_18FC12000, v3, v4, "Spotlight query %@ with predicate %@ did change status: [%@]", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_9();
}

void __58__CalSpotlightPendingSearch_searchQuery_didFailWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[40];

  objc_msgSend((id)OUTLINED_FUNCTION_3_2(a1), "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Spotlight query %@ with predicate %@ failed with error: %@", v4, 0x20u);

  OUTLINED_FUNCTION_9();
}

@end
