@implementation UIDocumentBrowserViewController

- (void)setCustomActions:(NSArray *)customActions
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v8[4];
  NSArray *v9;

  v4 = customActions;
  v5 = (NSArray *)-[NSArray copy](v4, "copy");
  v6 = self->_customActions;
  self->_customActions = v5;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__UIDocumentBrowserViewController_setCustomActions___block_invoke;
  v8[3] = &unk_24C0F0710;
  v9 = v4;
  v7 = v4;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v8);

}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = -[UIDocumentBrowserViewController allowsDocumentCreation](self, "allowsDocumentCreation");
    v5 = obj;
    if (v6)
    {
      -[UIDocumentBrowserViewController viewIfLoaded](self, "viewIfLoaded");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = obj;
      if (v7)
      {
        -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "warnIfNoValidCreationHandler");

        v5 = obj;
      }
    }
  }

}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BE2DF90];
  v6 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_DEFAULT, "Application did become active.", v10, 2u);
  }
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "inProcess");

  if ((v8 & 1) == 0)
  {
    -[UIDocumentBrowserViewController presentedViewController](self, "presentedViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      -[UIDocumentBrowserViewController _establishFirstResponderOnServiceSideForKeyCommand:](self, "_establishFirstResponderOnServiceSideForKeyCommand:", 0);
  }

}

- (void)__commonInit
{
  NSArray *customActions;
  NSArray *v4;
  NSArray *additionalLeadingNavigationBarButtonItems;
  NSArray *additionalTrailingNavigationBarButtonItems;
  DOCAppearance *v7;
  DOCAppearance *appearance;
  DOCDocumentCreationController *v9;
  DOCDocumentCreationController *documentCreationController;
  id v11;
  UIView *v12;
  UIView *trackingViewsContainer;
  void *v14;
  char v15;
  NSOperationQueue *v16;
  NSOperationQueue *serviceQueue;
  void *v18;
  id v19;
  id v20;

  customActions = self->_customActions;
  v4 = (NSArray *)MEMORY[0x24BDBD1A8];
  self->_customActions = (NSArray *)MEMORY[0x24BDBD1A8];

  additionalLeadingNavigationBarButtonItems = self->_additionalLeadingNavigationBarButtonItems;
  self->_additionalLeadingNavigationBarButtonItems = v4;

  additionalTrailingNavigationBarButtonItems = self->_additionalTrailingNavigationBarButtonItems;
  self->_additionalTrailingNavigationBarButtonItems = v4;

  v7 = objc_alloc_init(DOCAppearance);
  appearance = self->_appearance;
  self->_appearance = v7;

  -[DOCAppearance setShowsCreateButton:](self->_appearance, "setShowsCreateButton:", 1);
  self->_allowsDocumentCreation = 1;
  self->_configuredForUIPDocumentLanding = 0;
  v9 = -[DOCDocumentCreationController initForBrowserViewController:]([DOCDocumentCreationController alloc], "initForBrowserViewController:", self);
  documentCreationController = self->_documentCreationController;
  self->_documentCreationController = v9;

  v11 = objc_alloc(MEMORY[0x24BEBDB00]);
  v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  trackingViewsContainer = self->_trackingViewsContainer;
  self->_trackingViewsContainer = v12;

  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "inProcess");

  if ((v15 & 1) == 0)
  {
    v16 = (NSOperationQueue *)objc_opt_new();
    serviceQueue = self->_serviceQueue;
    self->_serviceQueue = v16;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_serviceQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setSuspended:](self->_serviceQueue, "setSuspended:", 1);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_applicationDidBecomeActive_, *MEMORY[0x24BEBDF88], 0);

  objc_msgSend(MEMORY[0x24BEBDAB0], "systemTraitsAffectingColorAppearance");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (id)-[UIDocumentBrowserViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v20, sel_updateForChangedTraitsAffectingColors);

}

- (void)_showDocumentBrowserViewController:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  -[UIDocumentBrowserViewController _clearShownViewControllers](self, "_clearShownViewControllers");
  -[UIDocumentBrowserViewController _embedDocumentBrowserViewController](self, "_embedDocumentBrowserViewController");
  -[UIDocumentBrowserViewController setAllowsDocumentCreation:](self, "setAllowsDocumentCreation:", -[UIDocumentBrowserViewController allowsDocumentCreation](self, "allowsDocumentCreation"));
  if (v3)
  {
    -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", self->_appearance);
    -[UIDocumentBrowserViewController setEditing:](self, "setEditing:", -[UIDocumentBrowserViewController isEditing](self, "isEditing"));
    -[UIDocumentBrowserViewController setAdditionalLeadingNavigationBarButtonItems:](self, "setAdditionalLeadingNavigationBarButtonItems:", self->_additionalLeadingNavigationBarButtonItems);
    -[UIDocumentBrowserViewController setAdditionalTrailingNavigationBarButtonItems:](self, "setAdditionalTrailingNavigationBarButtonItems:", self->_additionalTrailingNavigationBarButtonItems);
    -[UIDocumentBrowserViewController customActions](self, "customActions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserViewController setCustomActions:](self, "setCustomActions:", v5);

  }
}

- (void)setAllowsDocumentCreation:(BOOL)allowsDocumentCreation
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  if (allowsDocumentCreation)
  {
    -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasCreationHandlerWithoutValidatingMethodRequirements");

    if (v5)
    {
      -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "warnIfNoValidCreationHandler");

      -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasCreationHandlerWithRequiredMethods");

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }
  self->_allowsDocumentCreation = v8;
  -[UIDocumentBrowserViewController _updateAppearanceShowsCreateButton](self, "_updateAppearanceShowsCreateButton");
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsDocumentCreation
{
  return self->_allowsDocumentCreation;
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  DOCAppearance *v4;
  unint64_t v5;
  DOCAppearance *appearance;

  v4 = (DOCAppearance *)a3;
  v5 = -[DOCAppearance browserUserInterfaceStyle](self->_appearance, "browserUserInterfaceStyle");
  if (v5 != -[DOCAppearance browserUserInterfaceStyle](v4, "browserUserInterfaceStyle"))
  {
    -[UIDocumentBrowserViewController updateBackgroundColor](self, "updateBackgroundColor");
    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UIDocumentBrowserViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
  appearance = self->_appearance;
  self->_appearance = v4;

  -[UIDocumentBrowserViewController _doc_performRemoteUpdateAppearanceForReason:](self, "_doc_performRemoteUpdateAppearanceForReason:", 0);
}

- (void)addOperationToServiceQueue:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSOperationQueue *serviceQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "inProcess");

  if ((v6 & 1) == 0)
  {
    serviceQueue = self->_serviceQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__UIDocumentBrowserViewController_addOperationToServiceQueue___block_invoke;
    v8[3] = &unk_24C0F0738;
    v8[4] = self;
    v9 = v4;
    -[NSOperationQueue addOperationWithBlock:](serviceQueue, "addOperationWithBlock:", v8);

  }
}

- (DOCConfiguration)configuration
{
  return self->_configuration;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDocumentBrowserViewController;
  -[UIDocumentBrowserViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[UIDocumentBrowserViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](self->_trackingViewsContainer, "setFrame:");

  -[UIView setAutoresizingMask:](self->_trackingViewsContainer, "setAutoresizingMask:", 18);
  -[UIDocumentBrowserViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_trackingViewsContainer);

  -[UIDocumentBrowserViewController addDummySplitViewControllerForPreferredContentSize](self, "addDummySplitViewControllerForPreferredContentSize");
  -[UIDocumentBrowserViewController _showDocumentBrowserViewController:](self, "_showDocumentBrowserViewController:", 0);
  -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", self->_appearance);
  if (-[UIDocumentBrowserViewController allowsDocumentCreation](self, "allowsDocumentCreation"))
  {
    -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "warnIfNoValidCreationHandler");

  }
}

- (void)addDummySplitViewControllerForPreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isPickerUI"))
  {
    -[UIDocumentBrowserViewController dummySplitViewController](self, "dummySplitViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return;
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD968]), "initWithStyle:", 1);
    objc_msgSend(v18, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    objc_msgSend(v18, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 18);

    -[UIDocumentBrowserViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v18, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    objc_msgSend(v18, "set_alwaysAllowsSystemPreferredContentSize:", 1);
    -[UIDocumentBrowserViewController addChildViewController:](self, "addChildViewController:", v18);
    -[UIDocumentBrowserViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v17);

    objc_msgSend(v18, "didMoveToParentViewController:", self);
    -[UIDocumentBrowserViewController setDummySplitViewController:](self, "setDummySplitViewController:", v18);
    objc_msgSend(v18, "preferredContentSize");
    -[UIDocumentBrowserViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (void)_embedDocumentBrowserViewController
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *, void *);
  void *v8;
  id v9;
  id location;

  -[UIDocumentBrowserViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", 0);
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inProcess");

  if ((v4 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke;
    v8 = &unk_24C0F07B0;
    objc_copyWeak(&v9, &location);
    -[UIDocumentBrowserViewController _instantiateRemoteViewControllerWithCompletion:](self, "_instantiateRemoteViewControllerWithCompletion:", &v5);
    -[UIDocumentBrowserViewController _embedViewController:](self, "_embedViewController:", self->_remoteViewController, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_clearShownViewControllers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIDocumentBrowserViewController childViewControllers](self, "childViewControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "willMoveToParentViewController:", 0);
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        objc_msgSend(v7, "removeFromParentViewController");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (NSArray)customActions
{
  return self->_customActions;
}

- (BOOL)allowsPickingMultipleItems
{
  return self->_allowsPickingMultipleItems;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)-[_UIResilientRemoteViewContainerViewController remoteViewController](self->_remoteViewController, "remoteViewController");
}

- (int64_t)preferredStatusBarStyle
{
  return (dyld_program_sdk_at_least() & 1) == 0
      && -[UIDocumentBrowserViewController browserUserInterfaceStyle](self, "browserUserInterfaceStyle") == UIDocumentBrowserUserInterfaceStyleDark;
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return self->_additionalTrailingNavigationBarButtonItems;
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return self->_additionalLeadingNavigationBarButtonItems;
}

- (UIDocumentBrowserViewController)init
{
  return -[UIDocumentBrowserViewController initForOpeningContentTypes:](self, "initForOpeningContentTypes:", 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  UIDocumentBrowserViewController *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIDocumentBrowserViewController;
  v6 = a3;
  -[UIDocumentBrowserViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  if (v6)
  {
    -[UIDocumentBrowserViewController updateBackgroundColor](self, "updateBackgroundColor", v8.receiver, v8.super_class);
    -[UIDocumentBrowserViewController _beginMonitoringUIPPresentationController](self, "_beginMonitoringUIPPresentationController");
  }
  else
  {
    -[UIDocumentBrowserViewController _endMonitoringUIPPresentationController](self, "_endMonitoringUIPPresentationController", v8.receiver, v8.super_class);
  }
  objc_msgSend(v6, "rootViewController");
  v7 = (UIDocumentBrowserViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    -[UIDocumentBrowserViewController _doc_endDelayingRemotePresentation](self, "_doc_endDelayingRemotePresentation");
}

- (void)updateBackgroundColor
{
  UIDocumentBrowserViewController *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UIDocumentBrowserViewController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  UIDocumentBrowserViewController *v13;
  void *v14;
  UIDocumentBrowserViewController *v15;

  v2 = self;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPickerUI");

  if (!v4)
  {
    -[DOCAppearance backgroundColor](v2->_appearance, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserViewController traitCollection](v2, "traitCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resolvedColorWithTraitCollection:", v7);
    v15 = (UIDocumentBrowserViewController *)objc_claimAutoreleasedReturnValue();

    v2 = v2;
    -[UIDocumentBrowserViewController activePresentationController](v2, "activePresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();

    if ((v7 & 1) != 0)
    {
      objc_opt_class();
      v9 = v2;
      v10 = v9;
      do
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v10, "parentViewController");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          objc_msgSend(v10, "presentingViewController");
          v11 = objc_claimAutoreleasedReturnValue();
        }

        v10 = (void *)v11;
      }
      while (v11);

      if (!v10)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v15 = (UIDocumentBrowserViewController *)v12;
    }
    else
    {
      v13 = v2;
    }

LABEL_15:
    -[UIDocumentBrowserViewController view](v2, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v2->_isDisplayingRemoteViewController)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v15 = (UIDocumentBrowserViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v15 = (UIDocumentBrowserViewController *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentBrowserViewController viewIfLoaded](v2, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v14 = v5;
  objc_msgSend(v5, "setBackgroundColor:", v15);

}

void __82__UIDocumentBrowserViewController_supportsRemovableFileProvidersForConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  char v4;
  char v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  v6 = (id)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x24BE2DDF8]);
  v3 = objc_msgSend(v6, "BOOLForKey:", CFSTR("DOCUserDefaultsKeyForceRemovableFPSupport"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "forPickingDownloadsFolder");
  v5 = v4 ^ 1;
  if ((v4 & 1) == 0 && (v3 & 1) == 0)
    v5 = dyld_program_sdk_at_least();
  supportsRemovableFileProvidersForConfiguration__supportsRemovableFileProviders = v5;

}

void __75__UIDocumentBrowserViewController_recentDocumentsContentTypesFromInfoPlist__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("UIDocumentBrowserRecentDocumentContentTypes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDF8240], "doc_contentTypesForIdentifiers:", v3);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)recentDocumentsContentTypesFromInfoPlist_recentDocumentsContentTypesFromInfoPlist;
    recentDocumentsContentTypesFromInfoPlist_recentDocumentsContentTypesFromInfoPlist = v1;

  }
}

- (UIDocumentBrowserViewController)initForOpeningContentTypes:(NSArray *)contentTypes
{
  NSArray *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  UIDocumentBrowserViewController *v13;
  UIDocumentBrowserViewController *v14;
  UIDocumentBrowserViewController *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = contentTypes;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](v4, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }
  -[UIDocumentBrowserViewController configurationForOpeningDocumentsWithContentTypes:](self, "configurationForOpeningDocumentsWithContentTypes:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentBrowserViewController;
  v13 = -[UIDocumentBrowserViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, v12);
    -[UIDocumentBrowserViewController __commonInit](v14, "__commonInit");
    v15 = v14;
  }

  return v14;
}

- (UIDocumentBrowserViewController)initWithConfiguration:(id)a3
{
  id v5;
  UIDocumentBrowserViewController *v6;
  UIDocumentBrowserViewController *v7;
  UIDocumentBrowserViewController *v8;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "isPickerUI") && (objc_msgSend(v5, "shouldIgnoreInteractionMode") & 1) == 0)
    objc_msgSend(v5, "setSupportsRemovableFileProviders:", -[UIDocumentBrowserViewController supportsRemovableFileProvidersForConfiguration:](self, "supportsRemovableFileProvidersForConfiguration:", v5));
  v10.receiver = self;
  v10.super_class = (Class)UIDocumentBrowserViewController;
  v6 = -[UIDocumentBrowserViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    -[UIDocumentBrowserViewController __commonInit](v7, "__commonInit");
    v8 = v7;
  }

  return v7;
}

- (id)configurationForOpeningDocumentsWithContentTypes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF8240], "doc_contentTypesForIdentifiers:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x24BE2DEE0], "configurationForImportingDocumentContentTypes:mode:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupportsRemovableFileProviders:", -[UIDocumentBrowserViewController supportsRemovableFileProvidersForConfiguration:](self, "supportsRemovableFileProvidersForConfiguration:", v5));
  -[UIDocumentBrowserViewController recentDocumentsContentTypesFromInfoPlist](self, "recentDocumentsContentTypesFromInfoPlist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecentDocumentsContentTypes:", v6);

  return v5;
}

- (BOOL)supportsRemovableFileProvidersForConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  char v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__UIDocumentBrowserViewController_supportsRemovableFileProvidersForConfiguration___block_invoke;
  block[3] = &unk_24C0F0C70;
  v9 = v3;
  v4 = supportsRemovableFileProvidersForConfiguration__onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&supportsRemovableFileProvidersForConfiguration__onceToken, block);
  v6 = supportsRemovableFileProvidersForConfiguration__supportsRemovableFileProviders;

  return v6;
}

