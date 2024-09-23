@implementation DEDExtensionIdentifierManager

- (id)JSONRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  id obj;
  uint64_t v27;
  DEDExtensionIdentifierManager *v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  const __CFString *v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        -[DEDExtensionIdentifierManager identifierTable](v28, "identifierTable");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v32 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(v5, "objectForKeyedSubscript:", v9);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v17)
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
              objc_msgSend(v16, "stringValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v18);

              objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v9);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          }
          while (v13);
        }

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v29);
  }

  v39 = CFSTR("identifierTable");
  v40 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v19, 2, &v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v30;
  v22 = v21;
  if (!v20 || v21)
  {
    +[DEDExtensionIdentifierManager log](DEDExtensionIdentifierManager, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[DEDExtensionIdentifierManager JSONRepresentation].cold.1(v22, v24);

    v23 = &stru_24D1E6AF0;
  }
  else
  {
    v23 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v20, 4);
  }

  return v23;
}

- (DEDExtensionIdentifierManager)initWithJSONString:(id)a3
{
  id v4;
  DEDExtensionIdentifierManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  DEDExtensionIdentifier *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *obj;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  objc_super v48;
  DEDExtensionIdentifier *v49;
  uint8_t v50[128];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DEDExtensionIdentifierManager;
  v5 = -[DEDExtensionIdentifierManager init](&v48, sel_init);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  -[DEDExtensionIdentifierManager setIdentifierTable:](v5, "setIdentifierTable:", v6);

  v7 = (void *)MEMORY[0x24BDD1608];
  v31 = v4;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v7, "JSONObjectWithData:options:error:", v8, 0, &v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v47;

  v32 = v9;
  if (!v9 || v10)
  {
    +[DEDExtensionIdentifierManager log](DEDExtensionIdentifierManager, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DEDExtensionIdentifierManager initWithJSONString:].cold.1(v10, (uint64_t)v31, v11);
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifierTable"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[NSObject allKeys](v11, "allKeys");
      obj = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v44;
        v34 = v11;
        v33 = *(_QWORD *)v44;
        do
        {
          v15 = 0;
          v35 = v13;
          do
          {
            if (*(_QWORD *)v44 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v15);
            -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v18 = v17;
              v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
              if (v19)
              {
                v20 = v19;
                v37 = v17;
                v38 = v15;
                v21 = *(_QWORD *)v40;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v40 != v21)
                      objc_enumerationMutation(v18);
                    v23 = -[DEDExtensionIdentifier initWithString:]([DEDExtensionIdentifier alloc], "initWithString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
                    -[DEDExtensionIdentifierManager identifierTable](v5, "identifierTable");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "objectForKeyedSubscript:", v16);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v25)
                    {
                      objc_msgSend(v25, "arrayByAddingObject:", v23);
                    }
                    else
                    {
                      v49 = v23;
                      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
                    }
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    -[DEDExtensionIdentifierManager identifierTable](v5, "identifierTable");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v16);

                  }
                  v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
                }
                while (v20);
                v11 = v34;
                v10 = 0;
                v14 = v33;
                v13 = v35;
                v17 = v37;
                v15 = v38;
              }
            }
            else
            {
              +[DEDExtensionIdentifierManager log](DEDExtensionIdentifierManager, "log");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                v52 = "-[DEDExtensionIdentifierManager initWithJSONString:]";
                v53 = 2114;
                v54 = v16;
                _os_log_error_impl(&dword_21469E000, v18, OS_LOG_TYPE_ERROR, "Error in [%{public}s]. could not find array for key [%{public}@]", buf, 0x16u);
              }
            }

            ++v15;
          }
          while (v15 != v13);
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        }
        while (v13);
      }
    }
    else
    {
      +[DEDExtensionIdentifierManager log](DEDExtensionIdentifierManager, "log");
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        -[DEDExtensionIdentifierManager initWithJSONString:].cold.2(obj, v28, v29);
    }

  }
  return v5;
}

- (DEDExtensionIdentifierManager)init
{
  DEDExtensionIdentifierManager *v2;
  uint64_t v3;
  NSMutableDictionary *identifierTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DEDExtensionIdentifierManager;
  v2 = -[DEDExtensionIdentifierManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
    identifierTable = v2->_identifierTable;
    v2->_identifierTable = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)reset
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  +[DEDExtensionIdentifierManager log](DEDExtensionIdentifierManager, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21469E000, v3, OS_LOG_TYPE_DEFAULT, "resetting", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDExtensionIdentifierManager setIdentifierTable:](self, "setIdentifierTable:", v4);

}

