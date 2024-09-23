@implementation SearchQueryBuilder

- (SearchQueryBuilder)initWithSearchEngineInfo:(id)a3 queryString:(id)a4
{
  id v7;
  id v8;
  SearchQueryBuilder *v9;
  SearchQueryBuilder *v10;
  SearchQueryBuilder *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SearchQueryBuilder;
  v9 = -[SearchQueryBuilder init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->queryString, a4);
    objc_storeStrong((id *)&v10->engineInfo, a3);
    v11 = v10;
  }

  return v10;
}

- (SearchQueryBuilder)initWithQueryString:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  SearchQueryBuilder *v10;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CD57A0];
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultSearchEngineForPrivateBrowsing:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SearchQueryBuilder initWithSearchEngineInfo:queryString:](self, "initWithSearchEngineInfo:queryString:", v9, v7);

  return v10;
}

- (SearchQueryBuilder)initWithXWebSearchURL:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SearchQueryBuilder *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "safari_isXWebSearchURL"))
  {
    objc_msgSend(v6, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByRemovingPercentEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "host");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v9, "engineInfoForScriptName:", v10);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariSharedDefaults");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = (_QWORD *)MEMORY[0x1E0D4F5C8];
        if (!v4)
          v16 = (_QWORD *)MEMORY[0x1E0D4F658];
        objc_msgSend(v14, "objectForKey:", *v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "engineInfoFor:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v17 = (void *)v12;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CD57A0], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "defaultSearchEngineForPrivateBrowsing:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      self = -[SearchQueryBuilder initWithSearchEngineInfo:queryString:](self, "initWithSearchEngineInfo:queryString:", v17, v8);

      v13 = self;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)searchQueryBuilderWithQuery:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SearchQueryBuilder *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[SearchQueryBuilder initWithQueryString:forPrivateBrowsing:]([SearchQueryBuilder alloc], "initWithQueryString:forPrivateBrowsing:", v5, v4);

  return v6;
}

+ (id)searchQueryBuilderWithXWebSearchURL:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SearchQueryBuilder *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[SearchQueryBuilder initWithXWebSearchURL:forPrivateBrowsing:]([SearchQueryBuilder alloc], "initWithXWebSearchURL:forPrivateBrowsing:", v5, v4);

  return v6;
}

- (id)searchURL
{
  return (id)-[_SFSearchEngineInfo searchURLForUserTypedString:](self->engineInfo, "searchURLForUserTypedString:", self->queryString);
}

- (id)queryString
{
  return self->queryString;
}

- (id)searchEngineInfo
{
  return self->engineInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->engineInfo, 0);
  objc_storeStrong((id *)&self->queryString, 0);
}

@end