- (id)recentDocumentsContentTypesFromInfoPlist
{
  if (recentDocumentsContentTypesFromInfoPlist_onceToken != -1)
    dispatch_once(&recentDocumentsContentTypesFromInfoPlist_onceToken, &__block_literal_global_243);
  return (id)recentDocumentsContentTypesFromInfoPlist_recentDocumentsContentTypesFromInfoPlist;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDocumentBrowserViewController;
  v4 = a3;
  -[UIDocumentBrowserViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[UIDocumentBrowserViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (UIDocumentBrowserViewController)initForOpeningFilesWithContentTypes:(NSArray *)allowedContentTypes
{
  void *v4;
  UIDocumentBrowserViewController *v5;
  UIDocumentBrowserViewController *v6;
  UIDocumentBrowserViewController *v7;
  objc_super v9;

  -[UIDocumentBrowserViewController configurationForOpeningDocumentsWithContentTypes:](self, "configurationForOpeningDocumentsWithContentTypes:", allowedContentTypes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)UIDocumentBrowserViewController;
  v5 = -[UIDocumentBrowserViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_configuration, v4);
    -[UIDocumentBrowserViewController __commonInit](v6, "__commonInit");
    v7 = v6;
  }

  return v6;
}

- (UIDocumentBrowserViewController)initWithCoder:(id)a3
{
  id v4;
  UIDocumentBrowserViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  DOCConfiguration *configuration;
  void *v11;
  UIDocumentBrowserViewController *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIDocumentBrowserViewController;
  v5 = -[UIDocumentBrowserViewController initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE2DEE0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationForOpeningDocumentsOfApplicationWithBundleIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (DOCConfiguration *)v9;

    -[DOCConfiguration setSupportsRemovableFileProviders:](v5->_configuration, "setSupportsRemovableFileProviders:", -[UIDocumentBrowserViewController supportsRemovableFileProvidersForConfiguration:](v5, "supportsRemovableFileProvidersForConfiguration:", v5->_configuration));
    -[UIDocumentBrowserViewController __commonInit](v5, "__commonInit");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDocumentBrowserViewControllerAllowsDocumentCreation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v5->_allowsDocumentCreation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDocumentBrowserViewControllerAllowsDocumentCreation"));
    else
      v5->_allowsDocumentCreation = 1;
    v5->_allowsPickingMultipleItems = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIDocumentBrowserViewControllerAllowsPickingMultipleItems"));
    -[DOCAppearance setBrowserUserInterfaceStyle:](v5->_appearance, "setBrowserUserInterfaceStyle:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("UIDocumentBrowserViewControllerBrowserUserInterfaceStyle")));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDocumentBrowserViewController allowsDocumentCreation](self, "allowsDocumentCreation"), CFSTR("UIDocumentBrowserViewControllerAllowsDocumentCreation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDocumentBrowserViewController allowsPickingMultipleItems](self, "allowsPickingMultipleItems"), CFSTR("UIDocumentBrowserViewControllerAllowsPickingMultipleItems"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIDocumentBrowserViewController browserUserInterfaceStyle](self, "browserUserInterfaceStyle"), CFSTR("UIDocumentBrowserViewControllerBrowserUserInterfaceStyle"));

}

- (void)performBrowserStateChange:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  DOCRunInMainThread();

}

uint64_t __61__UIDocumentBrowserViewController_performBrowserStateChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBrowserStateChange:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)performBrowserStateChange:(id)a3 animated:(BOOL)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v5 = a3;
  if (self->_configuredForUIPDocumentLanding
    && objc_msgSend(MEMORY[0x24BE2DEF0], "_UIPDocLandingInfrastructureEnabled")
    && (self->_serviceProxy || !self->_remoteHasReceivedInitialUIPBrowserState))
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __70__UIDocumentBrowserViewController_performBrowserStateChange_animated___block_invoke;
    v6[3] = &unk_24C0F0698;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __70__UIDocumentBrowserViewController_performBrowserStateChange_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id to;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    objc_copyWeak(&v10, &to);
    v8 = *(id *)(a1 + 32);
    v9 = v5;
    DOCRunInMainThread();

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&to);

}

void __70__UIDocumentBrowserViewController_performBrowserStateChange_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_applyBrowserStateChange:serviceProxy:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

}

- (void)setPreferredUIPBrowserState:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[DOCUIPBrowserState isEqual:](self->_preferredUIPBrowserState, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredUIPBrowserState, a3);
    -[UIDocumentBrowserViewController _updateAppearanceShowsCreateButton](self, "_updateAppearanceShowsCreateButton");
  }

}

- (void)_applyBrowserStateChange:(id)a3 serviceProxy:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  self->_remoteHasReceivedInitialUIPBrowserState = 1;
  -[UIDocumentBrowserViewController sheetPresentationController](self, "sheetPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke;
  v23[3] = &unk_24C0F06C0;
  v23[4] = self;
  v12 = v8;
  v24 = v12;
  v13 = v9;
  v25 = v13;
  v14 = v10;
  v26 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x20BD0CEF0](v23);
  v16 = v15;
  if (v5)
  {
    if (v14)
    {
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_2;
      v21[3] = &unk_24C0F06E8;
      v22 = v15;
      objc_msgSend(v14, "animateChanges:", v21);
      v17 = v22;
    }
    else
    {
      v18 = (void *)MEMORY[0x24BEBDB00];
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_3;
      v19[3] = &unk_24C0F06E8;
      v20 = v15;
      objc_msgSend(v18, "animateWithDuration:animations:", v19, 0.5);
      v17 = v20;
    }

  }
  else
  {
    v15[2](v15);
  }

}

void __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_sendBrowserChange:serviceProxy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "doc_detentForDocumentLandingMode:", objc_msgSend(*(id *)(a1 + 40), "documentLandingMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(*(id *)(a1 + 56), "selectedDetentIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v4;
    if (v3 != v4)
    {
      objc_msgSend(*(id *)(a1 + 56), "setSelectedDetentIdentifier:", v4);
      v2 = v4;
    }
  }

}

uint64_t __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendBrowserChange:(id)a3 serviceProxy:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "documentLandingMode") != -1)
  {
    -[UIDocumentBrowserViewController preferredUIPBrowserState](self, "preferredUIPBrowserState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(v8, "setDocumentLandingMode:", objc_msgSend(v9, "documentLandingMode"));
    -[UIDocumentBrowserViewController setPreferredUIPBrowserState:](self, "setPreferredUIPBrowserState:", v8);

  }
  objc_msgSend(v6, "applyBrowserStateChange:", v9);

}

- (void)_prepareForPresentingInUIPDocumentLanding
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  id v7;

  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inProcess");

  if ((v4 & 1) == 0 && !self->_configuredForUIPDocumentLanding)
  {
    self->_configuredForUIPDocumentLanding = 1;
    -[UIDocumentBrowserViewController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsInUIPDocumentLanding:", 1);

    v6 = objc_alloc_init(MEMORY[0x24BE2DF30]);
    v7 = objc_alloc_init(MEMORY[0x24BE2DF30]);

    objc_msgSend(v7, "setContentMode:", -1);
    objc_msgSend(v7, "setDocumentLandingMode:", 1);
    -[UIDocumentBrowserViewController setPreferredUIPBrowserState:](self, "setPreferredUIPBrowserState:", v7);
    -[UIDocumentBrowserViewController performBrowserStateChange:animated:](self, "performBrowserStateChange:animated:", v7, 0);
    -[UIDocumentBrowserViewController _doc_performRemoteUpdateAppearanceForReason:](self, "_doc_performRemoteUpdateAppearanceForReason:", 1);
    -[UIDocumentBrowserViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[UIDocumentBrowserViewController _beginMonitoringUIPPresentationController](self, "_beginMonitoringUIPPresentationController");

  }
}

- (void)_initiateDocumentCreationWithIntent:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4 && self->_serviceProxy)
  {
    -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActiveDocumentCreationIntent:", v4);

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__UIDocumentBrowserViewController__initiateDocumentCreationWithIntent___block_invoke;
    v6[3] = &unk_24C0F0710;
    v7 = v4;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v6);

  }
}

uint64_t __71__UIDocumentBrowserViewController__initiateDocumentCreationWithIntent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_initiateDocumentCreationWithIntent:", *(_QWORD *)(a1 + 32));
}

- (NSString)_activeDocumentCreationIntent
{
  void *v2;
  void *v3;

  -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDocumentCreationIntent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_didDenyCreateDocumentSessionWithError:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  DOCRunInMainThread();

}

void __74__UIDocumentBrowserViewController__didDenyCreateDocumentSessionWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "documentCreationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDenyCreateDocumentSessionWithError:", *(_QWORD *)(a1 + 40));

}

- (void)_requestAnimationInfoForDocumentAtURL:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserViewController.m"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserViewController.m"), 525, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke;
  v14[3] = &unk_24C0F0788;
  objc_copyWeak(&v17, &location);
  v10 = v9;
  v16 = v10;
  v11 = v7;
  v15 = v11;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  id v8;
  id *v9;
  _QWORD v10[4];
  _QWORD v11[5];
  id v12;
  id v13[5];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5 = objc_msgSend(a1[4], "startAccessingSecurityScopedResource");
    v6 = a1[4];
    v13[0] = 0;
    objc_msgSend(WeakRetained, "_sandboxingURLWrapperForURL:readonly:error:", v6, 1, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13[0];
    if (v5)
      objc_msgSend(a1[4], "stopAccessingSecurityScopedResource");
    if (v7)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_4;
      v10[3] = &unk_24C0F0760;
      v9 = (id *)v11;
      v11[0] = a1[5];
      objc_msgSend(v3, "_getAnimationInfoForDocumentAtURL:completion:", v7, v10);
    }
    else
    {
      v11[1] = MEMORY[0x24BDAC760];
      v11[2] = 3221225472;
      v11[3] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_3;
      v11[4] = &unk_24C0F06E8;
      v9 = &v12;
      v12 = a1[5];
      DOCRunInMainThread();
    }

  }
  else
  {
    v13[1] = (id)MEMORY[0x24BDAC760];
    v13[2] = (id)3221225472;
    v13[3] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_2;
    v13[4] = &unk_24C0F06E8;
    v14 = a1[5];
    DOCRunInMainThread();
    v8 = v14;
  }

}

uint64_t __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  DOCRunInMainThread();

}

uint64_t __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF88], 0);

  -[UIDocumentBrowserViewController _endMonitoringUIPPresentationController](self, "_endMonitoringUIPPresentationController");
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentBrowserViewController;
  -[UIDocumentBrowserViewController dealloc](&v4, sel_dealloc);
}

- (void)_viewControllerPresentationDidInitiate
{
  if (-[UIDocumentBrowserViewController _expectsRemoteViewController](self, "_expectsRemoteViewController"))
    -[UIDocumentBrowserViewController loadViewIfNeeded](self, "loadViewIfNeeded");
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;

  v4 = a3;
  if (self->_isDelayingRemotePresentation && !self->_isDelayingParentPresentation)
  {
    v6 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      self->_isDelayingParentPresentation = 1;
      objc_msgSend(v6, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
      v4 = v6;
    }
  }

}

