@implementation SUUIClientContext

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUUIClientContext;
  -[SUUIClientContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@]"), v4, self->_storeFrontIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImageCache, 0);
  objc_storeStrong((id *)&self->_resourceLoadQueue, 0);
  objc_storeStrong((id *)&self->_trendingSearchProvider, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_scriptAppContext, 0);
  objc_storeStrong((id *)&self->_purchaseReferrerURL, 0);
  objc_storeStrong((id *)&self->_purchaseAffiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_navigationHistoryPersistenceKey, 0);
  objc_storeStrong((id *)&self->_navigationHistory, 0);
  objc_storeStrong((id *)&self->_metricsPageContexts, 0);
  objc_storeStrong((id *)&self->_metricsConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_destroyWeak((id *)&self->_applicationController);
  objc_storeStrong((id *)&self->_additionalPurchaseParameters, 0);
}

- (int64_t)userInterfaceIdiomOverride
{
  return self->_userInterfaceIdiomOverride;
}

- (id)tabBarItemsForStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  SUUITabBarItem *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[SUUIClientContext valueForConfigurationKey:](self, "valueForConfigurationKey:", CFSTR("tabs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3
      || (objc_msgSend(v4, "objectForKey:", CFSTR("compact")), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("standard"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v4;
      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v18 = v5;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKey:", CFSTR("id"), v18);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = -[SUUITabBarItem initWithTabIdentifier:]([SUUITabBarItem alloc], "initWithTabIdentifier:", v13);
              objc_msgSend(v12, "objectForKey:", CFSTR("url"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v15);
                -[SUUITabBarItem setRootURL:](v14, "setRootURL:", v16);

              }
              objc_msgSend(v6, "addObject:", v14);

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v9);
      }

      v5 = v18;
      v4 = v19;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)valueForConfigurationKey:(id)a3
{
  return -[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", a3);
}

+ (id)defaultContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SSVStoreFrontIdentifierForAccount();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "_cachePathForStoreFrontIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v6),
          (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathForResource:ofType:", CFSTR("SUUIStoreConfigurations"), CFSTR("plist"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v9);
        objc_msgSend(v10, "objectForKey:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v12 = objc_msgSend(v5, "rangeOfString:", CFSTR(","));
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v11 = 0;
          }
          else
          {
            objc_msgSend(v5, "substringToIndex:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKey:", v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v11;
        else
          v7 = 0;

        if (v7)
          goto LABEL_15;
      }
      else
      {
        v7 = 0;
      }
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_15:
    v13 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithConfigurationDictionary:", v7);
    if (v13)
    {
      v15 = objc_msgSend(v5, "copy");
      v16 = (void *)v13[16];
      v13[16] = v15;

    }
    goto LABEL_18;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

+ (id)_cachePathForStoreFrontIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_cachePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (NSString)_cachePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("SUUIClientContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (SUUIClientContext)initWithConfigurationDictionary:(id)a3
{
  id v4;
  SUUIClientContext *v5;
  uint64_t v6;
  NSBundle *bundle;
  SUClientInterface *v8;
  SUClientInterface *clientInterface;
  uint64_t v10;
  NSDictionary *configurationDictionary;
  SUUIClientContextViewControllerFactory *v12;
  NSCache *v13;
  NSCache *placeholderImageCache;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIClientContext;
  v5 = -[SUUIClientContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = objc_claimAutoreleasedReturnValue();
    bundle = v5->_bundle;
    v5->_bundle = (NSBundle *)v6;

    v8 = (SUClientInterface *)objc_alloc_init(MEMORY[0x24BEC8CF0]);
    clientInterface = v5->_clientInterface;
    v5->_clientInterface = v8;

    -[SUClientInterface setDelegate:](v5->_clientInterface, "setDelegate:", v5);
    v10 = objc_msgSend(v4, "copy");
    configurationDictionary = v5->_configurationDictionary;
    v5->_configurationDictionary = (NSDictionary *)v10;

    v5->_userInterfaceIdiomOverride = 0x7FFFFFFFFFFFFFFFLL;
    v12 = objc_alloc_init(SUUIClientContextViewControllerFactory);
    -[SUClientInterface setViewControllerFactory:](v5->_clientInterface, "setViewControllerFactory:", v12);
    v13 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    placeholderImageCache = v5->_placeholderImageCache;
    v5->_placeholderImageCache = v13;

    -[NSCache setName:](v5->_placeholderImageCache, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIClientContext.placeholderImageCache"));
  }

  return v5;
}

- (void)setPurchaseReferrerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)_setApplicationController:(id)a3
{
  objc_storeWeak((id *)&self->_applicationController, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[SUClientInterface setDelegate:](self->_clientInterface, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIClientContext;
  -[SUUIClientContext dealloc](&v3, sel_dealloc);
}

- (id)additionalLeftBarButtonItemForDocumentContainerViewController:(id)a3
{
  return 0;
}

- (id)additionalRightBarButtonItemForDocumentContainerViewController:(id)a3
{
  return 0;
}

- (id)additionalLeftBarButtonItemForViewController:(id)a3
{
  return 0;
}

- (id)additionalRightBarButtonItemForViewController:(id)a3
{
  return 0;
}

- (id)documentViewControllerForTemplateViewElement:(id)a3
{
  return 0;
}

- (BOOL)storeViewController:(id)a3 shouldDisplayDefaultDarButton:(int64_t)a4
{
  return 1;
}

- (BOOL)shouldForceTransientSearchControllerBahavior
{
  return 0;
}

- (void)getDefaultMetricsControllerWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUUIClientContext URLBag](self, "URLBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BEB2990];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__SUUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke;
  v8[3] = &unk_2511FA8D8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "loadValueForKey:completionBlock:", v6, v8);

}

void __68__SUUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SUUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke_2;
  block[3] = &unk_2511F83F8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __68__SUUIClientContext_getDefaultMetricsControllerWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  SUUIMetricsController *v6;
  void *v7;
  id v8;

  v8 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "metricsConfigurationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;

      v8 = v4;
    }

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1ED0]), "initWithGlobalConfiguration:", v8);
  if (v5)
  {
    v6 = -[SUUIMetricsController initWithGlobalConfiguration:]([SUUIMetricsController alloc], "initWithGlobalConfiguration:", v5);
    -[SUUIMetricsController setTopic:](v6, "setTopic:", CFSTR("xp_its_main"));
    SSVDefaultUserAgent();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setUserAgent:](v6, "setUserAgent:", v7);

  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)localizedAlertWithError:(id)a3
{
  return 0;
}

