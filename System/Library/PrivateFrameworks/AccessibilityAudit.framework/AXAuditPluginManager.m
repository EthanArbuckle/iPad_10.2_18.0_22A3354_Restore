@implementation AXAuditPluginManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__AXAuditPluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, block);
  return (id)sharedManager_instance_2;
}

void __37__AXAuditPluginManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_2;
  sharedManager_instance_2 = v0;

}

- (void)_loadAuditBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  id v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.accessibility.AccessibilityAuditUI"));

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("YES");
    *(_DWORD *)buf = 136315650;
    v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
    v20 = 2112;
    if (v6)
      v7 = CFSTR("NO");
    v21 = v7;
    v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: shouldLoad: %@, %@ ", buf, 0x20u);
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: plugin: %@ ", buf, 0x16u);
    }
    if (v8)
    {
      v9 = (__CFString *)-[__CFString principalClass](v8, "principalClass");
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: principalClass: %@ ", buf, 0x16u);
      }
      if (-[__CFString isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()))
      {
        v17 = 0;
        v10 = -[__CFString loadAndReturnError:](v8, "loadAndReturnError:", &v17);
        v11 = v17;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          if (v10)
            v12 = CFSTR("YES");
          else
            v12 = CFSTR("NO");
          v13 = -[__CFString isLoaded](v8, "isLoaded");
          *(_DWORD *)buf = 136315906;
          v19 = "-[AXAuditPluginManager _loadAuditBundle:]";
          if (v13)
            v14 = CFSTR("YES");
          else
            v14 = CFSTR("NO");
          v20 = 2112;
          v21 = v12;
          v22 = 2112;
          v23 = v11;
          v24 = 2112;
          v25 = v14;
          _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: loaded: %@, error: %@, plugin.isLoaded: %@", buf, 0x2Au);
        }
        if (-[__CFString isLoaded](v8, "isLoaded"))
        {
          objc_storeStrong(&_PluginBundle, v8);
          v15 = objc_opt_new();
          v16 = (void *)_Plugin;
          _Plugin = v15;

        }
      }
    }

  }
}

- (void)loadAuditBundles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[AXAuditPluginManager _didLoadBundles](self, "_didLoadBundles"))
  {
    -[AXAuditPluginManager set_didLoadBundles:](self, "set_didLoadBundles:", 1);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathsForResourcesOfType:inDirectory:", CFSTR("bundle"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("AccessibilityAudit"));

          if (v11)
            -[AXAuditPluginManager _loadAuditBundle:](self, "_loadAuditBundle:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (id)pluginForAuditCategory:(id)a3
{
  return (id)_Plugin;
}

- (id)platformPlugin
{
  return (id)_Plugin;
}

- (BOOL)_didLoadBundles
{
  return self->__didLoadBundles;
}

- (void)set_didLoadBundles:(BOOL)a3
{
  self->__didLoadBundles = a3;
}

@end