- (void)_ensurePreparedForAPIRequringXPC
{
  void *v3;

  if (-[UIDocumentBrowserViewController _expectsRemoteViewController](self, "_expectsRemoteViewController"))
  {
    if (objc_msgSend(MEMORY[0x24BE2DEF0], "_UIPDocLandingInfrastructureEnabled")
      && (-[UIDocumentBrowserViewController documentLandingPresenter](self, "documentLandingPresenter"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      -[UIDocumentBrowserViewController _ensurePreparedForAPIRequringXPC_asUIP](self, "_ensurePreparedForAPIRequringXPC_asUIP");
    }
    else
    {
      -[UIDocumentBrowserViewController _ensurePreparedForAPIRequringXPC_asLegacy](self, "_ensurePreparedForAPIRequringXPC_asLegacy");
    }
  }
}

- (void)_ensurePreparedForAPIRequringXPC_asUIP
{
  if (!-[UIDocumentBrowserViewController isViewLoaded](self, "isViewLoaded")
    || !self->_configuredForUIPDocumentLanding)
  {
    -[UIDocumentBrowserViewController _prepareForPresentingInUIPDocumentLanding](self, "_prepareForPresentingInUIPDocumentLanding");
  }
}

- (void)_ensurePreparedForAPIRequringXPC_asLegacy
{
  if ((-[UIDocumentBrowserViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
    -[UIDocumentBrowserViewController loadViewIfNeeded](self, "loadViewIfNeeded");
}

void __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject **v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      v10 = (NSObject **)MEMORY[0x24BE2DF90];
      v11 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke_cold_1();
      objc_msgSend(v9, "remoteViewControllerDidTerminateViewServiceWithError:", v7);
    }
    else
    {
      objc_msgSend(WeakRetained, "setServiceProxy:", v6);
      objc_msgSend(v9, "_displayRemoteControllerIfNeeded");
    }
  }

}

- (BOOL)_expectsRemoteViewController
{
  void *v2;
  char v3;

  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inProcess") ^ 1;

  return v3;
}

- (void)_instantiateRemoteViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _UIResilientRemoteViewContainerViewController *v10;
  _UIResilientRemoteViewContainerViewController *remoteViewController;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  -[NSOperationQueue setSuspended:](self->_serviceQueue, "setSuspended:", 1);
  self->_isDisplayingRemoteViewController = 0;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPickerUI");

  if (v6)
    -[UIDocumentBrowserViewController updateBackgroundColor](self, "updateBackgroundColor");
  objc_initWeak(&location, self);
  -[UIDocumentBrowserViewController preferredUIPBrowserState](self, "preferredUIPBrowserState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_remoteHasReceivedInitialUIPBrowserState = v7 != 0;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__UIDocumentBrowserViewController__instantiateRemoteViewControllerWithCompletion___block_invoke;
  v13[3] = &unk_24C0F07D8;
  objc_copyWeak(&v15, &location);
  v9 = v4;
  v14 = v9;
  +[DOCRemoteViewController instantiateRemoteDocumentBrowserViewControllerWithHostProxy:configuration:initialUIPBrowserState:completionBlock:](DOCRemoteViewController, "instantiateRemoteDocumentBrowserViewControllerWithHostProxy:configuration:initialUIPBrowserState:completionBlock:", self, v8, v7, v13);
  v10 = (_UIResilientRemoteViewContainerViewController *)objc_claimAutoreleasedReturnValue();
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v10;

  -[_UIResilientRemoteViewContainerViewController view](self->_remoteViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __82__UIDocumentBrowserViewController__instantiateRemoteViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(v11, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "serviceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSuspended:", 0);

  }
}

- (void)_embedViewController:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  -[UIDocumentBrowserViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v17, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  -[UIDocumentBrowserViewController addChildViewController:](self, "addChildViewController:", v17);
  -[UIDocumentBrowserViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  objc_msgSend(v17, "didMoveToParentViewController:", self);
}

- (int64_t)_preferredModalPresentationStyle
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[UIDocumentBrowserViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
    return 2;
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentBrowserViewController;
  return -[UIDocumentBrowserViewController _preferredModalPresentationStyle](&v6, sel__preferredModalPresentationStyle);
}

- (CGSize)preferredContentSize
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  -[UIDocumentBrowserViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
  {
    v5 = 640.0;
    v6 = 960.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDocumentBrowserViewController;
    -[UIDocumentBrowserViewController preferredContentSize](&v7, sel_preferredContentSize);
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)_displayRemoteControllerIfNeeded
{
  NSObject **v3;
  NSObject *v4;
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
  void *v15;
  uint8_t v16[16];

  if (!self->_isDisplayingRemoteViewController && !self->_isDelayingRemotePresentation && self->_serviceProxy)
  {
    v3 = (NSObject **)MEMORY[0x24BE2DF90];
    v4 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_209052000, v4, OS_LOG_TYPE_DEFAULT, "Displaying remote controller", v16, 2u);
    }
    self->_isDisplayingRemoteViewController = 1;
    -[UIDocumentBrowserViewController updateBackgroundColor](self, "updateBackgroundColor");
    -[_UIResilientRemoteViewContainerViewController view](self->_remoteViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[UIDocumentBrowserViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[UIDocumentBrowserViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "windowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "persistentIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDocumentBrowserViewController forwardHostSceneIdentifier:](self, "forwardHostSceneIdentifier:", v15);

    }
  }
}

- (void)_doc_performRemoteUpdateAppearanceForReason:(unint64_t)a3
{
  const __CFString *v5;
  BOOL isDelayingRemotePresentation;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  __CFString *v13;
  id v14;
  BOOL v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[UIDocumentBrowserViewController _expectsRemoteViewController](self, "_expectsRemoteViewController"))
  {
    if (a3)
    {
      if (a3 == 1)
      {
        if (self->_isDelayingRemotePresentation)
          return;
        v5 = CFSTR("Update Coordination");
      }
      else
      {
        v5 = CFSTR("???");
      }
    }
    else
    {
      if (self->_hasScheduledAppearanceUpdateXPC)
        return;
      v5 = CFSTR("Appearance Changed");
    }
    isDelayingRemotePresentation = self->_isDelayingRemotePresentation;
    if (!isDelayingRemotePresentation)
    {
      self->_isDelayingRemotePresentation = 1;
      -[UIDocumentBrowserViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("scheduling appearance update XPC invocation (reason: %@)"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSObject **)MEMORY[0x24BE2DFC0];
    v9 = *MEMORY[0x24BE2DFC0];
    if (!*MEMORY[0x24BE2DFC0])
    {
      DOCInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v7);
      v11 = v9;
      *(_DWORD *)buf = 136315138;
      v17 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_209052000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

    }
    self->_hasScheduledAppearanceUpdateXPC = 1;
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke;
    v12[3] = &unk_24C0F0828;
    objc_copyWeak(&v14, (id *)buf);
    v13 = (__CFString *)v5;
    v15 = !isDelayingRemotePresentation;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

  }
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v8 = v6;
  v10 = *(_BYTE *)(a1 + 48);
  DOCRunInMainThread();

  objc_destroyWeak(&v9);
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  NSObject **v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _BYTE *v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invoking appearance update XPC invocation (reason: %@)"), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSObject **)MEMORY[0x24BE2DFC0];
    v5 = *MEMORY[0x24BE2DFC0];
    if (!*MEMORY[0x24BE2DFC0])
    {
      DOCInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v3);
      v7 = v5;
      *(_DWORD *)buf = 136315138;
      v16 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_209052000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

    }
    WeakRetained[971] = 0;
    v8 = (void *)*((_QWORD *)WeakRetained + 123);
    v9 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_95;
    v12[3] = &unk_24C0F0648;
    v10 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    v14 = WeakRetained;
    v11 = v8;
    objc_msgSend(v10, "updateAppearance:shouldFlushCA:requiresAck:completionBlock:", v11, 1, v9, v12);

  }
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_95(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_2_96;
  v2[3] = &unk_24C0F0648;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_2_96(uint64_t a1)
{
  void *v2;
  NSObject **v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("got appearance update XPC infocation (reason: %@)"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (NSObject **)MEMORY[0x24BE2DFC0];
  v4 = *MEMORY[0x24BE2DFC0];
  if (!*MEMORY[0x24BE2DFC0])
  {
    DOCInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v2);
    v6 = v4;
    *(_DWORD *)buf = 136315138;
    v8 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "_doc_endDelayingRemotePresentation");

}

- (void)_doc_endDelayingRemotePresentation
{
  void *v3;

  if (self->_isDelayingRemotePresentation)
  {
    self->_isDelayingRemotePresentation = 0;
    -[UIDocumentBrowserViewController _endDelayingPresentation](self, "_endDelayingPresentation");
    if (self->_isDelayingParentPresentation)
    {
      self->_isDelayingParentPresentation = 0;
      -[UIDocumentBrowserViewController parentViewController](self, "parentViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_endDelayingPresentation");

    }
    -[UIDocumentBrowserViewController _displayRemoteControllerIfNeeded](self, "_displayRemoteControllerIfNeeded");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v7[4];
  BOOL v8;
  BOOL v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIDocumentBrowserViewController;
  -[UIDocumentBrowserViewController setEditing:animated:](&v10, sel_setEditing_animated_);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__UIDocumentBrowserViewController_setEditing_animated___block_invoke;
  v7[3] = &__block_descriptor_34_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
  v8 = a3;
  v9 = a4;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v7);
}

void __55__UIDocumentBrowserViewController_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  DOCRunInMainThread();

}

uint64_t __55__UIDocumentBrowserViewController_setEditing_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)revealDocumentAtURL:(NSURL *)url importIfNeeded:(BOOL)importIfNeeded completion:(void *)completion
{
  NSURL *v9;
  void *v10;
  void *v11;
  id v12;
  NSURL *v13;
  void *v14;
  _QWORD v15[4];
  NSURL *v16;
  id v17;
  id v18;
  BOOL v19;
  id location;

  v9 = url;
  v10 = completion;
  if (v10)
    v11 = v10;
  else
    v11 = &__block_literal_global_1;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserViewController.m"), 948, CFSTR("revealDocumentAtURL:importIfNeeded:completion: should not be called with a nil url"));

  }
  objc_initWeak(&location, self);
  -[UIDocumentBrowserViewController _ensurePreparedForAPIRequringXPC](self, "_ensurePreparedForAPIRequringXPC");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2;
  v15[3] = &unk_24C0F0A20;
  objc_copyWeak(&v18, &location);
  v12 = v11;
  v17 = v12;
  v13 = v9;
  v16 = v13;
  v19 = importIfNeeded;
  -[UIDocumentBrowserViewController dismissAllPresentedViewControllers:completion:](self, "dismissAllPresentedViewControllers:completion:", 1, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  char v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3;
  v4[3] = &unk_24C0F09F8;
  objc_copyWeak(&v7, v2);
  v6 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 56);
  objc_msgSend(WeakRetained, "addOperationToServiceQueue:", v4);

  objc_destroyWeak(&v7);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void (**v11)(_QWORD, _QWORD);
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  NSObject **v18;
  NSObject *v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _QWORD v45[3];
  char v46;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v8 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_4;
    v37[3] = &unk_24C0F08E0;
    v39 = v45;
    v38 = *(id *)(a1 + 40);
    v40 = &v41;
    v35[0] = v8;
    v35[1] = 3221225472;
    v35[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_105;
    v35[3] = &unk_24C0F0930;
    v9 = (id)MEMORY[0x20BD0CEF0](v37);
    v36 = v9;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0CEF0](v35);
    v11 = v10;
    if (v5)
    {
      v24 = v6;
      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_109;
      v31[3] = &unk_24C0F09A8;
      v12 = v10;
      v33 = v12;
      v13 = WeakRetained;
      v32 = v13;
      v34 = v9;
      v25 = (void *)MEMORY[0x20BD0CEF0](v31);
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", UIDocumentBrowserDownloadsFolderPlaceholderPath);

      if (v15)
      {
        objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v29[0] = v8;
        v29[1] = 3221225472;
        v29[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_114;
        v29[3] = &unk_24C0F09D0;
        v30 = v25;
        objc_msgSend(v16, "_revealSymbolicLocation:completion:", 0, v29);
        v17 = v30;
      }
      else
      {
        v20 = objc_msgSend(*(id *)(a1 + 32), "startAccessingSecurityScopedResource");
        *((_BYTE *)v42 + 24) = v20;
        v21 = *(_QWORD *)(a1 + 32);
        v28 = 0;
        objc_msgSend(v13, "_sandboxingURLWrapperForURL:readonly:error:", v21, 1, &v28);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v28;
        if (v17)
        {
          objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = *(unsigned __int8 *)(a1 + 56);
          v26[0] = v8;
          v26[1] = 3221225472;
          v26[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_115;
          v26[3] = &unk_24C0F09D0;
          v27 = v25;
          objc_msgSend(v22, "_revealDocumentAtURL:importIfNeeded:completion:", v17, v23, v26);

        }
        else
        {
          (*((void (**)(id, id))v12 + 2))(v12, v16);
        }
      }

      v6 = v24;
    }
    else
    {
      v18 = (NSObject **)MEMORY[0x24BE2DF90];
      v19 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v19 = *v18;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3_cold_1();
      v11[2](v11, 0);
    }

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v45, 8);
  }

}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v10 = *(_OWORD *)(a1 + 32);
  v7 = (id)v10;
  v11 = v6;
  v8 = v6;
  v9 = v5;
  DOCRunInMainThread();

}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  NSObject **v2;
  NSObject *v3;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    v2 = (NSObject **)MEMORY[0x24BE2DF90];
    v3 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_5_cold_1();
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
    }
  }
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  DOCRunInMainThread();

}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_106(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject **v5;
  NSObject *v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager"), 1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = (NSObject **)MEMORY[0x24BE2DF90];
  v6 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_106_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_109(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v8 = a3;
  v10 = a1[5];
  v9 = a1[4];
  v11 = a1[6];
  v6 = v5;
  v7 = v8;
  DOCRunInMainThread();

}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_110(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = (NSObject **)MEMORY[0x24BE2DF90];
    v3 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_110_cold_1();
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "interactionModeForPreparing");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_111;
    v7[3] = &unk_24C0F0958;
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v4, "prepareForMode:usingBookmark:completionBlock:", v6, 1, v7);

  }
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_111(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject **v4;
  NSObject *v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v6, 0);

  }
  else
  {
    v4 = (NSObject **)MEMORY[0x24BE2DF90];
    v5 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_111_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  UIDocumentBrowserViewController *v12;
  id v13;
  BOOL v14;
  objc_super v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((dyld_program_sdk_at_least() & 1) == 0)
    -[UIDocumentBrowserViewController clearCurrentOpenInteraction](self, "clearCurrentOpenInteraction");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)UIDocumentBrowserViewController;
    -[UIDocumentBrowserViewController presentViewController:animated:completion:](&v15, sel_presentViewController_animated_completion_, v8, v6, v9);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__UIDocumentBrowserViewController_presentViewController_animated_completion___block_invoke;
    v10[3] = &unk_24C0F0A48;
    v11 = v8;
    v14 = v6;
    v12 = self;
    v13 = v9;
    -[UIDocumentBrowserViewController dismissAllPresentedViewControllers:completion:](self, "dismissAllPresentedViewControllers:completion:", v6, v10);

  }
}

void __77__UIDocumentBrowserViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 48);
  DOCRunInMainThread();

}

id __77__UIDocumentBrowserViewController_presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)UIDocumentBrowserViewController;
  return objc_msgSendSuper2(&v5, sel_presentViewController_animated_completion_, v1, v2, v3);
}

- (void)dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  _QWORD v7[4];
  void (**v8)(_QWORD);
  BOOL v9;

  v6 = (void (**)(_QWORD))a4;
  if (-[UIDocumentBrowserViewController _expectsRemoteViewController](self, "_expectsRemoteViewController"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke;
    v7[3] = &unk_24C0F0A70;
    v9 = a3;
    v8 = v6;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v7);

  }
  else
  {
    v6[2](v6);
  }

}

void __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke_2;
  v4[3] = &unk_24C0F06E8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "_dismissAllPresentedViewControllers:completion:", v3, v4);

}

uint64_t __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke_2()
{
  return DOCRunInMainThread();
}

- (void)_beginTransitionCoordinatorSessionForDocumentURL:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  UIDocumentBrowserTransitionController *v7;
  DOCServiceDocumentBrowserViewControllerInterface *serviceProxy;
  void *v9;
  UIDocumentBrowserTransitionController *v10;
  dispatch_time_t v11;
  UIDocumentBrowserTransitionController *v12;
  _QWORD block[5];
  UIDocumentBrowserTransitionController *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[UIDocumentBrowserTransitionController isCoordinatingForURL:](self->_uipTransitionCoordinator, "isCoordinatingForURL:", v4))
  {
    v5 = (NSObject **)MEMORY[0x24BE2DF90];
    v6 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_INFO, "Beginning UIP transition to open document: %@", buf, 0xCu);
    }
    v7 = [UIDocumentBrowserTransitionController alloc];
    serviceProxy = self->_serviceProxy;
    -[UIDocumentBrowserViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[UIDocumentBrowserTransitionController initWithItemURL:documentBrowserProxy:referenceView:](v7, "initWithItemURL:documentBrowserProxy:referenceView:", v4, serviceProxy, v9);

    objc_storeStrong((id *)&self->_uipTransitionCoordinator, v10);
    v11 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__UIDocumentBrowserViewController__beginTransitionCoordinatorSessionForDocumentURL___block_invoke;
    block[3] = &unk_24C0F0A98;
    block[4] = self;
    v14 = v10;
    v15 = v4;
    v12 = v10;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __84__UIDocumentBrowserViewController__beginTransitionCoordinatorSessionForDocumentURL___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 1000) == *(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = (NSObject **)MEMORY[0x24BE2DF90];
    v3 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(v1 + 48);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_209052000, v3, OS_LOG_TYPE_INFO, "Timeout waiting for UIP transition to open document: %@", (uint8_t *)&v5, 0xCu);
    }
    return objc_msgSend(*(id *)(v1 + 32), "_endTransitionCoordinatorSession");
  }
  return result;
}

- (void)_endTransitionCoordinatorSession
{
  NSObject **v3;
  NSObject *v4;
  UIDocumentBrowserTransitionController *uipTransitionCoordinator;
  NSObject *v6;
  void *v7;
  UIDocumentBrowserTransitionController *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_uipTransitionCoordinator)
  {
    v3 = (NSObject **)MEMORY[0x24BE2DF90];
    v4 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uipTransitionCoordinator = self->_uipTransitionCoordinator;
      v6 = v4;
      -[UIDocumentBrowserTransitionController itemURL](uipTransitionCoordinator, "itemURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_INFO, "Ending UIP transition to open document: %@", (uint8_t *)&v9, 0xCu);

    }
    -[UIDocumentBrowserTransitionController setLoadingProgress:](self->_uipTransitionCoordinator, "setLoadingProgress:", 0);
    -[UIDocumentBrowserTransitionController setTargetView:](self->_uipTransitionCoordinator, "setTargetView:", 0);
    v8 = self->_uipTransitionCoordinator;
    self->_uipTransitionCoordinator = 0;

    -[UIDocumentBrowserViewController clearCurrentOpenInteraction](self, "clearCurrentOpenInteraction");
  }
}

