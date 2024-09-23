@implementation SUUIURL

- (SUUIURL)initWithURL:(id)a3
{
  id v4;
  SUUIURL *v5;
  void *v6;
  uint64_t v7;
  void *url;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSURL *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIURL;
  v5 = -[SUUIURL init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("https")))
    {
      v7 = objc_msgSend(v4, "copy");
      url = v5->_url;
      v5->_url = (NSURL *)v7;
    }
    else
    {
      v9 = objc_msgSend(v6, "length");
      objc_msgSend(v4, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", 0, v9, CFSTR("https"));
      url = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", url);
      v12 = v5->_url;
      v5->_url = (NSURL *)v11;

    }
  }

  return v5;
}

- (SUUIURL)initWithURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  id v8;
  id v9;
  SUUIURL *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = -[SUUIURL initWithURL:](self, "initWithURL:", a3);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)SUUIMobileCoreServicesFramework();
      v12 = *(id *)SUUIWeakLinkedSymbolForString("LSReferrerURLKey", v11);
      if (v12)
      {
        objc_msgSend(v9, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SUUIURL setReferrerURLString:](v10, "setReferrerURLString:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "absoluteString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUIURL setReferrerURLString:](v10, "setReferrerURLString:", v14);

        }
      }

    }
    -[SUUIURL setReferrerApplicationName:](v10, "setReferrerApplicationName:", v8);
  }

  return v10;
}

- (SUUIURL)initWithURLBagKey:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIURL *v11;

  v4 = (objc_class *)MEMORY[0x24BDD1808];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setScheme:", CFSTR("https"));
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("action"), CFSTR("bagurl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("bagkey"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v9);
  objc_msgSend(v6, "setQueryItems:", v7);
  objc_msgSend(v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUUIURL initWithURL:](self, "initWithURL:", v10);

  return v11;
}

- (NSString)actionString
{
  __CFString *v3;
  void *v4;

  -[SUUIURL valueForQueryParameter:](self, "valueForQueryParameter:", CFSTR("action"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[NSURL absoluteString](self->_url, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "rangeOfString:", CFSTR("MZSearch.woa")) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "rangeOfString:", CFSTR("/search?")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v4, "rangeOfString:", CFSTR("freeProductCodeWizard")) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "rangeOfString:", CFSTR("redeemLandingPage")) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v4, "rangeOfString:", CFSTR("showDialogForRedeem")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v4, "rangeOfString:", CFSTR("buyLandingPage")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(v4, "rangeOfString:", CFSTR("buyCharityGiftWizard")) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(v4, "rangeOfString:", CFSTR("MZFinance.woa")) == 0x7FFFFFFFFFFFFFFFLL
              && objc_msgSend(v4, "rangeOfString:", CFSTR("finance-app")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(v4, "rangeOfString:", CFSTR("viewEula")) == 0x7FFFFFFFFFFFFFFFLL)
                v3 = 0;
              else
                v3 = CFSTR("eula");
            }
            else if (objc_msgSend(v4, "rangeOfString:", CFSTR("getPass")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v3 = CFSTR("account");
            }
            else
            {
              v3 = CFSTR("addpassbookpass");
            }
          }
          else
          {
            v3 = CFSTR("donate");
          }
        }
        else
        {
          v3 = CFSTR("gift");
        }
      }
      else
      {
        v3 = CFSTR("redeem");
      }
    }
    else
    {
      v3 = CFSTR("search");
    }

  }
  return (NSString *)v3;
}

- (id)newURLRequest
{
  return -[SUUIURL newURLRequestWithBaseURL:](self, "newURLRequestWithBaseURL:", self->_url);
}

