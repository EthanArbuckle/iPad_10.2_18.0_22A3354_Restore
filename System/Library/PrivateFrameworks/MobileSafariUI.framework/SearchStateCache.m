@implementation SearchStateCache

- (SearchStateCache)init
{
  SearchStateCache *v2;
  uint64_t v3;
  NSMapTable *cache;
  SearchStateCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchStateCache;
  v2 = -[SearchStateCache init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMapTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)cacheAcceptanceOfCompletionItem:(id)a3 withCompletionList:(id)a4 forTabDocument:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v25, "originalURLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v25;
      objc_msgSend(v12, "url");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "domainName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("web_answer"));
LABEL_12:
      v19 = 0;
      goto LABEL_13;
    }
    v10 = 0;
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v11 = v25;
  if (objc_msgSend(v11, "goesToURL"))
  {
    objc_msgSend(v11, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchQueryBuilder searchQueryBuilderWithQuery:forPrivateBrowsing:](SearchQueryBuilder, "searchQueryBuilderWithQuery:forPrivateBrowsing:", v16, objc_msgSend(v9, "isPrivateBrowsingEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "searchURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = 0;
  v19 = 1;
LABEL_13:
  if (objc_msgSend(v10, "length") || (_DWORD)v15)
  {
    objc_msgSend(v8, "cacheCurrentCompletionsAfterAcceptanceOfCompletionItem:", v25);
    -[SearchStateCache _cacheQueryForTabDocument:](self, "_cacheQueryForTabDocument:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCompletionList:", v8);
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "host");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safari_domainFromHost");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDestinationTLD:", v23);

    }
    else
    {
      objc_msgSend(v20, "setDestinationTLD:", 0);
    }
    objc_msgSend(v20, "setDidOriginateFromSearchSuggestion:", v19);
    objc_msgSend(v20, "setDidOriginateFromMultipartWebAnswer:", v15);
    if (objc_msgSend(v8, "hasParsecResults"))
    {
      objc_msgSend(v8, "query");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setParsecQueryID:", objc_msgSend(v24, "queryID"));

    }
    else
    {
      objc_msgSend(v20, "setParsecQueryID:", 0);
    }

  }
}

- (id)_cacheQueryForTabDocument:(id)a3
{
  id v4;
  SearchStateItem *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SearchStateItem);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchStateItem setCacheDate:](v5, "setCacheDate:", v6);

  -[NSMapTable setObject:forKey:](self->_cache, "setObject:forKey:", v5, v4);
  return v5;
}

- (void)cacheSearchQueryID:(int64_t)a3 forTab:(id)a4
{
  id v5;

  -[SearchStateCache _cacheQueryForTabDocument:](self, "_cacheQueryForTabDocument:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParsecQueryID:", a3);
  objc_msgSend(v5, "setDidOriginateFromSearchSuggestion:", 1);

}

- (void)removeCachedSearchStateForTabDocument:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_cache, "removeObjectForKey:", a3);
}

- (void)clearParsecQueryOriginatingFromSearchSuggestionInTabDocument:(id)a3
{
  void *v3;
  id v4;

  -[NSMapTable objectForKey:](self->_cache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setDidOriginateFromSearchSuggestion:", 0);
    objc_msgSend(v4, "setParsecQueryID:", 0);
    v3 = v4;
  }

}

- (int64_t)idOfParsecQueryOriginatingFromSearchSuggestionInTabDocument:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMapTable objectForKey:](self->_cache, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "didOriginateFromSearchSuggestion"))
    v5 = objc_msgSend(v4, "parsecQueryID");
  else
    v5 = 0;

  return v5;
}

- (id)cachedCompletionListForTabDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_domainFromHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cacheDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceNow");
  if (v10 <= -480.0)
  {

    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "didOriginateFromMultipartWebAnswer"))
  {
    objc_msgSend(v5, "destinationTLD");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "safari_isCaseInsensitiveEqualToString:", v11);

    if (v12)
      goto LABEL_6;
LABEL_7:
    -[SearchStateCache removeCachedSearchStateForTabDocument:](self, "removeCachedSearchStateForTabDocument:", v4);
    v13 = 0;
    goto LABEL_8;
  }

LABEL_6:
  objc_msgSend(v5, "completionList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