- (UIDocumentBrowserTransitionController)transitionControllerForDocumentAtURL:(NSURL *)documentURL
{
  NSURL *v4;
  UIDocumentBrowserTransitionController *uipTransitionCoordinator;
  UIDocumentBrowserTransitionController *v6;
  UIDocumentBrowserTransitionController *v7;
  DOCServiceDocumentBrowserViewControllerInterface *serviceProxy;
  void *v9;

  v4 = documentURL;
  uipTransitionCoordinator = self->_uipTransitionCoordinator;
  if (uipTransitionCoordinator
    && -[UIDocumentBrowserTransitionController isCoordinatingForURL:](uipTransitionCoordinator, "isCoordinatingForURL:", v4))
  {
    v6 = self->_uipTransitionCoordinator;
  }
  else
  {
    v7 = [UIDocumentBrowserTransitionController alloc];
    serviceProxy = self->_serviceProxy;
    -[UIDocumentBrowserViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIDocumentBrowserTransitionController initWithItemURL:documentBrowserProxy:referenceView:](v7, "initWithItemURL:documentBrowserProxy:referenceView:", v4, serviceProxy, v9);

  }
  return v6;
}

- (void)importDocumentAtURL:(NSURL *)documentURL nextToDocumentAtURL:(NSURL *)neighbourURL mode:(UIDocumentBrowserImportMode)importMode completionHandler:(void *)completion
{
  void *v10;
  void *v11;
  id v12;

  v10 = completion;
  if (v10)
    v11 = v10;
  else
    v11 = &__block_literal_global_120;
  v12 = v11;
  -[UIDocumentBrowserViewController _importDocumentAtURL:neighbourURL:mode:completionHandler:](self, "_importDocumentAtURL:neighbourURL:mode:completionHandler:", documentURL, neighbourURL, importMode);

}

- (void)importDocumentAtURL:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  -[UIDocumentBrowserViewController _importDocumentAtURL:neighbourURL:mode:completionHandler:](self, "_importDocumentAtURL:neighbourURL:mode:completionHandler:", a3, 0, a4, a5);
}

- (void)importDocumentAtURL:(id)a3 byMoving:(BOOL)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  uint64_t v6;

  if (a4)
    v6 = 2;
  else
    v6 = 1;
  -[UIDocumentBrowserViewController _importDocumentAtURL:neighbourURL:mode:completionHandler:](self, "_importDocumentAtURL:neighbourURL:mode:completionHandler:", a3, 0, v6, a5);
}

- (void)_importDocumentAtURL:(id)a3 neighbourURL:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  BOOL v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "inProcess");

  if ((v14 & 1) != 0)
  {
    if (v11)
      -[UIDocumentBrowserViewController importDocumentAtURL:nextToDocumentAtURL:mode:completionHandler:](self, "importDocumentAtURL:nextToDocumentAtURL:mode:completionHandler:", v10, v11, a5, v12);
    else
      -[UIDocumentBrowserViewController importDocumentAtURL:mode:toCurrentBrowserLocationWithCompletion:](self, "importDocumentAtURL:mode:toCurrentBrowserLocationWithCompletion:", v10, a5, v12);
  }
  else
  {
    objc_initWeak(&location, self);
    -[UIDocumentBrowserViewController _ensurePreparedForAPIRequringXPC](self, "_ensurePreparedForAPIRequringXPC");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke;
    v15[3] = &unk_24C0F0BA8;
    objc_copyWeak(v19, &location);
    v20 = a5 == 2;
    v16 = v10;
    v18 = v12;
    v17 = v11;
    v19[1] = (id)a5;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v15);

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }

}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  id *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  char v36;
  _QWORD v37[4];
  id v38;
  id v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  id v46;
  id v47;
  char v48;
  id v49;
  _QWORD v50[4];
  id v51;
  char v52;
  id v53[2];

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(_BYTE *)(a1 + 72) == 0;
    v7 = *(_QWORD *)(a1 + 32);
    v53[0] = 0;
    objc_msgSend(WeakRetained, "_sandboxingURLWrapperForURL:readonly:error:", v7, v6, v53);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v53[0];
    if (v8)
    {
      v10 = MEMORY[0x24BDAC760];
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2;
      v50[3] = &unk_24C0F0B30;
      v51 = *(id *)(a1 + 48);
      v52 = *(_BYTE *)(a1 + 72);
      v11 = (void *)MEMORY[0x20BD0CEF0](v50);
      v12 = *(void **)(a1 + 40);
      if (v12)
      {
        v13 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
        v14 = *(_QWORD *)(a1 + 40);
        v49 = 0;
        objc_msgSend(v5, "_sandboxingURLWrapperForURL:readonly:error:", v14, 1, &v49);
        v28 = objc_claimAutoreleasedReturnValue();
        v15 = v49;
        if (v15)
        {
          v41 = v10;
          v42 = 3221225472;
          v43 = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_122;
          v44 = &unk_24C0F0A48;
          v27 = &v45;
          v45 = *(id *)(a1 + 40);
          v16 = &v47;
          v47 = v11;
          v46 = v15;
          v48 = v13;
          DOCRunInMainThread();
          v17 = v46;
          v18 = (void *)v28;
        }
        else
        {
          v37[0] = v10;
          v37[1] = 3221225472;
          v37[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_123;
          v37[3] = &unk_24C0F0B58;
          v27 = &v39;
          v26 = v11;
          v23 = v11;
          v39 = v23;
          v40 = v13;
          v38 = *(id *)(a1 + 40);
          objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v37);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v5 + 124, *(id *)(a1 + 32));
          v25 = *(_QWORD *)(a1 + 64);
          v33[0] = v10;
          v33[1] = 3221225472;
          v33[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_124;
          v33[3] = &unk_24C0F0B80;
          v35 = v23;
          v36 = v13;
          v24 = *(void **)(a1 + 40);
          v16 = &v38;
          v11 = v26;
          v34 = v24;
          v18 = (void *)v28;
          objc_msgSend(v17, "_importDocumentAtURLWrapper:nextToDocumentAtURLWrapper:mode:completionHandler:", v8, v28, v25, v33);

        }
      }
      else
      {
        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_3_125;
        v31[3] = &unk_24C0F0930;
        v19 = v11;
        v32 = v19;
        objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v31);
        v20 = v11;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v5 + 124, *(id *)(a1 + 32));
        v22 = *(_QWORD *)(a1 + 64);
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_4;
        v29[3] = &unk_24C0F09D0;
        v30 = v19;
        objc_msgSend(v21, "_importDocumentAtURLWrapper:mode:toCurrentBrowserLocationWithCompletion:", v8, v22, v29);

        v11 = v20;
        v15 = v32;
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = v6;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    DOCRunInMainThread();

  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = (NSObject **)MEMORY[0x24BE2DF90];
    v3 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209052000, v3, OS_LOG_TYPE_INFO, "prepareForMode: _importDocumentAtURL with usingBookmark == YES", buf, 2u);
    }
    if (*(_BYTE *)(a1 + 56))
      v4 = 3;
    else
      v4 = 2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_121;
    v6[3] = &unk_24C0F0AE0;
    v5 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "prepareForMode:usingBookmark:completionBlock:", v4, 1, v6);

  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_121(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, 0);
  }
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_122(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t result;

  v2 = (NSObject **)MEMORY[0x24BE2DF90];
  v3 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_122_cold_1();
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return result;
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_123(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return result;
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_124(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  return result;
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_3_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentBrowserViewController;
  -[UIDocumentBrowserViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[UIDocumentBrowserViewController _checkIfObservedUIPPresentationControllerDetentDidChangeForReason:](self, "_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:", CFSTR("initial state check (viewWillAppear)"));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)UIDocumentBrowserViewController;
  v7 = a4;
  -[UIDocumentBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24C0F0BD0;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_24C0F0BD0;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

uint64_t __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:", CFSTR("View did transition to new size"));
}

void __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id buf[2];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (NSObject **)MEMORY[0x24BE2DF90];
    v6 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_DEFAULT, "viewWillTransitionToSize performed with the activity VC on screen. Asking for new frames.", (uint8_t *)buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "activityViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "activityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "popoverTracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "activityViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "popoverTracker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_135;
      v19[3] = &unk_24C0F0C20;
      v20 = v7;
      objc_copyWeak(&v21, buf);
      objc_msgSend(v12, "getFrameForRegion:waitForNewThumbnail:completionBlock:", 0, 0, v19);

      objc_destroyWeak(&v21);
      v13 = v20;
    }
    else
    {
      objc_msgSend(v10, "activityViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "barButtonItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
LABEL_11:
        objc_destroyWeak(buf);

        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 32), "activityViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "barButtonItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "activityViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "popoverPresentationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBarButtonItem:", v16);

    }
    goto LABEL_11;
  }
LABEL_12:

}

void __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_135(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v10;
  id v11[5];

  v10 = *(id *)(a1 + 32);
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  v11[3] = *(id *)&a4;
  v11[4] = *(id *)&a5;
  objc_copyWeak(v11, (id *)(a1 + 40));
  DOCRunInMainThread();
  objc_destroyWeak(v11);

}

void __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2_136(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BE2DF90];
  v3 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceRect");
    NSStringFromCGRect(v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGRect(*(CGRect *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_209052000, v5, OS_LOG_TYPE_DEFAULT, "new popover location retrieved updating location on targetController %@ from: %@ to: %@", (uint8_t *)&v14, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(v10, "barButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v10, "sourceView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerViewWillLayoutSubviews");

    goto LABEL_10;
  }
LABEL_11:

}

- (void)remoteViewControllerDidTerminateViewServiceWithError:(id)a3
{
  id v4;
  _UIResilientRemoteViewContainerViewController *remoteViewController;
  DOCServiceDocumentBrowserViewControllerInterface *serviceProxy;
  NSObject **v7;
  NSObject *v8;
  NSURL *urlCurrentlyBeingImported;
  void *v10;
  uint64_t v11;
  id v12;
  double (**v13)(void);
  double v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  v4 = a3;
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  serviceProxy = self->_serviceProxy;
  self->_serviceProxy = 0;

  -[NSOperationQueue setSuspended:](self->_serviceQueue, "setSuspended:", 1);
  v7 = (NSObject **)MEMORY[0x24BE2DF90];
  if (self->_urlCurrentlyBeingImported)
  {
    v8 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[UIDocumentBrowserViewController remoteViewControllerDidTerminateViewServiceWithError:].cold.3();
    -[UIDocumentBrowserViewController _failedToImportDocumentAtURL:error:](self, "_failedToImportDocumentAtURL:error:", self->_urlCurrentlyBeingImported, v4);
    urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
    self->_urlCurrentlyBeingImported = 0;

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke;
  v20[3] = &unk_24C0F0C48;
  v12 = v10;
  v21 = v12;
  v13 = (double (**)(void))MEMORY[0x20BD0CEF0](v20);
  v14 = v13[2]();
  if (DOCViewServiceRecoveryAttemptTimeThreshold_onceToken != -1)
    dispatch_once(&DOCViewServiceRecoveryAttemptTimeThreshold_onceToken, &__block_literal_global_695);
  if (v14 <= *(double *)&DOCViewServiceRecoveryAttemptTimeThreshold_interval)
    v15 = remoteViewControllerDidTerminateViewServiceWithError__remoteViewControllerRecoveryAttempts + 1;
  else
    v15 = 1;
  remoteViewControllerDidTerminateViewServiceWithError__remoteViewControllerRecoveryAttempts = v15;
  objc_storeStrong((id *)&remoteViewControllerDidTerminateViewServiceWithError__lastRemoteViewControllerRecoveryAttempt, v10);
  v16 = *v7;
  if ((unint64_t)remoteViewControllerDidTerminateViewServiceWithError__remoteViewControllerRecoveryAttempts < 4)
  {
    if (!v16)
    {
      DOCInitLogging();
      v16 = *v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UIDocumentBrowserViewController remoteViewControllerDidTerminateViewServiceWithError:].cold.2();
    -[UIDocumentBrowserViewController _clearShownViewControllers](self, "_clearShownViewControllers");
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke_140;
    v19[3] = &unk_24C0F0C70;
    v19[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v19);
  }
  else
  {
    if (!v16)
    {
      DOCInitLogging();
      v16 = *v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UIDocumentBrowserViewController remoteViewControllerDidTerminateViewServiceWithError:].cold.1();
    -[UIDocumentBrowserViewController configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isPickerUI");

    if (v18)
      -[UIDocumentBrowserViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      -[UIDocumentBrowserViewController _showErrorViewController](self, "_showErrorViewController");
  }

}

double __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;

  if (remoteViewControllerDidTerminateViewServiceWithError__lastRemoteViewControllerRecoveryAttempt)
  {
    v2 = (id)remoteViewControllerDidTerminateViewServiceWithError__lastRemoteViewControllerRecoveryAttempt;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", v2);
  v5 = v4;

  return v5;
}

uint64_t __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke_140(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showDocumentBrowserViewController:", 1);
}

- (NSArray)allowedContentTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF8240];
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentContentTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doc_identifiersForContentTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)recentDocumentsContentTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF8240];
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentDocumentsContentTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doc_identifiersForContentTypes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)contentTypesForRecentDocuments
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentDocumentsContentTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(NSArray *)additionalLeadingNavigationBarButtonItems
{
  NSArray *v5;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = additionalLeadingNavigationBarButtonItems;
  v6 = (NSObject **)MEMORY[0x24BE2DF90];
  v7 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    *(_DWORD *)buf = 134217984;
    v29 = -[NSArray count](v5, "count");
    _os_log_impl(&dword_209052000, v8, OS_LOG_TYPE_INFO, "setAdditionalLeadingNavigationBarButtonItems for %lu buttons", buf, 0xCu);

  }
  objc_storeStrong((id *)&self->_additionalLeadingNavigationBarButtonItems, additionalLeadingNavigationBarButtonItems);
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "inProcess");

  if ((v10 & 1) == 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_leadingBarButtonTrackingViews;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v14++), "removeFromSuperview");
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    v21 = 0;
    v22 = 0;
    -[UIDocumentBrowserViewController getTrackingViews:remoteButtons:fromBarButtons:](self, "getTrackingViews:remoteButtons:fromBarButtons:", &v22, &v21, v5);
    v15 = v22;
    v16 = v22;
    v17 = v21;
    v18 = v21;
    objc_storeStrong((id *)&self->_leadingBarButtonTrackingViews, v15);
    objc_storeStrong((id *)&self->_remoteAdditionalLeadingNavigationBarButtonItems, v17);
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __80__UIDocumentBrowserViewController_setAdditionalLeadingNavigationBarButtonItems___block_invoke;
    v19[3] = &unk_24C0F0C98;
    objc_copyWeak(&v20, (id *)buf);
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

