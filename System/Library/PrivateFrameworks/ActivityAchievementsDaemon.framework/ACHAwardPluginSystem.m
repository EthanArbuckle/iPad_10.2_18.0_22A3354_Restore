@implementation ACHAwardPluginSystem

- (ACHAwardPluginSystem)init
{
  ACHAwardPluginSystem *v2;
  ACHAwardPluginSystem *v3;
  NSArray *progressProviders;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHAwardPluginSystem;
  v2 = -[ACHAwardPluginSystem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    progressProviders = v2->_progressProviders;
    v2->_progressProviders = (NSArray *)MEMORY[0x24BDBD1A8];

    -[ACHAwardPluginSystem _loadPlugins](v3, "_loadPlugins");
  }
  return v3;
}

- (id)_pluginDirectoryPath
{
  return (id)objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("/System/Library/Fitness/Plugins"));
}

- (id)_principalClassProtocols
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = &unk_254D82C18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_pluginClasses
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ACHAwardPluginSystem _pluginDirectoryPath](self, "_pluginDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAwardPluginSystem _principalClassProtocols](self, "_principalClassProtocols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[ACHAwardPluginSystem _loadPrincipalClassesConformingToProtocols:fromBundlesInDirectoryAtPath:error:](self, "_loadPrincipalClassesConformingToProtocols:fromBundlesInDirectoryAtPath:error:", v5, v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
  {
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  }
  else if ((objc_msgSend(v7, "hk_isCocoaNoSuchFileError") & 1) == 0)
  {
    ACHLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ACHAwardPluginSystem _pluginClasses].cold.1();

  }
  return v3;
}

- (id)_loadPrincipalClassesConformingToProtocols:(id)a3 fromBundlesInDirectoryAtPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  objc_class *v21;
  void *v23;
  id v24;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v9 = v7;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v24 = v8;
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v10;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x2199C8FE0]();
          objc_msgSend(v16, "pathExtension");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("bundle"));

          if (v19)
          {
            objc_msgSend(v9, "stringByAppendingPathComponent:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:](self, "_loadPrincipalClassConformingToProtocols:fromBundleAtPath:", v27, v20);
            if (v21)
              objc_msgSend(v25, "addObject:", v21);

          }
          objc_autoreleasePoolPop(v17);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    v10 = v23;
    v8 = v24;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (Class)_loadPrincipalClassConformingToProtocols:(id)a3 fromBundleAtPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  __CFString *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", v6);
  v8 = v7;
  if (v7)
  {
    v40 = 0;
    v9 = objc_msgSend(v7, "loadAndReturnError:", &v40);
    v10 = v40;
    if ((v9 & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v8, "principalClass");
      if (!v11)
      {
        ACHLogDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:].cold.3((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);

      }
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = v5;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            if (objc_msgSend(v11, "conformsToProtocol:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), (_QWORD)v36))
            {
              ACHLogDefault();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:].cold.2((uint64_t)v6, v32);

              v25 = v11;
              goto LABEL_26;
            }
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
          if (v21)
            continue;
          break;
        }
      }

      ACHLogDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (v11)
        {
          NSStringFromClass((Class)v11);
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v34 = CFSTR("<>");
        }
        -[NSObject hk_map:](v19, "hk_map:", &__block_literal_global_11, (_QWORD)v36);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v6;
        v43 = 2114;
        v44 = v34;
        v45 = 2114;
        v46 = v35;
        _os_log_error_impl(&dword_21407B000, v24, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": principal class %{public}@ doesn't conform to any of: %{public}@", buf, 0x20u);
        if (v11)

      }
      v25 = 0;
      v19 = v24;
    }
    else
    {
      ACHLogDefault();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:].cold.4();
      v25 = 0;
    }
LABEL_26:

  }
  else
  {
    ACHLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:].cold.1((uint64_t)v6, v10, v26, v27, v28, v29, v30, v31);
    v25 = 0;
  }

  return (Class)v25;
}

NSString *__82__ACHAwardPluginSystem__loadPrincipalClassConformingToProtocols_fromBundleAtPath___block_invoke(int a1, Protocol *proto)
{
  return NSStringFromProtocol(proto);
}

- (id)_createPluginsFromClasses:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  char *v10;

  v4 = &unk_254D82C18;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__ACHAwardPluginSystem__createPluginsFromClasses___block_invoke;
  v8[3] = &unk_24D13BA20;
  v9 = v4;
  v10 = sel_shouldLoadPlugin;
  v5 = v4;
  objc_msgSend(a3, "hk_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__ACHAwardPluginSystem__createPluginsFromClasses___block_invoke(uint64_t a1, objc_class *a2)
{
  id v3;

  if (-[objc_class conformsToProtocol:](a2, "conformsToProtocol:", *(_QWORD *)(a1 + 32))
    && ((objc_opt_respondsToSelector() & 1) == 0 || -[objc_class shouldLoadPlugin](a2, "shouldLoadPlugin")))
  {
    v3 = objc_alloc_init(a2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_loadPlugins
{
  NSArray *v3;
  NSArray *plugins;
  id v5;

  -[ACHAwardPluginSystem _pluginClasses](self, "_pluginClasses");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ACHAwardPluginSystem _createPluginsFromClasses:](self, "_createPluginsFromClasses:", v5);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  plugins = self->_plugins;
  self->_plugins = v3;

}

- (id)createTemplateAssetSources
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_plugins;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "templateAssetSource", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "pluginIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)createProgressProviders
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *progressProviders;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_plugins;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "progressProvider", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v9, "pluginIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

            -[NSArray arrayByAddingObject:](self->_progressProviders, "arrayByAddingObject:", v10);
            v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
            progressProviders = self->_progressProviders;
            self->_progressProviders = v12;

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProviders, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
}

- (void)_pluginClasses
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Failed to load plugins at \"%{public}@\": %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_loadPrincipalClassConformingToProtocols:(uint64_t)a3 fromBundleAtPath:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error: failed to instantiate bundle \"%{public}@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadPrincipalClassConformingToProtocols:(uint64_t)a1 fromBundleAtPath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_21407B000, a2, OS_LOG_TYPE_DEBUG, "Loaded bundle \"%{public}@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_loadPrincipalClassConformingToProtocols:(uint64_t)a3 fromBundleAtPath:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "Error: failed to get principal class from bundle \"%{public}@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadPrincipalClassConformingToProtocols:fromBundleAtPath:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_21407B000, v0, v1, "Error: failed to load bundle \"%{public}@\": %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
