@implementation NUArticleViewControllerFactory

- (NUArticleViewControllerFactory)initWithArticleDataProviderFactory:(id)a3 appStateMonitor:(id)a4 keyCommandManager:(id)a5 headerBlueprintProvider:(id)a6 articlePrefetcher:(id)a7 articleScrollPositionManager:(id)a8 spotlightManager:(id)a9 resolver:(id)a10
{
  id v17;
  NUArticleViewControllerFactory *v18;
  NUArticleViewControllerFactory *v19;
  uint64_t v20;
  NSHashTable *loadingListeners;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)NUArticleViewControllerFactory;
  v18 = -[NUArticleViewControllerFactory init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_articleDataProviderFactory, a3);
    objc_storeStrong((id *)&v19->_appStateMonitor, a4);
    objc_storeStrong((id *)&v19->_keyCommandManager, a5);
    objc_storeStrong((id *)&v19->_headerBlueprintProvider, a6);
    objc_storeStrong((id *)&v19->_articlePrefetcher, a7);
    objc_storeStrong((id *)&v19->_articleScrollPositionManager, a8);
    objc_storeStrong((id *)&v19->_spotlightManager, a9);
    objc_storeStrong((id *)&v19->_resolver, a10);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v20 = objc_claimAutoreleasedReturnValue();
    loadingListeners = v19->_loadingListeners;
    v19->_loadingListeners = (NSHashTable *)v20;

  }
  return v19;
}

- (id)createArticleViewControllerWithArticle:(id)a3 issue:(id)a4 context:(id)a5 relativePriority:(int64_t)a6 articleHostViewController:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  NUArticleHostViewControllerProvider *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NUArticleViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NUArticleViewController *v44;
  void *v46;
  id v47;
  id v48;
  NUArticleHostViewControllerProvider *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  NUArticleHostViewControllerProvider *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;

  v12 = a3;
  v55 = a4;
  v53 = a7;
  v52 = a5;
  -[NUArticleViewControllerFactory articlePrefetcher](self, "articlePrefetcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "articleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prefetchedArticleDataProviderForArticleID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    -[NUArticleViewControllerFactory articleDataProviderFactory](self, "articleDataProviderFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createArticleDataProviderWithArticle:", v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v17, "setRelativePriority:", a6);
  -[NUArticleViewControllerFactory resolver](self, "resolver");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resolveClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleViewControllerFactory resolver](self, "resolver");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  v23 = MEMORY[0x24BDAC760];
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke;
  v67[3] = &unk_24D5A1C08;
  v24 = v12;
  v68 = v24;
  objc_msgSend(v21, "resolveClass:contextBlock:", v22, v67);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleViewControllerFactory resolver](self, "resolver");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  v65[0] = v23;
  v65[1] = 3221225472;
  v65[2] = __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_2;
  v65[3] = &unk_24D5A1C08;
  v28 = v24;
  v66 = v28;
  objc_msgSend(v26, "resolveClass:contextBlock:", v27, v65);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = -[NUArticleHostViewControllerProvider initWithArticleHostViewController:]([NUArticleHostViewControllerProvider alloc], "initWithArticleHostViewController:", v53);
  -[NUArticleViewControllerFactory resolver](self, "resolver");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_class();
  v57[0] = v23;
  v57[1] = 3221225472;
  v57[2] = __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_3;
  v57[3] = &unk_24D5A1C30;
  v58 = v25;
  v59 = v29;
  v60 = v28;
  v61 = v30;
  v62 = v20;
  v63 = v55;
  v64 = v17;
  v54 = v17;
  v51 = v55;
  v56 = v20;
  v49 = v30;
  v50 = v28;
  v47 = v29;
  v48 = v25;
  objc_msgSend(v31, "resolveClass:contextBlock:", v32, v57);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleViewControllerFactory resolver](self, "resolver");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "resolveProtocol:", &unk_254E65108);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleViewControllerFactory resolver](self, "resolver");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "resolveProtocol:", &unk_254E680A8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = [NUArticleViewController alloc];
  -[NUArticleViewControllerFactory appStateMonitor](self, "appStateMonitor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewControllerFactory keyCommandManager](self, "keyCommandManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewControllerFactory loadingListeners](self, "loadingListeners");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewControllerFactory headerBlueprintProvider](self, "headerBlueprintProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewControllerFactory articleScrollPositionManager](self, "articleScrollPositionManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleViewControllerFactory spotlightManager](self, "spotlightManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[NUArticleViewController initWithArticleDataProvider:scrollViewController:appStateMonitor:keyCommandManager:loadingListeners:headerBlueprintProvider:debugSettingsProvider:videoPlayerViewControllerManager:articleScrollPositionManager:chromeControl:spotlightManager:](v37, "initWithArticleDataProvider:scrollViewController:appStateMonitor:keyCommandManager:loadingListeners:headerBlueprintProvider:debugSettingsProvider:videoPlayerViewControllerManager:articleScrollPositionManager:chromeControl:spotlightManager:", v54, v46, v38, v39, v40, v41, v34, v56, v42, v36, v43);

  -[NUArticleViewController setArticleContext:](v44, "setArticleContext:", v52);
  return v44;
}

void __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "headline");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "useObject:forProtocol:", v4, &unk_254E83150);

}

void __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "headline");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "useObject:forProtocol:", v4, &unk_254E83150);

}

void __130__NUArticleViewControllerFactory_createArticleViewControllerWithArticle_issue_context_relativePriority_articleHostViewController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
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
  objc_msgSend(v3, "useObject:forProtocol:", *(_QWORD *)(a1 + 32), &unk_254E75660);
  objc_msgSend(v3, "useObject:forProtocol:", *(_QWORD *)(a1 + 40), &unk_254E71198);
  objc_msgSend(*(id *)(a1 + 48), "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "useObject:forProtocol:", v4, &unk_254E83150);

  objc_msgSend(v3, "useObject:forClass:", *(_QWORD *)(a1 + 56), objc_opt_class());
  objc_msgSend(v3, "useObject:forClass:", *(_QWORD *)(a1 + 64), objc_opt_class());
  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
    objc_msgSend(v3, "useObject:forClass:", v5, objc_opt_class());
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 80), "linkedContentProviders", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v3, "useObject:forClass:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), objc_opt_class());
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSHashTable)loadingListeners
{
  return self->_loadingListeners;
}

- (NUArticleDataProviderFactory)articleDataProviderFactory
{
  return self->_articleDataProviderFactory;
}

- (SXAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (NUArticleKeyCommandManager)keyCommandManager
{
  return self->_keyCommandManager;
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (NUDocumentSectionBlueprintProvider)headerBlueprintProvider
{
  return self->_headerBlueprintProvider;
}

- (NUArticlePrefetcherType)articlePrefetcher
{
  return self->_articlePrefetcher;
}

- (NUArticleScrollPositionManagerType)articleScrollPositionManager
{
  return self->_articleScrollPositionManager;
}

- (NUSpotlightManager)spotlightManager
{
  return self->_spotlightManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightManager, 0);
  objc_storeStrong((id *)&self->_articleScrollPositionManager, 0);
  objc_storeStrong((id *)&self->_articlePrefetcher, 0);
  objc_storeStrong((id *)&self->_headerBlueprintProvider, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_keyCommandManager, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_articleDataProviderFactory, 0);
  objc_storeStrong((id *)&self->_loadingListeners, 0);
}

@end