void __80__UIDocumentBrowserViewController_setAdditionalLeadingNavigationBarButtonItems___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "remoteAdditionalLeadingNavigationBarButtonItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAdditionalLeadingNavigationBarButtonItems:", v5);

  }
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(NSArray *)additionalTrailingNavigationBarButtonItems
{
  NSArray *v5;
  void *v6;
  char v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = additionalTrailingNavigationBarButtonItems;
  objc_storeStrong((id *)&self->_additionalTrailingNavigationBarButtonItems, additionalTrailingNavigationBarButtonItems);
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "inProcess");

  if ((v7 & 1) == 0)
  {
    v8 = (NSObject **)MEMORY[0x24BE2DF90];
    v9 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      *(_DWORD *)buf = 134217984;
      v29 = -[NSArray count](v5, "count");
      _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_INFO, "setAdditionalTrailingNavigationBarButtonItems for %lu button", buf, 0xCu);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_trailingBarButtonTrackingViews;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v14++), "removeFromSuperview");
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    v21 = 0;
    v22 = 0;
    -[UIDocumentBrowserViewController getTrackingViews:remoteButtons:fromBarButtons:](self, "getTrackingViews:remoteButtons:fromBarButtons:", &v22, &v21, v5);
    v15 = v22;
    v16 = v22;
    v17 = v21;
    v18 = v21;
    objc_storeStrong((id *)&self->_trailingBarButtonTrackingViews, v15);
    objc_storeStrong((id *)&self->_remoteAdditionalTrailingNavigationBarButtonItems, v17);
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __81__UIDocumentBrowserViewController_setAdditionalTrailingNavigationBarButtonItems___block_invoke;
    v19[3] = &unk_24C0F0C98;
    objc_copyWeak(&v20, (id *)buf);
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

void __81__UIDocumentBrowserViewController_setAdditionalTrailingNavigationBarButtonItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (NSObject **)MEMORY[0x24BE2DF90];
    v6 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_INFO, "setAdditionalTrailingNavigationBarButtonItems: sending to service", v8, 2u);
    }
    objc_msgSend(WeakRetained, "remoteAdditionalTrailingNavigationBarButtonItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAdditionalTrailingNavigationBarButtonItems:", v7);

  }
}

uint64_t __52__UIDocumentBrowserViewController_setCustomActions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCustomActions:", *(_QWORD *)(a1 + 32));
}

- (void)setAllowsPickingMultipleItems:(BOOL)allowsPickingMultipleItems
{
  _QWORD v3[4];
  BOOL v4;

  self->_allowsPickingMultipleItems = allowsPickingMultipleItems;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__UIDocumentBrowserViewController_setAllowsPickingMultipleItems___block_invoke;
  v3[3] = &__block_descriptor_33_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
  v4 = allowsPickingMultipleItems;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v3);
}

uint64_t __65__UIDocumentBrowserViewController_setAllowsPickingMultipleItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setAllowsPickingMultipleItems:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)_updateAppearanceShowsCreateButton
{
  int v3;
  int allowsDocumentCreation;
  void *v5;
  _QWORD v7[4];
  char v8;

  v3 = -[DOCAppearance showsCreateButton](self->_appearance, "showsCreateButton");
  allowsDocumentCreation = self->_allowsDocumentCreation;
  if (allowsDocumentCreation != v3)
  {
    v5 = (void *)-[DOCAppearance copy](self->_appearance, "copy");
    objc_msgSend(v5, "setShowsCreateButton:", allowsDocumentCreation != 0);
    -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", v5);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__UIDocumentBrowserViewController__updateAppearanceShowsCreateButton__block_invoke;
    v7[3] = &__block_descriptor_33_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
    v8 = allowsDocumentCreation;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v7);

  }
  return allowsDocumentCreation != v3;
}

uint64_t __69__UIDocumentBrowserViewController__updateAppearanceShowsCreateButton__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setAllowsDocumentCreation:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setDefaultDocumentAspectRatio:(CGFloat)defaultDocumentAspectRatio
{
  double v5;
  void *v6;
  _QWORD v7[5];

  -[DOCAppearance defaultDocumentAspectRatio](self->_appearance, "defaultDocumentAspectRatio");
  if (v5 != defaultDocumentAspectRatio)
  {
    v6 = (void *)-[DOCAppearance copy](self->_appearance, "copy");
    objc_msgSend(v6, "setDefaultDocumentAspectRatio:", defaultDocumentAspectRatio);
    -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", v6);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__UIDocumentBrowserViewController_setDefaultDocumentAspectRatio___block_invoke;
  v7[3] = &__block_descriptor_40_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
  *(CGFloat *)&v7[4] = defaultDocumentAspectRatio;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v7);
}

uint64_t __65__UIDocumentBrowserViewController_setDefaultDocumentAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setDefaultDocumentAspectRatio:", *(double *)(a1 + 32));
}

- (CGFloat)defaultDocumentAspectRatio
{
  CGFloat result;

  -[DOCAppearance defaultDocumentAspectRatio](self->_appearance, "defaultDocumentAspectRatio");
  return result;
}

- (void)setLocalizedCreateDocumentActionTitle:(NSString *)localizedCreateDocumentActionTitle
{
  NSString *v4;
  void *v5;
  char v6;
  void *v7;
  NSString *v8;
  _QWORD v9[4];
  NSString *v10;

  v4 = localizedCreateDocumentActionTitle;
  -[DOCAppearance collectionCreateButtonTitle](self->_appearance, "collectionCreateButtonTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)-[DOCAppearance copy](self->_appearance, "copy");
    objc_msgSend(v7, "setCollectionCreateButtonTitle:", v4);
    -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", v7);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__UIDocumentBrowserViewController_setLocalizedCreateDocumentActionTitle___block_invoke;
  v9[3] = &unk_24C0F0710;
  v10 = v4;
  v8 = v4;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v9);

}

uint64_t __73__UIDocumentBrowserViewController_setLocalizedCreateDocumentActionTitle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setCreateButtonTitle:", *(_QWORD *)(a1 + 32));
}

- (NSString)localizedCreateDocumentActionTitle
{
  return -[DOCAppearance collectionCreateButtonTitle](self->_appearance, "collectionCreateButtonTitle");
}

- (void)setBrowserUserInterfaceStyle:(UIDocumentBrowserUserInterfaceStyle)browserUserInterfaceStyle
{
  id v5;

  if (-[DOCAppearance browserUserInterfaceStyle](self->_appearance, "browserUserInterfaceStyle") != browserUserInterfaceStyle)
  {
    -[UIDocumentBrowserViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2 * (browserUserInterfaceStyle == UIDocumentBrowserUserInterfaceStyleDark));
    v5 = (id)-[DOCAppearance copy](self->_appearance, "copy");
    objc_msgSend(v5, "setBrowserUserInterfaceStyle:", browserUserInterfaceStyle);
    -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", v5);

  }
}

- (BOOL)shouldShowFileExtensions
{
  return -[DOCAppearance shouldShowFileExtensions](self->_appearance, "shouldShowFileExtensions");
}

- (void)setShouldShowFileExtensions:(BOOL)shouldShowFileExtensions
{
  _BOOL8 v3;
  id v5;

  v3 = shouldShowFileExtensions;
  if (-[DOCAppearance shouldShowFileExtensions](self->_appearance, "shouldShowFileExtensions") != shouldShowFileExtensions)
  {
    v5 = (id)-[DOCAppearance copy](self->_appearance, "copy");
    objc_msgSend(v5, "setShouldShowFileExtensions:", v3);
    -[UIDocumentBrowserViewController effectiveAppearanceDidChange:](self, "effectiveAppearanceDidChange:", v5);

  }
}

- (UIDocumentBrowserUserInterfaceStyle)browserUserInterfaceStyle
{
  return -[DOCAppearance browserUserInterfaceStyle](self->_appearance, "browserUserInterfaceStyle");
}

- (void)clearCurrentOpenInteraction
{
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", &__block_literal_global_146);
}

uint64_t __62__UIDocumentBrowserViewController_clearCurrentOpenInteraction__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearCurrentOpenInteraction");
}

- (id)_unavailableConfigurationForTryAgain
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DOCConfiguration *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _DocumentManagerBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Error [UIDocumentBrowserViewController view service error]"), CFSTR("Error"), CFSTR("Localizable"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  _DocumentManagerBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Something went wrong while displaying documents."), CFSTR("Something went wrong while displaying documents."), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v6);
  objc_msgSend(v10, "setSecondaryText:", v9);
  v11 = self->_configuration;
  if (-[DOCConfiguration isInUIPDocumentLanding](v11, "isInUIPDocumentLanding"))
  {
    v12 = objc_alloc(MEMORY[0x24BEBDB38]);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithEffect:", v13);
    objc_msgSend(v10, "background");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCustomView:", v14);

  }
  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _DocumentManagerBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Try Again"), CFSTR("Try Again"), CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v18);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBaseForegroundColor:", v19);

  objc_initWeak(&location, self);
  objc_msgSend(v10, "setButton:", v16);
  v20 = (void *)MEMORY[0x24BEBD388];
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __71__UIDocumentBrowserViewController__unavailableConfigurationForTryAgain__block_invoke;
  v27 = &unk_24C0F0D40;
  objc_copyWeak(&v28, &location);
  objc_msgSend(v20, "actionWithHandler:", &v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "buttonProperties", v24, v25, v26, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPrimaryAction:", v21);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

  return v10;
}

void __71__UIDocumentBrowserViewController__unavailableConfigurationForTryAgain__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didTapTryAgainButton");

}

- (void)_showErrorViewController
{
  id v3;

  -[UIDocumentBrowserViewController _clearShownViewControllers](self, "_clearShownViewControllers");
  -[UIDocumentBrowserViewController _unavailableConfigurationForTryAgain](self, "_unavailableConfigurationForTryAgain");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDocumentBrowserViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v3);

}

- (void)_didTapTryAgainButton
{
  void *v3;
  id v4;

  -[UIDocumentBrowserViewController contentUnavailableConfiguration](self, "contentUnavailableConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "buttonProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEnabled:", 0);

    -[UIDocumentBrowserViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);
  }
  -[UIDocumentBrowserViewController _showDocumentBrowserViewController:](self, "_showDocumentBrowserViewController:", 1);

}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v3;
  char v4;

  -[UIDocumentBrowserViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (void)prepareItemBookmarks:(id)a3 usingBookmark:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDocumentBrowserViewController prepareItemBookmarks:forMode:usingBookmark:completionBlock:](self, "prepareItemBookmarks:forMode:usingBookmark:completionBlock:", v9, objc_msgSend(v10, "interactionModeForPreparing"), v5, v8);

}

- (void)prepareItemBookmarks:(id)a3 forMode:(unint64_t)a4 usingBookmark:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  UIDocumentBrowserViewController *v17;
  id v18;
  unint64_t v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke;
  block[3] = &unk_24C0F0D90;
  v20 = a5;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v19 = a4;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id obj;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_group_create();
  v15 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v3);
        dispatch_group_enter(v2);
        v5 = *(_QWORD *)(a1 + 56);
        v6 = *(unsigned __int8 *)(a1 + 64);
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "shouldConvert");
        objc_msgSend(*(id *)(a1 + 40), "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allowedConversions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_2;
        v20[3] = &unk_24C0F0D68;
        v21 = v15;
        v22 = v4;
        v23 = v2;
        objc_msgSend(v4, "prepareForMode:usingBookmark:shouldConvert:conversionRules:completionBlock:", v5, v6, v8, v10, v20);

        ++v3;
      }
      while (v16 != v3);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_3;
  block[3] = &unk_24C0F0738;
  v11 = *(id *)(a1 + 48);
  v18 = v15;
  v19 = v11;
  v12 = v15;
  dispatch_group_notify(v2, MEMORY[0x24BDAC9B8], block);

}

void __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)getTrackingViews:(id *)a3 remoteButtons:(id *)a4 fromBarButtons:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  UIDocumentBrowserViewController *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v32)
  {
    v9 = *(_QWORD *)v34;
    v10 = 0x24C0EF000uLL;
    v11 = 0x24C0EF000uLL;
    v30 = *(_QWORD *)v34;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 2992)), "initWithBarButton:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v12));
        v14 = objc_alloc(*(Class *)(v11 + 3000));
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithUUID:", v15);

        objc_msgSend(v7, "addObject:", v13);
        objc_msgSend(v8, "addObject:", v16);
        objc_msgSend(v13, "barButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "set_doc_ipi_view:", v16);

        -[UIView addSubview:](self->_trackingViewsContainer, "addSubview:", v16);
        v18 = *MEMORY[0x24BE2DF90];
        if (!*MEMORY[0x24BE2DF90])
        {
          DOCInitLogging();
          v18 = *MEMORY[0x24BE2DF90];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = v18;
          objc_msgSend(v13, "uuid");
          v20 = v8;
          v21 = v7;
          v22 = self;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v24 = v11;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v25;
          _os_log_impl(&dword_209052000, v19, OS_LOG_TYPE_INFO, "getTrackingViews:remoteButtons:fromBarButtons: creating RemoteButton with uuid: %@", buf, 0xCu);

          v11 = v24;
          self = v22;
          v7 = v21;
          v8 = v20;
          v9 = v30;
          v10 = 0x24C0EF000;
        }

        ++v12;
      }
      while (v32 != v12);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v32);
  }

  v26 = objc_retainAutorelease(v8);
  *a3 = v26;
  v27 = objc_retainAutorelease(v7);
  *a4 = v27;

}

- (id)trackingViewForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", self->_leadingBarButtonTrackingViews);
  objc_msgSend(v5, "addObjectsFromArray:", self->_trailingBarButtonTrackingViews);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "uuid", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)remoteBarButtonForUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", self->_remoteAdditionalLeadingNavigationBarButtonItems);
  objc_msgSend(v5, "addObjectsFromArray:", self->_remoteAdditionalTrailingNavigationBarButtonItems);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "uuid", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

void __62__UIDocumentBrowserViewController_addOperationToServiceQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);

}

- (void)_displayActivityControllerWithItemBookmarks:(id)a3 popoverTracker:(id)a4 isContentManaged:(BOOL)a5 additionalActivities:(id)a6 activityProxy:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject **v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id location[2];

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  -[UIDocumentBrowserViewController _activityViewControllerWithItemBookmarks:isForTitleMenuFolderSharing:popoverTracker:isContentManaged:additionalActivities:activityRunner:](self, "_activityViewControllerWithItemBookmarks:isForTitleMenuFolderSharing:popoverTracker:isContentManaged:additionalActivities:activityRunner:", v12, 0, v13, v9, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v13 && v16)
  {
    objc_initWeak(location, self);
    objc_storeWeak((id *)&self->_activityViewController, v17);
    v20 = v17;
    v21 = v13;
    objc_copyWeak(&v22, location);
    DOCRunInMainThread();
    objc_destroyWeak(&v22);

    objc_destroyWeak(location);
  }
  else
  {
    v18 = (NSObject **)MEMORY[0x24BE2DF90];
    v19 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_209052000, v19, OS_LOG_TYPE_DEFAULT, "Cannot present the activity view controller without a barButton or popoverTracker", (uint8_t *)location, 2u);
    }
  }

}

void __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setPopoverTracker:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke_2;
  v3[3] = &unk_24C0F0DE0;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  v3[4] = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getFrameForRegion:waitForNewThumbnail:completionBlock:", 0, 0, v3);

  objc_destroyWeak(&v5);
}

void __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v10;
  id v11[5];

  objc_copyWeak(v11, (id *)(a1 + 48));
  v10 = *(id *)(a1 + 40);
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  v11[3] = *(id *)&a4;
  v11[4] = *(id *)&a5;
  DOCRunInMainThread();

  objc_destroyWeak(v11);
}