- (id)localizedStringForKey:(id)a3
{
  return -[SUUIClientContext localizedStringForKey:inTable:](self, "localizedStringForKey:inTable:", a3, 0);
}

- (id)localizedStringForKey:(id)a3 inTable:(id)a4
{
  id v6;
  id v7;
  SUUILocalizedStringDictionary *localizedStrings;
  void *v9;
  SUUILocalizedStringDictionary *v10;
  void *v11;
  SUUILocalizedStringDictionary *v12;
  SUUILocalizedStringDictionary *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  localizedStrings = self->_localizedStrings;
  if (!localizedStrings)
  {
    -[NSDictionary objectForKey:](self->_configurationDictionary, "objectForKey:", CFSTR("locale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = [SUUILocalizedStringDictionary alloc];
      v16[0] = self->_bundle;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SUUILocalizedStringDictionary initWithLocaleName:bundles:](v10, "initWithLocaleName:bundles:", v9, v11);
      v13 = self->_localizedStrings;
      self->_localizedStrings = v12;

    }
    localizedStrings = self->_localizedStrings;
  }
  -[SUUILocalizedStringDictionary localizedStringForKey:inTable:](localizedStrings, "localizedStringForKey:inTable:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)localizedStringForKey:(id)a3 inBundles:(id)a4
{
  return (id)objc_msgSend(a1, "localizedStringForKey:inBundles:inTable:", a3, a4, 0);
}

+ (id)localizedStringForKey:(id)a3 inBundles:(id)a4 inTable:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  SUUILocalizedStringDictionary *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SUUILocalizedStringDictionary initWithLocaleName:bundles:]([SUUILocalizedStringDictionary alloc], "initWithLocaleName:bundles:", v12, v8);
  -[SUUILocalizedStringDictionary localizedStringForKey:inTable:](v13, "localizedStringForKey:inTable:", v7, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)metricsPageContextForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    do
    {
      v5 = v4;
      -[NSMapTable objectForKey:](self->_metricsPageContexts, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parentViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v4 && !v6);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)modalDocumentViewControllerForDocument:(id)a3 options:(id)a4
{
  return 0;
}

- (NSArray)navigationHistory
{
  void *v2;
  void *v3;

  -[SUUIClientContext _navigationHistory](self, "_navigationHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)newLegacyStorePageViewControllerForURLResponse:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BEC8DB8]);
  objc_msgSend(v4, "setClientInterface:", self->_clientInterface);
  return v4;
}

- (id)previewViewControllerForViewElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  SUUIPreviewContainerViewController *v9;
  SUUIClientContextPreviewContainer *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("data-preview-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length")
    || (objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("AllowPreviewForAllElements")),
        v7,
        v8))
  {
    v9 = objc_alloc_init(SUUIPreviewContainerViewController);
    v10 = -[SUUIClientContextPreviewContainer initWithAppContext:clientContext:previewContainerViewController:]([SUUIClientContextPreviewContainer alloc], "initWithAppContext:clientContext:previewContainerViewController:", self->_scriptAppContext, self, v9);
    v13 = CFSTR("previewContainer");
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dispatchEvent:eventAttribute:canBubble:isCancelable:extraInfo:completionBlock:", CFSTR("preview"), CFSTR("onpreview"), 1, 1, v11, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)pushNavigationHistoryPageIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SUUIClientContext _navigationHistory](self, "_navigationHistory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 5)
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
  objc_msgSend(v4, "addObject:", v6);
  if (self->_navigationHistoryPersistenceKey)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, self->_navigationHistoryPersistenceKey);
    objc_msgSend(v5, "synchronize");

  }
}

