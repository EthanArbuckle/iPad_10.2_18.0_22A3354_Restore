@implementation SFManageExtensionsViewController

+ (id)createManageExtensionsNavigationControllerFromPageFormatMenu:(id)a3 activeDocument:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = -[SFManageExtensionsViewController initFromPageFormatMenu:activeDocument:]([SFManageExtensionsViewController alloc], "initFromPageFormatMenu:activeDocument:", v5, v6);
  objc_initWeak(&location, v7);
  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v9 = objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverDoneButtonItem");
  v10 = (void *)MEMORY[0x1E0DC3428];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __112__SFManageExtensionsViewController_createManageExtensionsNavigationControllerFromPageFormatMenu_activeDocument___block_invoke;
  v19 = &unk_1E21E6688;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", &stru_1E21FE780, 0, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithBarButtonSystemItem:primaryAction:", v9, v11, v16, v17, v18, v19);
  objc_msgSend(v7, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sf_setPreferredDismissOrDoneButtonItem:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __112__SFManageExtensionsViewController_createManageExtensionsNavigationControllerFromPageFormatMenu_activeDocument___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)initFromPageFormatMenu:(id)a3 activeDocument:(id)a4
{
  id v6;
  id v7;
  SFManageExtensionsViewController *v8;
  SFManageExtensionsViewController *v9;
  uint64_t v10;
  SFWebExtensionsController *webExtensionsController;
  uint64_t v12;
  SFContentBlockerManager *contentBlockerManager;
  SFManageExtensionsViewController *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SFManageExtensionsViewController;
  v8 = -[SFManageExtensionsViewController initWithStyle:](&v16, sel_initWithStyle_, 2);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingPageFormatMenu, v6);
    v9->_presentedFromPrivateBrowsing = objc_msgSend(v7, "isPrivateBrowsingEnabled");
    objc_msgSend(v7, "webExtensionsController");
    v10 = objc_claimAutoreleasedReturnValue();
    webExtensionsController = v9->_webExtensionsController;
    v9->_webExtensionsController = (SFWebExtensionsController *)v10;

    objc_msgSend(v7, "contentBlockerManager");
    v12 = objc_claimAutoreleasedReturnValue();
    contentBlockerManager = v9->_contentBlockerManager;
    v9->_contentBlockerManager = (SFContentBlockerManager *)v12;

    -[SFManageExtensionsViewController _commonInit](v9, "_commonInit");
    v14 = v9;
  }

  return v9;
}

- (id)initFromSettingsWithExtensionsController:(id)a3 contentBlockerManager:(id)a4
{
  id v7;
  id v8;
  SFManageExtensionsViewController *v9;
  id *p_isa;
  id *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFManageExtensionsViewController;
  v9 = -[SFManageExtensionsViewController initWithStyle:](&v13, sel_initWithStyle_, 2);
  p_isa = (id *)&v9->super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webExtensionsController, a3);
    objc_storeStrong(p_isa + 128, a4);
    objc_msgSend(p_isa, "_commonInit");
    v11 = p_isa;
  }

  return p_isa;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  SFWebExtensionsController *v5;

  v5 = self->_webExtensionsController;
  -[SFManageExtensionsViewController _refreshExtensionData](self, "_refreshExtensionData");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__reload, *MEMORY[0x1E0D8A300], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__reload, *MEMORY[0x1E0D8AEE8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__reload, *MEMORY[0x1E0D89E88], 0);
  -[WBSExtensionsController addObserver:](v5, "addObserver:", self);
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFManageExtensionsViewController setTitle:](self, "setTitle:", v4);

}

- (void)_refreshExtensionData
{
  SFWebExtensionsController *v3;
  void *v4;
  uint64_t v5;
  SFWebExtensionsController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *extensions;
  SFWebExtensionsController *v14;
  _QWORD v15[4];
  SFWebExtensionsController *v16;
  SFManageExtensionsViewController *v17;
  _QWORD v18[4];
  SFWebExtensionsController *v19;

  v3 = self->_webExtensionsController;
  -[WBSExtensionsController extensions](v3, "extensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke;
  v18[3] = &unk_1E21E66B0;
  v6 = v3;
  v19 = v6;
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContentBlockerManager extensions](self->_contentBlockerManager, "extensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke_2;
  v15[3] = &unk_1E21E66D8;
  v14 = v6;
  v16 = v14;
  v17 = self;
  objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_localizedCompare_);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  extensions = self->_extensions;
  self->_extensions = v12;

  -[SFManageExtensionsViewController _filterExtensionsBasedOnUserTypedSearchQuery](self, "_filterExtensionsBasedOnUserTypedSearchQuery");
  -[SFManageExtensionsViewController _updateCloudExtensionLockupViews](self, "_updateCloudExtensionLockupViews");

}

