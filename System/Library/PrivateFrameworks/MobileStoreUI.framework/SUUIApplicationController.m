@implementation SUUIApplicationController

+ (void)prepareForLaunch
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x2426A2860](a1, a2);
  +[SUUIMetricsAppLaunchEvent createPendingLaunchEvent](SUUIMetricsAppLaunchEvent, "createPendingLaunchEvent");
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_60);
  objc_msgSend(a1, "configurationPreloader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preloadConfigurationForPurpose:withCompletionBlock:", 0, &__block_literal_global_29);

  objc_autoreleasePoolPop(v3);
}

void __45__SUUIApplicationController_prepareForLaunch__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = v8;
    else
      v10 = v8 & 2;
    if (v10)
    {
      v13 = 138412290;
      v14 = v5;
      LODWORD(v12) = 12;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v13, v12);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog();
    }

    goto LABEL_14;
  }
  if (objc_msgSend(v4, "count"))
    +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_35);
LABEL_15:

}

+ (SUUIConfigurationPreloader)configurationPreloader
{
  void *v4;
  SUUIConfigurationPreloader *v5;
  void *v6;
  void *v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SUUIApplicationController.m"), 225, CFSTR("This property is main thread only."));

  }
  v4 = (void *)_SUUIApplicationControllerConfigurationPreloader;
  if (!_SUUIApplicationControllerConfigurationPreloader)
  {
    v5 = objc_alloc_init(SUUIConfigurationPreloader);
    v6 = (void *)_SUUIApplicationControllerConfigurationPreloader;
    _SUUIApplicationControllerConfigurationPreloader = (uint64_t)v5;

    v4 = (void *)_SUUIApplicationControllerConfigurationPreloader;
  }
  return (SUUIConfigurationPreloader *)v4;
}

void __45__SUUIApplicationController_prepareForLaunch__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "setMainTime:");

}

- (void)_reloadRootViewControllers
{
  objc_class *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *navigationDocumentControllers;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  SUUINavigationDocumentController *v19;
  SUUINavigationDocumentController *v20;
  uint64_t v21;
  char **v22;
  id v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SUUIURL *v32;
  void *v33;
  SUUIURL *v34;
  void *v35;
  void *v36;
  void *v37;
  NSArray *tabBarItems;
  unint64_t v39;
  void *v40;
  void *v41;
  SUUIModalDocumentController *modalDocumentController;
  void *v43;
  void *v44;
  void *v45;
  IKAppContext *scriptContext;
  id v47;
  void *v48;
  uint64_t v49;
  NSArray *obj;
  _QWORD v51[4];
  id v52;
  SUUIApplicationController *v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@]: Reload root view controllers (client context: %@)"), v4, self->_clientContext);

  v48 = (void *)-[NSMutableArray copy](self->_navigationDocumentControllers, "copy");
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  navigationDocumentControllers = self->_navigationDocumentControllers;
  self->_navigationDocumentControllers = v5;

  -[SUUIApplicationController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = self->_tabBarItems;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v57;
    v12 = &selRef_setCompactAdCardHairlineLayer_;
    do
    {
      v13 = 0;
      v49 = v10;
      do
      {
        if (*(_QWORD *)v57 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v13);
        objc_msgSend(v14, "customRootViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "customRootViewController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "conformsToProtocol:", v12[441]))
          {
            objc_msgSend(v16, "appNavigationController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setClientContext:", v7);
            objc_msgSend(v17, "setDelegate:", self);
            v18 = self->_navigationDocumentControllers;
          }
          else
          {
            v21 = v11;
            v22 = v12;
            v23 = v8;
            v24 = v7;
            v25 = self->_navigationDocumentControllers;
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v25;
            v7 = v24;
            v8 = v23;
            v12 = v22;
            v11 = v21;
            v10 = v49;
          }
          -[NSMutableArray addObject:](v18, "addObject:", v17);

          objc_msgSend(v14, "customRootViewController");
          v19 = (SUUINavigationDocumentController *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
        }
        else
        {
          v19 = -[SUUIApplicationController _newNavigationControllerWithTabBarItem:](self, "_newNavigationControllerWithTabBarItem:", v14);
          v20 = -[SUUINavigationDocumentController initWithNavigationController:]([SUUINavigationDocumentController alloc], "initWithNavigationController:", v19);
          -[SUUINavigationDocumentController setClientContext:](v20, "setClientContext:", v7);
          -[SUUINavigationDocumentController setDelegate:](v20, "setDelegate:", self);
          -[NSMutableArray addObject:](self->_navigationDocumentControllers, "addObject:", v20);
          -[SUUIApplicationController _ensureStackConsistencyForNavigationController:](self, "_ensureStackConsistencyForNavigationController:", v19);
          v16 = v19;
        }
        objc_msgSend(v8, "addObject:", v19);

        ++v13;
      }
      while (v10 != v13);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v10);
  }

  v26 = MEMORY[0x24BDAC760];
  if (self->_hidesTabBar)
  {
    -[SUUIApplicationController _navigationContainerViewController](self, "_navigationContainerViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentViewController:", v28);

    -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setViewControllers:animated:", 0, 0);
  }
  else
  {
    -[SUUIApplicationController _tabBarController](self, "_tabBarController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISimpleContainerViewController setContentViewController:](self->_navigationContainerViewController, "setContentViewController:", 0);
    objc_msgSend(v29, "setViewControllers:animated:", v8, 0);
    SUUITabBarControllerGetMoreNavigationController(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDelegate:", self);
    -[NSDictionary objectForKey:](self->_launchOptions, "objectForKey:", CFSTR("url"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = [SUUIURL alloc];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[SUUIURL initWithURL:](v32, "initWithURL:", v33);

      +[SUUIURLResolver tabIdentifierForURL:](SUUIURLResolver, "tabIdentifierForURL:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        v37 = v7;
        tabBarItems = self->_tabBarItems;
        v54[0] = v26;
        v54[1] = 3221225472;
        v54[2] = __55__SUUIApplicationController__reloadRootViewControllers__block_invoke;
        v54[3] = &unk_2511FD068;
        v55 = v35;
        v39 = -[NSArray indexOfObjectPassingTest:](tabBarItems, "indexOfObjectPassingTest:", v54);
        if (v39 < objc_msgSend(v8, "count"))
        {
          objc_msgSend(v8, "objectAtIndex:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setSelectedViewController:", v40);

        }
        v7 = v37;
      }

    }
    objc_msgSend(v29, "selectedViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v41);

  }
  modalDocumentController = self->_modalDocumentController;
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIModalDocumentController setRootViewController:](modalDocumentController, "setRootViewController:", v43);

  -[SUUIApplicationController tabBarController](self, "tabBarController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "selectedViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIApplicationController _updateOverlayNavigationController:](self, "_updateOverlayNavigationController:", v45);

  scriptContext = self->_scriptContext;
  v51[0] = v26;
  v51[1] = 3221225472;
  v51[2] = __55__SUUIApplicationController__reloadRootViewControllers__block_invoke_3;
  v51[3] = &unk_2511FB0F8;
  v52 = v48;
  v53 = self;
  v47 = v48;
  -[IKAppContext evaluate:completionBlock:](scriptContext, "evaluate:completionBlock:", &__block_literal_global_313, v51);

}

- (SUUIClientContext)clientContext
{
  SUUIClientContext *clientContext;
  void *v4;

  clientContext = self->_clientContext;
  if (!clientContext)
  {
    -[objc_class defaultContext](self->_clientContextClass, "defaultContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController setClientContext:](self, "setClientContext:", v4);

    clientContext = self->_clientContext;
  }
  return clientContext;
}

- (id)_newNavigationControllerWithTabBarItem:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  id v8;
  Class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (v7 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v7, "application:navigationControllerWithTabBarItem:", self, v4),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v9 = (Class *)0x24BEC8D58;
    if (self->_scriptLoadState != 4)
      v9 = (Class *)0x24BEBD7A0;
    v8 = objc_alloc_init(*v9);
    if (objc_msgSend(v4, "barTintStyle") == 1)
    {
      objc_msgSend(v8, "navigationBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBarStyle:", 1);

    }
  }
  objc_msgSend(v8, "setDelegate:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "section");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[SUUIClientContext clientInterface](self->_clientContext, "clientInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClientInterface:", v12);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8DA8]), "initWithClientInterface:sectionType:defaultPNGStyle:", v12, 0, 0);
      if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
      {
        objc_msgSend(MEMORY[0x24BEC8DA0], "defaultConfigurationWithClientInterface:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSearchFieldConfiguration:", v14);

      }
      objc_msgSend(v8, "setSection:", v13);

    }
  }
  if (self->_clientContext
    && (self->_scriptLoadState == 4 || objc_msgSend(v4, "alwaysCreatesRootViewController"))
    && (v15 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "rootViewControllerClass")), "initWithTabBarItem:", v4)) != 0)
  {
    v16 = (void *)v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "setClientContext:", self->_clientContext);
    objc_msgSend(v8, "pushViewController:animated:", v16, 0);
  }
  else
  {
    objc_msgSend(v8, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

  }
  objc_msgSend(v4, "underlyingTabBarItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTabBarItem:", v18);

  return v8;
}

- (void)_ensureStackConsistencyForNavigationController:(id)a3
{
  void *v4;
  UIViewController *v5;
  UIViewController *lastPoppedViewController;
  id v7;

  v7 = a3;
  self->_lastNavigationControllerOperation = objc_msgSend(v7, "lastOperation");
  -[SUUIApplicationController _documentControllerForNavigationController:](self, "_documentControllerForNavigationController:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", self->_lastNavigationControllerOperation, 0);
  if (self->_lastNavigationControllerOperation == 2)
  {
    objc_msgSend(v7, "disappearingViewController");
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    lastPoppedViewController = self->_lastPoppedViewController;
    self->_lastPoppedViewController = v5;
  }
  else
  {
    lastPoppedViewController = self->_lastPoppedViewController;
    self->_lastPoppedViewController = 0;
  }

}

- (id)_documentControllerForNavigationController:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  SUUINavigationDocumentController *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_navigationDocumentControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
        objc_msgSend(v10, "navigationController");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v13 = v10;

    if (v13)
      goto LABEL_16;
  }
  else
  {
LABEL_10:

  }
  -[SUUIModalDocumentController navigationDocumentForNavigationController:](self->_modalDocumentController, "navigationDocumentForNavigationController:", v4, (_QWORD)v16);
  v13 = (SUUINavigationDocumentController *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[SUUINavigationDocumentController navigationController](self->_transientNavigationDocument, "navigationController");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v4)
      v13 = self->_transientNavigationDocument;
    else
      v13 = 0;
  }
LABEL_16:

  return v13;
}

- (UITabBarController)tabBarController
{
  return &self->_tabBarController->super;
}

- (UIViewController)rootViewController
{
  if (self->_hidesTabBar)
    -[SUUIApplicationController _navigationContainerViewController](self, "_navigationContainerViewController");
  else
    -[SUUIApplicationController _tabBarController](self, "_tabBarController");
  return (UIViewController *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_tabBarController
{
  int64_t v3;
  id scrollingTabBarController;
  id *p_scrollingTabBarController;
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v3 = -[SUUIApplicationControllerOptions tabBarControllerStyle](self->_options, "tabBarControllerStyle");
  if (v3 == 1)
  {
    scrollingTabBarController = self->_scrollingTabBarController;
    if (!scrollingTabBarController)
    {
      p_scrollingTabBarController = (id *)&self->_scrollingTabBarController;
      v6 = -[SUUIApplicationController _scrollingTabBarControllerClass](self, "_scrollingTabBarControllerClass");
      goto LABEL_7;
    }
  }
  else
  {
    if (v3)
    {
      v9 = 0;
      return v9;
    }
    p_scrollingTabBarController = (id *)&self->_tabBarController;
    scrollingTabBarController = self->_tabBarController;
    if (!scrollingTabBarController)
    {
      v6 = -[SUUIApplicationController _tabBarControllerClass](self, "_tabBarControllerClass");
LABEL_7:
      v7 = objc_alloc_init(v6);
      v8 = *p_scrollingTabBarController;
      *p_scrollingTabBarController = v7;

      objc_msgSend(*p_scrollingTabBarController, "setDelegate:", self);
      scrollingTabBarController = *p_scrollingTabBarController;
    }
  }
  v9 = scrollingTabBarController;
  return v9;
}

- (unint64_t)tabBarControllerSupportedInterfaceOrientations:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "transientViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v3, "selectedViewController"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1)
    {
      v5 = 30;
    }
    else if (SUUIAllowsLandscapePhone())
    {
      v5 = 26;
    }
    else
    {
      v5 = 2;
    }
  }

  return v5;
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v4;
  objc_class *v5;
  void *v6;
  SUUIClientContext *clientContext;
  SUUIClientContext *v8;

  v4 = (SUUIClientContext *)a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@]: Set client context %@"), v6, v4);

  clientContext = self->_clientContext;
  self->_clientContext = v4;
  v8 = v4;

  SUUISetShouldReverseLayoutDirectionWithContext(self->_clientContext);
  -[SUUIClientContext _setApplicationController:](self->_clientContext, "_setApplicationController:", self);
  -[SUUIClientContext setPurchaseReferrerURL:](self->_clientContext, "setPurchaseReferrerURL:", self->_activationURL);

}

- (void)navigationDocumentController:(id)a3 requestsAccessToAppContextUsingBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __95__SUUIApplicationController_navigationDocumentController_requestsAccessToAppContextUsingBlock___block_invoke;
  v7[3] = &unk_2511F4930;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[SUUIApplicationController evaluateBlockWhenLoaded:](self, "evaluateBlockWhenLoaded:", v7);

}

- (void)evaluateBlockWhenLoaded:(id)a3
{
  void (**v4)(void);
  NSMutableArray *v5;
  NSMutableArray *whenLoadedBlocks;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void (**v10)(void);

  v4 = (void (**)(void))a3;
  v10 = v4;
  if ((unint64_t)(self->_scriptLoadState - 3) > 1)
  {
    if (!self->_whenLoadedBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      whenLoadedBlocks = self->_whenLoadedBlocks;
      self->_whenLoadedBlocks = v5;

      v4 = v10;
    }
    v7 = (void *)objc_msgSend(v4, "copy");
    v8 = self->_whenLoadedBlocks;
    v9 = _Block_copy(v7);
    -[NSMutableArray addObject:](v8, "addObject:", v9);

  }
  else
  {
    v4[2]();
  }

}

- (void)_updateOverlayNavigationController:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;

  -[SUUIApplicationController _overlayNavigationControllerForViewController:](self, "_overlayNavigationControllerForViewController:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = SUUIUserInterfaceIdiom(self->_clientContext) == 1;
  v4 = v12;
  v5 = !v5 || v12 == 0;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v10 = SUUICompactThreshold();

    if (v9 <= v10)
      v11 = v12;
    else
      v11 = 0;
    -[SUUIModalDocumentController setOverlayNavigationController:withTransitionCoordinator:](self->_modalDocumentController, "setOverlayNavigationController:withTransitionCoordinator:", v11, 0);
    v4 = v12;
  }

}

