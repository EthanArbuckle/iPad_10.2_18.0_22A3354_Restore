@implementation DAEASOAuthClient

+ (id)clientIDForOAuthType:(unint64_t)a3
{
  int v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (a3 != 1)
      return 0;
    v3 = objc_msgSend(CFSTR("g8e99a:6.0:9:-53g5.8bf4-79:72c8bc433"), "length");
    MEMORY[0x24BDAC7A8]();
    v5 = (char *)v14 - v4;
    v6 = objc_msgSend(CFSTR("g8e99a:6.0:9:-53g5.8bf4-79:72c8bc433"), "UTF8String");
    if (v3 >= 1)
    {
      v7 = 0;
      v8 = v3;
      do
      {
        v5[v7] = *(_BYTE *)(v6 + v7) - ((v7 + 1) & 1);
        ++v7;
      }
      while (v3 != v7);
      goto LABEL_13;
    }
  }
  else
  {
    v9 = objc_msgSend(CFSTR("91:ef870.a438-57cd.99ce-3b3543e71d71"), "length");
    MEMORY[0x24BDAC7A8]();
    v5 = (char *)v14 - v10;
    v11 = objc_msgSend(CFSTR("91:ef870.a438-57cd.99ce-3b3543e71d71"), "UTF8String");
    if (v9 >= 1)
    {
      v12 = 0;
      v8 = v9;
      do
      {
        v5[v12] = *(_BYTE *)(v11 + v12) - ((v12 + 1) & 1);
        ++v12;
      }
      while (v9 != v12);
      goto LABEL_13;
    }
  }
  v8 = 0;
LABEL_13:
  v5[v8] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultScopeWithDomainForOAuthType:(unint64_t)a3
{
  if (a3 == 1)
    return &unk_24E374CC0;
  else
    return 0;
}

+ (id)_defaultScopeWithoutDomainForOAuthType:(unint64_t)a3 forToken:(BOOL)a4
{
  void *v4;
  void *v6;

  if (a3)
  {
    if (a3 == 2)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", &unk_24E374D08);
      v4 = v6;
      if (!a4)
        objc_msgSend(v6, "addObjectsFromArray:", &unk_24E374D20);
    }
    else if (a3 == 1)
    {
      v4 = &unk_24E374CD8;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = &unk_24E374CF0;
  }
  return v4;
}

+ (id)defaultScopeForOAuthType:(unint64_t)a3 withResourceIdentifier:(id)a4 isOnPrem:(BOOL)a5
{
  return (id)objc_msgSend(a1, "defaultScopeForOAuthType:withResourceIdentifier:forToken:isOnPrem:", a3, a4, 1, a5);
}

+ (id)defaultScopeForOAuthType:(unint64_t)a3 withResourceIdentifier:(id)a4 forToken:(BOOL)a5 isOnPrem:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "_defaultScopeWithoutDomainForOAuthType:forToken:", a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  if (a6)
  {
    objc_msgSend(a1, "_defaultScopeWithDomainForOAuthType:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

  }
  else if (v10)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10);
    v15 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v14, "scheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScheme:", v16);

    v28 = v14;
    objc_msgSend(v14, "host");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHost:", v17);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(a1, "_defaultScopeWithDomainForOAuthType:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v22);
          objc_msgSend(v15, "URL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "URLByAppendingPathComponent:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v26);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v20);
    }

  }
  return v11;
}

+ (id)clientRedirectForOAuthType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (a3 == 1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@"), v5, CFSTR("oauth-redirect"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("urn:ietf:wg:oauth:2.0:oob");
  }
  return v6;
}

+ (id)clientRedirect
{
  return CFSTR("urn:ietf:wg:oauth:2.0:oob");
}

+ (id)scopeForUpgradingFromBasicCreds
{
  return &unk_24E374D38;
}

@end