id __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "webExtensionForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFExtensionWrapper extensionWrapperForWebExtensionWithComposedIdentifier:webExtensionsController:](SFExtensionWrapper, "extensionWrapperForWebExtensionWithComposedIdentifier:webExtensionsController:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__SFManageExtensionsViewController__refreshExtensionData__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFExtensionWrapper extensionWrapperForContentBlockerWithComposedIdentifier:contentBlockerManager:](SFExtensionWrapper, "extensionWrapperForContentBlockerWithComposedIdentifier:contentBlockerManager:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1024));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateCloudExtensionLockupViews
{
  void *v3;
  _QWORD v4[5];

  if (!self->_waitingForLockupViews)
  {
    self->_waitingForLockupViews = 1;
    objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __68__SFManageExtensionsViewController__updateCloudExtensionLockupViews__block_invoke;
    v4[3] = &unk_1E21E6700;
    v4[4] = self;
    objc_msgSend(v3, "getLockupViewsForAppsOnOtherDevicesWithCompletionHandler:", v4);

  }
}

void __68__SFManageExtensionsViewController__updateCloudExtensionLockupViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1088) = 0;
  v8 = v3;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "isEqual:") & 1) == 0)
  {
    v4 = objc_msgSend(v8, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1072);
    *(_QWORD *)(v5 + 1072) = v4;

    objc_msgSend(*(id *)(a1 + 32), "_filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery");
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[WBSExtensionsController removeObserver:](self->_webExtensionsController, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SFManageExtensionsViewController;
  -[SFManageExtensionsViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFManageExtensionsViewController;
  -[SFManageExtensionsViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[UISearchBar setLayoutMargins:](self->_searchBar, "setLayoutMargins:", 0.0, self->_indentationWidthOfCell + self->_indentationWidthOfCell, 0.0, self->_indentationWidthOfCell + self->_indentationWidthOfCell);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFManageExtensionsViewController;
  -[SFManageExtensionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFContentBlockerManager addObserver:](self->_contentBlockerManager, "addObserver:", self);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UISearchBar *v6;
  UISearchBar *searchBar;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFManageExtensionsViewController;
  -[SFManageExtensionsViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[SFManageExtensionsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("ManageWebExtensionsView"));

  v4 = (void *)MEMORY[0x1E0DC3C38];
  -[SFManageExtensionsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sf_installSearchBarInTableView:includeSeparator:", v5, 0);
  v6 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  searchBar = self->_searchBar;
  self->_searchBar = v6;

  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v8);

  -[SFManageExtensionsViewController _updateLastViewedDate](self, "_updateLastViewedDate");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFManageExtensionsViewController;
  -[SFManageExtensionsViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SFContentBlockerManager removeObserver:](self->_contentBlockerManager, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SFManageWebExtensionsViewDidDismissNotification"), self);

}

- (void)_updateLastViewedDate
{
  void *v3;
  id v4;
  id v5;

  if (!self->_presentedFromPrivateBrowsing)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_setDate:forKey:", v3, *MEMORY[0x1E0D8A440]);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D8B710], self);

}

- (void)_reload
{
  void *v3;

  -[SFManageExtensionsViewController _refreshExtensionData](self, "_refreshExtensionData");
  -[SFManageExtensionsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[SFManageExtensionsViewController _updateLastViewedDate](self, "_updateLastViewedDate");
}

- (BOOL)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 1;
}

- (id)_tintIconForDarkModeIfNeeded:(id)a3
{
  id v3;
  double v4;
  double v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a3;
  objc_msgSend(v3, "safari_computeAverageLuminance");
  v5 = v4;
  v6 = objc_msgSend(v3, "safari_isGrayscale");
  v7 = objc_msgSend(v3, "safari_transparencyAnalysisResultIsNotOpaque");
  if (v5 >= 0.1 || ((v6 ^ 1) & 1) != 0 || ((v7 ^ 1) & 1) != 0)
  {
    v12 = v3;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__9;
    v24 = __Block_byref_object_dispose__9;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__SFManageExtensionsViewController__tintIconForDarkModeIfNeeded___block_invoke;
    v17[3] = &unk_1E21E6728;
    v19 = &v20;
    v10 = v3;
    v18 = v10;
    objc_msgSend(v8, "performAsCurrentTraitCollection:", v17);

    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __65__SFManageExtensionsViewController__tintIconForDarkModeIfNeeded___block_invoke_2;
    v14[3] = &unk_1E21E6728;
    v16 = &v20;
    v15 = v10;
    objc_msgSend(v11, "performAsCurrentTraitCollection:", v14);

    v12 = (id)v21[5];
    _Block_object_dispose(&v20, 8);

  }
  return v12;
}

void __65__SFManageExtensionsViewController__tintIconForDarkModeIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "size");
  SFTintImage(v2, v8, 0, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __65__SFManageExtensionsViewController__tintIconForDarkModeIfNeeded___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "imageAsset");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "size");
  SFTintImage(v2, v3, 0, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerImage:withTraitCollection:", v6, v7);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  SFAvailableAppTableViewCell *v8;
  id v9;
  void *v10;
  void *v11;
  SFAvailableAppTableViewCell *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v52;
  SFWebExtensionsController *v53;
  void *v54;

  v6 = a3;
  v7 = a4;
  if (-[SFManageExtensionsViewController _isOnOtherDevicesSection:](self, "_isOnOtherDevicesSection:", objc_msgSend(v7, "section")))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("availableAppCell"));
    v8 = (SFAvailableAppTableViewCell *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = -[SFAvailableAppTableViewCell initWithStyle:reuseIdentifier:]([SFAvailableAppTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("availableAppCell"));
    -[NSArray objectAtIndexedSubscript:](self->_filteredExtensionAppLockupViews, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SFAvailableAppTableViewCell setLockupView:](v8, "setLockupView:", v9);
    goto LABEL_39;
  }
  if (!-[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", objc_msgSend(v7, "section")))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("toggleExtensionCell"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "accessoryView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v14;
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("toggleExtensionCell"));
      v9 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
      objc_msgSend(v15, "setAccessoryView:", v9);
      objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__extensionStateWasToggled_, 4096);
    }
    v53 = self->_webExtensionsController;
    v54 = v15;
    -[NSArray objectAtIndexedSubscript:](self->_filteredExtensions, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (self->_presentedFromPrivateBrowsing)
    {
      if (!objc_msgSend(v16, "isEnabled"))
      {
        v19 = 0;
        goto LABEL_17;
      }
      v18 = objc_msgSend(v17, "allowedInPrivateBrowsing");
    }
    else
    {
      v18 = objc_msgSend(v16, "isEnabled");
    }
    v19 = v18;
LABEL_17:
    objc_msgSend(v9, "setOn:", v19);
    v20 = -[SFWebExtensionsController parentalControlsAreEnabledForExtensions](v53, "parentalControlsAreEnabledForExtensions");
    if (self->_presentedFromPrivateBrowsing)
      v21 = 1;
    else
      v21 = v20;
    if ((v21 & 1) != 0)
    {
      if ((v20 & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "composedIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "managedExtensionPrivateBrowsingStateForComposedIdentifier:", v26);

        objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "composedIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "managedExtensionStateForComposedIdentifier:", v29);

        if (v27)
          v31 = 1;
        else
          v31 = v30 == 2;
        v22 = !v31;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "composedIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v23, "managedExtensionStateForComposedIdentifier:", v24) == 0;

    }
    objc_msgSend(v9, "setEnabled:", v22);
    objc_msgSend(v9, "setTag:", objc_msgSend(v7, "row"));
    v32 = (void *)MEMORY[0x1E0CA58F0];
    objc_msgSend(v17, "extension");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_plugIn");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "pluginKitProxyForUUID:", v35);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "displayName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "contentBlockerHasSameNameAsWebExtensionFromSameApp:", self->_extensions))
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "displayName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = v36;
    }
    if ((objc_msgSend(v17, "isContentBlocker") & 1) != 0)
      goto LABEL_36;
    objc_msgSend(v17, "extension");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionsController webExtensionForExtension:](v53, "webExtensionForExtension:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
      goto LABEL_36;
    v43 = (void *)MEMORY[0x1E0D8A9C8];
    objc_msgSend(v42, "preferencesIcon");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "size");
    objc_msgSend(v43, "resizedImage:withSize:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v46)
    {
LABEL_36:
      objc_msgSend(MEMORY[0x1E0DC3870], "_iconForResourceProxy:format:", v52, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SFManageExtensionsViewController _tintIconForDarkModeIfNeeded:](self, "_tintIconForDarkModeIfNeeded:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "imageView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setImage:", v47);

    objc_msgSend(v54, "textLabel");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setText:", v40);

    objc_msgSend(v54, "indentationWidth");
    self->_indentationWidthOfCell = v50;
    v12 = v54;

    v8 = v12;
    goto LABEL_38;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("appStoreLinkCell"));
  v8 = (SFAvailableAppTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (SFAvailableAppTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("appStoreLinkCell"));
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAvailableAppTableViewCell textLabel](v8, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SFAvailableAppTableViewCell textLabel](v8, "textLabel");
    v12 = (SFAvailableAppTableViewCell *)objc_claimAutoreleasedReturnValue();
    -[SFAvailableAppTableViewCell setTextColor:](v12, "setTextColor:", v9);
LABEL_38:

LABEL_39:
  }

  return v8;
}

- (void)_extensionStateWasToggled:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_filteredExtensions, "objectAtIndexedSubscript:", objc_msgSend(v4, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v6 = objc_msgSend(v5, "canLoadWithErrorString:", &v22);
  v7 = v22;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v5, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3450];
    v11 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v13, v7, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke;
    v20[3] = &unk_1E21E6750;
    v21 = v4;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAction:", v17);

    -[SFManageExtensionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
    goto LABEL_11;
  }
  v8 = objc_msgSend(v4, "isOn");
  if ((v8 & 1) == 0)
  {
    if (!self->_presentedFromPrivateBrowsing)
    {
      objc_msgSend(v5, "disable");
      goto LABEL_11;
    }
LABEL_8:
    -[SFManageExtensionsViewController _setPrivateBrowsingStateForExtension:isOn:](self, "_setPrivateBrowsingStateForExtension:isOn:", v5, v8);
    goto LABEL_11;
  }
  if (!self->_presentedFromPrivateBrowsing)
  {
    objc_msgSend(v5, "enableWithPresentingViewController:completionHandler:", self, &__block_literal_global_53);
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEnabled"))
    goto LABEL_8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke_2;
  v18[3] = &unk_1E21E6778;
  v18[4] = self;
  v19 = v5;
  objc_msgSend(v19, "enableWithPresentingViewController:completionHandler:", self, v18);

LABEL_11:
}

uint64_t __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", 0);
}

uint64_t __62__SFManageExtensionsViewController__extensionStateWasToggled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPrivateBrowsingStateForExtension:isOn:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_setPrivateBrowsingStateForExtension:(id)a3 isOn:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setAllowedInPrivateBrowsing:", v4);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", *MEMORY[0x1E0D8B8D8], 0);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  NSString *v6;
  NSString *userTypedQuery;
  NSString *v8;
  NSString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (NSString *)a4;
  userTypedQuery = self->_userTypedQuery;
  if (userTypedQuery != v6 && !-[NSString isEqualToString:](userTypedQuery, "isEqualToString:", v6))
  {
    v8 = (NSString *)-[NSString copy](v6, "copy");
    v9 = self->_userTypedQuery;
    self->_userTypedQuery = v8;

    -[SFManageExtensionsViewController _filterExtensionsBasedOnUserTypedSearchQuery](self, "_filterExtensionsBasedOnUserTypedSearchQuery");
    -[SFManageExtensionsViewController _filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery](self, "_filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery");
    -[SFManageExtensionsViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)_filterExtensionsBasedOnUserTypedSearchQuery
{
  NSUInteger v3;
  NSArray *extensions;
  NSArray *v5;
  NSArray *filteredExtensions;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[5];

  v3 = -[NSString length](self->_userTypedQuery, "length");
  extensions = self->_extensions;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__SFManageExtensionsViewController__filterExtensionsBasedOnUserTypedSearchQuery__block_invoke;
    v9[3] = &unk_1E21E67C0;
    v9[4] = self;
    -[NSArray safari_filterObjectsUsingBlock:](extensions, "safari_filterObjectsUsingBlock:", v9);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    filteredExtensions = self->_filteredExtensions;
    self->_filteredExtensions = v5;

  }
  else
  {
    v7 = (NSArray *)-[NSArray copy](extensions, "copy");
    v8 = self->_filteredExtensions;
    self->_filteredExtensions = v7;

  }
}