- (void)setMetricsPageContext:(id)a3 forViewController:(id)a4
{
  id v6;
  NSMapTable *metricsPageContexts;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, a4);
  metricsPageContexts = self->_metricsPageContexts;
  if (v6)
  {
    if (!metricsPageContexts)
    {
      v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      v9 = self->_metricsPageContexts;
      self->_metricsPageContexts = v8;

      metricsPageContexts = self->_metricsPageContexts;
    }
    v10 = objc_loadWeakRetained(&location);
    -[NSMapTable setObject:forKey:](metricsPageContexts, "setObject:forKey:", v6, v10);
  }
  else
  {
    v10 = objc_loadWeakRetained(&location);
    -[NSMapTable removeObjectForKey:](metricsPageContexts, "removeObjectForKey:", v10);
  }

  objc_destroyWeak(&location);
}

- (BOOL)supportsRenderingVersion:(unsigned int)a3
{
  void *v4;
  void *v5;
  char v6;

  if (a3 == 0x80000)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Music"));

  return v6;
}

- (SSURLBag)URLBag
{
  SUUIURLBag *urlBag;
  void *v4;
  void *v5;
  SUUIURLBag *v6;
  SUUIURLBag *v7;

  urlBag = self->_urlBag;
  if (!urlBag)
  {
    objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SSVDefaultUserAgent();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, *MEMORY[0x24BEB2518]);

    v6 = -[SSURLBag initWithURLBagContext:]([SUUIURLBag alloc], "initWithURLBagContext:", v4);
    v7 = self->_urlBag;
    self->_urlBag = v6;

    urlBag = self->_urlBag;
  }
  return (SSURLBag *)urlBag;
}

- (SUUITrendingSearchProvider)trendingSearchProvider
{
  SUUITrendingSearchProvider *trendingSearchProvider;
  SUUITrendingSearchProvider *v4;
  SUUITrendingSearchProvider *v5;

  trendingSearchProvider = self->_trendingSearchProvider;
  if (!trendingSearchProvider)
  {
    v4 = -[SUUITrendingSearchProvider initWithClientContext:]([SUUITrendingSearchProvider alloc], "initWithClientContext:", self);
    v5 = self->_trendingSearchProvider;
    self->_trendingSearchProvider = v4;

    trendingSearchProvider = self->_trendingSearchProvider;
  }
  return trendingSearchProvider;
}

- (NSOperationQueue)resourceLoadQueue
{
  NSOperationQueue *resourceLoadQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  resourceLoadQueue = self->_resourceLoadQueue;
  if (!resourceLoadQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_resourceLoadQueue;
    self->_resourceLoadQueue = v4;

    -[NSOperationQueue setName:](self->_resourceLoadQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIClientContext.resourceLoadQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_resourceLoadQueue, "setMaxConcurrentOperationCount:", 8);
    resourceLoadQueue = self->_resourceLoadQueue;
  }
  return resourceLoadQueue;
}