- (void)_tintTabBarWithViewController:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);

  if (v6 >= -[NSArray count](self->_tabBarItems, "count"))
  {
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "barTintStyle") == 1)
    {
      v8 = 2;
      v9 = 1;
    }
    else
    {
      v11 = objc_msgSend(v7, "barTintStyle");
      v8 = v11 == 0;
      if (v11)
        v9 = 0;
      else
        v9 = 3;
    }
    objc_msgSend(v7, "userInterfaceTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "setForcedUserInterfaceStyle:", v8);
  objc_msgSend(v14, "setNeedsUserInterfaceAppearanceUpdate");
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStatusBarStyle:", v9);

  objc_msgSend(v14, "tabBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v10);

}

- (Class)_tabBarControllerClass
{
  return (Class)objc_opt_class();
}

- (id)_overlayNavigationControllerForViewController:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    if (!objc_msgSend(v3, "conformsToProtocol:", &unk_257264CC8))
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "overlayNavigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (id)_existingTabBarController
{
  int64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[SUUIApplicationControllerOptions tabBarControllerStyle](self->_options, "tabBarControllerStyle");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = 304;
  }
  else
  {
    v4 = 248;
  }
  v5 = *(id *)((char *)&self->super.isa + v4);
  return v5;
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIApplicationController)initWithClientContextClass:(Class)a3 options:(id)a4
{
  id v6;
  SUUIApplicationController *v7;
  SUUIApplicationController *v8;
  uint64_t v9;
  SUUIApplicationControllerOptions *options;
  SUUIApplicationControllerOptions *v11;
  SUUIApplicationControllerOptions *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUIApplicationController;
  v7 = -[SUUIApplicationController init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_clientContextClass = a3;
    v9 = objc_msgSend(v6, "copy");
    options = v8->_options;
    v8->_options = (SUUIApplicationControllerOptions *)v9;

    if (!v8->_options)
    {
      v11 = objc_alloc_init(SUUIApplicationControllerOptions);
      v12 = v8->_options;
      v8->_options = v11;

    }
    v8->_indexOfLastTabNeedingContent = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__pageDidDisplayNotification_, CFSTR("SUUIApplicationPageDidDisplayNotification"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__storeFrontChangeNotification_, *MEMORY[0x24BEB21E8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__applicationWillEnterForeground_, *MEMORY[0x24BEBE008], 0);

  }
  return v8;
}

- (void)setTabBarItems:(id)a3
{
  NSArray *v4;
  NSArray *tabBarItems;

  if (self->_tabBarItems != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    tabBarItems = self->_tabBarItems;
    self->_tabBarItems = v4;

    -[SUUIApplicationController _reloadRootViewControllers](self, "_reloadRootViewControllers");
  }
}

+ (void)finishedWithConfigurationPreloader
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SUUIApplicationController.m"), 233, CFSTR("This method is main thread only."));

  }
  v4 = (void *)_SUUIApplicationControllerConfigurationPreloader;
  _SUUIApplicationControllerConfigurationPreloader = 0;

}

void __45__SUUIApplicationController_prepareForLaunch__block_invoke_34(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "setClientConfigurationLoadTime:");

}

- (SUUIApplicationController)init
{
  return -[SUUIApplicationController initWithClientContextClass:](self, "initWithClientContextClass:", objc_opt_class());
}

- (SUUIApplicationController)initWithClientContextClass:(Class)a3
{
  return -[SUUIApplicationController initWithClientContextClass:options:](self, "initWithClientContextClass:options:", a3, 0);
}

- (SUUIApplicationController)initWithClientContextClass:(Class)a3 tabBarControllerStyle:(int64_t)a4
{
  SUUIMutableApplicationControllerOptions *v7;
  SUUIApplicationController *v8;

  v7 = objc_alloc_init(SUUIMutableApplicationControllerOptions);
  -[SUUIMutableApplicationControllerOptions setTabBarControllerStyle:](v7, "setTabBarControllerStyle:", a4);
  v8 = -[SUUIApplicationController initWithClientContextClass:options:](self, "initWithClientContextClass:options:", a3, v7);

  return v8;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUUIApplicationPageDidDisplayNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x2511FF088, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB21E8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_navigationDocumentControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 != v10)
          objc_msgSend(v9, "setDelegate:", 0);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[SUUIClientContext _setApplicationController:](self->_clientContext, "_setApplicationController:", 0);
  -[SUUIClientContext _setScriptAppContext:](self->_clientContext, "_setScriptAppContext:", 0);
  -[SUUIModalDocumentController setDelegate:](self->_modalDocumentController, "setDelegate:", 0);
  -[SUUIModalDocumentController setModalSourceViewProvider:](self->_modalDocumentController, "setModalSourceViewProvider:", 0);
  -[SUUIModalDocumentController setNavigationControllerDelegate:](self->_modalDocumentController, "setNavigationControllerDelegate:", 0);
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SUUITabBarControllerGetMoreNavigationController(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", 0);
  objc_msgSend(v11, "setDelegate:", 0);
  -[SUUINavigationDocumentController setDelegate:](self->_transientNavigationDocument, "setDelegate:", 0);
  -[SUUIURLResolver setDelegate:](self->_urlResolver, "setDelegate:", 0);
  -[SUUIURLResolver setNavigationControllerDelegate:](self->_urlResolver, "setNavigationControllerDelegate:", 0);

  v13.receiver = self;
  v13.super_class = (Class)SUUIApplicationController;
  -[SUUIApplicationController dealloc](&v13, sel_dealloc);
}

+ (id)applicationOptionsWithLaunchOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  SUUIURL *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = *MEMORY[0x24BEBDFC0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBDFC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEBDFB8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBDFB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v7;
    objc_msgSend(a1, "_referrerAppForSourceApplication:launchURL:", v9, &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;

    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("refApp"));
    v7 = v11;
  }
  objc_msgSend(v5, "removeObjectForKey:", v8);
  if (v7)
  {
    v12 = -[SUUIURL initWithURL:]([SUUIURL alloc], "initWithURL:", v7);
    -[SUUIURL underlyingURL](v12, "underlyingURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("url"));

    objc_msgSend(v5, "removeObjectForKey:", v6);
  }
  v15 = *MEMORY[0x24BEBDFB0];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBDFB0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (void *)SUUIMobileCoreServicesFramework();
    v18 = *(id *)SUUIWeakLinkedSymbolForString("LSReferrerURLKey", v17);
    if (v18)
    {
      objc_msgSend(v16, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("refUrl"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "absoluteString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("refUrl"));

      }
    }

  }
  objc_msgSend(v5, "removeObjectForKey:", v15);
  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }

  return v5;
}

+ (id)_referrerAppForSourceApplication:(id)a3 launchURL:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v18;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService")))
  {
    v19 = a4;
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", *a4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v6;
    objc_msgSend(v6, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("SUUIServiceRefApp"));

          if (v15)
          {
            objc_msgSend(v13, "value");
            v16 = objc_claimAutoreleasedReturnValue();

            v5 = (id)v16;
          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v18, "setQueryItems:", v7);
    objc_msgSend(v18, "URL");
    *v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)application:(id)a3 didReceiveURL:(id)a4
{
  SUUIURL *v5;
  SUUIURL *activationURL;
  id v7;

  v7 = a4;
  v5 = (SUUIURL *)objc_msgSend(v7, "copy");
  activationURL = self->_activationURL;
  self->_activationURL = v5;

  self->_ignoreDidBecomeActive = 1;
  -[SUUIClientContext setPurchaseReferrerURL:](self->_clientContext, "setPurchaseReferrerURL:", v7);

}

- (void)applicationDidBecomeActive:(id)a3
{
  if (!self->_ignoreDidBecomeActive)
    -[SUUIApplicationController resumeApplicationWithOptions:](self, "resumeApplicationWithOptions:", 0);
}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t resignActiveTaskID;
  dispatch_time_t v10;
  _QWORD block[11];
  _QWORD v12[4];
  id v13;
  SUUIApplicationController *v14;

  v4 = a3;
  v5 = v4;
  v6 = *MEMORY[0x24BEBE030];
  if (self->_resignActiveTaskID != *MEMORY[0x24BEBE030])
  {
    objc_msgSend(v4, "endBackgroundTask:");
    self->_resignActiveTaskID = v6;
  }
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke;
  v12[3] = &unk_2511F46D0;
  v13 = v5;
  v14 = self;
  v8 = v5;
  self->_resignActiveTaskID = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("SUUIApplicationController.resignActive"), v12);
  block[6] = v7;
  block[7] = 3221225472;
  block[8] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke_2;
  block[9] = &unk_2511F4908;
  block[10] = self;
  SSDialogGetDaemonDialogState();
  resignActiveTaskID = self->_resignActiveTaskID;
  v10 = dispatch_time(0, 5000000000);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke_4;
  block[3] = &unk_2511F5818;
  block[4] = self;
  block[5] = resignActiveTaskID;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__SUUIApplicationController_applicationWillResignActive___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192));
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192) = *MEMORY[0x24BEBE030];
  return result;
}

void __57__SUUIApplicationController_applicationWillResignActive___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__SUUIApplicationController_applicationWillResignActive___block_invoke_3;
  v2[3] = &unk_2511F82E0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __57__SUUIApplicationController_applicationWillResignActive___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWillResignActiveWithDialogState:", *(unsigned __int8 *)(a1 + 40));
}

_QWORD *__57__SUUIApplicationController_applicationWillResignActive___block_invoke_4(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[24] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_finishWillResignActiveWithDialogState:", 0);
  return result;
}

- (void)hideStatusOverlayForProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SUUIStatusOverlayProvider *v6;
  void *v7;
  UIViewController *floatingStatusOverlayViewController;
  SUUIStatusOverlayProvider *v9;

  v4 = a4;
  v6 = (SUUIStatusOverlayProvider *)a3;
  if (v6 && self->_statusOverlayProvider == v6)
  {
    self->_statusOverlayProvider = 0;
    v9 = v6;

    if (self->_floatingStatusOverlayViewController)
    {
      -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v7, 0, v4);

      floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
      self->_floatingStatusOverlayViewController = 0;

    }
    else
    {
      -[SUUIApplicationController _removeStatusOverlayFromAllNavigationControllers](self, "_removeStatusOverlayFromAllNavigationControllers");
    }
    v6 = v9;
  }

}

- (void)loadApplication
{
  -[SUUIApplicationController loadApplicationWithOptions:](self, "loadApplicationWithOptions:", 0);
}

- (void)loadApplicationWithOptions:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  NSDictionary *v20;
  NSDictionary *launchOptions;
  SUUIModalDocumentController *v22;
  SUUIModalDocumentController *modalDocumentController;
  SUUIModalDocumentController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SUUIExplicitRestrictionAlertController *WeakRetained;
  id v32;
  int v33;
  dispatch_time_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD block[5];
  id v39;
  id location;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@] Load application with options %@"), v6, v4);

  -[SUUIApplicationController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "mutableCopy");
  if (!v8)
    v8 = (void *)objc_opt_new();
  +[SUUIMetricsAppLaunchEvent processStartTime](SUUIMetricsAppLaunchEvent, "processStartTime");
  v10 = v9;
  if (v9 < 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    v10 = v12;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)(v10 * 1000.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("launchTime"));

  v14 = (void *)MEMORY[0x24BDBCE70];
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  objc_msgSend(v14, "su_dictionaryWithSize:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("windowSize"));

  v20 = (NSDictionary *)objc_msgSend(v8, "copy");
  launchOptions = self->_launchOptions;
  self->_launchOptions = v20;

  v22 = objc_alloc_init(SUUIModalDocumentController);
  modalDocumentController = self->_modalDocumentController;
  self->_modalDocumentController = v22;

  -[SUUIModalDocumentController setClientContext:](self->_modalDocumentController, "setClientContext:", v7);
  -[SUUIModalDocumentController setDelegate:](self->_modalDocumentController, "setDelegate:", self);
  -[SUUIModalDocumentController setModalSourceViewProvider:](self->_modalDocumentController, "setModalSourceViewProvider:", self);
  -[SUUIModalDocumentController setNavigationControllerDelegate:](self->_modalDocumentController, "setNavigationControllerDelegate:", self);
  v24 = self->_modalDocumentController;
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIModalDocumentController setRootViewController:](v24, "setRootViewController:", v25);

  +[SUUINearMeController sharedController](SUUINearMeController, "sharedController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClientContext:", v7);

  +[SUUIFamilyCircleController sharedController](SUUIFamilyCircleController, "sharedController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setClientContext:", v7);

  objc_msgSend(MEMORY[0x24BEB2010], "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setCustomURLProtocols:", v29);

  objc_msgSend(MEMORY[0x24BDB7498], "registerClass:", objc_opt_class());
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = objc_msgSend(v30, "launchedToTest");

  if ((_DWORD)v29)
    objc_msgSend(MEMORY[0x24BDB7498], "registerClass:", objc_opt_class());
  if (!v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "configurationPreloader");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_4;
    v36[3] = &unk_2511F9E00;
    objc_copyWeak(&v37, &location);
    objc_msgSend(v35, "preloadConfigurationForPurpose:withCompletionBlock:", 1, v36);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  -[SUUIApplicationController _loadApplicationScript](self, "_loadApplicationScript");
  WeakRetained = (SUUIExplicitRestrictionAlertController *)objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_11;
  v32 = objc_loadWeakRetained((id *)&self->_delegate);
  v33 = objc_msgSend(v32, "shouldShowExplicitRestrictionAlertOnLaunch");

  if (v33)
  {
    WeakRetained = -[SUUIExplicitRestrictionAlertController initWithClientContext:]([SUUIExplicitRestrictionAlertController alloc], "initWithClientContext:", v7);
    -[SUUIExplicitRestrictionAlertController presentExplicitRestrictionAlertIfNeededOfType:completionBlock:](WeakRetained, "presentExplicitRestrictionAlertIfNeededOfType:completionBlock:", 0, 0);
LABEL_11:

  }
  objc_initWeak(&location, self);
  v34 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke;
  block[3] = &unk_2511F6980;
  block[4] = self;
  objc_copyWeak(&v39, &location);
  dispatch_after(v34, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
LABEL_14:

}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x2426A2860]();
  objc_msgSend((id)objc_opt_class(), "configurationPreloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_2;
  v4[3] = &unk_2511F9E00;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v3, "preloadConfigurationForPurpose:withCompletionBlock:", 2, v4);
  objc_destroyWeak(&v5);

  objc_autoreleasePoolPop(v2);
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_3;
    v5[3] = &unk_2511F6980;
    v6 = v3;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
    objc_destroyWeak(&v7);

  }
}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  SUUIClientContext *v4;

  v1 = (id *)a1;
  v4 = -[SUUIClientContext initWithConfigurationDictionary:]([SUUIClientContext alloc], "initWithConfigurationDictionary:", *(_QWORD *)(a1 + 32));
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "_reloadTabBarWithClientContext:", v4);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend((id)objc_opt_class(), "finishedWithConfigurationPreloader");

}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  _QWORD block[4];
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v7);
  v9 = WeakRetained;
  if (v5)
  {
    objc_msgSend(WeakRetained, "_setClientContextWithDictionary:", v5);

    +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_85);
  }
  else
  {
    objc_msgSend(WeakRetained, "_failReloadWithError:", v6);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_6;
  block[3] = &unk_2511F53F8;
  objc_copyWeak(&v11, v7);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v11);

}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setRequiredBlockingBagLoad:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  objc_msgSend(v2, "setClientConfigurationLoadTime:");

}

void __56__SUUIApplicationController_loadApplicationWithOptions___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend((id)objc_opt_class(), "finishedWithConfigurationPreloader");

}

- (void)recordMetricsEvent:(id)a3 flushImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  SUUIMetricsController *metricsController;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  SUUIClientContext *clientContext;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  metricsController = self->_metricsController;
  if (metricsController)
  {
    SUUIMetricsWindowOrientationForInterfaceOrientation(objc_msgSend(v7, "statusBarOrientation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setWindowOrientation:](metricsController, "setWindowOrientation:", v10);

    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "flushImmediately");
      objc_msgSend(v6, "originalTime");
      objc_msgSend(v6, "setOriginalTime:", v11 + 1.0);
      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v6);
      objc_msgSend((id)objc_opt_class(), "flushImmediately");
    }
    else
    {
      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v6);
    }
  }
  else if (self->_clientContext)
  {
    v12 = *MEMORY[0x24BEBE030];
    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke;
    v22[3] = &unk_2511F5818;
    v14 = v7;
    v23 = v14;
    v24 = v12;
    v15 = objc_msgSend(v14, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("SUUIApplicationController.recordMetricsEvent"), v22);
    clientContext = self->_clientContext;
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke_2;
    v17[3] = &unk_2511FCF80;
    v17[4] = self;
    v18 = v14;
    v21 = v4;
    v19 = v6;
    v20 = v15;
    -[SUUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", v17);

  }
}

