@implementation WFCoercionOptions

- (WFCoercionOptions)initWithDictionary:(id)a3
{
  id v5;
  WFCoercionOptions *v6;
  uint64_t v7;
  NSDictionary *dictionary;
  WFCoercionOptions *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoercionOptions.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFCoercionOptions;
  v6 = -[WFCoercionOptions init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (WFCoercionOptions)init
{
  return -[WFCoercionOptions initWithDictionary:](self, "initWithDictionary:", MEMORY[0x24BDBD1B8]);
}

- (id)optionsByAddingContentsOfOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFCoercionOptions dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v7);
  +[WFCoercionOptions optionsWithDictionary:](WFCoercionOptions, "optionsWithDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (id)new
{
  if (new_onceToken != -1)
    dispatch_once(&new_onceToken, &__block_literal_global_1260);
  return (id)new_options;
}

+ (id)optionsWithDictionary:(id)a3
{
  id v3;
  WFCoercionOptions *v4;

  v3 = a3;
  v4 = -[WFCoercionOptions initWithDictionary:]([WFCoercionOptions alloc], "initWithDictionary:", v3);

  return v4;
}

void __24__WFCoercionOptions_new__block_invoke()
{
  WFCoercionOptions *v0;
  void *v1;

  v0 = objc_alloc_init(WFCoercionOptions);
  v1 = (void *)new_options;
  new_options = (uint64_t)v0;

}

- (BOOL)coercionPathIsDisallowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFCoercionOptions dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFCoercionOptionIgnoreDefaultDisallowedCoercionPaths"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (id)_defaultDisallowedCoercionPaths;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        if ((WFCoercionPathContainsPath(v4, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12)) & 1) != 0)
          goto LABEL_20;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "objectForKey:", CFSTR("WFCoercionOptionDisallowedCoercionPaths"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
LABEL_13:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v14)
        objc_enumerationMutation(v8);
      if ((WFCoercionPathContainsPath(v4, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15)) & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v13)
          goto LABEL_13;
        goto LABEL_21;
      }
    }
LABEL_20:
    LOBYTE(v13) = 1;
  }
LABEL_21:

  return v13;
}

+ (void)registerDefaultDisallowedCoercionPath:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = registerDefaultDisallowedCoercionPath__onceToken;
  v4 = a3;
  v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&registerDefaultDisallowedCoercionPath__onceToken, &__block_literal_global_4156);
    v5 = v6;
  }
  objc_msgSend((id)_defaultDisallowedCoercionPaths, "addObject:", v5);

}

void __84__WFCoercionOptions_DisallowedCoercionPaths__registerDefaultDisallowedCoercionPath___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_defaultDisallowedCoercionPaths;
  _defaultDisallowedCoercionPaths = v0;

}

- (id)itemClassPrioritizationType
{
  void *v2;
  void *v3;

  -[WFCoercionOptions dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFCoercionOptionItemClassPrioritizationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredTypes
{
  void *v2;
  void *v3;

  -[WFCoercionOptions dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFCoercionOptionPreferredTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFContentPermissionRequestor)permissionRequestor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFCoercionOptions dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PermissionRequestor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  return (WFContentPermissionRequestor *)v6;
}

- (BOOL)shouldContinueLoadingWebContentIfExternalResourcesAreDenied
{
  void *v2;
  void *v3;
  char v4;

  -[WFCoercionOptions dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ContinueLoadingWebContentIfExternalResourcesAreDenied"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
