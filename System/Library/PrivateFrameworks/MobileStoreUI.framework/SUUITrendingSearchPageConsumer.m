@implementation SUUITrendingSearchPageConsumer

- (id)_pageWithDictionary:(id)a3
{
  id v3;
  SUUITrendingSearchPage *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  unint64_t v21;
  const __CFString *v22;
  SUUITrendingSearch *v23;
  void *v25;
  void *v26;
  id v27;
  SUUITrendingSearchPage *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(SUUITrendingSearchPage);
  objc_msgSend(v3, "objectForKey:", CFSTR("header"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x24BDBC000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUUITrendingSearchPage setTitle:](v4, "setTitle:", v7);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("trendingSearches"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v5;
    v27 = v3;
    v28 = v4;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v9;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      v14 = CFSTR("label");
      v15 = CFSTR("url");
      v29 = v10;
LABEL_8:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        if ((unint64_t)objc_msgSend(v8, "count") > 9)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "objectForKey:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = v15;
              v21 = v6;
              v22 = v14;
              v23 = objc_alloc_init(SUUITrendingSearch);
              -[SUUITrendingSearch setTerm:](v23, "setTerm:", v18);
              -[SUUITrendingSearch setURLString:](v23, "setURLString:", v19);
              objc_msgSend(v8, "addObject:", v23);

              v14 = v22;
              v6 = v21;
              v15 = v20;
              v10 = v29;
            }
          }

        }
        if (v12 == ++v16)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v12)
            goto LABEL_8;
          break;
        }
      }
    }

    v3 = v27;
    v4 = v28;
    v9 = v25;
    v5 = v26;
  }
  -[SUUITrendingSearchPage setSearches:](v4, "setSearches:", v8);

  return v4;
}

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  objc_opt_class();
  v9 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUITrendingSearchPageConsumer _pageWithDictionary:](self, "_pageWithDictionary:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && !v9)
    *a5 = objc_retainAutorelease(v8);

  return v9;
}

@end
