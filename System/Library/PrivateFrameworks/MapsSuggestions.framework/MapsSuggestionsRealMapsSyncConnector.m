@implementation MapsSuggestionsRealMapsSyncConnector

- (MapsSuggestionsRealMapsSyncConnector)init
{
  MapsSuggestionsRealMapsSyncConnector *v2;
  uint64_t v3;
  NSArray *storeSubscriptionTypes;
  void *v5;
  objc_super v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsRealMapsSyncConnector;
  v2 = -[MapsSuggestionsRealMapsSyncConnector init](&v7, sel_init);
  if (v2)
  {
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    v8[2] = objc_opt_class();
    v8[3] = objc_opt_class();
    v8[4] = objc_opt_class();
    v8[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
    v3 = objc_claimAutoreleasedReturnValue();
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v3;

    objc_msgSend(MEMORY[0x1E0D473D8], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscribe:", v2);

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MapsSuggestionsMapsSyncConnectorDelegate)delegate
{
  return (MapsSuggestionsMapsSyncConnectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)MapsSyncReviewedPlace_fetchWithMuids:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D473D0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithOffset:limit:", 0, 1);
  v6 = (void *)MEMORY[0x1E0D473F0];
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryPredicateWithFormat:argumentArray:", CFSTR("muid IN %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473E8]), "initWithPredicate:sortDescriptors:range:", v8, 0, v5);
  v10 = objc_alloc_init(MEMORY[0x1E0D473B8]);
  v14 = 0;
  objc_msgSend(v10, "fetchSyncWithOptions:error:", v9, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)saveNewReviewedPlaceWithMuid:(unint64_t)a3 lastSuggestedReviewDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0D473B0];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  v8 = objc_alloc_init(MEMORY[0x1E0D47348]);
  objc_msgSend(v7, "setAnonymousCredential:", v8);

  objc_msgSend(v7, "setMuid:", a3);
  objc_msgSend(v7, "setLastSuggestedReviewDate:", v6);

  if (v7)
    v9 = v7;

  return v7;
}

- (BOOL)allContentOfType:(int64_t)a3 handler:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD v21[4];
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    switch(a3)
    {
      case 0:
        GEOFindOrCreateLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136446978;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealMapsSyncConnector.m";
        v26 = 1024;
        v27 = 115;
        v28 = 2082;
        v29 = "-[MapsSuggestionsRealMapsSyncConnector allContentOfType:handler:]";
        v30 = 2082;
        v31 = "YES";
        v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. MapsSuggestionsMapsSyncTypeUnknown does not make sense";
        goto LABEL_15;
      case 1:
        v8 = objc_alloc_init(MEMORY[0x1E0D47390]);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke;
        v21[3] = &unk_1E4BCDE70;
        v22 = v5;
        objc_msgSend(v8, "fetchWithCompletionHandler:", v21);

        v9 = 1;
        v6 = v22;
        break;
      case 2:
        v10 = objc_alloc_init(MEMORY[0x1E0D47360]);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_2;
        v19[3] = &unk_1E4BCDE70;
        v20 = v5;
        objc_msgSend(v10, "fetchWithCompletionHandler:", v19);

        v9 = 1;
        v6 = v20;
        break;
      case 3:
        if (qword_1ED22F668 != -1)
          dispatch_once(&qword_1ED22F668, &__block_literal_global_43);
        if (_MergedGlobals_54)
        {
          objc_msgSend(MEMORY[0x1E0D473F0], "mapsFavoritesPredicateWithHidden:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("positionIndex"), 1);
          v13 = objc_alloc(MEMORY[0x1E0D473E8]);
          v23 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v13, "initWithPredicate:sortDescriptors:range:", v11, v14, 0);

        }
        else
        {
          v6 = 0;
        }
        v16 = objc_alloc_init(MEMORY[0x1E0D47370]);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_3;
        v17[3] = &unk_1E4BCDE70;
        v18 = v5;
        objc_msgSend(v16, "fetchWithOptions:completionHandler:", v6, v17);

        v9 = 1;
        break;
      default:
        GEOFindOrCreateLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 136446978;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealMapsSyncConnector.m";
        v26 = 1024;
        v27 = 118;
        v28 = 2082;
        v29 = "-[MapsSuggestionsRealMapsSyncConnector allContentOfType:handler:]";
        v30 = 2082;
        v31 = "YES";
        v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Missing a MapsSuggestionsMapsSyncType in allContentOfType:";
        goto LABEL_15;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealMapsSyncConnector.m";
      v26 = 1024;
      v27 = 83;
      v28 = 2082;
      v29 = "-[MapsSuggestionsRealMapsSyncConnector allContentOfType:handler:]";
      v30 = 2082;
      v31 = "nil == (handler)";
      v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_15:
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, v7, buf, 0x26u);
    }
LABEL_16:
    v9 = 0;
  }

  return v9;
}

void __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v4 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

void __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v4 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

void __65__MapsSuggestionsRealMapsSyncConnector_allContentOfType_handler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v4 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

  }
}

- (void)deleteObjects:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D473D8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteWithObjects:completionHandler:", v7, v6);

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (void)storeDidChangeWithTypes:(id)a3
{
  char *v4;
  NSObject *v5;
  MapsSuggestionsMapsSyncConnectorDelegate **p_delegate;
  id WeakRetained;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  GEOFindOrCreateLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_DEBUG, "queryContentsDidChangeWithTypes: %@", buf, 0xCu);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    if (v8)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = v4;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (!v10)
        goto LABEL_23;
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v14, "containsString:", CFSTR("History"), (_QWORD)v16) & 1) != 0)
          {
            v15 = 1;
          }
          else if ((objc_msgSend(v14, "containsString:", CFSTR("Collection")) & 1) != 0)
          {
            v15 = 2;
          }
          else
          {
            if (!objc_msgSend(v14, "containsString:", CFSTR("Favorite")))
              continue;
            v15 = 3;
          }
          objc_msgSend(v8, "mapsSyncDidChangeForType:", v15);
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (!v11)
          goto LABEL_23;
      }
    }
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v22 = "MapsSuggestionsRealMapsSyncConnector.m";
      v23 = 1026;
      v24 = 136;
      v25 = 2082;
      v26 = "-[MapsSuggestionsRealMapsSyncConnector storeDidChangeWithTypes:]";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: delegate went away in %{public}s", buf, 0x1Cu);
    }

LABEL_23:
  }

}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