- (id)newURLRequestWithBaseURL:(id)a3
{
  NSURL *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  SUUIURL *v25;
  id v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = (NSURL *)a3;
  v5 = objc_alloc_init(MEMORY[0x24BDB7458]);
  -[SUUIURL _queryDictionary](self, "_queryDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("serialNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v7, CFSTR("x-apple-serial-number"));
  -[NSURL host](v4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7 || self->_url != v4)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v6, "objectForKey:", CFSTR("action"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("search"));

      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__3;
      v33 = __Block_byref_object_dispose__3;
      v34 = 0;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("action"), CFSTR("bagKey"), CFSTR("x-apple-serial-number"), 0);
      v13 = v12;
      if (v11)
        objc_msgSend(v12, "addObject:", CFSTR("libraryid"));
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __36__SUUIURL_newURLRequestWithBaseURL___block_invoke;
      v23[3] = &unk_2511F5060;
      v28 = v11;
      v27 = &v29;
      v14 = v13;
      v24 = v14;
      v25 = self;
      v15 = v9;
      v26 = v15;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v23);
      if (v30[5])
      {
        -[SUUIURL _searchGroupForSearchKind:](self, "_searchGroupForSearchKind:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("group"));

      }
      v17 = (void *)-[NSURL copyQueryStringDictionaryWithUnescapedValues:](v4, "copyQueryStringDictionaryWithUnescapedValues:", 1);
      if (v17)
        objc_msgSend(v15, "addEntriesFromDictionary:", v17);
      if (v11)
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("string"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("term"));
          objc_msgSend(v15, "removeObjectForKey:", CFSTR("string"));
        }

      }
      -[NSURL urlBySettingQueryStringDictionary:](v4, "urlBySettingQueryStringDictionary:", v15);
      v19 = objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v29, 8);
      v4 = (NSURL *)v19;
    }
    objc_msgSend(v5, "setURL:", v4);
  }
  -[SUUIURL referrerApplicationName](self, "referrerApplicationName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v20, CFSTR("ref-user-agent"));
  -[SUUIURL referrerURLString](self, "referrerURLString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v21, CFSTR("referer"));

  return v5;
}

void __36__SUUIURL_newURLRequestWithBaseURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 64)
    && ((objc_msgSend(v7, "isEqualToString:", CFSTR("kind")) & 1) != 0
     || objc_msgSend(v7, "isEqualToString:", CFSTR("entity"))))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_decodedQueryParameter:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v6, v7);
    v5 = (id)v6;
  }

}

- (NSDictionary)queryStringDictionary
{
  void *v2;
  void *v3;

  -[SUUIURL _queryDictionary](self, "_queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSString)redeemCode
{
  void *v2;
  void *v3;

  -[SUUIURL _queryDictionary](self, "_queryDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("certId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v3;
}

- (NSString)searchTerm
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[SUUIURL _queryDictionary](self, "_queryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __21__SUUIURL_searchTerm__block_invoke;
  v8[3] = &unk_2511F5088;
  v8[4] = &v9;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  -[SUUIURL _decodedQueryParameter:](self, "_decodedQueryParameter:", v10[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v10[5];
  v10[5] = v4;

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

void __21__SUUIURL_searchTerm__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("term")))
  {
    v8 = objc_msgSend(v7, "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }
  else if (objc_msgSend(v14, "rangeOfString:options:", CFSTR("term"), 13) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend(v14, "isEqualToString:", CFSTR("string")))
  {
    v11 = objc_msgSend(v7, "copy");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (NSString)URLBagKey
{
  void *v3;
  __CFString *v4;
  void *v5;

  -[SUUIURL _queryDictionary](self, "_queryDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("bagkey"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SUUIURL actionString](self, "actionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("library-link");
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("library-link")) & 1) == 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("search")))
      {
        -[SUUIURL _searchURLBagKey](self, "_searchURLBagKey");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = CFSTR("newsstand");
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("newsstand")) & 1) == 0)
        {
          v4 = CFSTR("passbook");
          if ((objc_msgSend(v5, "isEqualToString:", CFSTR("passbook")) & 1) == 0)
          {
            v4 = CFSTR("ringtones");
            if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ringtones")) & 1) == 0)
            {
              if (objc_msgSend(v5, "isEqualToString:", CFSTR("accessory-lookup")))
                v4 = CFSTR("p2-accessory-room");
              else
                v4 = 0;
            }
          }
        }
      }
    }

  }
  return (NSString *)v4;
}

