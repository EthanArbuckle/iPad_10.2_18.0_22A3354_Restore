@implementation NSURL(CNFRegAdditions)

- (id)CNFQueryDictionary
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("&"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v18 = 0;
          v19 = 0;
          v11 = _parseKeyValuePair(v10, &v19, &v18);
          v12 = v19;
          v13 = v18;
          v14 = v13;
          if (v11)
            v15 = v13 == 0;
          else
            v15 = 1;
          if (!v15 && v12 != 0)
            objc_msgSend(v2, "setObject:forKey:", v13, v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

  }
  return v2;
}

- (id)URLByAppendingCNFQueryDictionary:()CNFRegAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_7;
  objc_msgSend(a1, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  v10 = v8;
  if (v7)
  {
    v11 = objc_msgSend(v8, "rangeOfString:", CFSTR("?"));
    v10 = v9;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "substringToIndex:", v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(a1, "CNFQueryDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "addEntriesFromDictionary:", v5);
  _queryStringFromCNFQueryDictionary(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@?%@"), v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
LABEL_7:
    v16 = a1;

  return v16;
}

@end
