@implementation HBXHealthAppPluginFactory

+ (id)makeDataListViewControllerForHealthStore:(id)a3 displayType:(id)a4 predicate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[HBXHealthAppPluginFactory _makeDataListViewControllerProvidingForDisplayType:](HBXHealthAppPluginFactory, "_makeDataListViewControllerProvidingForDisplayType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "makeDataListViewControllerForHealthStore:displayType:predicate:", v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_makeDataListViewControllerProvidingForDisplayType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_loadPluginBundleForDisplayType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HBXHealthAppPluginFactory _createPluginAddDataViewControllerProvidingFromPluginBundle:](HBXHealthAppPluginFactory, "_createPluginAddDataViewControllerProvidingFromPluginBundle:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_loadPluginBundleForDisplayType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_pluginPathForDisplayType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[HBXHealthAppPluginFactory _loadBundleForPluginPath:](HBXHealthAppPluginFactory, "_loadBundleForPluginPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_pluginPathForDisplayType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = objc_msgSend(a3, "displayTypeIdentifier");
  if (v4 == 273)
  {
    objc_msgSend(a1, "_pluginsDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("MedicationsHealthAppPlugin.healthplugin");
  }
  else
  {
    if (v4 != 257)
    {
      v8 = 0;
      return v8;
    }
    objc_msgSend(a1, "_pluginsDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("VisionHealthAppPlugin.healthplugin");
  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_pluginsDirectoryPath
{
  void *v2;
  void *v3;

  +[HBXHealthAppPluginUtilities defaultUtilities](HBXHealthAppPluginUtilities, "defaultUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedItemPluginsPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_loadBundleForPluginPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v15 = 0;
    v6 = objc_msgSend(v4, "loadAndReturnError:", &v15);
    v7 = v15;
    if ((v6 & 1) != 0)
    {
      v8 = v5;
    }
    else
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x24BDD3070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      {
        v12 = v10;
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        v18 = 2114;
        v19 = v3;
        v20 = 2114;
        v21 = v7;
        v14 = v13;
        _os_log_error_impl(&dword_215814000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load plugin bundle at path %{public}@ with error: %{public}@", buf, 0x20u);

      }
      v8 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      +[HBXHealthAppPluginFactory _loadBundleForPluginPath:].cold.1(v9);
    v8 = 0;
  }

  return v8;
}

+ (id)_createPluginAddDataViewControllerProvidingFromPluginBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HBXHealthAppPluginFactory _createPluginAppDelegateFromPluginBundle:](HBXHealthAppPluginFactory, "_createPluginAppDelegateFromPluginBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &unk_254E23B00;
  if ((objc_msgSend(v4, "conformsToProtocol:", v5) & 1) != 0)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      v11 = v10;
      NSStringFromProtocol((Protocol *)v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_215814000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Plugin app delegate does not conform to %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);

    }
    v6 = 0;
  }

  return v6;
}

+ (id)_createPluginAppDelegateFromPluginBundle:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PluginAppDelegateClass"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(NSClassFromString(v6));
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
      +[HBXHealthAppPluginFactory _createPluginAppDelegateFromPluginBundle:].cold.1(v8, (uint64_t)a1, v4);
    v7 = 0;
  }

  return v7;
}

+ (Class)makeDataListDataProviderClassFromPluginName:(id)a3 displayType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_pluginsDirectoryPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_loadBundleForPluginPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HBXHealthAppPluginFactory _createPluginDataListDataProviderProvidingFromPluginBundle:](HBXHealthAppPluginFactory, "_createPluginDataListDataProviderProvidingFromPluginBundle:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeDataListDataProviderClassForDisplayType:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

+ (id)_createPluginDataListDataProviderProvidingFromPluginBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[HBXHealthAppPluginFactory _createPluginAppDelegateFromPluginBundle:](HBXHealthAppPluginFactory, "_createPluginAppDelegateFromPluginBundle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &unk_254E23BB8;
  if ((objc_msgSend(v4, "conformsToProtocol:", v5) & 1) != 0)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_opt_class();
      v11 = v10;
      NSStringFromProtocol((Protocol *)v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_215814000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Plugin app delegate does not conform to %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);

    }
    v6 = 0;
  }

  return v6;
}

+ (void)_loadBundleForPluginPath:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1;
  v3 = (id)OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215814000, v4, v5, "%{public}@: Failed to create plugin bundle at path: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)_createPluginAppDelegateFromPluginBundle:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a1;
  v6 = (id)OUTLINED_FUNCTION_2();
  objc_msgSend(a3, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_215814000, v7, v8, "%{public}@: Plugin does not declare an app delegate in its Info.plist: %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_1();
}

@end