- (void)clientInterface:(id)a3 dispatchOnPageResponseWithData:(id)a4 response:(id)a5
{
  -[SUUIClientContext sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:](self, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", 0, a4, a5, 0);
}

- (void)clientInterface:(id)a3 dispatchXEvent:(id)a4 completionBlock:(id)a5
{
  -[SUUIClientContext sendOnXEventWithDictionary:completionBlock:](self, "sendOnXEventWithDictionary:completionBlock:", a4, a5);
}

- (void)clientInterface:(id)a3 presentDialog:(id)a4
{
  id v6;
  SUUIStoreDialogController *dialogController;
  SUUIStoreDialogController *v8;
  SUUIStoreDialogController *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    dialogController = self->_dialogController;
    if (!dialogController)
    {
      v8 = objc_alloc_init(SUUIStoreDialogController);
      v9 = self->_dialogController;
      self->_dialogController = v8;

      dialogController = self->_dialogController;
    }
    -[SUUIStoreDialogController presentDialog:](dialogController, "presentDialog:", v6);
  }

}

- (id)scriptInterfaceForClientInterface:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUIClientContext _applicationController](self, "_applicationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "legacyScriptInterfaceForApplication:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_fallbackConfigurationDictionary
{
  return 0;
}

- (void)customizePurchase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SUUIURL *purchaseReferrerURL;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSString length](self->_additionalPurchaseParameters, "length"))
  {
    objc_msgSend(v4, "buyParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&%@"), v5, self->_additionalPurchaseParameters);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBuyParameters:", v6);

    }
  }
  purchaseReferrerURL = self->_purchaseReferrerURL;
  if (purchaseReferrerURL)
  {
    -[SUUIURL referrerApplicationName](purchaseReferrerURL, "referrerApplicationName");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forDownloadProperty:", v8, *MEMORY[0x24BEB23B8]);
    -[SUUIURL referrerURLString](self->_purchaseReferrerURL, "referrerURLString");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forDownloadProperty:", v9, *MEMORY[0x24BEB23C0]);
    objc_msgSend(v4, "buyParameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && v8 | v9)
    {
      v12 = (void *)objc_msgSend(v10, "mutableCopy");
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("&extRefApp=%@"), v14);

      }
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("&extRefUrl=%@"), v16);

      }
      objc_msgSend(v4, "setBuyParameters:", v12);

    }
  }
  if (self->_purchaseAffiliateIdentifier)
    objc_msgSend(v4, "setAffiliateIdentifier:");
  objc_msgSend(v4, "requestProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "mutableCopy");

  if (!v18)
    v18 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  if (self->_purchaseURLBagType)
    objc_msgSend(v18, "setURLBagType:");
  objc_msgSend(MEMORY[0x24BEC8B70], "currentClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientProvidedHeaders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v20, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forHTTPHeaderField:", v27, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v23);
  }

  objc_msgSend(v4, "setRequestProperties:", v18);
}

- (void)customizeSoftwarePurchase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SUUIURL *purchaseReferrerURL;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSString length](self->_additionalPurchaseParameters, "length"))
  {
    objc_msgSend(v4, "buyParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&%@"), v5, self->_additionalPurchaseParameters);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBuyParameters:", v6);

    }
  }
  purchaseReferrerURL = self->_purchaseReferrerURL;
  if (purchaseReferrerURL)
  {
    -[SUUIURL referrerApplicationName](purchaseReferrerURL, "referrerApplicationName");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SUUIURL referrerApplicationName](self->_purchaseReferrerURL, "referrerApplicationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReferrerName:", v9);

    -[SUUIURL referrerURLString](self->_purchaseReferrerURL, "referrerURLString");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setReferrerURL:", v10);
    objc_msgSend(v4, "buyParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && v8 | v10)
    {
      v13 = (void *)objc_msgSend(v11, "mutableCopy");
      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("&extRefApp=%@"), v15);

      }
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendFormat:", CFSTR("&extRefUrl=%@"), v17);

      }
      objc_msgSend(v4, "setBuyParameters:", v13);

    }
  }
  if (self->_purchaseAffiliateIdentifier)
    objc_msgSend(v4, "setAffiliateIdentifier:");
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BEC8B70], "currentClient");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "clientProvidedHeaders");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v20, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v27, v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v23);
  }

  objc_msgSend(v4, "setAdditionalHeaders:", v18);
}

- (BOOL)isManagedAppleID
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  return v4;
}