void __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v16 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFilesApp");
    objc_msgSend(v16, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "window");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }

    objc_msgSend(*(id *)(a1 + 40), "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceView:", v6);

    v9 = *(double *)(a1 + 56);
    v10 = *(double *)(a1 + 64);
    v11 = *(double *)(a1 + 72);
    v12 = *(double *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 40), "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceRect:", v9, v10, v11, v12);

    v14 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "presentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "manageOverrideIfNecessaryForPresentationController:", v15);

    objc_msgSend(v16, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
    WeakRetained = v16;
  }

}

- (BOOL)_shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  BOOL v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentContentTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke;
  v20[3] = &unk_24C0F0E30;
  v21 = v7;
  v9 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_170);

  objc_msgSend(v9, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_3;
  v18[3] = &unk_24C0F0E98;
  v19 = v6;
  v13 = v6;
  v14 = objc_msgSend(v12, "indexOfObjectPassingTest:", v18);

  v16 = v11 != 0x7FFFFFFFFFFFFFFFLL || v14 != 0x7FFFFFFFFFFFFFFFLL;
  return v16;
}

void __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToType:", *MEMORY[0x24BDF83B8]) ^ 1;
}

BOOL __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_4;
  v8[3] = &unk_24C0F0E98;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "conformsToType:", a2);
}

- (id)_activityViewControllerWithItemBookmarks:(id)a3 isForTitleMenuFolderSharing:(BOOL)a4 popoverTracker:(id)a5 isContentManaged:(BOOL)a6 additionalActivities:(id)a7 activityRunner:(id)a8
{
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  DOCDocBrowserVC_UIActivityViewController *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  int v47;
  void *v48;
  DOCDocBrowserVC_UIActivityViewController *v49;
  id v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  id v58;
  _BOOL4 v59;
  void *v61;
  void *v62;
  void *v64;
  id v65;
  id obj;
  void *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id location;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v59 = a6;
  v83 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v58 = a5;
  v12 = a7;
  v68 = a8;
  v61 = v11;
  obj = v12;
  if (+[DOCItemBookmark isAnyItemBookmarkAFault:](DOCItemBookmark, "isAnyItemBookmarkAFault:", v11)
    && !DOCIsNetworkReachable())
  {
    if (!a4)
      DOCAlertUserTheNetworkIsNotReachable(self);
    goto LABEL_10;
  }
  if (a4
    || !-[UIDocumentBrowserViewController _shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks:](self, "_shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks:", v11))
  {
    goto LABEL_13;
  }
  -[UIDocumentBrowserViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    -[UIDocumentBrowserViewController delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0)
      goto LABEL_13;
    +[DOCItemBookmark documentsURLsForItemBookmarks:](DOCItemBookmark, "documentsURLsForItemBookmarks:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserViewController delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "documentBrowser:shouldShowActivityViewControllerForDocumentURLs:barButtonItem:popoverTracker:", self, v21, 0, v58);

    if (v23)
      goto LABEL_13;
LABEL_10:
    v18 = 0;
    goto LABEL_44;
  }
  +[DOCItemBookmark documentsURLsForItemBookmarks:](DOCItemBookmark, "documentsURLsForItemBookmarks:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentBrowserViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "documentBrowser:shouldShowActivityViewControllerForDocumentURLs:popoverTracker:isContentManaged:additionalActivities:activityProxy:", self, v15, v58, v59, obj, v68);

  if ((v17 & 1) == 0)
    goto LABEL_10;
LABEL_13:
  -[UIDocumentBrowserViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) == 0)
    goto LABEL_15;
  +[DOCItemBookmark documentsURLsForItemBookmarks:](DOCItemBookmark, "documentsURLsForItemBookmarks:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDocumentBrowserViewController delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "documentBrowser:applicationActivitiesForDocumentURLs:", self, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", CFSTR("com.apple.DocumentManagerUICore.SaveToFiles"));
  objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "canCopySourceIsContentManaged:", v59);

  if (v30)
  {
    objc_msgSend(obj, "arrayByAddingObject:", CFSTR("com.apple.DocumentManager.action.copy"));
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v31;
  }
  else
  {
    v32 = obj;
  }
  objc_msgSend(v62, "addObject:", *MEMORY[0x24BE8F6A0]);
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  v77 = 0u;
  obj = v32;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v78;
    do
    {
      v35 = 0;
      v36 = v28;
      do
      {
        if (*(_QWORD *)v78 != v34)
          objc_enumerationMutation(obj);
        +[DOCActivity activityWithIdentifier:actionPerformerProxy:](DOCActivity, "activityWithIdentifier:actionPerformerProxy:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v35), v68);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "arrayByAddingObject:", v37);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        ++v35;
        v36 = v28;
      }
      while (v33 != v35);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v61, "count"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v65 = v61;
  v38 = 0;
  v39 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v74 != v40)
          objc_enumerationMutation(v65);
        v42 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v42, "fileURL");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObject:", v43);
        objc_msgSend(v42, "fileProviderItem");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isTrashed");

        objc_msgSend(v42, "fileURL");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "startAccessingSecurityScopedResource");

        if (v47)
        {
          objc_msgSend(v42, "fileURL");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addObject:", v48);

        }
        v38 |= v45;
      }
      v39 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v39);
  }

  objc_initWeak(&location, self);
  v49 = -[DOCDocBrowserVC_UIActivityViewController initWithActivityItems:applicationActivities:]([DOCDocBrowserVC_UIActivityViewController alloc], "initWithActivityItems:applicationActivities:", v67, v28);
  -[DOCDocBrowserVC_UIActivityViewController setIsContentManaged:](v49, "setIsContentManaged:", v59);
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = __172__UIDocumentBrowserViewController__activityViewControllerWithItemBookmarks_isForTitleMenuFolderSharing_popoverTracker_isContentManaged_additionalActivities_activityRunner___block_invoke;
  v69[3] = &unk_24C0F0EC0;
  v50 = v64;
  v70 = v50;
  objc_copyWeak(&v71, &location);
  -[DOCDocBrowserVC_UIActivityViewController setCompletionWithItemsHandler:](v49, "setCompletionWithItemsHandler:", v69);
  if (!a4)
  {
    -[UIDocumentBrowserViewController delegate](self, "delegate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_opt_respondsToSelector();

    if ((v52 & 1) != 0)
    {
      -[UIDocumentBrowserViewController delegate](self, "delegate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "documentBrowser:willPresentActivityViewController:", self, v49);

    }
  }
  if ((v38 & 1) != 0)
  {
    objc_msgSend(v62, "addObject:", CFSTR("com.apple.UIKit.activity.CloudSharing"));
    objc_msgSend(v62, "addObject:", CFSTR("com.apple.DocumentManager.action.copySharedLink"));
    -[DOCDocBrowserVC_UIActivityViewController excludedActivityTypes](v49, "excludedActivityTypes");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "count") == 0;

    if (!v55)
    {
      -[DOCDocBrowserVC_UIActivityViewController excludedActivityTypes](v49, "excludedActivityTypes");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addObjectsFromArray:", v56);

    }
  }
  if (objc_msgSend(v62, "count"))
    -[DOCDocBrowserVC_UIActivityViewController setExcludedActivityTypes:](v49, "setExcludedActivityTypes:", v62);
  -[DOCDocBrowserVC_UIActivityViewController setModalPresentationStyle:](v49, "setModalPresentationStyle:", 7);
  v18 = v49;
  objc_destroyWeak(&v71);

  objc_destroyWeak(&location);
LABEL_44:

  return v18;
}

void __172__UIDocumentBrowserViewController__activityViewControllerWithItemBookmarks_isForTitleMenuFolderSharing_popoverTracker_isContentManaged_additionalActivities_activityRunner___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "stopAccessingSecurityScopedResource", (_QWORD)v11);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "setEditing:", 0);

  }
}

- (id)_sandboxingURLWrapperForURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "checkPromisedItemIsReachableAndReturnError:", a5) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v7, v6, a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (NSObject **)MEMORY[0x24BE2DF90];
    v10 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_DEFAULT, "Error while trying to reveal a document at a URL: The resource is not reachable.", v12, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  int v7;
  int v8;
  char IsKeyInput;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  -[UIDocumentBrowserViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIDocumentBrowserViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[UIDocumentBrowserViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = v3 == 0;
    else
      v6 = 0;
    v7 = v6;

    if (v3)
      goto LABEL_9;
  }
  else
  {
    v7 = 0;
    if (v3)
    {
LABEL_9:
      v8 = objc_msgSend(v3, "conformsToProtocol:", &unk_2545C5210);
      goto LABEL_12;
    }
  }
  v8 = 0;
LABEL_12:
  if ((v7 | v8) == 1)
  {
    IsKeyInput = DOCFirstResponderIsKeyInput();
    -[UIDocumentBrowserViewController configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFilesApp");

    v12 = (void *)objc_opt_new();
    if ((v11 & 1) == 0)
    {
      v13 = (void *)objc_opt_new();
      -[UIDocumentBrowserViewController configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "inProcess") & 1) != 0)
        objc_msgSend(v13, "allKeyCommands");
      else
        objc_msgSend(v13, "allKeyCommandsWithAction:", sel_performKeyCommandNoOpOnHostSide_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "addObjectsFromArray:", v15);
      -[UIDocumentBrowserViewController configuration](self, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "inProcess") | IsKeyInput;

      if ((v17 & 1) == 0)
      {
        +[DOCKeyboardFocusManager allDirectionalKeyCommandsWithAction:prioritize:](DOCKeyboardFocusManager, "allDirectionalKeyCommandsWithAction:prioritize:", sel_performKeyCommandNoOpOnHostSide_, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v18);

      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)preferredFocusEnvironments
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDocumentBrowserViewController;
  -[UIDocumentBrowserViewController preferredFocusEnvironments](&v3, sel_preferredFocusEnvironments);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  char v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  NSString *v15;
  SEL v16;
  unsigned __int8 allowsDocumentCreation;
  void *v19;
  objc_super v20;

  v6 = a4;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFilesApp");

  objc_opt_class();
  v9 = (char *)a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (char *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "propertyList");
      v10 = objc_claimAutoreleasedReturnValue();
      v9 = (char *)a3;
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v6, "propertyList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v9 = (char *)a3;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v6, "propertyList");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.DocumentManager.keyCommands.originalKeyCommandAction"));
          v15 = (NSString *)objc_claimAutoreleasedReturnValue();

          v9 = (char *)a3;
          if (v15)
          {
            v16 = NSSelectorFromString(v15);
            if (v16)
              v9 = (char *)v16;
            else
              v9 = (char *)a3;
          }

        }
      }
    }
  }
  if (v9 == sel_performCreateDocumentOrOpenNewWindow_)
  {
    if ((v8 & 1) == 0)
    {
      allowsDocumentCreation = self->_allowsDocumentCreation;
      goto LABEL_20;
    }
LABEL_19:
    allowsDocumentCreation = 0;
    goto LABEL_20;
  }
  if (v9 == sel_performPreview_)
    goto LABEL_19;
  if (v9 == sel_performConnectToServer_ || v9 == sel_performEjectMedium_)
  {
    if ((v8 & 1) == 0)
    {
      -[UIDocumentBrowserViewController configuration](self, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      allowsDocumentCreation = -[UIDocumentBrowserViewController supportsRemovableFileProvidersForConfiguration:](self, "supportsRemovableFileProvidersForConfiguration:", v19);

      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (sel_performKeyCommandNoOpOnHostSide_ == a3)
  {
    allowsDocumentCreation = 1;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIDocumentBrowserViewController;
    allowsDocumentCreation = -[UIDocumentBrowserViewController canPerformAction:withSender:](&v20, sel_canPerformAction_withSender_, a3, v6);
  }
LABEL_20:

  return allowsDocumentCreation;
}

- (void)_establishFirstResponderOnServiceSideForKeyCommand:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__UIDocumentBrowserViewController__establishFirstResponderOnServiceSideForKeyCommand___block_invoke;
  v6[3] = &unk_24C0F0710;
  v7 = v4;
  v5 = v4;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v6);

}

uint64_t __86__UIDocumentBrowserViewController__establishFirstResponderOnServiceSideForKeyCommand___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_establishFirstResponderAndPerformKeyCommand:", *(_QWORD *)(a1 + 32));
}

- (void)_presentActivityViewControllerForItemBookmarks:(id)a3 withPopoverTracker:(id)a4 isContentManaged:(BOOL)a5 additionalActivities:(id)a6 activityProxy:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject **v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (NSObject **)MEMORY[0x24BE2DF90];
  v17 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_209052000, v17, OS_LOG_TYPE_DEFAULT, "Present the activity view controller in the host on items: %@ popoverTracker:%@", buf, 0x16u);
  }
  v18 = *v16;
  if (!*v16)
  {
    DOCInitLogging();
    v18 = *v16;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209052000, v18, OS_LOG_TYPE_INFO, "prepareForMode: _presentActivityViewControllerForItemBookmarks with usingBookmark == NO", buf, 2u);
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __153__UIDocumentBrowserViewController__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke;
  v22[3] = &unk_24C0F0EE8;
  v22[4] = self;
  v23 = v13;
  v26 = a5;
  v24 = v14;
  v25 = v15;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  -[UIDocumentBrowserViewController prepareItemBookmarks:forMode:usingBookmark:completionBlock:](self, "prepareItemBookmarks:forMode:usingBookmark:completionBlock:", v12, 1, 0, v22);

}

uint64_t __153__UIDocumentBrowserViewController__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayActivityControllerWithItemBookmarks:popoverTracker:isContentManaged:additionalActivities:activityProxy:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)_canSendDocumentLandingDidPickDocumentsAtURLs
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_documentLandingPresenter);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)_sendDocumentLandingDidPickDocumentsAtURLs:(id)a3
{
  _UIDocumentLandingPresenter **p_documentLandingPresenter;
  id v5;
  id WeakRetained;

  p_documentLandingPresenter = &self->_documentLandingPresenter;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_documentLandingPresenter);
  objc_msgSend(WeakRetained, "documentLandingBrowser:didPickDocumentsAtURLs:", self, v5);

}

- (void)_commitDocumentURLPreview:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  UIDocumentBrowserViewController *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__UIDocumentBrowserViewController__commitDocumentURLPreview___block_invoke;
  v7[3] = &unk_24C0F0F10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[UIDocumentBrowserViewController prepareItemBookmarks:usingBookmark:completionBlock:](self, "prepareItemBookmarks:usingBookmark:completionBlock:", v5, 1, v7);

}

void __61__UIDocumentBrowserViewController__commitDocumentURLPreview___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "_canSendDocumentLandingDidPickDocumentsAtURLs"))
    objc_msgSend(*(id *)(a1 + 40), "_sendDocumentLandingDidPickDocumentsAtURLs:", v3);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "documentBrowser:didPickDocumentsAtURLs:", *(_QWORD *)(a1 + 40), v3);
LABEL_7:

    goto LABEL_8;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentBrowser:didPickDocumentURLs:", *(_QWORD *)(a1 + 40), v3);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_didTriggerCustomActionWithIdentifier:(id)a3 onItemBookmarks:(id)a4
{
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (NSObject **)MEMORY[0x24BE2DF90];
  v9 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209052000, v9, OS_LOG_TYPE_INFO, "prepareForMode: _didTriggerCustomActionWithIdentifier with usingBookmark == NO", buf, 2u);
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke;
  v11[3] = &unk_24C0F0F10;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[UIDocumentBrowserViewController prepareItemBookmarks:forMode:usingBookmark:completionBlock:](self, "prepareItemBookmarks:forMode:usingBookmark:completionBlock:", v7, 1, 0, v11);

}

