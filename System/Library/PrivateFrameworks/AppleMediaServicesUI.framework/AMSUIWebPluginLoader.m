@implementation AMSUIWebPluginLoader

- (AMSUIWebPluginLoader)initWithContext:(id)a3
{
  id v4;
  AMSUIWebPluginLoader *v5;
  AMSUIWebPluginLoader *v6;
  uint64_t v7;
  NSDictionary *installedPluginURLs;
  NSMutableDictionary *v9;
  NSMutableDictionary *loadedPluginsMap;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebPluginLoader;
  v5 = -[AMSUIWebPluginLoader init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    -[AMSUIWebPluginLoader _loadInstalledPlugins](v6, "_loadInstalledPlugins");
    v7 = objc_claimAutoreleasedReturnValue();
    installedPluginURLs = v6->_installedPluginURLs;
    v6->_installedPluginURLs = (NSDictionary *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    loadedPluginsMap = v6->_loadedPluginsMap;
    v6->_loadedPluginsMap = v9;

  }
  return v6;
}

- (NSArray)loadedPlugins
{
  void *v2;
  void *v3;

  -[AMSUIWebPluginLoader loadedPluginsMap](self, "loadedPluginsMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)pluginForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _BYTE location[12];
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIWebPluginLoader loadedPluginsMap](self, "loadedPluginsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[AMSUIWebPluginLoader installedPluginURLs](self, "installedPluginURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithURL:", v10);
      v12 = v11;
      if (v11)
      {
        if ((objc_msgSend(v11, "load") & 1) != 0)
        {
          v13 = (objc_class *)objc_msgSend(v12, "principalClass");
          if (v13)
          {
            v14 = v13;
            if ((-[objc_class conformsToProtocol:](v13, "conformsToProtocol:", &unk_254B1F3A0) & 1) != 0)
            {
              objc_initWeak((id *)location, self);
              v15 = [v14 alloc];
              -[AMSUIWebPluginLoader context](self, "context");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "bag");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[AMSUIWebPluginLoader context](self, "context");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "account");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[AMSUIWebPluginLoader context](self, "context");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "clientInfo");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19;
              if (!v19)
              {
                objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v38[0] = MEMORY[0x24BDAC760];
              v38[1] = 3221225472;
              v38[2] = __50__AMSUIWebPluginLoader_pluginForBundleIdentifier___block_invoke;
              v38[3] = &unk_24CB4F800;
              objc_copyWeak(&v39, (id *)location);
              v8 = (void *)objc_msgSend(v15, "initWithBag:account:clientInfo:propertiesChangedHandler:", v36, v17, v20, v38);
              if (!v19)

              -[AMSUIWebPluginLoader loadedPluginsMap](self, "loadedPluginsMap");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v8, v4);

              objc_destroyWeak(&v39);
              objc_destroyWeak((id *)location);
              goto LABEL_39;
            }
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v25)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v25, "OSLogObject");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v33 = objc_opt_class();
              AMSLogKey();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 138543874;
              *(_QWORD *)&location[4] = v33;
              v41 = 2114;
              v42 = v34;
              v43 = 2114;
              v44 = v4;
              _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Principal class doesn't conform to AMSUIWebPlugin. Bundle identifier: %{public}@", location, 0x20u);

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v25)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v25, "OSLogObject");
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v31 = objc_opt_class();
              AMSLogKey();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)location = 138543874;
              *(_QWORD *)&location[4] = v31;
              v41 = 2114;
              v42 = v32;
              v43 = 2114;
              v44 = v4;
              _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Principal class not found. Bundle identifier: %{public}@", location, 0x20u);

            }
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v25, "OSLogObject");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v29 = objc_opt_class();
            AMSLogKey();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)location = 138543874;
            *(_QWORD *)&location[4] = v29;
            v41 = 2114;
            v42 = v30;
            v43 = 2114;
            v44 = v4;
            _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to load plugin. Bundle identifier: %{public}@", location, 0x20u);

          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v25, "OSLogObject");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = objc_opt_class();
          AMSLogKey();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v27;
          v41 = 2114;
          v42 = v28;
          v43 = 2114;
          v44 = v4;
          _os_log_impl(&dword_211102000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No plugin bundle found. Bundle identifier: %{public}@", location, 0x20u);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        AMSLogKey();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v23;
        v41 = 2114;
        v42 = v24;
        v43 = 2114;
        v44 = v4;
        _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No plugin found. Bundle identifier: %{public}@", location, 0x20u);

      }
    }
    v8 = 0;
LABEL_39:

    goto LABEL_40;
  }
  -[AMSUIWebPluginLoader loadedPluginsMap](self, "loadedPluginsMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
  return v8;
}

void __50__AMSUIWebPluginLoader_pluginForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "syncProperties");

}

- (id)_loadInstalledPlugins
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
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", CFSTR("/System/Library/AppleMediaServices/WebUI/"));
  objc_msgSend(v3, "pathsForResourcesOfType:inDirectory:", CFSTR("bundle"), CFSTR("PlugIns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
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
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bundleURL");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      AMSLogKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to find plugins bundle", buf, 0x16u);

    }
  }

  return v2;
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (NSDictionary)installedPluginURLs
{
  return self->_installedPluginURLs;
}

- (NSMutableDictionary)loadedPluginsMap
{
  return self->_loadedPluginsMap;
}

- (void)setLoadedPluginsMap:(id)a3
{
  objc_storeStrong((id *)&self->_loadedPluginsMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedPluginsMap, 0);
  objc_storeStrong((id *)&self->_installedPluginURLs, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
