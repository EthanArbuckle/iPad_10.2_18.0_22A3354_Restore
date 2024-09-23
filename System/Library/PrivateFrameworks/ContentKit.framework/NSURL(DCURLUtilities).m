@implementation NSURL(DCURLUtilities)

- (id)dc_queryDictionary
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dc_dictionaryFromQueryString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dc_fragmentQueryDictionary
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "fragment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v2 = 0;
    if (objc_msgSend(v1, "characterAtIndex:", 0) == 33)
    {
      v3 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v1, "substringFromIndex:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dc_dictionaryFromQueryString:", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)dc_matchesHost:()DCURLUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(CFSTR("www."), "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v7);

  }
  return v6;
}

+ (id)dc_queryItemsFromQueryString:()DCURLUtilities
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_13457);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dc_queryItemsFromQueryDictionary:()DCURLUtilities
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v9 = 0x24BDD1000uLL;
    do
    {
      v10 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10);
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", v11, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
            objc_msgSend(v4, "addObject:", v13);
            goto LABEL_13;
          }

          v14 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v8;
            v16 = v3;
            v17 = v5;
            v18 = v4;
            v19 = v9;
            v20 = (void *)MEMORY[0x24BDD1838];
            objc_msgSend(v14, "stringValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v20;
            v9 = v19;
            v4 = v18;
            v5 = v17;
            v3 = v16;
            v8 = v15;
            v7 = v24;
            objc_msgSend(v22, "queryItemWithName:value:", v11, v21);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_11;
          }
        }
        v13 = 0;
LABEL_13:

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)dc_dictionaryFromQueryString:()DCURLUtilities
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "dc_queryItemsFromQueryString:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "value");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (const __CFString *)v12;
        else
          v14 = &stru_24C4E3948;
        objc_msgSend(v11, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

+ (uint64_t)dc_queryStringWithQueryDictionary:()DCURLUtilities
{
  return objc_msgSend(a1, "dc_queryStringWithQueryDictionary:addingPercentEscapes:", a3, 1);
}

+ (id)dc_queryStringWithQueryDictionary:()DCURLUtilities addingPercentEscapes:
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "appendFormat:", CFSTR("&%@"), v10);
          goto LABEL_24;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v13, "removeCharactersInString:", CFSTR("?=&"));
          if ((a4 & 1) != 0)
          {
            objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = v10;
            v15 = v11;
          }
          v19 = v15;
          objc_msgSend(v5, "appendFormat:", CFSTR("&%@=%@"), v14, v15);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_24;
          objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v16, "mutableCopy");

          objc_msgSend(v13, "removeCharactersInString:", CFSTR("?=&"));
          v17 = v11;
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v18 = v17;
            else
              v18 = 0;
          }
          else
          {
            v18 = 0;
          }
          v14 = v18;

          if ((a4 & 1) != 0)
          {
            objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = v10;
          }
          v19 = v20;
          objc_msgSend(v14, "stringValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("&%@=%@"), v19, v21);

        }
LABEL_24:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "length") && objc_msgSend(v5, "characterAtIndex:", 0) == 38)
    objc_msgSend(v5, "deleteCharactersInRange:", 0, 1);
  v22 = (void *)objc_msgSend(v5, "copy");

  return v22;
}

@end