- (BOOL)isMultiUser
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMultiUser");

  return v3;
}

- (void)loadValueForConfigurationKey:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id location;
  _QWORD block[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[SUUIClientContext valueForConfigurationKey:](self, "valueForConfigurationKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__SUUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke;
      block[3] = &unk_2511F4930;
      v17 = v7;
      v16 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    -[SUUIClientContext URLBag](self, "URLBag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__SUUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_2;
    v10[3] = &unk_2511FA928;
    v10[4] = self;
    v11 = v6;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    objc_msgSend(v9, "loadWithCompletionBlock:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

uint64_t __66__SUUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __66__SUUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = a2;
    objc_msgSend((id)objc_opt_class(), "_configurationDictionaryWithBagDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "objectForKey:", a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__SUUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_3;
  v13[3] = &unk_2511FA900;
  v14 = v8;
  v9 = v8;
  objc_copyWeak(&v19, a1 + 7);
  v15 = a1[5];
  v10 = a1[6];
  v17 = v5;
  v18 = v10;
  v16 = v7;
  v11 = v5;
  v12 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v19);
}

uint64_t __66__SUUIClientContext_loadValueForConfigurationKey_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "_setValue:forConfigurationKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)loadValueForConfigurationKeys:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke;
  v22[3] = &unk_2511FA950;
  v22[4] = self;
  v10 = v8;
  v23 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v22);
  if (v7 && (v11 = objc_msgSend(v6, "count"), v11 == objc_msgSend(v10, "count")))
  {
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_2;
    block[3] = &unk_2511F4930;
    v21 = v7;
    v20 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_initWeak(&location, self);
    -[SUUIClientContext URLBag](self, "URLBag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_3;
    v13[3] = &unk_2511FA9C8;
    v13[4] = self;
    v14 = v6;
    v15 = v10;
    objc_copyWeak(&v17, &location);
    v16 = v7;
    objc_msgSend(v12, "loadWithCompletionBlock:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForConfigurationKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

uint64_t __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = a2;
    objc_msgSend((id)objc_opt_class(), "_configurationDictionaryWithBagDictionary:", v6);
    a2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_4;
  v17[3] = &unk_2511FA950;
  v18 = a2;
  v8 = *(void **)(a1 + 40);
  v19 = *(id *)(a1 + 48);
  v9 = a2;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_5;
  v12[3] = &unk_2511FA9A0;
  v13 = *(id *)(a1 + 48);
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v10 = *(id *)(a1 + 56);
  v14 = v5;
  v15 = v10;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

  objc_destroyWeak(&v16);
}

void __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, v4);

}

void __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_6;
  v4[3] = &unk_2511FA978;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_destroyWeak(&v5);
}

void __67__SUUIClientContext_loadValueForConfigurationKeys_completionBlock___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  if (a3)
  {
    v4 = (id *)(a1 + 32);
    v5 = a3;
    v6 = a2;
    WeakRetained = objc_loadWeakRetained(v4);
    objc_msgSend(WeakRetained, "_setValue:forConfigurationKey:", v5, v6);

  }
}

- (Class)moviePlayerViewControllerClass
{
  uint64_t v2;

  v2 = SUUIMediaPlayerFramework();
  return (Class)SUUIWeakLinkedClassForString(CFSTR("MPMoviePlayerViewController"), v2);
}

- (SSVPlatformContext)platformContext
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUIURLBag existingBagDictionary](self->_urlBag, "existingBagDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2050]), "initWithBagDictionary:", v3);
  }
  else
  {
    -[SUUIClientContext URLBag](self, "URLBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadWithCompletionBlock:", &__block_literal_global_36);

    v4 = 0;
  }

  return (SSVPlatformContext *)v4;
}

