@implementation AMSDialogRequest(AMSUIWeb)

- (id)generateWebExport
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "buttonActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "_resultFromDialogAction:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("actions"));
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a1, "textFields", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(a1, "_resultFromDialogTextField:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v13);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("textFields"));
  objc_msgSend(a1, "appearanceInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("appearanceInfo"));

  objc_msgSend(a1, "defaultAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_resultFromDialogAction:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("defaultAction"));

  objc_msgSend(a1, "iconURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("iconURL"));

  objc_msgSend(a1, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("identifier"));

  objc_msgSend(a1, "message");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("message"));

  objc_msgSend(a1, "metricsEvent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "underlyingDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("metrics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "style"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("style"));

  objc_msgSend(a1, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("title"));

  objc_msgSend(a1, "userInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("userInfo"));

  return v2;
}

- (id)_resultFromDialogAction:()AMSUIWeb
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "deepLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deepLink"));

    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));

    objc_msgSend(v3, "metricsEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "underlyingDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("metrics"));

    objc_msgSend(v3, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v37[0] = CFSTR("url");
      objc_msgSend(v3, "request");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "URL");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "absoluteString");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = &stru_24CB5A078;
      if (v11)
        v13 = (const __CFString *)v11;
      v38[0] = v13;
      v37[1] = CFSTR("headers");
      objc_msgSend(v3, "request");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "allHTTPHeaderFields");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = MEMORY[0x24BDBD1B8];
      if (v14)
        v16 = v14;
      v38[1] = v16;
      v37[2] = CFSTR("body");
      objc_msgSend(v3, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "HTTPBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v3, "request");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "HTTPBody");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "initWithData:encoding:");
      }
      else
      {
        v19 = 0;
      }
      v38[2] = v19;
      v37[3] = CFSTR("method");
      objc_msgSend(v3, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "HTTPMethod");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = CFSTR("GET");
      if (v21)
        v23 = (const __CFString *)v21;
      v38[3] = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("request"));

      if (v17)
      {

      }
    }
    else
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("request"));
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "style"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("style"));

    objc_msgSend(v3, "title");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("title"));

    objc_msgSend(v3, "iconURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "absoluteString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("iconURL"));

    objc_msgSend(v3, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("userInfo"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_resultFromDialogTextField:()AMSUIWeb
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDBCED8];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "keyboardType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("keyboardType"));

    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("text"));

    objc_msgSend(v4, "placeholder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("placeholder"));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