uint64_t __80__SFManageExtensionsViewController__filterExtensionsBasedOnUserTypedSearchQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "shortName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));

  }
  return v5;
}

- (void)_filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery
{
  NSUInteger v3;
  NSArray *extensionAppLockupViews;
  NSArray *v5;
  NSArray *filteredExtensionAppLockupViews;
  NSArray *v7;
  NSArray *v8;
  _QWORD v9[5];

  v3 = -[NSString length](self->_userTypedQuery, "length");
  extensionAppLockupViews = self->_extensionAppLockupViews;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__SFManageExtensionsViewController__filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery__block_invoke;
    v9[3] = &unk_1E21E67E8;
    v9[4] = self;
    -[NSArray safari_filterObjectsUsingBlock:](extensionAppLockupViews, "safari_filterObjectsUsingBlock:", v9);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    filteredExtensionAppLockupViews = self->_filteredExtensionAppLockupViews;
    self->_filteredExtensionAppLockupViews = v5;

  }
  else
  {
    v7 = (NSArray *)-[NSArray copy](extensionAppLockupViews, "copy");
    v8 = self->_filteredExtensionAppLockupViews;
    self->_filteredExtensionAppLockupViews = v7;

  }
}

uint64_t __93__SFManageExtensionsViewController__filterExtensionAppLockupViewsBasedOnUserTypedSearchQuery__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));

  return v5;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int *v7;
  int64_t v8;

  v6 = a3;
  if (a4)
  {
    if (!-[SFManageExtensionsViewController _isOnOtherDevicesSection:](self, "_isOnOtherDevicesSection:", a4))
    {
      v8 = -[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", a4);
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___SFManageExtensionsViewController__filteredExtensionAppLockupViews;
  }
  else
  {
    v7 = &OBJC_IVAR___SFManageExtensionsViewController__filteredExtensions;
  }
  v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v7), "count");