- (BOOL)isBootstrapScriptFallbackDisabled
{
  void *v2;
  char v3;

  -[SUUIClientContext existingBagValueForKey:](self, "existingBagValueForKey:", CFSTR("bootstrap-script-fallback-disabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)existingBagValueForKey:(id)a3
{
  SUUIURLBag *urlBag;
  id v4;
  void *v5;
  void *v6;

  urlBag = self->_urlBag;
  v4 = a3;
  -[SUUIURLBag existingBagDictionary](urlBag, "existingBagDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newLoadStoreURLOperationWithURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BDB74A0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:", v5);

  v7 = -[SUUIClientContext newLoadStoreURLOperationWithURLRequest:](self, "newLoadStoreURLOperationWithURLRequest:", v6);
  return v7;
}

- (id)newLoadStoreURLOperationWithURLRequest:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BEB2040];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURLRequest:", v5);

  -[SUUIClientContext URLBag](self, "URLBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithURLBag:", v7);

  objc_msgSend(v6, "setITunesStoreRequest:", 1);
  objc_msgSend(v6, "setMachineDataStyle:", 2);
  -[SUUIClientContext SAPSessionForVersion:](self, "SAPSessionForVersion:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSAPSession:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2068]), "initWithPolicyType:", 1);
  objc_msgSend(v6, "setSAPSignaturePolicy:", v9);

  return v6;
}

- (id)SAPSessionForVersion:(int64_t)a3
{
  if (a3 == 1)
    objc_msgSend(MEMORY[0x24BEB2028], "sharedPrimeSession");
  else
    objc_msgSend(MEMORY[0x24BEB2028], "sharedDefaultSession");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)sendApplicationDidEnterBackground
{
  -[IKAppContext evaluate:completionBlock:](self->_scriptAppContext, "evaluate:completionBlock:", &__block_literal_global_121, 0);
}

void __54__SUUIClientContext_sendApplicationDidEnterBackground__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toObjectOfClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendApplicationDidEnterBackground");
}

- (void)sendApplicationWillEnterForeground
{
  -[IKAppContext evaluate:completionBlock:](self->_scriptAppContext, "evaluate:completionBlock:", &__block_literal_global_125, 0);
}

void __55__SUUIClientContext_sendApplicationWillEnterForeground__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toObjectOfClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendApplicationWillEnterForeground");
}

- (void)sendOnPageResponseWithDocument:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IKAppContext *scriptAppContext;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  scriptAppContext = self->_scriptAppContext;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __88__SUUIClientContext_sendOnPageResponseWithDocument_data_URLResponse_performanceMetrics___block_invoke;
  v19[3] = &unk_2511F9768;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[IKAppContext evaluate:completionBlock:](scriptAppContext, "evaluate:completionBlock:", v19, 0);

}

void __88__SUUIClientContext_sendOnPageResponseWithDocument_data_URLResponse_performanceMetrics___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)sendOnXEventWithDictionary:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  IKAppContext *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[3];
  char v17;

  v6 = a3;
  v7 = a4;
  v8 = self->_scriptAppContext;
  if (v8)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v9 = MEMORY[0x24BDAC760];
    v17 = 0;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__SUUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke;
    v13[3] = &unk_2511FAA90;
    v15 = v16;
    v14 = v6;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __64__SUUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke_2;
    v10[3] = &unk_2511FAAB8;
    v11 = v7;
    v12 = v16;
    -[IKAppContext evaluate:completionBlock:](v8, "evaluate:completionBlock:", v13, v10);

    _Block_object_dispose(v16, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __64__SUUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "sendOnXEventWithDictionary:", *(_QWORD *)(a1 + 32));
}

uint64_t __64__SUUIClientContext_sendOnXEventWithDictionary_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

- (void)sendAppPreviewStateChanged:(BOOL)a3
{
  IKAppContext *scriptAppContext;
  _QWORD v4[4];
  BOOL v5;

  scriptAppContext = self->_scriptAppContext;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SUUIClientContext_sendAppPreviewStateChanged___block_invoke;
  v4[3] = &__block_descriptor_33_e19_v16__0__JSContext_8l;
  v5 = a3;
  -[IKAppContext evaluate:completionBlock:](scriptAppContext, "evaluate:completionBlock:", v4, 0);
}

void __48__SUUIClientContext_sendAppPreviewStateChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendAppPreviewStateChanged:", *(unsigned __int8 *)(a1 + 32));
}

- (void)sendApplicationWindowSizeDidUpdate:(CGSize)a3
{
  IKAppContext *scriptAppContext;
  _QWORD v4[4];
  CGSize v5;

  scriptAppContext = self->_scriptAppContext;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SUUIClientContext_sendApplicationWindowSizeDidUpdate___block_invoke;
  v4[3] = &__block_descriptor_48_e19_v16__0__JSContext_8l;
  v5 = a3;
  -[IKAppContext evaluate:completionBlock:](scriptAppContext, "evaluate:completionBlock:", v4, 0);
}

