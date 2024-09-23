@implementation NSSExternalAnalyticsPaneldentifierProvider

- (NSSExternalAnalyticsPaneldentifierProvider)initWithHostNames:(id)a3
{
  id v4;
  NSSExternalAnalyticsPaneldentifierProvider *v5;
  uint64_t v6;
  NSArray *hostNames;
  uint64_t v8;
  NSString *panelIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSSExternalAnalyticsPaneldentifierProvider;
  v5 = -[NSSExternalAnalyticsPaneldentifierProvider init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hostNames = v5->_hostNames;
    v5->_hostNames = (NSArray *)v6;

    -[NSSExternalAnalyticsPaneldentifierProvider panelIdentifierWithHostNames:](v5, "panelIdentifierWithHostNames:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    panelIdentifier = v5->_panelIdentifier;
    v5->_panelIdentifier = (NSString *)v8;

  }
  return v5;
}

- (id)panelIdentifierWithHostNames:(id)a3
{
  id v3;
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD);
  CFDictionaryRef v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFDictionary *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __75__NSSExternalAnalyticsPaneldentifierProvider_panelIdentifierWithHostNames___block_invoke;
  v32[3] = &unk_1E9BDCD28;
  v4 = v3;
  v33 = v4;
  v5 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D8292448](v32);
  v6 = CFNetworkCopySystemProxySettings();
  -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("ProxyAutoConfigEnable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("ProxyAutoConfigURLString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
  }
  else
  {
    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("HTTPProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("HTTPPort"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length") && objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v9, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  if ((((uint64_t (**)(_QWORD, void *))v5)[2](v5, v10) & 1) != 0)
  {
    if (v10)
      goto LABEL_34;
  }
  else
  {

  }
  -[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("__SCOPED__"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (!v14)
  {
    v10 = 0;
    goto LABEL_33;
  }
  v15 = v14;
  v26 = v6;
  v27 = v4;
  v16 = *(_QWORD *)v29;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      if (objc_msgSend(v18, "hasPrefix:", CFSTR("pdp")))
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HTTPProxy"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("HTTPPort"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "length")
          && objc_msgSend(v23, "length")
          && (((uint64_t (**)(_QWORD, void *))v5)[2](v5, v20) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v20, v23);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }

      }
      else
      {
        if (!objc_msgSend(v18, "hasPrefix:", CFSTR("en")))
          continue;
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ProxyAutoConfigURLString"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (((uint64_t (**)(_QWORD, void *))v5)[2](v5, v20))
        {
          v10 = (void *)objc_msgSend(v20, "copy");
LABEL_31:

          goto LABEL_32;
        }
      }

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v15)
      continue;
    break;
  }
  v10 = 0;
LABEL_32:
  v6 = v26;
  v4 = v27;
LABEL_33:

LABEL_34:
  return v10;
}

uint64_t __75__NSSExternalAnalyticsPaneldentifierProvider_panelIdentifierWithHostNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (NSString)panelIdentifier
{
  return self->_panelIdentifier;
}

- (NSArray)hostNames
{
  return self->_hostNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostNames, 0);
  objc_storeStrong((id *)&self->_panelIdentifier, 0);
}

@end
