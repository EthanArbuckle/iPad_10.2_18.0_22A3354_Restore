@implementation _DKAppInstallMonitor

- (_DKAppInstallMonitor)init
{
  _DKAppInstallMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BMSource *source;
  uint64_t v8;
  LSApplicationWorkspace *appWorkspace;
  NSObject *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DKAppInstallMonitor;
  v2 = -[_DKMonitor init](&v12, sel_init);
  if (v2)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "App");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Install");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = objc_claimAutoreleasedReturnValue();
    source = v2->_source;
    v2->_source = (BMSource *)v6;

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = objc_claimAutoreleasedReturnValue();
    appWorkspace = v2->_appWorkspace;
    v2->_appWorkspace = (LSApplicationWorkspace *)v8;

    -[LSApplicationWorkspace addObserver:](v2->_appWorkspace, "addObserver:", v2);
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[_DKAppInstallMonitor init].cold.1(v10);

  }
  return v2;
}

+ (id)eventStream
{
  return CFSTR("AppInstall");
}

+ (id)entitlements
{
  return 0;
}

+ (id)_metadataFromProxy:(id)a3 didInstall:(BOOL)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE1B008], "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  }
  objc_msgSend(v5, "genre");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE1B008], "primaryCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);

  }
  objc_msgSend(v5, "subgenres");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v11;
    v25 = v9;
    v26 = v7;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("genre"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v12, "addObject:", v19);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    v7 = v26;
    v4 = v4;
    v9 = v25;
  }
  if (objc_msgSend(v12, "count", v24, v25))
  {
    objc_msgSend(MEMORY[0x24BE1B008], "subCategories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v20);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B008], "isInstall");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v22);

  return v6;
}

+ (id)_identifierFromProxy:(id)a3
{
  return (id)objc_msgSend(a3, "bundleIdentifier");
}

+ (id)_dateFromProxy:(id)a3
{
  return (id)objc_msgSend(a3, "registeredDate");
}

+ (id)_eventWithAppProxy:(id)a3 didInstall:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_metadataFromProxy:didInstall:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_identifierFromProxy:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dateFromProxy:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE1B080];
  objc_msgSend(MEMORY[0x24BE1B130], "appInstallStream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "eventWithStream:startDate:endDate:value:metadata:", v11, v9, v9, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_applicationsDidChange:(id)a3 didInstall:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  id location;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a3;
  objc_initWeak(&location, self);
  -[_DKMonitor queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58___DKAppInstallMonitor__applicationsDidChange_didInstall___block_invoke;
  v14[3] = &unk_24DA67338;
  v9 = v6;
  v15 = v9;
  objc_copyWeak(&v16, &location);
  v17 = a4;
  v10 = v14;
  v11 = v7;
  v12 = (void *)os_transaction_create();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_5;
  block[3] = &unk_24DA66E28;
  v20 = v12;
  v21 = v10;
  v13 = v12;
  dispatch_async(v11, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)applicationsDidInstall:(id)a3
{
  -[_DKAppInstallMonitor _applicationsDidChange:didInstall:](self, "_applicationsDidChange:didInstall:", a3, 1);
}

- (void)applicationsDidUninstall:(id)a3
{
  -[_DKAppInstallMonitor _applicationsDidChange:didInstall:](self, "_applicationsDidChange:didInstall:", a3, 0);
}

- (id)historicalDeletingHandler
{
  return self->historicalDeletingHandler;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_appWorkspace, a3);
}

- (BMSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong(&self->historicalDeletingHandler, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "_DKAppInstallMonitor added LSApplicationWorkspace observer.", v1, 2u);
}

@end