void __56__SUUIClientContext_sendApplicationWindowSizeDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendApplicationWindowSizeDidUpdate:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (int64_t)tabBarStyleForWidth:(double)a3
{
  if (SUUIUserInterfaceIdiom(self) != 1)
    return 0;
  if (SUUICompactThreshold_onceToken != -1)
    dispatch_once(&SUUICompactThreshold_onceToken, &__block_literal_global_452);
  return *(double *)&SUUICompactThreshold_threshold < a3;
}

+ (id)_configurationDictionaryWithBagDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("language"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("locale"));
    objc_msgSend(v3, "objectForKey:", CFSTR("isScheduledGiftingEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("cgift"));
    objc_msgSend(v3, "objectForKey:", CFSTR("isBuyingScheduledGiftCertificateEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) == 0)
      objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("mgift"));
    objc_msgSend(v3, "objectForKey:", CFSTR("storefront-header-suffix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("sfsuffix"));
    objc_msgSend(v3, "objectForKey:", CFSTR("itml-store"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v5;
      v11 = v9;
    }
    else
    {
      v11 = &stru_2511FF0C8;
      v10 = v5;
    }
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("appjs.v2"));
    objc_msgSend(v3, "objectForKey:", CFSTR("has-in-apps-notice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("inappnote"));
    objc_msgSend(v3, "objectForKey:", CFSTR("tabs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("tabs"));
    objc_msgSend(v3, "objectForKey:", CFSTR("itunes-stop-pages"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("itunes-stop-pages"));
    objc_msgSend(v3, "objectForKey:", CFSTR("isSponsoredAdsEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("isSponsoredAdsEnabled"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setAdditionalPurchaseParameters:(id)a3
{
  NSString *v4;
  NSString *additionalPurchaseParameters;

  if (self->_additionalPurchaseParameters != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    additionalPurchaseParameters = self->_additionalPurchaseParameters;
    self->_additionalPurchaseParameters = v4;

  }
}

- (void)_setPurchaseAffiliateIdentifier:(id)a3
{
  NSString *v4;
  NSString *purchaseAffiliateIdentifier;

  if (self->_purchaseAffiliateIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    purchaseAffiliateIdentifier = self->_purchaseAffiliateIdentifier;
    self->_purchaseAffiliateIdentifier = v4;

  }
}

- (void)_setPurchaseURLBagType:(int64_t)a3
{
  self->_purchaseURLBagType = a3;
}

- (void)_setValue:(id)a3 forConfigurationKey:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  NSDictionary *configurationDictionary;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (id)-[NSDictionary mutableCopy](self->_configurationDictionary, "mutableCopy");
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "setObject:forKey:", v11, v6);
  v8 = (NSDictionary *)objc_msgSend(v7, "copy");
  configurationDictionary = self->_configurationDictionary;
  self->_configurationDictionary = v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("SUUIClientContextConfigurationDidChangeNotification"), self);

}

- (id)_navigationHistory
{
  NSMutableArray *navigationHistory;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;

  navigationHistory = self->_navigationHistory;
  if (!navigationHistory)
  {
    if (!self->_navigationHistoryPersistenceKey)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayForKey:", self->_navigationHistoryPersistenceKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
      v7 = self->_navigationHistory;
      self->_navigationHistory = v6;

    }
    navigationHistory = self->_navigationHistory;
    if (!navigationHistory)
    {
LABEL_6:
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->_navigationHistory;
      self->_navigationHistory = v8;

      navigationHistory = self->_navigationHistory;
    }
  }
  return navigationHistory;
}

- (SUUIApplicationController)_applicationController
{
  return (SUUIApplicationController *)objc_loadWeakRetained((id *)&self->_applicationController);
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (NSString)metricsConfigurationIdentifier
{
  return self->_metricsConfigurationIdentifier;
}

- (void)setMetricsConfigurationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)navigationHistoryPersistenceKey
{
  return self->_navigationHistoryPersistenceKey;
}

- (void)setNavigationHistoryPersistenceKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SUUIURL)purchaseReferrerURL
{
  return self->_purchaseReferrerURL;
}

- (IKAppContext)_scriptAppContext
{
  return self->_scriptAppContext;
}

- (void)_setScriptAppContext:(id)a3
{
  objc_storeStrong((id *)&self->_scriptAppContext, a3);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setUserInterfaceIdiomOverride:(int64_t)a3
{
  self->_userInterfaceIdiomOverride = a3;
}

- (NSCache)placeholderImageCache
{
  return self->_placeholderImageCache;
}

@end