- (id)valueForQueryParameter:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUUIURL _queryDictionary](self, "_queryDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_queryDictionary
{
  NSMutableDictionary *queryDictionary;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    -[NSURL query](self->_url, "query");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = self->_queryDictionary;
    self->_queryDictionary = v6;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "componentsSeparatedByString:", CFSTR("="), (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count") == 2)
          {
            v14 = self->_queryDictionary;
            objc_msgSend(v13, "objectAtIndex:", 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectAtIndex:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v16);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    queryDictionary = self->_queryDictionary;
  }
  return queryDictionary;
}

- (id)_decodedQueryParameter:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByRemovingPercentEncoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_searchGroupForSearchKind:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("epubBook")) & 1) != 0
    || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("metaEbook")) & 1) != 0
    || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("ibook")) & 1) != 0
    || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("ibookTextbook")) & 1) != 0)
  {
    v4 = CFSTR("ebook");
  }
  else if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("book")) & 1) != 0)
  {
    v4 = CFSTR("audiobook");
  }
  else if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("iMix")) & 1) != 0
         || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("itunesMix")) & 1) != 0
         || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("mix")) & 1) != 0
         || (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("preorderAlbum")) & 1) != 0)
  {
    v4 = CFSTR("album");
  }
  else if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("shortFilm")) & 1) != 0)
  {
    v4 = CFSTR("movie");
  }
  else if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("tvEpisode")) & 1) != 0)
  {
    v4 = CFSTR("tvSeason");
  }
  else if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("tone")) & 1) != 0)
  {
    v4 = CFSTR("ringtone");
  }
  else if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("course")) & 1) != 0)
  {
    v4 = CFSTR("iTunesUCourse");
  }
  else
  {
    v4 = v3;
    if (!-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("any-audio")))
      goto LABEL_7;
    v4 = 0;
  }

LABEL_7:
  return v4;
}

- (id)_searchURLBagKey
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSURL host](self->_url, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.AppStore")))
    {
      -[SUUIURL _appStoreSearchURLBagKey](self, "_appStoreSearchURLBagKey");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.MobileStore")) & 1) != 0)
    {
      v5 = CFSTR("p2-music-search");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0)
    {
      v5 = CFSTR("p2-book-search");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.podcasts")) & 1) != 0)
    {
      v5 = CFSTR("p2-podcasts-search");
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.itunesu")) & 1) != 0)
    {
      v5 = CFSTR("p2-itunesu-search");
    }
    else
    {
      -[SUUIURL _queryDictionary](self, "_queryDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("kind"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      switch(SUUIItemKindForString((uint64_t)v9))
      {
        case 1:
        case 3:
        case 6:
        case 7:
        case 8:
        case 11:
        case 13:
        case 14:
        case 15:
        case 16:
          v5 = CFSTR("p2-music-search");
          break;
        case 2:
          v5 = CFSTR("p2-book-search");
          break;
        case 4:
          v5 = CFSTR("p2-itunesu-search");
          break;
        case 5:
        case 12:
        case 17:
          -[SUUIURL _appStoreSearchURLBagKey](self, "_appStoreSearchURLBagKey");
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case 9:
        case 10:
          v5 = CFSTR("p2-podcasts-search");
          break;
        default:
          v5 = 0;
          break;
      }

    }
  }
  return v5;
}

- (id)_appStoreSearchURLBagKey
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("AppStoreSearchKeyOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = CFSTR("p2-panda-search");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_queryDictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_referrerApplicationName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_referrerURLString, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIURL;
  -[SUUIURL description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [Referrer: %@, %@]"), v4, self->_url, self->_referrerApplicationName, self->_referrerURLString);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SUUIURL underlyingURL](self, "underlyingURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SUUIURL underlyingURL](self, "underlyingURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)referrerApplicationName
{
  return self->_referrerApplicationName;
}

- (void)setReferrerApplicationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)referrerURLString
{
  return self->_referrerURLString;
}

- (void)setReferrerURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)underlyingURL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_referrerURLString, 0);
  objc_storeStrong((id *)&self->_referrerApplicationName, 0);
  objc_storeStrong((id *)&self->_queryDictionary, 0);
}

@end
