@implementation AFPluginManager

- (AFPluginManager)initWithPath:(id)a3 domainKeys:(id)a4 factoryInitializationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  AFPluginManager *v11;
  uint64_t v12;
  NSString *path;
  uint64_t v14;
  NSArray *domainKeys;
  uint64_t v16;
  id factoryInitializationBlock;
  uint64_t v18;
  NSMutableDictionary *domainKeyDictionary;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AFPluginManager;
  v11 = -[AFPluginManager init](&v33, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    path = v11->_path;
    v11->_path = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    domainKeys = v11->_domainKeys;
    v11->_domainKeys = (NSArray *)v14;

    v28 = v8;
    if (v10)
    {
      v16 = MEMORY[0x1A1AC0C3C](v10);
      factoryInitializationBlock = v11->_factoryInitializationBlock;
      v11->_factoryInitializationBlock = (id)v16;
    }
    else
    {
      factoryInitializationBlock = v11->_factoryInitializationBlock;
      v11->_factoryInitializationBlock = &__block_literal_global_23436;
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    domainKeyDictionary = v11->_domainKeyDictionary;
    v11->_domainKeyDictionary = (NSMutableDictionary *)v18;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v11->_domainKeys;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11->_domainKeyDictionary, "setObject:forKeyedSubscript:", v26, v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v22);
    }

    v8 = v28;
  }

  return v11;
}

- (void)enumerateFactoryInstancesForDomainKey:(id)a3 groupIdentifier:(id)a4 classIdentifier:(id)a5 usingBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (v10 && v9 && v12)
  {
    -[AFPluginManager _loadBundlesIfNeeded](self, "_loadBundlesIfNeeded");
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_domainKeyDictionary, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v44 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v22, "supportsClassIdentifier:forDomainKey:groupIdentifier:", v11, v9, v10))
            objc_msgSend(v14, "addObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v19);
    }

    objc_msgSend(v14, "addObjectsFromArray:", v17);
    v42 = 0;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v14;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v39;
      *(_QWORD *)&v24 = 136315394;
      v35 = v24;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v39 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v27);
          objc_msgSend(v28, "factoryInstance", v35);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29
            || ((*((void (**)(id, uint64_t))self->_factoryInitializationBlock + 2))(self->_factoryInitializationBlock, objc_msgSend(v28, "factoryClass")), v29 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v28, "setFactoryInstance:", v29), v29))
          {
            ((void (**)(_QWORD, void *, char *))v13)[2](v13, v29, &v42);
            if (v42)
            {

              goto LABEL_29;
            }
          }
          else
          {
            v30 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              v31 = v30;
              v32 = (void *)objc_msgSend(v28, "factoryClass");
              *(_DWORD *)buf = v35;
              v48 = "-[AFPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:]";
              v49 = 2114;
              v50 = v32;
              v33 = v32;
              _os_log_error_impl(&dword_19AF50000, v31, OS_LOG_TYPE_ERROR, "%s Unable to create an instance of plugin NSPrincipalClass %{public}@", buf, 0x16u);

            }
            v29 = 0;
          }

          ++v27;
        }
        while (v25 != v27);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        v25 = v34;
      }
      while (v34);
    }
LABEL_29:

  }
}

- (void)preloadBundles
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AFPluginManager preloadBundles]";
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[AFPluginManager _loadBundlesIfNeeded](self, "_loadBundlesIfNeeded");
}

- (void)_loadBundlesIfNeeded
{
  void *v3;
  NSString *path;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_hasLoadedBundles)
  {
    self->_hasLoadedBundles = 1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    path = self->_path;
    v16 = 0;
    v15 = v3;
    objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", path, &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v5);
          -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v11);
          if (v12)
            v13 = v6 == 0;
          else
            v13 = 0;
          if (v13)
          {
            -[AFPluginManager _registerBundle:](self, "_registerBundle:", v12);
          }
          else
          {
            v14 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v22 = "-[AFPluginManager _loadBundlesIfNeeded]";
              v23 = 2112;
              v24 = v11;
              v25 = 2112;
              v26 = v6;
              _os_log_error_impl(&dword_19AF50000, v14, OS_LOG_TYPE_ERROR, "%s Error loading bundle at path \"%@\":%@", buf, 0x20u);
            }
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      }
      while (v8);
    }

  }
}

- (void)_registerBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  AFPluginBundle *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSArray *obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
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
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "principalClass");
    if (v6)
    {
      v7 = v6;
      v8 = objc_alloc_init(AFPluginBundle);
      -[AFPluginBundle setFactoryClass:](v8, "setFactoryClass:", v7);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = self->_domainKeys;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v28)
      {
        v26 = *(_QWORD *)v36;
        v27 = v5;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(obj);
            v29 = v9;
            v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v9);
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            objc_msgSend(v5, "infoDictionary");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectForKey:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = v12;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v32;
              do
              {
                v16 = 0;
                do
                {
                  if (*(_QWORD *)v32 != v15)
                    objc_enumerationMutation(v30);
                  objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v16), "componentsSeparatedByString:", CFSTR("#"));
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "firstObject");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend(v17, "count") >= 2)
                  {
                    objc_msgSend(v17, "objectAtIndex:", 1);
                    v19 = objc_claimAutoreleasedReturnValue();
                    if (v19)
                    {
                      v20 = (void *)v19;
                      -[AFPluginBundle registerClassIdentifier:forDomain:inGroup:](v8, "registerClassIdentifier:forDomain:inGroup:", v19, v10, v18);

                    }
                  }
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_domainKeyDictionary, "objectForKeyedSubscript:", v10);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "objectForKeyedSubscript:", v18);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v22)
                  {
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary objectForKeyedSubscript:](self->_domainKeyDictionary, "objectForKeyedSubscript:", v10);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v18);

                  }
                  objc_msgSend(v22, "addObject:", v8);

                  ++v16;
                }
                while (v14 != v16);
                v14 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v14);
            }

            v9 = v29 + 1;
            v5 = v27;
          }
          while (v29 + 1 != v28);
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v28);
      }

    }
    else
    {
      v24 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[AFPluginManager _registerBundle:]";
        v43 = 2112;
        v44 = v5;
        _os_log_impl(&dword_19AF50000, v24, OS_LOG_TYPE_INFO, "%s Siri plugin does not specify an NSPrincipalClass, unable to load: %@", buf, 0x16u);
      }
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFPluginManager;
  -[AFPluginManager description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" Bundle Path: %@, Bundles: %@"), self->_path, self->_domainKeys);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainKeyDictionary, 0);
  objc_storeStrong(&self->_factoryInitializationBlock, 0);
  objc_storeStrong((id *)&self->_domainKeys, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

id __70__AFPluginManager_initWithPath_domainKeys_factoryInitializationBlock___block_invoke(uint64_t a1, objc_class *a2)
{
  return objc_alloc_init(a2);
}

+ (id)pluginManagerForPath:(id)a3 domainKeys:(id)a4 factoryInitializationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:domainKeys:factoryInitializationBlock:", v10, v9, v8);

  return v11;
}

@end