uint64_t __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

void __65__SUUIApplicationController_recordMetricsEvent_flushImmediately___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v4 + 136);
  v5 = (id *)(v4 + 136);
  v6 = v7;
  if (!v7)
  {
    objc_storeStrong(v5, a2);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  SUUIMetricsWindowOrientationForInterfaceOrientation(objc_msgSend(*(id *)(a1 + 40), "statusBarOrientation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWindowOrientation:", v8);

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend((id)objc_opt_class(), "flushImmediately");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "recordEvent:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend((id)objc_opt_class(), "flushImmediately");
  objc_msgSend(*(id *)(a1 + 40), "endBackgroundTask:", *(_QWORD *)(a1 + 56));

}

- (void)resumeApplicationWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__SUUIApplicationController_resumeApplicationWithOptions___block_invoke;
    v8[3] = &unk_2511FB0A8;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

  }
  else
  {
    -[IKAppContext resumeWithOptions:](self->_scriptContext, "resumeWithOptions:", v4);
  }

}

uint64_t __58__SUUIApplicationController_resumeApplicationWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "resumeWithOptions:", *(_QWORD *)(a1 + 40));
}

- (void)suspendApplicationWithOptions:(id)a3
{
  -[IKAppContext suspendWithOptions:](self->_scriptContext, "suspendWithOptions:", a3);
}

- (id)selectTabWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *tabBarItems;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  SUUIApplicationController *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__91;
  v26 = __Block_byref_object_dispose__91;
  v27 = 0;
  if (!self->_hidesTabBar)
  {
    -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    tabBarItems = self->_tabBarItems;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__SUUIApplicationController_selectTabWithIdentifier___block_invoke;
    v16[3] = &unk_2511FCFA8;
    v17 = v4;
    v8 = v10;
    v18 = v8;
    v5 = v9;
    v20 = self;
    v21 = &v22;
    v19 = v5;
    -[NSArray enumerateObjectsUsingBlock:](tabBarItems, "enumerateObjectsUsingBlock:", v16);
    if (!v23[5])
    {
      objc_msgSend(v5, "selectedViewController");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v23[5];
      v23[5] = v12;

    }
    -[SUUIApplicationController _dispatchTabBarOnSelect](self, "_dispatchTabBarOnSelect");
    -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v23[5]);
    -[SUUIApplicationController _updateOverlayNavigationController:](self, "_updateOverlayNavigationController:", v23[5]);

    goto LABEL_7;
  }
  -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(v5, "navigationController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v23[5];
    v23[5] = v7;
LABEL_7:

  }
  v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __53__SUUIApplicationController_selectTabWithIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  void *v9;
  void *v10;

  objc_msgSend(a2, "tabIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count") > a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "selectedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        objc_msgSend(*(id *)(a1 + 48), "setSelectedViewController:", v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 128), "popAllDocuments");
      }

    }
    *a4 = 1;
  }
}

- (void)showErrorViewWithTitle:(id)a3 message:(id)a4
{
  -[SUUIApplicationController showErrorViewWithTitle:message:buttonTitle:buttonAction:](self, "showErrorViewWithTitle:message:buttonTitle:buttonAction:", a3, a4, 0, 0);
}

- (void)showErrorViewWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 buttonAction:(id)a6
{
  const __CFString *v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;
  const __CFString *v18;
  void *v19;
  SUUILaunchErrorViewController *v20;
  __CFString *v21;

  v10 = (const __CFString *)a4;
  v11 = (objc_class *)MEMORY[0x24BEBDBB0];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = [v11 alloc];
  v16 = (void *)objc_msgSend(v15, "initWithFrame:title:style:", v14, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  if (v13)
    v17 = v10 == 0;
  else
    v17 = 0;
  if (v17)
    v18 = &stru_2511FF0C8;
  else
    v18 = v10;
  v21 = (__CFString *)v18;
  objc_msgSend(v16, "setMessage:");
  objc_msgSend(v16, "setButtonTitle:", v13);

  objc_msgSend(v16, "setButtonAction:", v12);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v19);

  v20 = objc_alloc_init(SUUILaunchErrorViewController);
  -[SUUILaunchErrorViewController setView:](v20, "setView:", v16);
  -[SUUIApplicationController showTransientViewController:](self, "showTransientViewController:", v20);

}

- (void)showErrorViewForLaunchFailure
{
  uint64_t v3;
  void *v4;
  SUUIClientContext *v5;
  SUUIClientContext *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  _QWORD v11[5];

  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke;
  v11[3] = &unk_2511F47C0;
  v11[4] = self;
  -[SUUIApplicationController evaluateBlockWhenLoaded:](self, "evaluateBlockWhenLoaded:", v11);
  objc_initWeak(&location, self);
  SUUIErrorDocumentTitle(self->_clientContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_clientContext;
  v6 = v5;
  if (v5)
    -[SUUIClientContext localizedStringForKey:](v5, "localizedStringForKey:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_2;
  v8[3] = &unk_2511F53F8;
  objc_copyWeak(&v9, &location);
  -[SUUIApplicationController showErrorViewWithTitle:message:buttonTitle:buttonAction:](self, "showErrorViewWithTitle:message:buttonTitle:buttonAction:", v4, 0, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke(uint64_t a1)
{
  id v2;

  v2 = +[SUUIMetricsUtilities newErrorPageEvent](SUUIMetricsUtilities, "newErrorPageEvent");
  objc_msgSend(v2, "setPageType:", CFSTR("SUUIApplicationController"));
  objc_msgSend(*(id *)(a1 + 32), "recordMetricsEvent:flushImmediately:", v2, 0);

}

void __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD v3[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_reloadApplication");
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_3;
    v3[3] = &unk_2511F47C0;
    v3[4] = v2;
    objc_msgSend(v2, "evaluateBlockWhenLoaded:", v3);
  }

}

void __58__SUUIApplicationController_showErrorViewForLaunchFailure__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = +[SUUIMetricsUtilities newErrorRetryClickEvent](SUUIMetricsUtilities, "newErrorRetryClickEvent");
  objc_msgSend(v2, "setPageType:", CFSTR("SUUIApplicationController"));
  objc_msgSend(*(id *)(a1 + 32), "recordMetricsEvent:flushImmediately:", v2, 0);

}

- (void)showExternalURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUUIApplicationController *v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "valueForQueryParameter:", CFSTR("referrer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referrerApplicationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || !v5)
  {

  }
  else if (!objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("siri")))
  {
    objc_msgSend(v4, "setReferrerApplicationName:", CFSTR("com.apple.Siri"));
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SUUIApplicationController_showExternalURL___block_invoke;
  v8[3] = &unk_2511F5128;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v9 = v7;
  v10 = self;
  -[SUUIApplicationController _attemptAMSURLHandlingIfPossibleForExternalURL:fallback:](self, "_attemptAMSURLHandlingIfPossibleForExternalURL:fallback:", v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __45__SUUIApplicationController_showExternalURL___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "_shouldUseLegacyURLHandlingForExternalURL:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = *(_QWORD **)(a1 + 40);
    if (v5[14])
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) != 0)
        return;
      v5 = *(_QWORD **)(a1 + 40);
    }
    objc_msgSend(v5, "_legacyResolveExternalURL:", *(_QWORD *)(a1 + 32));
    return;
  }
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_launchOptionsWithURL:", *(_QWORD *)(a1 + 32));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "addEntriesFromDictionary:", v11);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(v9 + 104);
    *(_QWORD *)(v9 + 104) = v8;
  }
  else
  {
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "resumeApplicationWithOptions:", v11);
  }

}

- (void)showStatusOverlayUsingProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SUUIStatusOverlayProvider *v7;
  SUUIStatusOverlayProvider *statusOverlayProvider;
  void *v9;
  void *v10;
  SUUIStatusOverlayProvider *v11;

  v4 = a4;
  v7 = (SUUIStatusOverlayProvider *)a3;
  statusOverlayProvider = self->_statusOverlayProvider;
  if (!v7)
  {
    v11 = 0;
    -[SUUIApplicationController hideStatusOverlayForProvider:animated:](self, "hideStatusOverlayForProvider:animated:", statusOverlayProvider, v4);
    goto LABEL_5;
  }
  if (statusOverlayProvider != v7)
  {
    v11 = v7;
    objc_storeStrong((id *)&self->_statusOverlayProvider, a3);
    -[SUUIApplicationController _activeNavigationController](self, "_activeNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController _showStatusOverlayForNavigationController:viewController:animated:](self, "_showStatusOverlayForNavigationController:viewController:animated:", v9, v10, v4);

LABEL_5:
    v7 = v11;
  }

}

- (void)showTransientViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIApplicationController _transientNavigationDocument](self, "_transientNavigationDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v5, "ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", 3, 0);
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewControllers:animated:", v7, 0);

    objc_msgSend(v5, "ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", 3, 1);
  }
  else
  {
    objc_msgSend(v5, "setStackItems:animated:", MEMORY[0x24BDBD1A8], 0);
  }
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransientViewController:animated:", v6, 0);

  -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v6);
}

- (void)setMescalPrimeEnabledForXHRRequests:(BOOL)a3
{
  IKAppContext *scriptContext;

  self->_mescalPrimeEnabledForXHRRequests = a3;
  scriptContext = self->_scriptContext;
  if (scriptContext)
    -[IKAppContext setMescalPrimeEnabledForXHRRequests:](scriptContext, "setMescalPrimeEnabledForXHRRequests:");
}

- (void)updateTabBarWithItems:(id)a3 animated:(BOOL)a4
{
  -[SUUIApplicationController updateTabBarWithItems:animated:completion:](self, "updateTabBarWithItems:animated:completion:", a3, a4, 0);
}

- (void)updateTabBarWithItems:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  NSMutableArray *v12;
  NSMutableArray *navigationDocumentControllers;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  unint64_t v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  SUUINavigationDocumentController *v30;
  NSArray *v31;
  NSArray *tabBarItems;
  void *v33;
  void *v34;
  IKAppContext *scriptContext;
  id v36;
  id v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v38 = a4;
  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v39 = a5;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@]: Update tab bar items (client context: %@) %@"), v9, self->_clientContext, v7);

  v10 = (void *)-[NSMutableArray copy](self->_navigationDocumentControllers, "copy");
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  navigationDocumentControllers = self->_navigationDocumentControllers;
  self->_navigationDocumentControllers = v12;

  -[SUUIApplicationController clientContext](self, "clientContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    v40 = v10;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v18, "customRootViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "customRootViewController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "conformsToProtocol:", &unk_257264D88))
          {
            objc_msgSend(v20, "appNavigationController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setClientContext:", v41);
            objc_msgSend(v21, "setDelegate:", self);
            v22 = self->_navigationDocumentControllers;
          }
          else
          {
            v24 = self->_navigationDocumentControllers;
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v24;
          }
          -[NSMutableArray addObject:](v22, "addObject:", v21);

          objc_msgSend(v18, "customRootViewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v25);
        }
        else
        {
          v23 = -[NSArray indexOfObject:](self->_tabBarItems, "indexOfObject:", v18);
          if (v23 >= objc_msgSend(v10, "count"))
          {
            v20 = 0;
          }
          else
          {
            objc_msgSend(v10, "objectAtIndex:", v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v20, "navigationController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v20, "clientContext");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
              objc_msgSend(v20, "setClientContext:", v41);
            -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v23);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "underlyingTabBarItem");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setUnderlyingTabBarItem:", v28);

            -[NSMutableArray addObject:](self->_navigationDocumentControllers, "addObject:", v20);
            objc_msgSend(v11, "addObject:", v25);
            v10 = v40;
          }
          else
          {
            v29 = -[SUUIApplicationController _newNavigationControllerWithTabBarItem:](self, "_newNavigationControllerWithTabBarItem:", v18);
            if (v29)
            {
              v30 = -[SUUINavigationDocumentController initWithNavigationController:]([SUUINavigationDocumentController alloc], "initWithNavigationController:", v29);
              -[SUUINavigationDocumentController setClientContext:](v30, "setClientContext:", v41);
              -[SUUINavigationDocumentController setDelegate:](v30, "setDelegate:", self);
              -[NSMutableArray addObject:](self->_navigationDocumentControllers, "addObject:", v30);
              objc_msgSend(v11, "addObject:", v29);

              v10 = v40;
            }

          }
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v15);
  }

  v31 = (NSArray *)objc_msgSend(obj, "copy");
  tabBarItems = self->_tabBarItems;
  self->_tabBarItems = v31;

  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setViewControllers:animated:", v11, v38);

  -[SUUITabBarController selectedViewController](self->_tabBarController, "selectedViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v34);

  scriptContext = self->_scriptContext;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke;
  v45[3] = &unk_2511FCFD0;
  v46 = v39;
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke_2;
  v43[3] = &unk_2511F4908;
  v44 = v10;
  v36 = v10;
  v37 = v39;
  -[IKAppContext evaluate:completionBlock:](scriptContext, "evaluate:completionBlock:", v45, v43);

}

void __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TabBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendOnUpdateWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__SUUIApplicationController_updateTabBarWithItems_animated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

- (Class)_JSITunesStoreClass
{
  return (Class)objc_opt_class();
}

- (Class)_scrollingTabBarControllerClass
{
  return (Class)objc_opt_class();
}

- (void)appContext:(id)a3 didCompletePurchase:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SUUIApplicationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "application:didCompletePurchase:", self, v6);

}

- (void)appContext:(id)a3 didCompleteSoftwarePurchase:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SUUIApplicationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "application:didCompleteSoftwarePurchase:", self, v6);

}

- (void)appContext:(id)a3 didExitWithOptions:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v5 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BEBE030];
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__SUUIApplicationController_appContext_didExitWithOptions___block_invoke;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = v7;
    v7 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.ios.StoreKitUIService.openURL"), v12);

  }
  -[SUUIApplicationController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "application:didStopWithOptions:", self, v5);
  if (objc_msgSend(v6, "length"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
    SUUIMetricsOpenSensitiveURL(v10, 0);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endBackgroundTask:", v7);

  }
}

void __59__SUUIApplicationController_appContext_didExitWithOptions___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

- (void)appContext:(id)a3 didFailWithError:(id)a4
{
  IKAppContext *scriptContext;
  void *v6;
  id v7;

  scriptContext = self->_scriptContext;
  v7 = a4;
  -[IKAppContext appScriptFallbackHandler](scriptContext, "appScriptFallbackHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SUUIApplicationController _failWithError:](self, "_failWithError:", v7);
}

- (void)appContext:(id)a3 didStartWithOptions:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  NSDictionary *launchOptions;
  SUUIURL *legacyLaunchURL;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@] Context %@ did start with options %@"), v9, v7, v6);

  self->_scriptLoadState = 3;
  -[SUUIApplicationController _fireBlocksAfterLoad](self, "_fireBlocksAfterLoad");
  launchOptions = self->_launchOptions;
  self->_launchOptions = 0;

  legacyLaunchURL = self->_legacyLaunchURL;
  self->_legacyLaunchURL = 0;

  if (self->_indexOfLastTabNeedingContent != 0x7FFFFFFFFFFFFFFFLL)
    -[SUUIApplicationController _dispatchTabBarOnNeedsContentForTabAtIndex:](self, "_dispatchTabBarOnNeedsContentForTabAtIndex:");
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_174_0);
}

void __60__SUUIApplicationController_appContext_didStartWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "setBootstrapEndTime:");

}