void __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject **v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "customActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke_2;
  v13[3] = &unk_24C0F0F38;
  v14 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v13);

  objc_msgSend(*(id *)(a1 + 32), "customActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (v8)
  {
    objc_msgSend(v8, "resolvedHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v3, 0);

  }
  else
  {
    v10 = (NSObject **)MEMORY[0x24BE2DF90];
    v11 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_209052000, v11, OS_LOG_TYPE_INFO, "tried to perform an action that does not exist anymore", v12, 2u);
    }
  }

}

uint64_t __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (void)_didPickItemBookmarks:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  NSObject **v13;
  NSObject *v14;
  const __CFString *v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInUIPDocumentLanding");

  if (!v6 || !self->_uipTransitionCoordinator)
  {
    -[UIDocumentBrowserViewController _clearCurrentOpenInteractionUnlessUIPDocumentLanding](self, "_clearCurrentOpenInteractionUnlessUIPDocumentLanding");
    v7 = -[UIDocumentBrowserViewController _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_documentBrowser_didPickDocumentURLs_);
    v8 = -[UIDocumentBrowserViewController _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", sel_documentBrowser_didPickDocumentsAtURLs_);
    v9 = -[UIDocumentBrowserViewController _canSendDocumentLandingDidPickDocumentsAtURLs](self, "_canSendDocumentLandingDidPickDocumentsAtURLs");
    v10 = v9;
    if (v7 || v8 || v9)
    {
      -[UIDocumentBrowserViewController configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "interactionMode");

      v13 = (NSObject **)MEMORY[0x24BE2DF90];
      v14 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = CFSTR("NO");
        if (v12 == 1)
          v15 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v22 = v15;
        _os_log_impl(&dword_209052000, v14, OS_LOG_TYPE_INFO, "prepareForMode: _didPickItemBookmarks with usingBookmark == %@", buf, 0xCu);
      }
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke;
      v16[3] = &unk_24C0F0F88;
      v18 = v10;
      v16[4] = self;
      v19 = v8;
      v20 = v7;
      v17 = v4;
      -[UIDocumentBrowserViewController prepareItemBookmarks:usingBookmark:completionBlock:](self, "prepareItemBookmarks:usingBookmark:completionBlock:", v17, v12 == 1, v16);

    }
  }

}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  int v13;
  NSObject **v14;
  NSObject *v15;
  _QWORD v16[5];
  char v17;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "fileURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_2;
  v16[3] = &unk_24C0F0F60;
  v17 = *(_BYTE *)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 32);
  v18 = *(_WORD *)(a1 + 49);
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0CEF0](v16);
  if (objc_msgSend(v4, "count"))
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "forSavingDocuments");

  v14 = (NSObject **)MEMORY[0x24BE2DF90];
  v15 = *MEMORY[0x24BE2DF90];
  if (v13)
  {
    if (!v15)
    {
      DOCInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_1();
LABEL_14:
    ((void (**)(_QWORD, void *))v11)[2](v11, v4);
    goto LABEL_15;
  }
  if (!v15)
  {
    DOCInitLogging();
    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_2();
LABEL_15:

}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(a2, "copy");
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_sendDocumentLandingDidPickDocumentsAtURLs:", v3);
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentBrowser:didPickDocumentsAtURLs:", *(_QWORD *)(a1 + 32), v3);
  }
  else
  {
    if (!*(_BYTE *)(a1 + 42))
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentBrowser:didPickDocumentURLs:", *(_QWORD *)(a1 + 32), v3);
  }

LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInUIPDocumentLanding"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000);

    if (!v6)
      DOCRunInMainThread();
  }
  else
  {

  }
}

uint64_t __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearCurrentOpenInteraction");
}

- (void)_clearCurrentOpenInteractionUnlessUIPDocumentLanding
{
  void *v3;
  char v4;
  dispatch_time_t v5;
  _QWORD block[9];
  id v7;
  id location;

  -[UIDocumentBrowserViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInUIPDocumentLanding");

  if ((v4 & 1) == 0)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_initWeak(&location, self);
      block[5] = MEMORY[0x24BDAC760];
      block[6] = 3221225472;
      block[7] = __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke;
      block[8] = &unk_24C0F0FB0;
      objc_copyWeak(&v7, &location);
      DOCRunInMainThread();
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
    else
    {
      v5 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke_2;
      block[3] = &unk_24C0F0C70;
      block[4] = self;
      dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCurrentOpenInteraction");

}

uint64_t __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearCurrentOpenInteraction");
}

- (void)_documentPickerWasCancelled
{
  DOCRunInMainThread();
}

void __62__UIDocumentBrowserViewController__documentPickerWasCancelled__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "documentBrowser:didPickDocumentURLs:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1A8]);
  }
  else
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentManagerWasCancelled:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_setURLCurrentlyBeingImported:(id)a3
{
  objc_storeStrong((id *)&self->_urlCurrentlyBeingImported, a3);
}

- (void)_iOS_didRequestDocumentCreationWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  UIDocumentBrowserViewController *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got %s: %s"), "iOS", "-[UIDocumentBrowserViewController _iOS_didRequestDocumentCreationWithHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSObject **)MEMORY[0x24BE2DF70];
  v7 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_retainAutorelease(v5);
    v9 = v7;
    *(_DWORD *)buf = 136315138;
    v19 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_209052000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[UIDocumentBrowserViewController documentCreationController](self, "documentCreationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke;
  v13[3] = &unk_24C0F0FD8;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v4;
  v16 = v11;
  v12 = v10;
  v14 = v12;
  v15 = self;
  -[UIDocumentBrowserViewController _core_didRequestDocumentCreationWithHandler:](self, "_core_didRequestDocumentCreationWithHandler:", v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  void *v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  id v13;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (a3 && v6 && WeakRetained)
  {
    v13 = 0;
    objc_msgSend(WeakRetained, "_sandboxingURLWrapperForURL:readonly:error:", v6, a3 != 2, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v10)
    {
      v11 = (NSObject **)MEMORY[0x24BE2DF70];
      v12 = *MEMORY[0x24BE2DF70];
      if (!*MEMORY[0x24BE2DF70])
      {
        DOCInitLogging();
        v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke_cold_1();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 40), "_failedToImportDocumentAtURL:error:", v6, v10);
    }
    else
    {
      objc_storeStrong(v8 + 124, a2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "didEndSessionWithImportedURL:canceled:error:", 0, 1, 0);
  }

}

- (void)_core_didRequestDocumentCreationWithHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Got %s: %s"), "core", "-[UIDocumentBrowserViewController _core_didRequestDocumentCreationWithHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSObject **)MEMORY[0x24BE2DF70];
  v8 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_retainAutorelease(v6);
    v10 = v8;
    *(_DWORD *)buf = 136315138;
    v20 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v11 = (void *)MEMORY[0x20BD0CEF0](v5);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke;
  v16[3] = &unk_24C0F1000;
  objc_copyWeak(&v18, (id *)buf);
  v12 = v11;
  v17 = v12;
  v13 = (void *)MEMORY[0x20BD0CEF0](v16);
  objc_copyWeak(&v15, (id *)buf);
  v14 = v13;
  DOCRunInMainThread();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak((id *)buf);
}

void __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  NSObject **v7;
  NSObject *v8;
  void (*v9)(void);
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = (NSObject **)MEMORY[0x24BE2DF70];
  v8 = *MEMORY[0x24BE2DF70];
  if (WeakRetained)
  {
    if (!v8)
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_209052000, v8, OS_LOG_TYPE_DEFAULT, "Document creation (core) - completion called with url: %@, mode: %lu.", (uint8_t *)&v10, 0x16u);
    }
    if (v5 && a3)
      objc_msgSend(WeakRetained, "_setURLCurrentlyBeingImported:", v5);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (!v8)
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_209052000, v8, OS_LOG_TYPE_DEFAULT, "Document creation (core) skipped - strongSelf == nil", (uint8_t *)&v10, 2u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v9();

}

void __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke_226(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject **v5;
  NSObject *v6;
  NSObject **v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "documentCreationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "handlesDidRequestDocumentCreation") & 1) != 0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke_227;
      v9[3] = &unk_24C0F1028;
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v4, "performDidRequestDocumentCreationWithHandler:", v9);

    }
    else
    {
      v7 = (NSObject **)MEMORY[0x24BE2DF70];
      v8 = *MEMORY[0x24BE2DF70];
      if (!*MEMORY[0x24BE2DF70])
      {
        DOCInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209052000, v8, OS_LOG_TYPE_DEFAULT, "Document creation (core) skipped - handlesDidRequestDocumentCreation == false", buf, 2u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    v5 = (NSObject **)MEMORY[0x24BE2DF70];
    v6 = *MEMORY[0x24BE2DF70];
    if (!*MEMORY[0x24BE2DF70])
    {
      DOCInitLogging();
      v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_DEFAULT, "Document creation (core) skipped - strongSelf == nil", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke_227(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_iOS_didImportDocumentAtURL:(id)a3 toDestinationItemBookmark:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSURL *urlCurrentlyBeingImported;
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got %s: %s"), "iOS", "-[UIDocumentBrowserViewController _iOS_didImportDocumentAtURL:toDestinationItemBookmark:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSObject **)MEMORY[0x24BE2DF70];
  v10 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    *(_DWORD *)buf = 136315138;
    v18 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  v16 = v6;
  v14 = v6;
  v15 = v7;
  DOCRunInMainThread();

}

void __89__UIDocumentBrowserViewController__iOS_didImportDocumentAtURL_toDestinationItemBookmark___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint8_t buf[16];

  v2 = (NSObject **)MEMORY[0x24BE2DF70];
  v3 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209052000, v3, OS_LOG_TYPE_INFO, "prepareForMode: _didImportDocumentAtURL with usingBookmark == YES", buf, 2u);
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interactionModeForPreparing");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__UIDocumentBrowserViewController__iOS_didImportDocumentAtURL_toDestinationItemBookmark___block_invoke_228;
  v8[3] = &unk_24C0F0D68;
  v7 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v7;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "prepareForMode:usingBookmark:completionBlock:", v6, 1, v8);

}

void __89__UIDocumentBrowserViewController__iOS_didImportDocumentAtURL_toDestinationItemBookmark___block_invoke_228(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "fileURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_core_didImportDocumentAtURL:toDestinationURL:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager"), 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_failedToImportDocumentAtURL:error:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_core_didImportDocumentAtURL:(id)a3 toDestinationURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSURL *urlCurrentlyBeingImported;
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got %s: %s"), "core", "-[UIDocumentBrowserViewController _core_didImportDocumentAtURL:toDestinationURL:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSObject **)MEMORY[0x24BE2DF70];
  v10 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    *(_DWORD *)buf = 136315138;
    v18 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  v16 = v6;
  v14 = v7;
  v15 = v6;
  DOCRunInMainThread();

}

void __81__UIDocumentBrowserViewController__core_didImportDocumentAtURL_toDestinationURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "documentCreationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performDidImportDocumentAtURL:toDestinationURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_iOS_failedToImportDocumentAtURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSURL *urlCurrentlyBeingImported;
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got %s: %s"), "iOS", "-[UIDocumentBrowserViewController _iOS_failedToImportDocumentAtURL:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSObject **)MEMORY[0x24BE2DF70];
  v10 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    *(_DWORD *)buf = 136315138;
    v18 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  v16 = v6;
  v14 = v7;
  v15 = v6;
  DOCRunInMainThread();

}

void __74__UIDocumentBrowserViewController__iOS_failedToImportDocumentAtURL_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "documentCreationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performFailedToImportDocumentAtURL:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_core_failedToImportDocumentAtURL:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSURL *urlCurrentlyBeingImported;
  id v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got %s: %s"), "core", "-[UIDocumentBrowserViewController _core_failedToImportDocumentAtURL:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSObject **)MEMORY[0x24BE2DF70];
  v10 = *MEMORY[0x24BE2DF70];
  if (!*MEMORY[0x24BE2DF70])
  {
    DOCInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    *(_DWORD *)buf = 136315138;
    v18 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  v16 = v6;
  v14 = v7;
  v15 = v6;
  DOCRunInMainThread();

}

void __75__UIDocumentBrowserViewController__core_failedToImportDocumentAtURL_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "documentCreationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performFailedToImportDocumentAtURL:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_updateRemoteBarButtonFrames:(id)a3 forUUID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  DOCRunInMainThread();

}

void __72__UIDocumentBrowserViewController__updateRemoteBarButtonFrames_forUUID___block_invoke(id *a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;

  objc_msgSend(a1[4], "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popoverPresentationController");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[5], "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(a1[5], "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "CGRectValue");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      objc_msgSend(a1[6], "objectAtIndexedSubscript:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "trackingViewForUUID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "remoteBarButtonForUUID:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
      if (v22)
      {
        objc_msgSend(v22, "barButtonItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "barButton");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v17)
        {
          objc_msgSend(v22, "containerView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setNeedsLayout");

        }
      }

      ++v3;
    }
    while (objc_msgSend(a1[5], "count") > v3);
  }
  objc_msgSend(a1[4], "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(a1[4], "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "documentBrowserDidUpdateAdditionalNavigationBarButtonItems:", a1[4]);

  }
}

- (void)_didTriggerBarButtonWithUUID:(id)a3 overflowAction:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  DOCRunInMainThread();

}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void **v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BE2DF90];
  v3 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v29 = v6;
    _os_log_impl(&dword_209052000, v5, OS_LOG_TYPE_INFO, "_didTriggerBarButtonWithUUID: %@", buf, 0xCu);

  }
  v7 = (void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "remoteBarButtonForUUID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = *v2;
    if (!*v2)
    {
      DOCInitLogging();
      v9 = *v2;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *v7;
      v11 = v9;
      objc_msgSend(v10, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v29 = v12;
      _os_log_impl(&dword_209052000, v11, OS_LOG_TYPE_INFO, "_didTriggerBarButtonWithUUID: %@ button found, perform action", buf, 0xCu);

    }
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v8, "performOverflowAction");
    else
      objc_msgSend(v8, "performPrimaryAction");
  }
  else
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064));
    objc_msgSend(v13, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1072));
    v14 = *v2;
    if (!*v2)
    {
      DOCInitLogging();
      v14 = *v2;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_3(v7, v14);
    v15 = *v2;
    if (!*v2)
    {
      DOCInitLogging();
      v15 = *v2;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_2();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v20);
          v22 = *v2;
          if (!*v2)
          {
            DOCInitLogging();
            v22 = *v2;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_1(buf, v22, v21, v29);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v18);
    }

  }
}

- (void)_fallbackRenameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  void *v9;
  id v10;
  NSObject **v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a5;
  v13 = 0;
  +[DOCFileRenamingSupport fallbackRename:toProposedName:error:](DOCFileRenamingSupport, "fallbackRename:toProposedName:error:", v7, a4, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  v11 = (NSObject **)MEMORY[0x24BE2DF90];
  v12 = *MEMORY[0x24BE2DF90];
  if (!v9)
  {
    if (!v12)
    {
      DOCInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[UIDocumentBrowserViewController _fallbackRenameDocumentAtURL:proposedName:completionHandler:].cold.1(v12, v10);
      if (v10)
        goto LABEL_12;
    }
    else if (v10)
    {
LABEL_12:
      v8[2](v8, 0, v10);
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 512, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!v12)
  {
    DOCInitLogging();
    v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_INFO, "Success. Renamed from: %@ to: %@", buf, 0x16u);
  }
  ((void (**)(id, void *, id))v8)[2](v8, v9, 0);
LABEL_13:

}