LABEL_7:

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", objc_msgSend(v6, "section")))
  {
    objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D8B8C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:withOptions:", v8, 0);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;

  v5 = a4;
  LOBYTE(self) = -[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", objc_msgSend(v5, "section"));

  return (char)self;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[NSArray count](self->_filteredExtensionAppLockupViews, "count", a3))
    return 3;
  else
    return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v9;

  v6 = a3;
  if (!a4)
  {
    if (self->_presentedFromPrivateBrowsing)
      goto LABEL_5;
    if (-[SFWebExtensionsController hasNamedProfiles](self->_webExtensionsController, "hasNamedProfiles"))
    {
      -[SFWebExtensionsController profile](self->_webExtensionsController, "profile");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    if (-[NSArray count](self->_filteredExtensionAppLockupViews, "count")
      && -[NSArray count](self->_filteredExtensions, "count"))
    {
      goto LABEL_5;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if (!-[SFManageExtensionsViewController _isOnOtherDevicesSection:](self, "_isOnOtherDevicesSection:", a4))
  {
    -[SFManageExtensionsViewController _isAppStoreLinkSection:](self, "_isAppStoreLinkSection:", a4);
    goto LABEL_7;
  }
LABEL_5:
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  int v7;
  NSArray *extensions;
  void *v9;
  _QWORD v10[5];

  if (a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D89C08], "sharedController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasAnyExtensionManagement");

  if (v7)
  {
    extensions = self->_extensions;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__SFManageExtensionsViewController_tableView_titleForFooterInSection___block_invoke;
    v10[3] = &unk_1E21E67C0;
    v10[4] = self;
    -[NSArray safari_containsObjectPassingTest:](extensions, "safari_containsObjectPassingTest:", v10);
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

BOOL __70__SFManageExtensionsViewController_tableView_titleForFooterInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1089))
  {
    objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "composedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "managedExtensionPrivateBrowsingStateForComposedIdentifier:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "composedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "managedExtensionStateForComposedIdentifier:", v5);
  }
  v7 = v6;

  return v7 == 0;
}

- (BOOL)_isOnOtherDevicesSection:(int64_t)a3
{
  NSUInteger v4;

  v4 = -[NSArray count](self->_filteredExtensionAppLockupViews, "count");
  return a3 == 1 && v4 != 0;
}

- (BOOL)_isAppStoreLinkSection:(int64_t)a3
{
  NSUInteger v4;
  uint64_t v5;

  v4 = -[NSArray count](self->_filteredExtensionAppLockupViews, "count");
  v5 = 1;
  if (v4)
    v5 = 2;
  return v5 == a3;
}

- (_SFPageFormatMenuController)presentingPageFormatMenu
{
  return (_SFPageFormatMenuController *)objc_loadWeakRetained((id *)&self->_presentingPageFormatMenu);
}

- (void)setPresentingPageFormatMenu:(id)a3
{
  objc_storeWeak((id *)&self->_presentingPageFormatMenu, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingPageFormatMenu);
  objc_storeStrong((id *)&self->_filteredExtensionAppLockupViews, 0);
  objc_storeStrong((id *)&self->_extensionAppLockupViews, 0);
  objc_storeStrong((id *)&self->_userTypedQuery, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_filteredExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
}

@end
