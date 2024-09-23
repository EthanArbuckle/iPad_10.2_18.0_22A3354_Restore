@implementation LSDPluginManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_34);
  return (id)sharedInstance_sharedInstance_1;
}

void __34__LSDPluginManager_sharedInstance__block_invoke()
{
  LSDPluginManager *v0;
  void *v1;

  v0 = objc_alloc_init(LSDPluginManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (void)loadPluginsAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSDictionary *v26;
  NSDictionary *pluginsByBundleIentifier;
  uint64_t v28;
  void *context;
  void *v30;
  uint64_t v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v4;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 7, &__block_literal_global_4_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    v11 = CFSTR("lsdplugin");
    v31 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        objc_msgSend(v13, "pathExtension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v11);

        if (!v15)
        {
          v20 = 0;
          v17 = 0;
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16)
        {
          v20 = 0;
          goto LABEL_22;
        }
        v18 = v7;
        v19 = v11;
        objc_msgSend(v16, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v22 = 0;
LABEL_16:
          _LSDefaultLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v39 = v13;
            v40 = 2112;
            v41 = v20;
            v42 = 2112;
            v43 = v22;
            _os_log_impl(&dword_182882000, v25, OS_LOG_TYPE_DEFAULT, "Failed to load plugin with URL: %@ bundle identifier %@ error: %@", buf, 0x20u);
          }

LABEL_19:
          v11 = v19;
          v7 = v18;
          goto LABEL_20;
        }
        v33 = 0;
        v21 = objc_msgSend(v17, "loadAndReturnError:", &v33);
        v22 = v33;
        if ((v21 & 1) == 0)
          goto LABEL_16;
        v23 = (void *)objc_msgSend(v17, "principalClass");
        if (!objc_msgSend(v23, "conformsToProtocol:", &unk_1EDCED9B0))
          goto LABEL_19;
        v24 = objc_alloc_init((Class)v23);

        v11 = v19;
        if (!v24)
        {
          v7 = v18;
          goto LABEL_21;
        }
        v7 = v18;
        objc_msgSend(v18, "setObject:forKey:", v24, v20);
        v22 = v24;
LABEL_20:

LABEL_21:
        v10 = v31;
LABEL_22:
        v26 = (NSDictionary *)objc_msgSend(v7, "copy");
        pluginsByBundleIentifier = self->_pluginsByBundleIentifier;
        self->_pluginsByBundleIentifier = v26;

        ++v12;
      }
      while (v9 != v12);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      v9 = v28;
    }
    while (v28);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __37__LSDPluginManager_loadPluginsAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Error enumerating URL: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (void)startPlugins
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSXPCListener *v10;
  NSXPCListener *listener;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_pluginsByBundleIentifier;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSDictionary objectForKey:](self->_pluginsByBundleIentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "start");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v9);
  listener = self->_listener;
  self->_listener = v10;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EDCE1C18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

- (void)endpointForServiceIdentifier:(id)a3 reply:(id)a4
{
  NSDictionary *pluginsByBundleIentifier;
  void (**v6)(id, void *);
  void *v7;
  id v8;

  pluginsByBundleIentifier = self->_pluginsByBundleIentifier;
  v6 = (void (**)(id, void *))a4;
  -[NSDictionary objectForKey:](pluginsByBundleIentifier, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "XPCListenerEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (NSDictionary)pluginsByBundleIentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPluginsByBundleIentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pluginsByBundleIentifier, 0);
}

@end
