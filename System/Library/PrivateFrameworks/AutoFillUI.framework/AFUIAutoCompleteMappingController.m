@implementation AFUIAutoCompleteMappingController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AFUIAutoCompleteMappingController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___instance;
}

void __51__AFUIAutoCompleteMappingController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;

}

- (void)_cachePlistMappings
{
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];

  if (!self->_cache)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cache = self->_cache;
    self->_cache = v3;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("ABAutoCompleteMappings"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[5] = 0;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("Mappings"));
    _CFPropertyListCreateFiltered();
    objc_msgSend(0, "objectForKey:", CFSTR("Mappings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __56__AFUIAutoCompleteMappingController__cachePlistMappings__block_invoke;
    v9[3] = &unk_250857120;
    v9[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

  }
}

void __56__AFUIAutoCompleteMappingController__cachePlistMappings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("AutocompleteTokens"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("FieldLabels"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)heuristicStringsForTextContentTypes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    if (self->_cache)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v29 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
              objc_msgSend(v5, "removeObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v8);
      }

    }
    if (objc_msgSend(v5, "count"))
      -[AFUIAutoCompleteMappingController _cachePlistMappings](self, "_cachePlistMappings");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      v18 = MEMORY[0x24BDBD1A8];
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          if (v20)
            v22 = v20;
          else
            v22 = v18;
          objc_msgSend(v13, "addObjectsFromArray:", v22);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)heuristicTextContentTypeForHints:(id)a3 textContentTypesToSkip:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *cache;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[AFUIAutoCompleteMappingController _cachePlistMappings](self, "_cachePlistMappings");
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__2;
    v19 = __Block_byref_object_dispose__2;
    v20 = 0;
    cache = self->_cache;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __93__AFUIAutoCompleteMappingController_heuristicTextContentTypeForHints_textContentTypesToSkip___block_invoke;
    v11[3] = &unk_250857148;
    v12 = v7;
    v13 = v6;
    v14 = &v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cache, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __93__AFUIAutoCompleteMappingController_heuristicTextContentTypeForHints_textContentTypesToSkip___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  id v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
  {
    v19 = v7;
    v20 = v6;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v14 = *(id *)(a1 + 40);
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v24 != v17)
                  objc_enumerationMutation(v14);
                if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "compare:options:", v13, 129, v19, v20))
                {
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
                  *a4 = 1;
                  goto LABEL_17;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    v7 = v19;
    v6 = v20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistPath, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