- (void)renameDocumentAtURL:(NSURL *)documentURL proposedName:(NSString *)proposedName completionHandler:(void *)completionHandler
{
  NSURL *v9;
  NSString *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;
  void *v15;
  NSURL *v16;
  NSString *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  UIDocumentBrowserViewController *v19;
  DOCServiceDocumentBrowserViewControllerInterface *serviceProxy;
  NSObject **v21;
  NSObject *v22;
  DOCServiceDocumentBrowserViewControllerInterface *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSString *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  void (**v36)(_QWORD, _QWORD, _QWORD);
  _QWORD v37[5];
  NSURL *v38;
  NSString *v39;
  id v40;
  id v41[2];

  v9 = documentURL;
  v10 = proposedName;
  v11 = completionHandler;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserViewController.m"), 2684, CFSTR("renameDocumentAtURL:proposedName:completionHandler: should not be called with a nil completionHandler"));

    if (v10)
      goto LABEL_4;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserViewController.m"), 2683, CFSTR("renameDocumentAtURL:proposedName:completionHandler: should not be called with a nil url"));

  if (!v12)
    goto LABEL_20;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_21:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserViewController.m"), 2685, CFSTR("renameDocumentAtURL:proposedName:completionHandler: should not be called with a nil proposedName"));

LABEL_4:
  v41[0] = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v9, 0, v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v41[0];
  v15 = v14;
  if (v13)
  {
    v31 = v14;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke;
    v37[3] = &unk_24C0F10C8;
    v37[4] = self;
    v16 = v9;
    v38 = v16;
    v32 = v10;
    v17 = v10;
    v39 = v17;
    v18 = v12;
    v40 = v18;
    v30 = (void *)MEMORY[0x20BD0CEF0](v37);
    v19 = self;
    serviceProxy = self->_serviceProxy;
    v21 = (NSObject **)MEMORY[0x24BE2DFB8];
    v22 = *MEMORY[0x24BE2DFB8];
    if (serviceProxy)
    {
      if (!v22)
      {
        DOCInitLogging();
        v22 = *v21;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[UIDocumentBrowserViewController renameDocumentAtURL:proposedName:completionHandler:].cold.2();
      v23 = v19->_serviceProxy;
      v24 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_239;
      v35[3] = &unk_24C0F0930;
      v36 = v18;
      -[DOCServiceDocumentBrowserViewControllerInterface remoteObjectProxyWithErrorHandler:](v23, "remoteObjectProxyWithErrorHandler:", v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v24;
      v33[1] = 3221225472;
      v33[2] = __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_3;
      v33[3] = &unk_24C0F10F0;
      v26 = v30;
      v34 = v30;
      objc_msgSend(v25, "_renameDocumentAtURL:newName:completion:", v13, v17, v33);

      v10 = v32;
    }
    else
    {
      if (!v22)
      {
        DOCInitLogging();
        v22 = *v21;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[UIDocumentBrowserViewController renameDocumentAtURL:proposedName:completionHandler:].cold.1();
      v26 = v30;
      objc_msgSend(MEMORY[0x24BE2DF10], "_spi_renameDocumentAtURL:proposedName:completionHandler:", v16, v17, v30);
    }

    v15 = v31;
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v14);
  }

}

void __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v8 = a3;
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v6 = v5;
  v7 = v8;
  DOCRunInMainThread();

}

uint64_t __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", *MEMORY[0x24BDD0B88]))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "code");

    if (v3 == 4)
      return objc_msgSend(*(id *)(a1 + 40), "_fallbackRenameDocumentAtURL:proposedName:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 64), "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  sandbox_extension_update_file();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  DOCRunInMainThread();

}

uint64_t __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_2_240(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)forwardHostSceneIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__UIDocumentBrowserViewController_forwardHostSceneIdentifier___block_invoke;
  v6[3] = &unk_24C0F0710;
  v7 = v4;
  v5 = v4;
  -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v6);

}

uint64_t __62__UIDocumentBrowserViewController_forwardHostSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setSceneIdentifier:", *(_QWORD *)(a1 + 32));
}

+ (id)placeholderURLForDownloadsFolder
{
  if (placeholderURLForDownloadsFolder_onceToken != -1)
    dispatch_once(&placeholderURLForDownloadsFolder_onceToken, &__block_literal_global_246);
  return (id)placeholderURLForDownloadsFolder__placeholderURLForDownloadsFolder;
}

void __67__UIDocumentBrowserViewController_placeholderURLForDownloadsFolder__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", UIDocumentBrowserDownloadsFolderPlaceholderPath);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)placeholderURLForDownloadsFolder__placeholderURLForDownloadsFolder;
  placeholderURLForDownloadsFolder__placeholderURLForDownloadsFolder = v0;

}

- (void)manageOverrideIfNecessaryForPresentationController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIDocumentBrowserViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (dyld_program_sdk_at_least())
      {
        -[UIDocumentBrowserViewController traitCollection](self, "traitCollection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "userInterfaceStyle");

        objc_msgSend(v8, "traitOverrides");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setUserInterfaceStyle:", v6);

        objc_msgSend(v8, "setDelegate:", self);
      }
    }
  }

}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  -[UIDocumentBrowserViewController manageOverrideIfNecessaryForPresentationController:](self, "manageOverrideIfNecessaryForPresentationController:", a4);
}

- (NSArray)leadingBarButtonTrackingViews
{
  return self->_leadingBarButtonTrackingViews;
}

- (void)setLeadingBarButtonTrackingViews:(id)a3
{
  objc_storeStrong((id *)&self->_leadingBarButtonTrackingViews, a3);
}

- (NSArray)trailingBarButtonTrackingViews
{
  return self->_trailingBarButtonTrackingViews;
}

- (void)setTrailingBarButtonTrackingViews:(id)a3
{
  objc_storeStrong((id *)&self->_trailingBarButtonTrackingViews, a3);
}

- (NSArray)remoteAdditionalLeadingNavigationBarButtonItems
{
  return self->_remoteAdditionalLeadingNavigationBarButtonItems;
}

- (void)setRemoteAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAdditionalLeadingNavigationBarButtonItems, a3);
}

- (NSArray)remoteAdditionalTrailingNavigationBarButtonItems
{
  return self->_remoteAdditionalTrailingNavigationBarButtonItems;
}

- (void)setRemoteAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAdditionalTrailingNavigationBarButtonItems, a3);
}

- (UIViewController)dummySplitViewController
{
  return self->_dummySplitViewController;
}

- (void)setDummySplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dummySplitViewController, a3);
}

- (_UIResilientRemoteViewContainerViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (DOCDocBrowserVC_UIActivityViewController)activityViewController
{
  return (DOCDocBrowserVC_UIActivityViewController *)objc_loadWeakRetained((id *)&self->_activityViewController);
}

- (void)setActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_activityViewController, a3);
}

- (DOCServiceDocumentBrowserViewControllerInterface)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (NSOperationQueue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (DOCDocumentCreationController)documentCreationController
{
  return self->_documentCreationController;
}

- (DOCUIPBrowserState)preferredUIPBrowserState
{
  return self->_preferredUIPBrowserState;
}

- (BOOL)remoteHasReceivedInitialUIPBrowserState
{
  return self->_remoteHasReceivedInitialUIPBrowserState;
}

- (void)setRemoteHasReceivedInitialUIPBrowserState:(BOOL)a3
{
  self->_remoteHasReceivedInitialUIPBrowserState = a3;
}

- (UISheetPresentationController)observedUIPPresentationController
{
  return self->_observedUIPPresentationController;
}

- (_UIDocumentLandingPresenter)documentLandingPresenter
{
  return (_UIDocumentLandingPresenter *)objc_loadWeakRetained((id *)&self->_documentLandingPresenter);
}

- (void)setDocumentLandingPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_documentLandingPresenter, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_documentLandingPresenter);
  objc_storeStrong((id *)&self->_observedUIPPresentationController, 0);
  objc_storeStrong((id *)&self->_preferredUIPBrowserState, 0);
  objc_storeStrong((id *)&self->_documentCreationController, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_dummySplitViewController, 0);
  objc_storeStrong((id *)&self->_remoteAdditionalTrailingNavigationBarButtonItems, 0);
  objc_storeStrong((id *)&self->_remoteAdditionalLeadingNavigationBarButtonItems, 0);
  objc_storeStrong((id *)&self->_trailingBarButtonTrackingViews, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonTrackingViews, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_additionalTrailingNavigationBarButtonItems, 0);
  objc_storeStrong((id *)&self->_additionalLeadingNavigationBarButtonItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uipTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_urlCurrentlyBeingImported, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_trackingViewsContainer, 0);
}

- (void)_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:(id)a3
{
  UISheetPresentationController *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = self->_observedUIPPresentationController;
  if (v4)
  {
    v5 = -[UIDocumentBrowserViewController _currentLandingModeBasedForObservedPresentationController](self, "_currentLandingModeBasedForObservedPresentationController");
    -[UIDocumentBrowserViewController preferredUIPBrowserState](self, "preferredUIPBrowserState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "documentLandingMode");

    if (v5 != v7)
      -[UIDocumentBrowserViewController _sendBrowserLandingModeChangeForReason:](self, "_sendBrowserLandingModeChangeForReason:", v8);
  }

}

- (int64_t)_currentLandingModeBasedForObservedPresentationController
{
  UISheetPresentationController *v3;
  UISheetPresentationController *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;

  v3 = self->_observedUIPPresentationController;
  v4 = v3;
  if (v3)
  {
    -[UISheetPresentationController selectedDetentIdentifier](v3, "selectedDetentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDocumentBrowserViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "verticalSizeClass");

    if (v7 == 1)
    {
      -[UISheetPresentationController doc_detentForDocumentLandingMode:](v4, "doc_detentForDocumentLandingMode:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
    v9 = -[UISheetPresentationController doc_documentLandingModeForDetent:](v4, "doc_documentLandingModeForDetent:", v5);

  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)_sendBrowserLandingModeChangeForReason:(id)a3
{
  id v4;
  UISheetPresentationController *v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_observedUIPPresentationController;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE2DF30]);
    objc_msgSend(v6, "setDocumentLandingMode:", -[UIDocumentBrowserViewController _currentLandingModeBasedForObservedPresentationController](self, "_currentLandingModeBasedForObservedPresentationController"));
    v7 = (NSObject **)MEMORY[0x24BE2DF90];
    v8 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_209052000, v8, OS_LOG_TYPE_DEFAULT, "Sending updated landingMode change in response to: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __104__UIDocumentBrowserViewController_DOCUIPPresentationController___sendBrowserLandingModeChangeForReason___block_invoke;
    v10[3] = &unk_24C0F0698;
    objc_copyWeak(&v12, (id *)buf);
    v9 = v6;
    v11 = v9;
    -[UIDocumentBrowserViewController addOperationToServiceQueue:](self, "addOperationToServiceQueue:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);

  }
}

void __104__UIDocumentBrowserViewController_DOCUIPPresentationController___sendBrowserLandingModeChangeForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_sendBrowserChange:serviceProxy:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_beginMonitoringUIPPresentationController
{
  UISheetPresentationController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  if (self->_configuredForUIPDocumentLanding)
  {
    -[UIDocumentBrowserViewController presentationController](self, "presentationController");
    v3 = (UISheetPresentationController *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v3 != self->_observedUIPPresentationController)
    {
      -[UIDocumentBrowserViewController _endMonitoringUIPPresentationController](self, "_endMonitoringUIPPresentationController");
      objc_storeStrong((id *)&self->_observedUIPPresentationController, v3);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *MEMORY[0x24BEBEA70];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __106__UIDocumentBrowserViewController_DOCUIPPresentationController___beginMonitoringUIPPresentationController__block_invoke;
      v8[3] = &unk_24C0F1158;
      v8[4] = self;
      v7 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, v3, v6, v8);

      if (-[UIDocumentBrowserViewController _appearState](self, "_appearState") - 1 <= 1)
        -[UIDocumentBrowserViewController _checkIfObservedUIPPresentationControllerDetentDidChangeForReason:](self, "_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:", CFSTR("initial state check"));

    }
  }
}

uint64_t __106__UIDocumentBrowserViewController_DOCUIPPresentationController___beginMonitoringUIPPresentationController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:", CFSTR("did change notification"));
}

- (void)_endMonitoringUIPPresentationController
{
  UISheetPresentationController *observedUIPPresentationController;
  void *v4;
  void *v5;
  UISheetPresentationController *v6;
  UISheetPresentationController *v7;

  observedUIPPresentationController = self->_observedUIPPresentationController;
  if (observedUIPPresentationController)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v7 = observedUIPPresentationController;
    objc_msgSend(v4, "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBEA70], 0);

    v6 = self->_observedUIPPresentationController;
    self->_observedUIPPresentationController = 0;

  }
}

void __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "Failed to get the remote browser View Controller with error (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "Unexpected error in revealDocumentAtURL - serviceProxy is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_209052000, v0, v1, "Unexpected error in revealDocumentAtURL, completion handler invoked multiple times", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_106_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "revealDocumentAtURL encountered an error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_110_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "prepareForMode: revealDocumentAtURL with usingBookmark == YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_111_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "revealDocumentAtURL was unable to prepareForMode:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_122_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "Error trying to create a sandbox extension for the neighbour url %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "The UIDocumentBrowserViewController view service crashed for too many times in a row.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "Remote view controller crashed with error: %@. Trying to relaunch.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_209052000, v0, v1, "The DocumentManager service was terminated in the middle of importing/creating new document, the service will probably restart but the operation likely failed, so notifying the delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "Calling delegate -documentBrowser:didPickDocumentURLs: with an empty array of items. This indicates the items failed to be prepared and materialized on disk: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_209052000, v0, v1, "Tried to call delegate -documentBrowser:didPickDocumentURLs: with an empty array of items. This indicates the items failed to be prepared and materialized on disk: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_209052000, v0, OS_LOG_TYPE_ERROR, "Cannot create urlWrapper for url %@. error %@.", v1, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a3, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_error_impl(&dword_209052000, v7, OS_LOG_TYPE_ERROR, "_didTriggerBarButtonWithUUID                                       %@", a1, 0xCu);

}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_209052000, v0, v1, "_didTriggerBarButtonWithUUID                                       Existing UUIDs:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_3(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v3, v5, "_didTriggerBarButtonWithUUID: Button not found to perform action. Requested UUID: %@", v6);

  OUTLINED_FUNCTION_12();
}

- (void)_fallbackRenameDocumentAtURL:(void *)a1 proposedName:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(&dword_209052000, v3, v5, "Error. Rename failed: %@", v6);

  OUTLINED_FUNCTION_12();
}

- (void)renameDocumentAtURL:proposedName:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_209052000, v0, v1, "%@ Starting rename for %@ using XPC service");
  OUTLINED_FUNCTION_3();
}

- (void)renameDocumentAtURL:proposedName:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_209052000, v0, v1, "%@ Starting rename for %@ using running document manager service");
  OUTLINED_FUNCTION_3();
}

@end