- (void)appContext:(id)a3 didStopWithOptions:(id)a4
{
  int64_t scriptLoadState;
  void *v6;
  uint64_t v7;
  void *v8;
  _SUUIApplicationShutdownHelper *shutdownHelper;
  id v10;

  v10 = a4;
  -[SUUIApplicationController _removeObserversForReloadNotifications](self, "_removeObserversForReloadNotifications");
  scriptLoadState = self->_scriptLoadState;
  if (scriptLoadState == 5)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "applicationState") == 2)
    {
      self->_reloadApplicationOnForegroundNotification = 1;
      -[SUUIApplicationController _invalidateApplication](self, "_invalidateApplication");
      v7 = *MEMORY[0x24BEBDF80];
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeDefaultImage:forScreen:", v7, v8);

    }
    else
    {
      -[SUUIApplicationController _reloadApplication](self, "_reloadApplication");
    }
    -[_SUUIApplicationShutdownHelper stop](self->_shutdownHelper, "stop");
    shutdownHelper = self->_shutdownHelper;
    self->_shutdownHelper = 0;

  }
  else if (scriptLoadState == 6)
  {
    -[SUUIApplicationController _invalidateApplication](self, "_invalidateApplication");
    -[_SUUIApplicationShutdownHelper stop](self->_shutdownHelper, "stop");
    v6 = self->_shutdownHelper;
    self->_shutdownHelper = 0;
  }
  else
  {
    -[SUUIApplicationController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "application:didStopWithOptions:", self, v10);
    else
      -[SUUIApplicationController _reloadApplication](self, "_reloadApplication");
  }

}

- (void)appContext:(id)a3 evaluateAppJavaScriptInContext:(id)a4
{
  id v6;
  id v7;
  SUUIJSApplication *v8;
  SUUIJSTabBar *v9;
  id v10;
  void *v11;
  SUUIJSModalDocumentController *v12;
  SUUIJSModalDocumentController *v13;
  SUUIJSTelephony *v14;
  SUUIJSImageColorAnalyzer *v15;
  SUUIJSImageColorAnalyzer *v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = -[SUUIJSApplication initWithAppContext:applicationController:]([SUUIJSApplication alloc], "initWithAppContext:applicationController:", v6, self);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("App"));

  v9 = -[SUUIJSTabBar initWithAppContext:controller:]([SUUIJSTabBar alloc], "initWithAppContext:controller:", v6, self);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("TabBar"));

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__91;
  v34 = __Block_byref_object_dispose__91;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__91;
  v28 = __Block_byref_object_dispose__91;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__91;
  v22 = __Block_byref_object_dispose__91;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__SUUIApplicationController_appContext_evaluateAppJavaScriptInContext___block_invoke;
  v17[3] = &unk_2511FD018;
  v17[4] = self;
  v17[5] = &v30;
  v17[6] = &v24;
  v17[7] = &v18;
  objc_msgSend(v6, "evaluateDelegateBlockSync:", v17);
  v10 = objc_alloc(-[SUUIApplicationController _JSITunesStoreClass](self, "_JSITunesStoreClass"));
  v11 = (void *)objc_msgSend(v10, "initWithAppContext:clientContext:", v6, v31[5]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("itms"));

  v12 = [SUUIJSModalDocumentController alloc];
  v13 = -[SUUIJSModalDocumentController initWithAppContext:modalDocumentController:](v12, "initWithAppContext:modalDocumentController:", v6, v19[5]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("modal"));

  v14 = -[SUUIJSTelephony initWithAppContext:]([SUUIJSTelephony alloc], "initWithAppContext:", v6);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("Telephony"));

  v15 = [SUUIJSImageColorAnalyzer alloc];
  v16 = -[SUUIJSImageColorAnalyzer initWithAppContext:clientContext:](v15, "initWithAppContext:clientContext:", v6, v31[5]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("ImageColorAnalyzer"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)v25[5], "application:evaluateAppJavaScriptInContext:JSContext:", self, v6, v7);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

void __71__SUUIApplicationController_appContext_evaluateAppJavaScriptInContext___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 128));
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4
{
  -[SUUIApplicationController appContext:needsReloadWithUrgency:options:](self, "appContext:needsReloadWithUrgency:options:", a3, a4, 0);
}

- (void)appContext:(id)a3 needsReloadWithUrgency:(unint64_t)a4 options:(id)a5
{
  uint64_t v7;

  if (self->_scriptContext == a3)
  {
    if (-[SUUIApplicationControllerOptions supportsFullApplicationReload](self->_options, "supportsFullApplicationReload"))
    {
      if (a4 == 1)
      {
        self->_stopApplicationOnBackgroundNotification = 1;
      }
      else if (!a4)
      {
        v7 = objc_opt_class();
        NSLog(CFSTR("%@: Reloading app immediately"), v7);
        -[SUUIApplicationController _stopScriptContextForReload](self, "_stopScriptContextForReload");
      }
    }
    else
    {
      NSLog(CFSTR("Skipping full application reload. That feature is not supported in this application."));
    }
  }
}

- (void)appContextNeedsRestart:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEBE030];
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__SUUIApplicationController_appContextNeedsRestart___block_invoke;
  v13[3] = &unk_2511F5818;
  v6 = v3;
  v14 = v6;
  v15 = v4;
  v7 = objc_msgSend(v6, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("SUUIApplicationController.restartApp"), v13);
  objc_msgSend(v6, "suspend");
  v8 = objc_alloc_init(MEMORY[0x24BEB1DA8]);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __52__SUUIApplicationController_appContextNeedsRestart___block_invoke_2;
  v10[3] = &unk_2511F5F88;
  v11 = v6;
  v12 = v7;
  v9 = v6;
  objc_msgSend(v8, "restartApplication:", v10);

}

uint64_t __52__SUUIApplicationController_appContextNeedsRestart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__SUUIApplicationController_appContextNeedsRestart___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(a1 + 40));
}

- (void)appContext:(id)a3 setPreviewOverlayDocument:(id)a4 withOptions:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  SUUIPreviewDocumentController *previewDocumentController;
  SUUIPreviewDocumentController *v12;
  void *v13;
  SUUIPreviewDocumentController *v14;
  SUUIPreviewDocumentController *v15;
  SUUIPreviewDocumentController *v16;
  void *v17;
  _BOOL4 v18;
  char v19;
  void *v20;
  UIViewController *v21;
  UIViewController *v22;
  UIViewController *floatingStatusOverlayViewController;
  UIViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v28 = a4;
  v7 = a5;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  if (v28)
  {
    objc_msgSend(v28, "templateElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "elementType") == 91)
    {
      v9 = v28;
    }
    else
    {
      NSLog(CFSTR("Invalid preview document template: %@"), v10);

      v10 = 0;
      v9 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  v29 = v9;
  previewDocumentController = self->_previewDocumentController;
  if (previewDocumentController)
  {
    objc_msgSend(v8, "removeObserver:name:object:", self, 0x2511FF088, self->_previewDocumentController);
    v12 = self->_previewDocumentController;
    self->_previewDocumentController = 0;

  }
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v14 = -[SUUIPreviewDocumentController initWithDocument:]([SUUIPreviewDocumentController alloc], "initWithDocument:", v29);
    v15 = self->_previewDocumentController;
    self->_previewDocumentController = v14;

    v16 = self->_previewDocumentController;
    -[SUUIApplicationController clientContext](self, "clientContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPreviewDocumentController setClientContext:](v16, "setClientContext:", v17);

    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__previewDocumentIsActiveChangeNotification_, 0x2511FF088, self->_previewDocumentController);
    v18 = -[SUUIPreviewDocumentController isPreviewActive](self->_previewDocumentController, "isPreviewActive");
    if (previewDocumentController)
      v19 = 1;
    else
      v19 = v18;
    if (self->_floatingStatusOverlayViewController)
    {
      if (v18)
      {
        objc_msgSend(v13, "traitCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIPreviewDocumentController overlayViewControllerWithBackgroundStyle:](self->_previewDocumentController, "overlayViewControllerWithBackgroundStyle:", objc_msgSend(v20, "userInterfaceStyle") != 1);
        v21 = (UIViewController *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }
      floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
      self->_floatingStatusOverlayViewController = v21;
      v24 = v21;

      SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v13, self->_floatingStatusOverlayViewController, 1);
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("playsImmediately"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v25, "BOOLValue")
      && -[SUUIApplicationController _playPreviewForPreviewTemplate:](self, "_playPreviewForPreviewTemplate:", v10))
    {
      -[SUUIApplicationController _activeNavigationController](self, "_activeNavigationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIApplicationController _showStatusOverlayForNavigationController:viewController:animated:](self, "_showStatusOverlayForNavigationController:viewController:animated:", v26, v27, 1);

    }
    if ((v19 & 1) != 0)
LABEL_26:
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SUUIApplicationControllerPreviewOverlayDidChangeNotification"), self, 0);
  }
  else
  {
    if (self->_floatingStatusOverlayViewController)
    {
      SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v13, 0, 1);
      v22 = self->_floatingStatusOverlayViewController;
      self->_floatingStatusOverlayViewController = 0;

    }
    if (previewDocumentController)
      goto LABEL_26;
  }

}

- (id)deviceConfigForContext:(id)a3
{
  SUUIAppDeviceConfig *deviceConfig;
  SUUIAppDeviceConfig *v5;
  SUUIAppDeviceConfig *v6;

  deviceConfig = self->_deviceConfig;
  if (!deviceConfig)
  {
    v5 = objc_alloc_init(SUUIAppDeviceConfig);
    v6 = self->_deviceConfig;
    self->_deviceConfig = v5;

    deviceConfig = self->_deviceConfig;
  }
  return deviceConfig;
}

- (id)navigationControllerForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!self->_hidesTabBar)
    goto LABEL_4;
  -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {

LABEL_4:
    v5 = 0;
  }

  return v5;
}

- (id)presentationViewControllerForAppContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SUUIApplicationController rootViewController](self, "rootViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

- (id)activeDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SUUIModalDocumentController documents](self->_modalDocumentController, "documents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    if (self->_hidesTabBar)
    {
      -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        v4 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v5, "documents");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray lastObject](v7, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transientViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[SUUINavigationDocumentController documents](self->_transientNavigationDocument, "documents");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = self->_navigationDocumentControllers;
      v4 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v4)
      {
        v12 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v4; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v21);
            v15 = objc_claimAutoreleasedReturnValue();
            if (v14 == (void *)v15)
            {

            }
            else
            {
              v16 = (void *)v15;
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v14, "navigationController");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18 == v5
                  || objc_msgSend(v5, "conformsToProtocol:", &unk_257264D88)
                  && (objc_msgSend(v5, "appNavigationController"),
                      v19 = (void *)objc_claimAutoreleasedReturnValue(),
                      v19,
                      v19 == v14))
                {
                  objc_msgSend(v14, "documents");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "lastObject");
                  v4 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_6;
                }
              }
            }
          }
          v4 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v4)
            continue;
          break;
        }
      }
    }
LABEL_6:

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v4;
}

- (id)appIdentifier
{
  return CFSTR("com.apple.iTunesStoreUI.ITML");
}

- (BOOL)appIsTrusted
{
  return 1;
}

- (id)appJSURL
{
  return self->_applicationScriptURL;
}

- (BOOL)appJSURLTrusted
{
  return 1;
}

- (id)appLaunchParams
{
  return self->_launchOptions;
}

- (id)localStorage
{
  SUUITransientAppDataStorage *v3;
  IKAppDataStoring *localStorage;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IKAppDataStoring *v12;
  IKAppDataStoring *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_localStorage)
  {
    if (-[SUUIApplicationControllerOptions useTransientStorageForTests](self->_options, "useTransientStorageForTests"))
    {
      v3 = objc_alloc_init(SUUITransientAppDataStorage);
      localStorage = self->_localStorage;
      self->_localStorage = (IKAppDataStoring *)v3;

    }
    else
    {
      NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15[1] = v8;
        v15[2] = CFSTR("com.apple.iTunesStoreUI.localStorage");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("plist"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (IKAppDataStoring *)objc_msgSend(objc_alloc(MEMORY[0x24BE51930]), "initWithFilePath:identifier:", v11, CFSTR("com.apple.iTunesStoreUI.localStorage"));
        v13 = self->_localStorage;
        self->_localStorage = v12;

      }
    }
  }
  return self->_localStorage;
}

- (BOOL)shouldIgnoreJSValidation
{
  return 1;
}

- (id)vendorIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifierForVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)vendorStorage
{
  SUUITransientAppDataStorage *v3;
  IKAppDataStoring *vendorStorage;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IKAppDataStoring *v12;
  IKAppDataStoring *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_vendorStorage)
  {
    if (-[SUUIApplicationControllerOptions useTransientStorageForTests](self->_options, "useTransientStorageForTests"))
    {
      v3 = objc_alloc_init(SUUITransientAppDataStorage);
      vendorStorage = self->_vendorStorage;
      self->_vendorStorage = (IKAppDataStoring *)v3;

    }
    else
    {
      NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15[1] = v8;
        v15[2] = CFSTR("com.apple.iTunesStoreUI.vendorStorage");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("plist"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (IKAppDataStoring *)objc_msgSend(objc_alloc(MEMORY[0x24BE51930]), "initWithFilePath:identifier:", v11, CFSTR("com.apple.iTunesStoreUI.vendorStorage"));
        v13 = self->_vendorStorage;
        self->_vendorStorage = v12;

      }
    }
  }
  return self->_vendorStorage;
}

- (int64_t)modalDocumentController:(id)a3 barStyleForStackItem:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(a4, "presentationType", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", 0x251212EA8);

  if (!v6)
    return 0;
  if (self->_hidesTabBar)
  {
    -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v7, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v7, "selectedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
    }
    else
    {
      objc_msgSend(v11, "navigationController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

  }
  if (v9)
  {
    objc_msgSend(v9, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "barStyle");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)modalDocumentControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[SUUIApplicationController _needsStatusOverlay](self, "_needsStatusOverlay", a3))
  {
    -[SUUIApplicationController rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "bounds");
    if (-[SUUIApplicationController _usesFloatingStatusOverlayForWidth:](self, "_usesFloatingStatusOverlayForWidth:", v6))
    {
      -[SUUIApplicationController _showFloatingStatusOverlayAnimated:](self, "_showFloatingStatusOverlayAnimated:", 1);
    }

  }
  -[SUUIApplicationController _activeNavigationController](self, "_activeNavigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "suui_viewWillAppear:", 1);
  -[SUUIApplicationController activeDocument](self, "activeDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "onAppear");

}

- (void)getModalSourceViewForElementIdentifier:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (!self->_hidesTabBar)
  {
    -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v7, "selectedViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    SUUIViewControllerGetTopMostViewController(v9);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(v7, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topViewController");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (void *)v10;

    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_257211EF0) & 1) != 0)
    objc_msgSend(v11, "getModalSourceViewForElementIdentifier:completionBlock:", v12, v6);
  else
    v6[2](v6, 0);

}