- (DEDExtensionIdentifierManager)initWithExtensionIdentifiers:(id)a3
{
  id v4;
  DEDExtensionIdentifierManager *v5;
  uint64_t v6;
  NSMutableDictionary *identifierTable;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DEDExtensionIdentifierManager;
  v5 = -[DEDExtensionIdentifierManager init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifierTable = v5->_identifierTable;
    v5->_identifierTable = (NSMutableDictionary *)v6;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
          -[DEDExtensionIdentifierManager identifierTable](v5, "identifierTable");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extensionIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v16, "mutableCopy");

          if (!v17)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "addObject:", v13);
          -[DEDExtensionIdentifierManager identifierTable](v5, "identifierTable");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extensionIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v17, v19);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v4 = v21;
  }

  return v5;
}

- (id)identifierForExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  DEDExtensionIdentifier *v12;
  void *v13;

  v4 = a3;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "invocationNumber") + 1;
  else
    v11 = 0;
  v12 = -[DEDExtensionIdentifier initWithExtensionIdentifier:invocationNumber:]([DEDExtensionIdentifier alloc], "initWithExtensionIdentifier:invocationNumber:", v4, v11);
  objc_msgSend(v8, "addObject:", v12);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v8, v4);

  objc_sync_exit(v5);
  return v12;
}

- (id)knownIdentifiersForExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (void *)objc_msgSend(v7, "copy");
  else
    v8 = 0;

  objc_sync_exit(v5);
  return v8;
}

- (void)revokeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", v4);
  if (v9)
  {
    -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

  }
  else
  {
    +[DEDExtensionIdentifierManager log](DEDExtensionIdentifierManager, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "extensionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_21469E000, v12, OS_LOG_TYPE_INFO, "no identifier table found for DE identifier [%{public}@]", (uint8_t *)&v14, 0xCu);

    }
  }

  objc_sync_exit(v5);
}

- (id)allIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v4);
  return v3;
}

- (BOOL)isKnownIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v4);

  objc_sync_exit(v5);
  return (v8 != 0) & v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DEDExtensionIdentifierManager identifierTable](self, "identifierTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifierTable"));

}

- (DEDExtensionIdentifierManager)initWithCoder:(id)a3
{
  id v4;
  DEDExtensionIdentifierManager *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *identifierTable;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DEDExtensionIdentifierManager;
  v5 = -[DEDExtensionIdentifierManager init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("identifierTable"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifierTable = v5->_identifierTable;
    v5->_identifierTable = (NSMutableDictionary *)v7;

    v9 = v5->_identifierTable;
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v5->_identifierTable;
    v5->_identifierTable = v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (id)log
{
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, &__block_literal_global_12);
  return (id)log_log_1;
}

void __36__DEDExtensionIdentifierManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;

  +[DEDConfiguration sharedInstance](DEDConfiguration, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = os_log_create((const char *)objc_msgSend(v2, "loggingSubsystem"), "ded-identifier-manager");
  v1 = (void *)log_log_1;
  log_log_1 = (uint64_t)v0;

}

- (NSMutableDictionary)identifierTable
{
  return self->_identifierTable;
}

- (void)setIdentifierTable:(id)a3
{
  objc_storeStrong((id *)&self->_identifierTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierTable, 0);
}

- (void)JSONRepresentation
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446466;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_3(&dword_21469E000, a2, v4, "Error in [%{public}s] [%{public}@]", (uint8_t *)v5);

}

- (void)initWithJSONString:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  int v7[5];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136446722;
  OUTLINED_FUNCTION_2_2();
  v8 = v6;
  v9 = a2;
  _os_log_error_impl(&dword_21469E000, a3, OS_LOG_TYPE_ERROR, "Error in [%{public}s] [%{public}@] from JSON [%{public}@]", (uint8_t *)v7, 0x20u);

}

- (void)initWithJSONString:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "-[DEDExtensionIdentifierManager initWithJSONString:]";
  v5 = 2114;
  v6 = CFSTR("identifierTable");
  OUTLINED_FUNCTION_1_3(&dword_21469E000, a1, a3, "Error in [%{public}s]. did not find [%{public}@]", (uint8_t *)&v3);
}

@end