- (id)jsNavigationDocumentForNavigationController:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIApplicationController.m"), 1316, CFSTR("This is invalid."));

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__91;
  v22 = __Block_byref_object_dispose__91;
  v23 = 0;
  -[SUUIClientContext _scriptAppContext](self->_clientContext, "_scriptAppContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__SUUIApplicationController_jsNavigationDocumentForNavigationController_inContext___block_invoke;
  v15[3] = &unk_2511FD040;
  v17 = &v18;
  v15[4] = self;
  v10 = v7;
  v16 = v10;
  objc_msgSend(v9, "evaluateDelegateBlockSync:", v15);

  v11 = v19[5];
  if (v11)
  {
    -[SUUIApplicationController jsNavigationDocumentForNavigationDocumentController:inContext:](self, "jsNavigationDocumentForNavigationDocumentController:inContext:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __83__SUUIApplicationController_jsNavigationDocumentForNavigationController_inContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_documentControllerForNavigationController:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)jsNavigationDocumentForNavigationDocumentController:(id)a3 inContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUIApplicationController.m"), 1335, CFSTR("This is invalid."));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TabBar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toObjectOfClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__91;
  v30 = __Block_byref_object_dispose__91;
  v31 = 0;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[SUUIApplicationController _transientNavigationController](self, "_transientNavigationController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v27[5];
    v27[5] = v11;

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__SUUIApplicationController_jsNavigationDocumentForNavigationDocumentController_inContext___block_invoke;
    block[3] = &unk_2511F4720;
    block[4] = self;
    block[5] = &v26;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
  }
  if ((id)v27[5] == v7)
  {
    objc_msgSend(v10, "transientTab");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationDocument");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "tabs");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "navigationDocument", (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "navigationControllerDelegate");
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18 == v7)
          {

            goto LABEL_17;
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v32, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_17:

  }
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __91__SUUIApplicationController_jsNavigationDocumentForNavigationDocumentController_inContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_transientNavigationController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __95__SUUIApplicationController_navigationDocumentController_requestsAccessToAppContextUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_scriptAppContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)navigationDocumentStackDidChange:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "documents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[SUUIApplicationController _sendDidDisplayFirstPageIfNecessary](self, "_sendDidDisplayFirstPageIfNecessary");
}

- (void)tabBarController:(id)a3 willDisplayViewController:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a3, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  -[SUUIApplicationController _dispatchTabBarOnNeedsContentForTabAtIndex:](self, "_dispatchTabBarOnNeedsContentForTabAtIndex:", v8);
}

- (void)URLResolver:(id)a3 didFinishWithResult:(BOOL)a4
{
  SUUIURLResolver *urlResolver;

  -[SUUIURLResolver setDelegate:](self->_urlResolver, "setDelegate:", 0, a4);
  -[SUUIURLResolver setNavigationControllerDelegate:](self->_urlResolver, "setNavigationControllerDelegate:", 0);
  urlResolver = self->_urlResolver;
  self->_urlResolver = 0;

}

- (BOOL)URLResolver:(id)a3 shouldPerformDefaultActionForURL:(id)a4
{
  id v6;
  id v7;
  IKAppContext *scriptContext;
  NSDictionary *launchOptions;
  NSDictionary *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  scriptContext = self->_scriptContext;
  if (scriptContext)
  {
    launchOptions = self->_launchOptions;
    if (launchOptions)
    {
      v10 = (NSDictionary *)-[NSDictionary mutableCopy](launchOptions, "mutableCopy");
      objc_msgSend(v7, "underlyingURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDictionary setValue:forKey:](v10, "setValue:forKey:", v12, CFSTR("url"));
      v13 = self->_launchOptions;
      self->_launchOptions = v10;
    }
    else
    {
      -[SUUIApplicationController _launchOptionsWithURL:](self, "_launchOptionsWithURL:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUUIURLResolver tabIdentifierForURL:](SUUIURLResolver, "tabIdentifierForURL:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v12, "removeObjectForKey:", CFSTR("url"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("selectedTabId"));
      }
      -[SUUIApplicationController resumeApplicationWithOptions:](self, "resumeApplicationWithOptions:", v12);
    }

  }
  return scriptContext == 0;
}

- (void)URLResolver:(id)a3 showTransientViewController:(id)a4
{
  -[SUUIApplicationController showTransientViewController:](self, "showTransientViewController:", a4);
}

- (void)URLResolver:(id)a3 showURL:(id)a4 withTabIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTransientViewController:animated:", 0, 0);

  -[SUUIApplicationController selectTabWithIdentifier:](self, "selectTabWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (id)objc_msgSend(v9, "popToRootViewControllerAnimated:", 0);
    objc_msgSend(v9, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "showExternalURL:", v13);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  UIViewController *lastPoppedViewController;
  id v11;

  v6 = a3;
  if (-[SUUIApplicationController _sendNativeBackButtonMetricEvents](self, "_sendNativeBackButtonMetricEvents")
    && self->_lastNavigationControllerOperation == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    objc_msgSend(v7, "setActionType:", *MEMORY[0x24BEB28C8]);
    objc_msgSend(v7, "setTargetType:", *MEMORY[0x24BEB2968]);
    objc_msgSend(v7, "setTargetIdentifier:", CFSTR("back"));
    if (self->_lastPoppedViewController
      && ((objc_opt_respondsToSelector() & 1) == 0
        ? (v8 = 0)
        : (-[UIViewController activeMetricsController](self->_lastPoppedViewController, "activeMetricsController"),
           v8 = (void *)objc_claimAutoreleasedReturnValue()),
          -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", self->_lastPoppedViewController), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "setPageContext:", v9), v9, v8))
    {
      objc_msgSend(v8, "recordEvent:", v7);

    }
    else
    {
      -[SUUIApplicationController recordMetricsEvent:flushImmediately:](self, "recordMetricsEvent:flushImmediately:", v7, 0);
    }

  }
  -[SUUIApplicationController _documentControllerForNavigationController:](self, "_documentControllerForNavigationController:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", self->_lastNavigationControllerOperation, 1);
  -[SUUIModalDocumentController ensureOverlayNavigationControllerStackConsistencyForNavigationController:](self->_modalDocumentController, "ensureOverlayNavigationControllerStackConsistencyForNavigationController:", v6);

  lastPoppedViewController = self->_lastPoppedViewController;
  self->_lastPoppedViewController = 0;

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  IKAppContext *scriptContext;
  _QWORD v13[4];
  char v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SUUIApplicationController _ensureStackConsistencyForNavigationController:](self, "_ensureStackConsistencyForNavigationController:", v8);
  if (-[SUUIApplicationController _needsStatusOverlay](self, "_needsStatusOverlay"))
    -[SUUIApplicationController _showStatusOverlayForNavigationController:viewController:animated:](self, "_showStatusOverlayForNavigationController:viewController:animated:", v8, v9, v5);
  +[SUUINavigationControllerAssistant assistantForNavigationController:clientContext:](SUUINavigationControllerAssistant, "assistantForNavigationController:clientContext:", v8, self->_clientContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "willShowViewController:animated:", v9, v5);
  if (self->_lastNavigationControllerOperation == 2)
  {
    v11 = objc_msgSend(v8, "isInteractiveTransition");
    scriptContext = self->_scriptContext;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__SUUIApplicationController_navigationController_willShowViewController_animated___block_invoke;
    v13[3] = &__block_descriptor_33_e19_v16__0__JSContext_8l;
    v14 = v11;
    -[IKAppContext evaluate:completionBlock:](scriptContext, "evaluate:completionBlock:", v13, 0);
  }

}

void __82__SUUIApplicationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("itms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendOnNavigationStackWillPop:", *(unsigned __int8 *)(a1 + 32));
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a3, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "supportedInterfaceOrientations");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
    {
      v5 = 30;
    }
    else if (SUUIAllowsLandscapePhone())
    {
      v5 = 26;
    }
    else
    {
      v5 = 2;
    }
  }

  return v5;
}

- (void)tabBarController:(id)a3 didEndCustomizingViewControllers:(id)a4 changed:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *navigationDocumentControllers;
  uint64_t v16;
  NSArray *tabBarItems;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSArray *v22;
  NSArray *v23;
  void *v24;
  char v25;
  id v26;
  id obj;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (v5)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = MEMORY[0x24BDAC760];
      v12 = *(_QWORD *)v32;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
          navigationDocumentControllers = self->_navigationDocumentControllers;
          v30[0] = v11;
          v30[1] = 3221225472;
          v30[2] = __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke;
          v30[3] = &unk_2511FA778;
          v30[4] = v14;
          v16 = -[NSMutableArray indexOfObjectPassingTest:](navigationDocumentControllers, "indexOfObjectPassingTest:", v30);
          if (v16 != 0x7FFFFFFFFFFFFFFFLL
            || (tabBarItems = self->_tabBarItems,
                v29[0] = v11,
                v29[1] = 3221225472,
                v29[2] = __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke_2,
                v29[3] = &unk_2511FD068,
                v29[4] = v14,
                v16 = -[NSArray indexOfObjectPassingTest:](tabBarItems, "indexOfObjectPassingTest:", v29),
                v16 != 0x7FFFFFFFFFFFFFFFLL))
          {
            -[NSMutableArray objectAtIndex:](self->_navigationDocumentControllers, "objectAtIndex:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v8, "addObject:", v18);

            -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v19);

          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }

    v20 = self->_navigationDocumentControllers;
    self->_navigationDocumentControllers = v8;
    v21 = v8;

    v22 = (NSArray *)objc_msgSend(v28, "copy");
    v23 = self->_tabBarItems;
    self->_tabBarItems = v22;

    -[IKAppContext evaluate:completionBlock:](self->_scriptContext, "evaluate:completionBlock:", &__block_literal_global_242, 0);
    -[SUUIApplicationController delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
      objc_msgSend(v24, "applicationDidCustomizeTabBarItems:", self);

    v7 = v26;
  }

}

BOOL __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == *(void **)(a1 + 32);

  }
  return v6;
}

BOOL __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "customRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __87__SUUIApplicationController_tabBarController_didEndCustomizingViewControllers_changed___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TabBar"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toObjectOfClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendOnUpdate");
}

- (void)tabBarController:(id)a3 didReselectViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[SUUIApplicationController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "indexOfObjectIdenticalTo:", v6);
  if (v9 < -[NSArray count](self->_tabBarItems, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "application:didReselectTabBarItem:", self, v10);

  }
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  objc_msgSend(v24, "allViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_21;
  v9 = v8;
  SUUITabBarControllerGetMoreNavigationController(v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (v11 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v10), v9 >= v11))
  {
    if (v9 <= v11)
      goto LABEL_8;
    -[NSMutableArray objectAtIndex:](self->_navigationDocumentControllers, "objectAtIndex:", v9 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v23)
    {
      v14 = v12;
      v15 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_navigationDocumentControllers, "objectAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v13)
    {
      v14 = v12;
      v15 = 0;
LABEL_6:
      objc_msgSend(v14, "setMoreNavigationController:", v15);
    }
  }

LABEL_8:
  -[SUUIApplicationController _dispatchTabBarOnSelect](self, "_dispatchTabBarOnSelect");
  -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v6);
  -[SUUIApplicationController _overlayNavigationControllerForViewController:](self, "_overlayNavigationControllerForViewController:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v6, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[SUUIApplicationController _needsStatusOverlay](self, "_needsStatusOverlay"))
  {
    objc_msgSend(v16, "topViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController _showStatusOverlayForNavigationController:viewController:animated:](self, "_showStatusOverlayForNavigationController:viewController:animated:", v16, v17, 0);

  }
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1 && v16)
  {
    -[SUUIApplicationController rootViewController](self, "rootViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "bounds");
    if (v20 > SUUICompactThreshold())
    {
      -[SUUIModalDocumentController presentOverlayViewControllersFromNavigationController:](self->_modalDocumentController, "presentOverlayViewControllersFromNavigationController:", v16);

      v16 = 0;
    }
    -[SUUIModalDocumentController setOverlayNavigationController:withTransitionCoordinator:](self->_modalDocumentController, "setOverlayNavigationController:withTransitionCoordinator:", v16, 0);

  }
  -[SUUIApplicationController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < -[NSArray count](self->_tabBarItems, "count") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "application:didSelectTabBarItem:", self, v22);

  }
LABEL_21:

}

- (BOOL)tabBarController:(id)a3 shouldFallbackToRootForController:(id)a4
{
  id v4;
  uint64_t v5;
  char v6;

  v4 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "topViewController");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v6 = objc_msgSend(v4, "isEditing");

  return v6 ^ 1;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  int64_t scriptLoadState;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "containsTransientViewControllerOnly") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    scriptLoadState = self->_scriptLoadState;
    if (scriptLoadState == 1)
    {
      -[SUUIApplicationController _retryAfterFailure](self, "_retryAfterFailure");
    }
    else if (scriptLoadState == 4)
    {
      -[SUUIApplicationController _recordTabBarMetricsEventToSelectViewController:](self, "_recordTabBarMetricsEventToSelectViewController:", v7);
    }
    -[SUUIApplicationController setUserInterfaceOverrideOnTabBarController:forViewController:](self, "setUserInterfaceOverrideOnTabBarController:forViewController:", v6, v7);
    v8 = 1;
  }

  return v8;
}

- (void)setUserInterfaceOverrideOnTabBarController:(id)a3 forViewController:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v11 = a3;
  objc_msgSend(v11, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6);

  if (v8 >= -[NSArray count](self->_tabBarItems, "count"))
  {
    v10 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "barTintStyle") == 1)
      v10 = 2;
    else
      v10 = objc_msgSend(v9, "barTintStyle") == 0;

  }
  objc_msgSend(v11, "setForcedUserInterfaceStyle:", v10);
  objc_msgSend(v11, "setNeedsUserInterfaceAppearanceUpdate");

}

- (void)tabBarController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;
  UIViewController *floatingStatusOverlayViewController;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char v25;
  char v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  char v31;
  char isKindOfClass;
  void *v33;
  char v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  double v43;
  double v44;
  BOOL v45;
  BOOL v46;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  v11 = self->_floatingStatusOverlayViewController != 0;
  v12 = -[SUUIApplicationController _usesFloatingStatusOverlayForWidth:](self, "_usesFloatingStatusOverlayForWidth:", width);
  if (-[SUUIApplicationController _needsStatusOverlay](self, "_needsStatusOverlay") && !v12)
  {
    SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v9, 0, objc_msgSend(v10, "isAnimated"));
    floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
    self->_floatingStatusOverlayViewController = 0;

  }
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __93__SUUIApplicationController_tabBarController_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v40[3] = &unk_2511FD0B0;
  v40[4] = self;
  v43 = width;
  v44 = height;
  v45 = v11;
  v46 = v12;
  v14 = v9;
  v41 = v14;
  v15 = v10;
  v42 = v15;
  objc_msgSend(v15, "animateAlongsideTransition:completion:", 0, v40);
  -[SUUIApplicationController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "application:willTransitionToSize:withTransitionCoordinator:", self, v15, width, height);
  objc_msgSend(v14, "selectedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIApplicationController clientContext](self, "clientContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = objc_msgSend(v18, "tabBarStyleForWidth:", v21);

  -[SUUIApplicationController clientContext](self, "clientContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "tabBarStyleForWidth:", width);

  v25 = v24 == 0;
  v26 = v22 == 0;
  v39 = v16;
  if (objc_msgSend(v17, "conformsToProtocol:", &unk_257264CC8))
  {
    v25 = objc_msgSend(v17, "documentViewControllerIsCompactForWidth:", width);
    -[SUUIApplicationController rootViewController](self, "rootViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bounds");
    v26 = objc_msgSend(v17, "documentViewControllerIsCompactForWidth:", v29);

  }
  objc_msgSend(v17, "presentedViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == v24)
    v31 = v26 ^ v25 ^ 1;
  else
    v31 = 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((v31 & 1) == 0 && (isKindOfClass & 1) == 0)
  {
    -[SUUIApplicationController delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_respondsToSelector();

    if ((v34 & 1) == 0
      || (-[SUUIApplicationController delegate](self, "delegate"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = objc_msgSend(v35, "application:shouldDismissPopoverOnTraitCollectionChange:", self, v30),
          v35,
          v36))
    {
      if (v30 && objc_msgSend(v30, "modalPresentationStyle") == 7)
        objc_msgSend(v30, "dismissViewControllerAnimated:completion:", 0, 0);
    }
  }
  -[SUUIApplicationController _overlayNavigationControllerForViewController:](self, "_overlayNavigationControllerForViewController:", v17);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1 && v37)
  {
    if (width <= SUUICompactThreshold())
      v38 = v37;
    else
      v38 = 0;
    -[SUUIModalDocumentController setOverlayNavigationController:withTransitionCoordinator:](self->_modalDocumentController, "setOverlayNavigationController:withTransitionCoordinator:", v38, v15);
  }

}

void __93__SUUIApplicationController_tabBarController_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sendApplicationWindowSizeDidUpdate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "_needsStatusOverlay")
    && *(unsigned __int8 *)(a1 + 72) != *(unsigned __int8 *)(a1 + 73))
  {
    v2 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 73))
    {
      objc_msgSend(v2, "_removeStatusOverlayFromAllNavigationControllers");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "navigationController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUUINavigationControllerAssistant existingAssistantForNavigationController:](SUUINavigationControllerAssistant, "existingAssistantForNavigationController:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setStatusOverlayProvider:", 0);
      objc_msgSend(*(id *)(a1 + 40), "allViewControllers");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");
      objc_msgSend(*(id *)(a1 + 40), "viewControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v5 > v7)
      {
        SUUITabBarControllerGetMoreNavigationController(*(void **)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUINavigationControllerAssistant existingAssistantForNavigationController:](SUUINavigationControllerAssistant, "existingAssistantForNavigationController:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setStatusOverlayProvider:", 0);

      }
      objc_msgSend(*(id *)(a1 + 32), "_showFloatingStatusOverlayAnimated:", objc_msgSend(*(id *)(a1 + 48), "isAnimated"));
    }
    else
    {
      objc_msgSend(v2, "_activeNavigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_11:

        return;
      }
      v15 = v10;
      +[SUUINavigationControllerAssistant assistantForNavigationController:clientContext:](SUUINavigationControllerAssistant, "assistantForNavigationController:clientContext:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v15, "topViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_statusOverlayProviderForViewController:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStatusOverlayProvider:", v14);

    }
    v10 = v15;
    goto LABEL_11;
  }
}

- (void)_previewDocumentIsActiveChangeNotification:(id)a3
{
  id v4;
  SUUIPreviewDocumentController *v5;
  void *v6;
  BOOL v7;
  void *v8;
  SUUIPreviewDocumentController *previewDocumentController;
  void *v10;
  UIViewController *floatingStatusOverlayViewController;
  id v12;

  v4 = a3;
  if (self->_previewDocumentController)
  {
    v12 = v4;
    objc_msgSend(v4, "object");
    v5 = (SUUIPreviewDocumentController *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != self->_previewDocumentController)
    {
LABEL_7:

      v4 = v12;
      goto LABEL_8;
    }
    v7 = -[SUUIPreviewDocumentController isPreviewActive](v5, "isPreviewActive");

    v4 = v12;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:name:object:", self, v8, self->_previewDocumentController);

      previewDocumentController = self->_previewDocumentController;
      self->_previewDocumentController = 0;

      if (self->_floatingStatusOverlayViewController)
      {
        -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v10, 0, 1);

        floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
        self->_floatingStatusOverlayViewController = 0;

      }
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SUUIApplicationControllerPreviewOverlayDidChangeNotification"), self, 0);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)_reloadAfterNetworkChange:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUUIApplicationController__reloadAfterNetworkChange___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __55__SUUIApplicationController__reloadAfterNetworkChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) == 1)
  {
    objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "networkType");

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "_retryAfterFailure");
  }
}

- (void)_removeStatusOverlayFromAllNavigationControllers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_navigationDocumentControllers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 != v8)
        {
          objc_msgSend(v7, "navigationController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUUINavigationControllerAssistant existingAssistantForNavigationController:](SUUINavigationControllerAssistant, "existingAssistantForNavigationController:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setStatusOverlayProvider:", 0);
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)_storeFrontChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUUIApplicationController__storeFrontChangeNotification___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __59__SUUIApplicationController__storeFrontChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeFrontIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "storeFrontIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[4] && (objc_msgSend(v4, "_isStoreFront:equalToStoreFront:", v3, v9) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "appScriptFallbackHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateAllURLBags");

    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadAccounts");

    if ((objc_msgSend(*(id *)(a1 + 32), "_isDisplayingAccountViewController") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
      objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__resetUserInteraceForAccountViewDisappear_, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_resetUserInterfaceAfterStoreFrontChange");
    }
  }

}

- (int64_t)_applicationMode
{
  int64_t scriptLoadState;

  scriptLoadState = self->_scriptLoadState;
  if (scriptLoadState == 4)
    return 2;
  else
    return scriptLoadState == 3;
}

- (NSArray)_navigationControllers
{
  return (NSArray *)self->_navigationDocumentControllers;
}

- (void)_resetDocumentControllers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_navigationDocumentControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          objc_msgSend(v8, "popAllDocuments");
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[SUUINavigationDocumentController popAllDocuments](self->_transientNavigationDocument, "popAllDocuments");
  if (-[SUUIApplicationController _applicationMode](self, "_applicationMode") == 2)
    -[SUUIApplicationController _reloadRootViewControllers](self, "_reloadRootViewControllers");
}

- (int64_t)_selectedTabBarIndex
{
  int64_t v2;
  void *v3;
  void *v4;

  if (self->_hidesTabBar)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "selectedIndex");
  else
    v2 = 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

- (void)_setSelectedTabBarIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SUUIApplicationController _transientNavigationDocument](self, "_transientNavigationDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTransientViewController:animated:", v6, 0);
    -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v6);
  }
  else
  {
    objc_msgSend(v8, "setSelectedIndex:", a3);
    objc_msgSend(v8, "selectedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController _tintTabBarWithViewController:](self, "_tintTabBarWithViewController:", v7);

    objc_msgSend(v8, "selectedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController _updateOverlayNavigationController:](self, "_updateOverlayNavigationController:", v6);
  }

}

- (void)_stopApplication
{
  _SUUIApplicationShutdownHelper *v3;
  _SUUIApplicationShutdownHelper *shutdownHelper;

  if (self->_scriptContext)
  {
    if (self->_scriptLoadState != 6)
    {
      v3 = -[_SUUIApplicationShutdownHelper initWithApplicationController:]([_SUUIApplicationShutdownHelper alloc], "initWithApplicationController:", self);
      shutdownHelper = self->_shutdownHelper;
      self->_shutdownHelper = v3;

      -[_SUUIApplicationShutdownHelper start](self->_shutdownHelper, "start");
      self->_scriptLoadState = 6;
      -[IKAppContext stop](self->_scriptContext, "stop");
    }
  }
}

- (SUUINavigationDocumentController)_transientNavigationController
{
  if (self->_hidesTabBar)
    -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
  else
    -[SUUIApplicationController _transientNavigationDocument](self, "_transientNavigationDocument");
  return (SUUINavigationDocumentController *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_activeNavigationController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (self->_hidesTabBar)
  {
    -[NSMutableArray firstObject](self->_navigationDocumentControllers, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "navigationController");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    SUUITabBarControllerGetActiveNavigationController(v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  _SUUIApplicationShutdownHelper *v4;
  _SUUIApplicationShutdownHelper *shutdownHelper;
  uint64_t v6;

  -[SUUIClientContext sendApplicationDidEnterBackground](self->_clientContext, "sendApplicationDidEnterBackground", a3);
  if (self->_stopApplicationOnBackgroundNotification)
  {
    self->_stopApplicationOnBackgroundNotification = 0;
    -[SUUIApplicationController _removeObserversForReloadNotifications](self, "_removeObserversForReloadNotifications");
    -[_SUUIApplicationShutdownHelper stop](self->_shutdownHelper, "stop");
    v4 = -[_SUUIApplicationShutdownHelper initWithApplicationController:]([_SUUIApplicationShutdownHelper alloc], "initWithApplicationController:", self);
    shutdownHelper = self->_shutdownHelper;
    self->_shutdownHelper = v4;

    -[_SUUIApplicationShutdownHelper start](self->_shutdownHelper, "start");
    v6 = objc_opt_class();
    NSLog(CFSTR("%@: Reloading app on background"), v6);
    -[SUUIApplicationController _stopScriptContextForReload](self, "_stopScriptContextForReload");
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[SUUIClientContext sendApplicationWillEnterForeground](self->_clientContext, "sendApplicationWillEnterForeground", a3);
  if (self->_reloadApplicationOnForegroundNotification)
  {
    self->_reloadApplicationOnForegroundNotification = 0;
    if (self->_scriptLoadState == 1)
      -[SUUIApplicationController _retryAfterFailure](self, "_retryAfterFailure");
    else
      -[SUUIApplicationController _reloadApplication](self, "_reloadApplication");
  }
}

- (void)_dispatchTabBarOnNeedsContentForTabAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  IKAppContext *scriptContext;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v3;
    v16 = v4;
    if (-[NSArray count](self->_tabBarItems, "count") > a3)
    {
      -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndex:](self->_navigationDocumentControllers, "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 == v9
        || (objc_msgSend(v8, "documentStackItems"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "count"),
            v10,
            !v11))
      {
        if (self->_scriptLoadState == 3)
        {
          scriptContext = self->_scriptContext;
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __72__SUUIApplicationController__dispatchTabBarOnNeedsContentForTabAtIndex___block_invoke;
          v13[3] = &unk_2511F61F8;
          v14 = v7;
          -[IKAppContext evaluate:completionBlock:](scriptContext, "evaluate:completionBlock:", v13, 0);
          self->_indexOfLastTabNeedingContent = 0x7FFFFFFFFFFFFFFFLL;

        }
        else
        {
          self->_indexOfLastTabNeedingContent = a3;
        }
      }

    }
  }
}

void __72__SUUIApplicationController__dispatchTabBarOnNeedsContentForTabAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TabBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sendOnNeedsContentForTabBarItem:", *(_QWORD *)(a1 + 32));
}

- (void)_dispatchTabBarOnSelect
{
  -[IKAppContext evaluate:completionBlock:](self->_scriptContext, "evaluate:completionBlock:", &__block_literal_global_268, 0);
}

void __52__SUUIApplicationController__dispatchTabBarOnSelect__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TabBar"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toObjectOfClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("onSelect"), 0);
}

- (void)_failReloadWithError:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[objc_class _fallbackConfigurationDictionary](self->_clientContextClass, "_fallbackConfigurationDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_opt_class();
    NSLog(CFSTR("[%@]: Did fail loading configuration with error: %@. Using fallback configuration dictionary instead."), v5, v6);
    -[SUUIApplicationController _setClientContextWithDictionary:](self, "_setClientContextWithDictionary:", v4);
  }
  else
  {
    -[SUUIApplicationController _failWithError:](self, "_failWithError:", v6);
  }

}

- (void)_failWithError:(id)a3
{
  uint64_t v4;
  IKAppContext *scriptContext;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  uint64_t v10;
  NSArray *tabBarItems;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[6];

  v15 = a3;
  v4 = objc_opt_class();
  NSLog(CFSTR("[%@]: Did fail with error: %@"), v4, v15);
  self->_scriptLoadState = 1;
  if ((-[IKAppContext isValid](self->_scriptContext, "isValid") & 1) == 0)
  {
    scriptContext = self->_scriptContext;
    self->_scriptContext = 0;

  }
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_275);
  if (ISErrorIsEqual())
  {
    objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllCachedResponses");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "application:didFailToLoadWithError:", self, v15);

  }
  if (!self->_clientContext)
  {
    v10 = -[NSMutableArray count](self->_navigationDocumentControllers, "count");
    tabBarItems = self->_tabBarItems;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__SUUIApplicationController__failWithError___block_invoke_2;
    v16[3] = &unk_2511FD118;
    v16[4] = self;
    v16[5] = v10;
    -[NSArray enumerateObjectsUsingBlock:](tabBarItems, "enumerateObjectsUsingBlock:", v16);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BEC8B00];
  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__reloadAfterNetworkChange_, v13, v14);

  self->_reloadApplicationOnForegroundNotification = 1;
}

void __44__SUUIApplicationController__failWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "setLaunchFailureTime:");

}

void __44__SUUIApplicationController__failWithError___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40) > a3)
  {
    v16 = v5;
    SUUIErrorDocumentTitle(*(void **)(*(_QWORD *)(a1 + 32) + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v16, "barTintStyle") == 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
    {
      objc_msgSend(v8, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewControllers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        if (!objc_msgSend(v16, "alwaysCreatesRootViewController")
          || (v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v16, "rootViewControllerClass")), "initWithTabBarItem:", v16)) == 0)
        {
          v14 = objc_alloc(MEMORY[0x24BEBDBB0]);
          v15 = (void *)objc_msgSend(v14, "initWithFrame:title:style:", v6, v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
          v13 = objc_alloc_init(MEMORY[0x24BEBDB08]);
          objc_msgSend(v13, "setView:", v15);

        }
        objc_msgSend(v10, "pushViewController:animated:", v13, 0);

      }
    }

    v5 = v16;
  }

}

- (void)_finishWillResignActiveWithDialogState:(BOOL)a3
{
  unint64_t v3;
  _BOOL4 v4;
  SUUIURL *activationURL;
  id v7;

  v3 = *MEMORY[0x24BEBE030];
  if (self->_resignActiveTaskID != *MEMORY[0x24BEBE030])
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "applicationState"))
    {
      if (v4)
      {
        self->_ignoreDidBecomeActive = 1;
      }
      else
      {
        activationURL = self->_activationURL;
        self->_activationURL = 0;

        self->_ignoreDidBecomeActive = 0;
        -[SUUIClientContext setPurchaseReferrerURL:](self->_clientContext, "setPurchaseReferrerURL:", 0);
        -[SUUIApplicationController suspendApplicationWithOptions:](self, "suspendApplicationWithOptions:", 0);
      }
    }
    objc_msgSend(v7, "endBackgroundTask:", self->_resignActiveTaskID);
    self->_resignActiveTaskID = v3;

  }
}

- (void)_fireBlocksAfterLoad
{
  void *v3;
  NSMutableArray *whenLoadedBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableArray copy](self->_whenLoadedBlocks, "copy");
  whenLoadedBlocks = self->_whenLoadedBlocks;
  self->_whenLoadedBlocks = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2426A2860](v6);
        (*(void (**)(uint64_t))(v10 + 16))(v10);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
    }
    while (v6);
  }

}

- (CGSize)sizeForNavigationDocument:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  CGSize result;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "navigationControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "navigationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = v6;
      goto LABEL_14;
    }
    v8 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "modalDocumentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_overlayNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      v5 = v6;
      goto LABEL_8;
    }
    objc_msgSend(v4, "modalDocumentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_overlayViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[SUUIApplicationController tabBarController](self, "tabBarController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

LABEL_14:
    if (v8)
      goto LABEL_16;
  }
  -[SUUIApplicationController tabBarController](self, "tabBarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v22 = 0;
  v23 = &v22;
  v24 = 0x3010000000;
  v25 = "";
  v26 = *MEMORY[0x24BDBF148];
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(v8, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v12 = v23;
    v23[4] = v13;
    v12[5] = v14;
  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__SUUIApplicationController_sizeForNavigationDocument___block_invoke;
    v19[3] = &unk_2511F4720;
    v21 = &v22;
    v20 = v8;
    dispatch_sync(MEMORY[0x24BDAC9B8], v19);
    v11 = v20;
  }

  v15 = *((double *)v23 + 4);
  v16 = *((double *)v23 + 5);
  _Block_object_dispose(&v22, 8);

  v17 = v15;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

void __55__SUUIApplicationController_sizeForNavigationDocument___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;

}

- (void)_handleScriptUnavailable
{
  self->_scriptLoadState = 4;
  -[SUUIApplicationController _reloadRootViewControllers](self, "_reloadRootViewControllers");
  -[SUUIApplicationController _fireBlocksAfterLoad](self, "_fireBlocksAfterLoad");
}

- (void)_invalidateApplication
{
  void *v3;
  SUUIClientContext *clientContext;
  IKAppContext *scriptContext;
  void *v6;
  SUUIPreviewDocumentController *previewDocumentController;
  UIViewController *floatingStatusOverlayViewController;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSMutableArray *navigationDocumentControllers;
  SUUIModalDocumentController *modalDocumentController;
  SUUINavigationDocumentController *transientNavigationDocument;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x2511FF088, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
  -[SUUIClientContext _setApplicationController:](self->_clientContext, "_setApplicationController:", 0);
  -[SUUIClientContext _setScriptAppContext:](self->_clientContext, "_setScriptAppContext:", 0);
  clientContext = self->_clientContext;
  self->_clientContext = 0;

  self->_didDisplayFirstPage = 0;
  scriptContext = self->_scriptContext;
  self->_scriptContext = 0;

  self->_scriptLoadState = 0;
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v6, 0, 0);
  previewDocumentController = self->_previewDocumentController;
  self->_previewDocumentController = 0;

  floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
  self->_floatingStatusOverlayViewController = 0;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_navigationDocumentControllers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
        {
          objc_msgSend(v14, "setDelegate:", 0);
          objc_msgSend(v14, "popAllDocuments");
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  navigationDocumentControllers = self->_navigationDocumentControllers;
  self->_navigationDocumentControllers = 0;

  -[SUUIModalDocumentController setModalSourceViewProvider:](self->_modalDocumentController, "setModalSourceViewProvider:", 0);
  -[SUUIModalDocumentController setNavigationControllerDelegate:](self->_modalDocumentController, "setNavigationControllerDelegate:", 0);
  -[SUUIModalDocumentController popAllDocuments](self->_modalDocumentController, "popAllDocuments");
  -[SUUIModalDocumentController setDelegate:](self->_modalDocumentController, "setDelegate:", 0);
  modalDocumentController = self->_modalDocumentController;
  self->_modalDocumentController = 0;

  -[SUUINavigationDocumentController setDelegate:](self->_transientNavigationDocument, "setDelegate:", 0);
  transientNavigationDocument = self->_transientNavigationDocument;
  self->_transientNavigationDocument = 0;

  -[SUUISimpleContainerViewController setContentViewController:](self->_navigationContainerViewController, "setContentViewController:", 0);
  objc_msgSend(v6, "setTransientViewController:animated:", 0, 0);
  objc_msgSend(v6, "setViewControllers:", 0);

}

- (BOOL)_isDisplayingAccountViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithObjects:", v5, 0);

  v7 = objc_msgSend(v6, "count");
  v8 = v7 != 0;
  if (v7)
  {
    while (1)
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v9, "childViewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
        objc_msgSend(v6, "addObjectsFromArray:", v10);
      objc_msgSend(v9, "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 && (objc_msgSend(v10, "containsObject:", v11) & 1) == 0)
        objc_msgSend(v6, "addObject:", v11);

      objc_msgSend(v6, "removeObjectAtIndex:", 0);
      v12 = objc_msgSend(v6, "count");
      v8 = v12 != 0;
      if (!v12)
        goto LABEL_11;
    }
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
LABEL_11:

  return v8;
}

- (BOOL)_isStoreFront:(id)a3 equalToStoreFront:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "rangeOfString:", CFSTR(" "));
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "substringToIndex:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  v9 = objc_msgSend(v6, "rangeOfString:", CFSTR(" "));
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "substringToIndex:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  v11 = objc_msgSend(v5, "isEqualToString:", v6);

  return v11;
}

- (id)_launchOptionsWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "underlyingURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v6, CFSTR("url"), 0);
  objc_msgSend(v4, "referrerApplicationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    objc_msgSend((id)objc_opt_class(), "_referrerAppForSourceApplication:launchURL:", v8, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;

    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("url"));
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("refApp"));

  }
  objc_msgSend(v4, "referrerURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("refUrl"));
  v14 = (void *)MEMORY[0x24BDBCE70];
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  objc_msgSend(v14, "su_dictionaryWithSize:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v19, CFSTR("windowSize"));

  return v7;
}

- (void)_legacyResolveExternalURL:(id)a3
{
  SUUIURLResolver *urlResolver;
  SUUIURLResolver *v5;
  SUUIURLResolver *v6;
  SUUIURLResolver *v7;
  SUUIURLResolver *v8;
  void *v9;
  id v10;

  urlResolver = self->_urlResolver;
  v10 = a3;
  -[SUUIURLResolver setDelegate:](urlResolver, "setDelegate:", 0);
  -[SUUIURLResolver setNavigationControllerDelegate:](self->_urlResolver, "setNavigationControllerDelegate:", 0);
  v5 = self->_urlResolver;
  self->_urlResolver = 0;

  v6 = -[SUUIURLResolver initWithClientContext:]([SUUIURLResolver alloc], "initWithClientContext:", self->_clientContext);
  v7 = self->_urlResolver;
  self->_urlResolver = v6;

  -[SUUIURLResolver setDelegate:](self->_urlResolver, "setDelegate:", self);
  -[SUUIURLResolver setNavigationControllerDelegate:](self->_urlResolver, "setNavigationControllerDelegate:", self);
  v8 = self->_urlResolver;
  -[SUUIApplicationController _operationQueue](self, "_operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIURLResolver setOperationQueue:](v8, "setOperationQueue:", v9);

  -[SUUIURLResolver resolveURL:](self->_urlResolver, "resolveURL:", v10);
}

- (void)_loadApplicationScript
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  SUUIURL *v12;
  void *v13;
  SUUIURL *v14;
  void *v15;
  NSDictionary *launchOptions;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@] Load application script"), v4);

  self->_scriptLoadState = 2;
  -[SUUIApplicationController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "bootstrapScriptURLForApplication:", self);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[SUUIApplicationController _startScriptContextWithURL:](self, "_startScriptContextWithURL:", v6);
LABEL_9:

      goto LABEL_10;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", CFSTR("SUUIITMLURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    || (-[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("appjs.v2")), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIApplicationController _startScriptContextWithURL:](self, "_startScriptContextWithURL:", v9);

    }
    else
    {
      -[SUUIApplicationController _handleScriptUnavailable](self, "_handleScriptUnavailable");
    }
    goto LABEL_9;
  }
  objc_initWeak(&location, self);
  -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __51__SUUIApplicationController__loadApplicationScript__block_invoke;
  v18[3] = &unk_2511F6248;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v17, "loadValueForKey:completionBlock:", CFSTR("itml-store"), v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_10:
  -[NSDictionary valueForKey:](self->_launchOptions, "valueForKey:", CFSTR("url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (NSDictionary *)-[NSDictionary mutableCopy](self->_launchOptions, "mutableCopy");
    v12 = [SUUIURL alloc];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10);
    v14 = -[SUUIURL initWithURL:](v12, "initWithURL:", v13);

    +[SUUIURLResolver tabIdentifierForURL:](SUUIURLResolver, "tabIdentifierForURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[NSDictionary removeObjectForKey:](v11, "removeObjectForKey:", CFSTR("url"));
      -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, CFSTR("selectedTabId"));
    }
    else if (-[SUUIApplicationController _shouldUseLegacyURLHandlingForExternalURL:](self, "_shouldUseLegacyURLHandlingForExternalURL:", v14))
    {
      -[NSDictionary removeObjectForKey:](v11, "removeObjectForKey:", CFSTR("url"));
      -[SUUIApplicationController _legacyResolveExternalURL:](self, "_legacyResolveExternalURL:", v14);
      objc_storeStrong((id *)&self->_legacyLaunchURL, v14);
    }
    launchOptions = self->_launchOptions;
    self->_launchOptions = v11;

  }
}

void __51__SUUIApplicationController__loadApplicationScript__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUUIApplicationController__loadApplicationScript__block_invoke_2;
  block[3] = &unk_2511F5100;
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __51__SUUIApplicationController__loadApplicationScript__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_startScriptContextWithURL:", v2);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_loadWeakRetained((id *)(a1 + 48));
    WeakRetained = v4;
    if (v3)
      objc_msgSend(v4, "_failWithError:", *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v4, "_handleScriptUnavailable");
  }

}

- (id)_navigationContainerViewController
{
  SUUISimpleContainerViewController *navigationContainerViewController;
  SUUISimpleContainerViewController *v4;
  SUUISimpleContainerViewController *v5;

  navigationContainerViewController = self->_navigationContainerViewController;
  if (!navigationContainerViewController)
  {
    v4 = objc_alloc_init(SUUISimpleContainerViewController);
    v5 = self->_navigationContainerViewController;
    self->_navigationContainerViewController = v4;

    navigationContainerViewController = self->_navigationContainerViewController;
  }
  return navigationContainerViewController;
}

- (id)_operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIApplicationController"));
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (BOOL)_needsStatusOverlay
{
  return self->_statusOverlayProvider
      || -[SUUIPreviewDocumentController isPreviewActive](self->_previewDocumentController, "isPreviewActive");
}

- (BOOL)_playPreviewForPreviewTemplate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "previewURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEC8CD8], "sessionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v4);
    objc_msgSend(v5, "audioPlayerForURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "play");
    }
    else
    {
      v9 = (id)objc_msgSend(v5, "stopAllAudioPlayerSessions");
      objc_msgSend(v5, "startSessionWithURL:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStoreItemIdentifier:", objc_msgSend(v3, "itemIdentifier"));
      objc_msgSend(v10, "play");

    }
  }

  return v4 != 0;
}

- (void)_recordTabBarMetricsEventToSelectViewController:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedIndex");
  objc_msgSend(v4, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "count"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v15);
  if (v8 < (int64_t)-[NSArray count](self->_tabBarItems, "count"))
  {
    v9 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    objc_msgSend(v9, "setTargetType:", *MEMORY[0x24BEB2980]);
    -[NSArray objectAtIndex:](self->_tabBarItems, "objectAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metricsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTargetIdentifier:", v11);

    if (!v7)
      goto LABEL_16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "activeMetricsController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "topViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v13, "activeMetricsController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }
    }
    -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPageContext:", v14);

    if (v12)
    {
      objc_msgSend(v12, "recordEvent:", v9);

    }
    else
    {
LABEL_16:
      -[SUUIApplicationController recordMetricsEvent:flushImmediately:](self, "recordMetricsEvent:flushImmediately:", v9, 0);
    }

  }
}

- (void)_reloadApplication
{
  -[SUUIApplicationController _removeObserversForReloadNotifications](self, "_removeObserversForReloadNotifications");
  -[SUUIApplicationController _invalidateApplication](self, "_invalidateApplication");
  -[SUUIApplicationController loadApplication](self, "loadApplication");
  -[SUUIApplicationController _sendClientContextDidChange](self, "_sendClientContextDidChange");
}

uint64_t __55__SUUIApplicationController__reloadRootViewControllers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "tabIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __55__SUUIApplicationController__reloadRootViewControllers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("TabBar"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toObjectOfClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendOnUpdate");
}

uint64_t __55__SUUIApplicationController__reloadRootViewControllers__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "count");
  return objc_msgSend(*(id *)(a1 + 40), "_dispatchTabBarOnSelect");
}

- (void)_reloadTabBarWithClientContext:(id)a3
{
  SUUIClientContext *clientContext;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    clientContext = self->_clientContext;
    if (clientContext)
    {
      v5 = a3;
      -[SUUIClientContext valueForConfigurationKey:](clientContext, "valueForConfigurationKey:", CFSTR("tabs"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForConfigurationKey:", CFSTR("tabs"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if ((objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
        {
          -[SUUIClientContext _setValue:forConfigurationKey:](self->_clientContext, "_setValue:forConfigurationKey:", v6, CFSTR("tabs"));
          -[SUUIApplicationController _sendClientContextDidChange](self, "_sendClientContextDidChange");
        }
      }

    }
  }
}

- (void)_removeObserversForReloadNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], 0);

}

- (void)_resetUserInterfaceAfterStoreFrontChange
{
  IKAppContext *scriptContext;
  id v4;

  if (-[SUUIApplicationControllerOptions supportsFullApplicationReload](self->_options, "supportsFullApplicationReload"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SUAccountViewControllerDidDisappearNotification"), 0);
    scriptContext = self->_scriptContext;
    if (scriptContext)
      -[IKAppContext stop](scriptContext, "stop");
    else
      -[SUUIApplicationController _reloadApplication](self, "_reloadApplication");

  }
}

- (void)_retryAfterFailure
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUIApplicationController _removeObserversForReloadNotifications](self, "_removeObserversForReloadNotifications");
  if (self->_tabBarController)
  {
    -[SUUIApplicationController _transientNavigationDocument](self, "_transientNavigationDocument");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setViewControllers:animated:", MEMORY[0x24BDBD1A8], 0);
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutSubviews");

    -[SUUITabBarController setTransientViewController:animated:](self->_tabBarController, "setTransientViewController:animated:", 0, 0);
  }
  -[SUUIApplicationController loadApplicationWithOptions:](self, "loadApplicationWithOptions:", self->_launchOptions);
}

- (void)_sendClientContextDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "applicationDidChangeClientContext:", self);

}

- (void)_sendDidDisplayFirstPageIfNecessary
{
  SUUIClientContext *clientContext;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  id WeakRetained;
  id v9;
  void *v10;

  if (!self->_didDisplayFirstPage)
  {
    clientContext = self->_clientContext;
    -[SUUIApplicationController rootViewController](self, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "bounds");
    -[SUUIClientContext sendApplicationWindowSizeDidUpdate:](clientContext, "sendApplicationWindowSizeDidUpdate:", v6, v7);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "applicationDidDisplayFirstPage:", self);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("SUUIApplicationPageDidDisplayNotification"), 0);

    self->_didDisplayFirstPage = 1;
  }
}

- (BOOL)_sendNativeBackButtonMetricEvents
{
  return 1;
}

- (void)_setClientContextWithDictionary:(id)a3
{
  objc_class *clientContextClass;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  clientContextClass = self->_clientContextClass;
  v5 = a3;
  v6 = (void *)objc_msgSend([clientContextClass alloc], "initWithConfigurationDictionary:", v5);

  -[SUUIApplicationController setClientContext:](self, "setClientContext:", v6);
  -[SUUIModalDocumentController setClientContext:](self->_modalDocumentController, "setClientContext:", self->_clientContext);
  -[SUUINavigationDocumentController setClientContext:](self->_transientNavigationDocument, "setClientContext:", self->_clientContext);
  +[SUUINearMeController sharedController](SUUINearMeController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientContext:", self->_clientContext);

  +[SUUIFamilyCircleController sharedController](SUUIFamilyCircleController, "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientContext:", self->_clientContext);

  -[SUUIApplicationController _reloadRootViewControllers](self, "_reloadRootViewControllers");
  -[SUUIApplicationController _sendClientContextDidChange](self, "_sendClientContextDidChange");
  -[SUUIApplicationController _loadApplicationScript](self, "_loadApplicationScript");
}

- (BOOL)_shouldUseLegacyURLHandlingForExternalURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "actionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("account")) & 1) != 0)
    goto LABEL_7;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("donate")) & 1) != 0)
    goto LABEL_7;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("gift")) & 1) != 0)
    goto LABEL_7;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("redeem")) & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v4, "underlyingURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8
    || (+[SUUIURLResolver tabIdentifierForURL:](SUUIURLResolver, "tabIdentifierForURL:", v4),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
LABEL_7:
    v10 = 1;
  }
  else
  {
    v10 = self->_scriptLoadState == 4;
  }

  return v10;
}

- (void)_attemptAMSURLHandlingIfPossibleForExternalURL:(id)a3 fallback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(getAMSURLParserClass(), "bagSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAMSURLParserClass(), "bagSubProfileVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v10 = (void *)getAMSBagClass_softClass;
  v27 = getAMSBagClass_softClass;
  v11 = MEMORY[0x24BDAC760];
  if (!getAMSBagClass_softClass)
  {
    location[0] = (id)MEMORY[0x24BDAC760];
    location[1] = (id)3221225472;
    location[2] = __getAMSBagClass_block_invoke;
    location[3] = &unk_2511FA508;
    location[4] = &v24;
    __getAMSBagClass_block_invoke((uint64_t)location);
    v10 = (void *)v25[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v12, "bagForProfile:profileVersion:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)getAMSURLParserClass()), "initWithBag:", v13);
  objc_msgSend(v6, "underlyingURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "typeForURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(location, self);
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke;
  v19[3] = &unk_2511FD188;
  v17 = v7;
  v21 = v17;
  objc_copyWeak(&v22, location);
  v18 = v6;
  v20 = v18;
  objc_msgSend(v16, "addFinishBlock:", v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(location);

}

void __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke_2;
  block[3] = &unk_2511FD160;
  v10 = v6;
  v13 = a1[5];
  v11 = v5;
  v7 = v5;
  v8 = v6;
  objc_copyWeak(&v14, a1 + 6);
  v12 = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v14);
}

void __85__SUUIApplicationController__attemptAMSURLHandlingIfPossibleForExternalURL_fallback___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  SUUIURLResolver *v4;
  id v5;
  id v6;
  void *v7;
  id *WeakRetained;

  if (*(_QWORD *)(a1 + 32) || (v2 = *(_QWORD *)(a1 + 40), (v2 | 2) != 2))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained[34], "setDelegate:", 0);
    objc_msgSend(WeakRetained[34], "setNavigationControllerDelegate:", 0);
    v3 = WeakRetained[34];
    WeakRetained[34] = 0;

    v4 = -[SUUIURLResolver initWithClientContext:]([SUUIURLResolver alloc], "initWithClientContext:", WeakRetained[4]);
    v5 = WeakRetained[34];
    WeakRetained[34] = v4;

    objc_msgSend(WeakRetained[34], "setDelegate:");
    objc_msgSend(WeakRetained[34], "setNavigationControllerDelegate:");
    v6 = WeakRetained[34];
    objc_msgSend(WeakRetained, "_operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOperationQueue:", v7);

    objc_msgSend(WeakRetained[34], "amsResolveURL:forURLType:", *(_QWORD *)(a1 + 48), v2);
  }
}

- (void)_showFloatingStatusOverlayAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *previewDocumentController;
  id v6;
  void *v7;
  void *v8;
  UIViewController *v9;
  UIViewController *floatingStatusOverlayViewController;
  id v11;

  v3 = a3;
  if (!self->_floatingStatusOverlayViewController)
  {
    previewDocumentController = self->_previewDocumentController;
    if (!previewDocumentController)
      previewDocumentController = self->_statusOverlayProvider;
    v6 = previewDocumentController;
    -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "overlayViewControllerWithBackgroundStyle:", objc_msgSend(v8, "userInterfaceStyle") != 1);
    v9 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    floatingStatusOverlayViewController = self->_floatingStatusOverlayViewController;
    self->_floatingStatusOverlayViewController = v9;

  }
  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(v11, self->_floatingStatusOverlayViewController, v3);

}

- (void)_showStatusOverlayForNavigationController:(id)a3 viewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SUUIApplicationController rootViewController](self, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "bounds");
  if (-[SUUIApplicationController _usesFloatingStatusOverlayForWidth:](self, "_usesFloatingStatusOverlayForWidth:", v12))
  {
    -[SUUIApplicationController _showFloatingStatusOverlayAnimated:](self, "_showFloatingStatusOverlayAnimated:", v5);
  }
  else if (v8)
  {
    +[SUUINavigationControllerAssistant assistantForNavigationController:clientContext:](SUUINavigationControllerAssistant, "assistantForNavigationController:clientContext:", v8, self->_clientContext);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusOverlayProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transitionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationController _statusOverlayProviderForViewController:](self, "_statusOverlayProviderForViewController:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStatusOverlayProvider:animated:", v16, v5);

    objc_msgSend(v13, "willShowViewController:animated:", v9, v5);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __95__SUUIApplicationController__showStatusOverlayForNavigationController_viewController_animated___block_invoke;
    v19[3] = &unk_2511FB0A8;
    v20 = v13;
    v21 = v14;
    v17 = v14;
    v18 = v13;
    objc_msgSend(v15, "notifyWhenInteractionEndsUsingBlock:", v19);

  }
}

void __95__SUUIApplicationController__showStatusOverlayForNavigationController_viewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isCancelled"))
    objc_msgSend(*(id *)(a1 + 32), "setStatusOverlayProvider:animated:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "isAnimated"));

}

- (void)_startScriptContextWithURL:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  NSURL *v16;
  NSURL *applicationScriptURL;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  IKAppContext *v22;
  IKAppContext *scriptContext;
  IKAppContext *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  SUUIBootstrapScriptFallback *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("[%@] Start script with URL <%@>"), v6, v4);

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v14 = v13;
    else
      v14 = v13 & 2;
    if (!v14)
      goto LABEL_21;
    LODWORD(v32) = 138412290;
    *(_QWORD *)((char *)&v32 + 4) = v4;
    LODWORD(v31) = 12;
    goto LABEL_19;
  }
  if (self->_scriptContext)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (!v11)
      goto LABEL_21;
    LODWORD(v32) = 138412290;
    *(_QWORD *)((char *)&v32 + 4) = v4;
    LODWORD(v31) = 12;
LABEL_19:
    v15 = (void *)_os_log_send_and_compose_impl();

    if (!v15)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v32, v31, v32);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog();
LABEL_21:

    goto LABEL_22;
  }
  SUUIInitializeDOMFeatureFactory();
  SUUIInitializeViewElementFactory();
  SUUIInitializeViewElementStyleFactory();
  v16 = (NSURL *)objc_msgSend(v4, "copy");
  applicationScriptURL = self->_applicationScriptURL;
  self->_applicationScriptURL = v16;

  -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BEB1FF0];
  objc_msgSend(v18, "URLBagContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setURLBag:forContext:", v18, v20);

  v21 = -[SUUIApplicationControllerOptions requiresLocalBootstrapScript](self->_options, "requiresLocalBootstrapScript");
  v22 = (IKAppContext *)objc_msgSend(objc_alloc(MEMORY[0x24BE51928]), "initWithApplication:mode:delegate:", self, v21, self);
  scriptContext = self->_scriptContext;
  self->_scriptContext = v22;

  -[IKAppContext setRemoteInspectionEnabled:](self->_scriptContext, "setRemoteInspectionEnabled:", 1);
  -[IKAppContext setMescalPrimeEnabledForXHRRequests:](self->_scriptContext, "setMescalPrimeEnabledForXHRRequests:", self->_mescalPrimeEnabledForXHRRequests);
  v24 = self->_scriptContext;
  -[SUUIApplicationControllerOptions bootstrapScriptTimeoutInterval](self->_options, "bootstrapScriptTimeoutInterval");
  -[IKAppContext setAppScriptTimeoutInterval:](v24, "setAppScriptTimeoutInterval:");
  -[SUUIClientContext _setScriptAppContext:](self->_clientContext, "_setScriptAppContext:", self->_scriptContext);
  if (-[SUUIApplicationControllerOptions isBootstrapScriptFallbackEnabled](self->_options, "isBootstrapScriptFallbackEnabled"))
  {
    -[SUUIClientContext storeFrontIdentifier](self->_clientContext, "storeFrontIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      v27 = -[SUUIClientContext isBootstrapScriptFallbackDisabled](self->_clientContext, "isBootstrapScriptFallbackDisabled");

      if (!v27)
      {
        -[SUUIClientContext storeFrontIdentifier](self->_clientContext, "storeFrontIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUIBootstrapScriptFallback cacheFilenameForStoreFrontIdentifier:](SUUIBootstrapScriptFallback, "cacheFilenameForStoreFrontIdentifier:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = -[SUUIBootstrapScriptFallback initWithFilename:]([SUUIBootstrapScriptFallback alloc], "initWithFilename:", v29);
        -[SUUIApplicationControllerOptions bootstrapScriptFallbackMaximumAge](self->_options, "bootstrapScriptFallbackMaximumAge");
        -[SUUIBootstrapScriptFallback setMaximumAge:](v30, "setMaximumAge:");
        -[IKAppContext setAppScriptFallbackHandler:](self->_scriptContext, "setAppScriptFallbackHandler:", v30);

      }
    }
  }
  -[IKAppContext start](self->_scriptContext, "start");
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:](SUUIMetricsAppLaunchEvent, "withPendingLaunchEvent:", &__block_literal_global_324);

LABEL_23:
}

void __56__SUUIApplicationController__startScriptContextWithURL___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  v3 = a2;
  objc_msgSend(v2, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v3, "setBootstrapStartTime:");

}

- (void)_jsLaunchFinishedWithLaunchMetrics:(id)a3
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
  void *v13;
  void *v14;
  SUUIClientContext *clientContext;
  void *v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  +[SUUIMetricsAppLaunchEvent consumePendingLaunchEvent](SUUIMetricsAppLaunchEvent, "consumePendingLaunchEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "setLaunchEndTime:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jsResourcesStartTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v7);
      objc_msgSend(v5, "setJsResourcesStartTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jsResourcesEndTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v8);
      objc_msgSend(v5, "setJsResourcesEndTime:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("initialTabMetrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("requestStartTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v11);
        objc_msgSend(v5, "setInitialTabRequestStartTime:");
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("responseStartTime"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v12);
        objc_msgSend(v5, "setInitialTabResponseStartTime:");
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("responseEndTime"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v13);
        objc_msgSend(v5, "setInitialTabResponseEndTime:");
      }

    }
    if (+[SUUIMetricsUtilities shouldLogTimingMetrics](SUUIMetricsUtilities, "shouldLogTimingMetrics"))
    {
      SSDebugLevel();
      SSDebugFileLevel();
      v16 = v5;
      SSDebugLog();
    }
    if (+[SUUIMetricsUtilities showEventNotifications](SUUIMetricsUtilities, "showEventNotifications", v16))
    {
      +[SUUIStatusBarAlertCenter sharedCenter](SUUIStatusBarAlertCenter, "sharedCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __64__SUUIApplicationController__jsLaunchFinishedWithLaunchMetrics___block_invoke;
      v17[3] = &unk_2511F47C0;
      v18 = v5;
      objc_msgSend(v14, "showMessage:withStyle:forDuration:actionBlock:", CFSTR("App Launched"), 0, v17, 0.0);

    }
    -[SUUIApplicationController recordMetricsEvent:flushImmediately:](self, "recordMetricsEvent:flushImmediately:", v5, 0);

  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", &__block_literal_global_343);
  }

}

uint64_t __64__SUUIApplicationController__jsLaunchFinishedWithLaunchMetrics___block_invoke(uint64_t a1)
{
  return +[SUUIObjectInspectorViewController showInspectableObject:](SUUIObjectInspectorViewController, "showInspectableObject:", *(_QWORD *)(a1 + 32));
}

- (id)_statusOverlayProviderForViewController:(id)a3
{
  id v4;
  void *previewDocumentController;
  id v6;
  char v7;

  v4 = a3;
  previewDocumentController = self->_previewDocumentController;
  if (previewDocumentController)
    goto LABEL_2;
  if (!self->_statusOverlayProvider)
    goto LABEL_7;
  v7 = objc_opt_respondsToSelector();
  previewDocumentController = self->_statusOverlayProvider;
  if ((v7 & 1) != 0)
  {
    if (objc_msgSend(previewDocumentController, "shouldShowStatusOverlayForViewController:", v4))
    {
      previewDocumentController = self->_statusOverlayProvider;
      goto LABEL_2;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
LABEL_2:
  v6 = previewDocumentController;
LABEL_8:

  return v6;
}

- (void)_stopScriptContextForReload
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SUUIMetricsController flushImmediately](self->_metricsController, "flushImmediately");
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSVStoreFrontIdentifierForAccount();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1580]);
    +[SUUIClientContext _cachePathForStoreFrontIdentifier:](SUUIClientContext, "_cachePathForStoreFrontIdentifier:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  }
  if (objc_msgSend(MEMORY[0x24BEC8C58], "sharedCFURLCache"))
    CFURLCacheRemoveAllCachedResponses();
  objc_msgSend(MEMORY[0x24BDB7470], "sharedURLCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllCachedResponses");

  objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateAllURLBags");

  -[IKAppContext appScriptFallbackHandler](self->_scriptContext, "appScriptFallbackHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  self->_scriptLoadState = 5;
  -[IKAppContext stop](self->_scriptContext, "stop");

}

- (id)_transientNavigationDocument
{
  SUUINavigationDocumentController *transientNavigationDocument;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  SUUINavigationDocumentController *v8;
  SUUINavigationDocumentController *v9;
  SUUINavigationDocumentController *v10;
  void *v11;

  transientNavigationDocument = self->_transientNavigationDocument;
  if (!transientNavigationDocument)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0
      || (v6 = objc_loadWeakRetained((id *)&self->_delegate),
          objc_msgSend(v6, "application:navigationControllerWithTabBarItem:", self, 0),
          v7 = (id)objc_claimAutoreleasedReturnValue(),
          v6,
          !v7))
    {
      v7 = objc_alloc_init(MEMORY[0x24BEBD7A0]);
    }
    objc_msgSend(v7, "setDelegate:", self);
    v8 = -[SUUINavigationDocumentController initWithNavigationController:]([SUUINavigationDocumentController alloc], "initWithNavigationController:", v7);
    v9 = self->_transientNavigationDocument;
    self->_transientNavigationDocument = v8;

    v10 = self->_transientNavigationDocument;
    -[SUUIApplicationController clientContext](self, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUINavigationDocumentController setClientContext:](v10, "setClientContext:", v11);

    -[SUUINavigationDocumentController setDelegate:](self->_transientNavigationDocument, "setDelegate:", self);
    transientNavigationDocument = self->_transientNavigationDocument;
  }
  return transientNavigationDocument;
}

- (BOOL)_usesFloatingStatusOverlayForWidth:(double)a3
{
  void *v4;
  BOOL v5;

  -[SUUIApplicationController _existingTabBarController](self, "_existingTabBarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (!v4 || (objc_opt_respondsToSelector() & 1) != 0) && 320.0 / a3 < 0.5;

  return v5;
}

- (id)_rootDocuments
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_navigationDocumentControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 != v10)
        {
          objc_msgSend(v9, "documents");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            objc_msgSend(v9, "documents");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "firstObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
              objc_msgSend(v3, "addObject:", v14);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

- (SUUIApplicationDelegate)delegate
{
  return (SUUIApplicationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_hidesTabBar
{
  return self->_hidesTabBar;
}

- (void)_setHidesTabBar:(BOOL)a3
{
  self->_hidesTabBar = a3;
}

- (BOOL)mescalPrimeEnabledForXHRRequests
{
  return self->_mescalPrimeEnabledForXHRRequests;
}

- (SUUIPreviewDocumentController)_previewOverlayDocumentController
{
  return self->_previewDocumentController;
}

- (SUUIModalDocumentController)modalDocumentController
{
  return self->_modalDocumentController;
}

- (SUUIApplicationControllerOptions)options
{
  return self->_options;
}

- (SUUIScrollingTabBarController)scrollingTabBarController
{
  return self->_scrollingTabBarController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollingTabBarController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_whenLoadedBlocks, 0);
  objc_storeStrong((id *)&self->_vendorStorage, 0);
  objc_storeStrong((id *)&self->_urlResolver, 0);
  objc_storeStrong((id *)&self->_transientNavigationDocument, 0);
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_shutdownHelper, 0);
  objc_storeStrong((id *)&self->_statusOverlayProvider, 0);
  objc_storeStrong((id *)&self->_scriptContext, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_previewDocumentController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_navigationDocumentControllers, 0);
  objc_storeStrong((id *)&self->_navigationContainerViewController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_modalDocumentController, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
  objc_storeStrong((id *)&self->_legacyLaunchURL, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_lastPoppedViewController, 0);
  objc_storeStrong((id *)&self->_floatingStatusOverlayViewController, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_applicationScriptURL, 0);
  objc_storeStrong((id *)&self->_activationURL, 0);
}

@end
