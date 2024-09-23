@implementation CatalogViewController

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CatalogViewController;
  -[CatalogViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[CatalogViewController _updateStartPageSafeAreaInsets](self, "_updateStartPageSafeAreaInsets");
}

- (void)updatePreferredContentSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CatalogViewController;
  -[AbstractCatalogViewController updatePreferredContentSize](&v3, sel_updatePreferredContentSize);
  -[AbstractCatalogViewController updatePreferredContentSize](self->_popoverCatalogViewController, "updatePreferredContentSize");
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CatalogViewController;
  -[CatalogViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[CatalogViewController requiredContentWidth](self, "requiredContentWidth");
  v4 = v3;
  -[SFPopoverSizingTableViewController preferredContentSize](self->_completionsViewController, "preferredContentSize");
  -[CompletionListTableViewController setPreferredContentSize:](self->_completionsViewController, "setPreferredContentSize:", v4);
}

- (double)requiredContentWidth
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerPopoverWidth:", self);
  v5 = v4;

  return v5;
}

- (void)_updateStartPageSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", self->_startPageViewController))
  {
    -[CatalogViewController view](self, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaInsets");
    UIEdgeInsetsSubtract();
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CatalogViewController startPageViewController](self, "startPageViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAdditionalSafeAreaInsets:", v4, v6, v8, v10);

  }
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CompletionListTableViewController *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  SFStartPageViewController *v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL startPageGeometryIsFrozen;
  void *v28;
  void *v29;
  void *v30;
  UniversalSearchFirstTimeExperienceViewController *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[CatalogViewController view](self, "view");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = self->_completionsViewController;
  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v11))
  {
    -[CatalogViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaInsets");
    UIEdgeInsetsSubtract();

    UIEdgeInsetsMax();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[CompletionListTableViewController tableView](v11, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v4, v6, v8, v10);
    objc_msgSend(v21, "setContentInset:", v14, v16, v18, v20);
    objc_msgSend(v21, "setScrollIndicatorInsets:", v14, v16, v18, v20);

  }
  v22 = self->_startPageViewController;
  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v22))
  {
    -[_SFNavigationBarCommon layoutIfNeeded](self->_navigationBar, "layoutIfNeeded");
    -[_SFNavigationBarCommon urlOutlineFrameRelativeToView:](self->_navigationBar, "urlOutlineFrameRelativeToView:", v41);
    x = v42.origin.x;
    y = v42.origin.y;
    width = v42.size.width;
    height = v42.size.height;
    if (!CGRectEqualToRect(v42, *MEMORY[0x1E0C9D648]))
    {
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      CGRectGetMinX(v43);
      v44.origin.x = v4;
      v44.origin.y = v6;
      v44.size.width = v8;
      v44.size.height = v10;
      CGRectGetWidth(v44);
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      CGRectGetMaxX(v45);
    }
    if (self->_startPageGeometryIsFrozen)
    {
      startPageGeometryIsFrozen = 1;
    }
    else
    {
      -[SFStartPageViewController view](v22, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrame:", v4, v6, v8, v10);
      if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024FavoritesEnabled"))
      {
        -[CatalogViewController view](self, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_sf_hasLandscapeAspectRatio");

      }
      v46.origin.x = v4;
      v46.origin.y = v6;
      v46.size.width = v8;
      v46.size.height = v10;
      CGRectGetWidth(v46);
      _SFRoundFloatToPixels();
      if (!self->_usesPopoverStyleForFavorites)
      {
        -[CatalogViewController traitCollection](self, "traitCollection");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "horizontalSizeClass");

      }
      _SFDefaultLayoutMargins();
      UIEdgeInsetsReplace();
      objc_msgSend(v28, "setLayoutMargins:");

      startPageGeometryIsFrozen = self->_startPageGeometryIsFrozen;
    }
    self->_startPageGeometryWasFrozenDuringLastLayout = startPageGeometryIsFrozen;
  }
  v31 = self->_universalSearchFirstTimeExperienceViewController;
  if (-[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v31))
  {
    UIEdgeInsetsReplace();
    v33 = v4 + v32;
    v35 = v6 + v34;
    v37 = v8 - (v32 + v36);
    v39 = v10 - (v34 + v38);
    -[UniversalSearchFirstTimeExperienceViewController view](v31, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

  }
}

- (id)childViewControllerForStatusBarStyle
{
  SFStartPageViewController *v3;
  SFStartPageViewController *v4;
  _BOOL4 v5;
  SFStartPageViewController *v6;

  -[AbstractCatalogViewController foregroundChildViewController](self, "foregroundChildViewController");
  v3 = (SFStartPageViewController *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 != self->_startPageViewController)
  {

LABEL_5:
    v6 = 0;
    return v6;
  }
  v5 = -[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self, "isResponsibleForLayoutOfViewController:", v3);

  if (!v5)
    goto LABEL_5;
  v6 = self->_startPageViewController;
  return v6;
}

- (id)startPageViewController
{
  return self->_startPageViewController;
}

- (id)universalSearchFirstTimeExperienceViewController
{
  return self->_universalSearchFirstTimeExperienceViewController;
}

- (id)completionsViewControllerIfLoaded
{
  return self->_completionsViewController;
}

- (double)maxContentHeight
{
  id WeakRetained;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerPopoverMaxHeight:", self);
  v5 = v4;

  return v5;
}

- (BOOL)popoverIsShowing
{
  void *v2;
  UIPopoverPresentationController *popoverPresentationController;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  BOOL v10;

  popoverPresentationController = self->_popoverPresentationController;
  if (popoverPresentationController)
  {
    -[UIPopoverPresentationController containerView](popoverPresentationController, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[UIPopoverPresentationController presentingViewController](self->_popoverPresentationController, "presentingViewController"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      objc_msgSend(WeakRetained, "rootViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

      if (v6)
      {
LABEL_9:

        return v10;
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_9;
  }
  return 0;
}

- (void)setObscuredInsets:(UIEdgeInsets)a3
{
  id v7;

  if (self->_obscuredInsets.left != a3.left
    || self->_obscuredInsets.top != a3.top
    || self->_obscuredInsets.right != a3.right
    || self->_obscuredInsets.bottom != a3.bottom)
  {
    self->_obscuredInsets = a3;
    -[CatalogViewController _updateStartPageSafeAreaInsets](self, "_updateStartPageSafeAreaInsets");
    -[CatalogViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)startPageViewControllerDidScroll:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  void *v8;
  id WeakRetained;
  id v10;

  v4 = a4;
  v10 = a3;
  if (!-[CatalogViewController isShowingCompletions](self, "isShowingCompletions")
    && objc_msgSend(v10, "showsWallpaper"))
  {
    objc_msgSend(v10, "scrollDistance");
    SFChromeVisibilityForScrollDistance();
    v7 = v6;
    -[UIBarButtonItem customView](self->_cancelBarButton, "customView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOpaqueBackgroundVisibility:", v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerDidScroll:animated:", self, v4);

}

- (BOOL)isShowingCompletions
{
  return self->_showingCompletions;
}

- (void)updateTabGroupHeading
{
  -[StartPageController updateTabGroupHeading](self->_startPageController, "updateTabGroupHeading");
  self->_nextSnapshotRequiresScreenUpdates = 1;
}

uint64_t __55__CatalogViewController_startPageUpdatePolicyDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1272), "updatePolicyDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "updateStartPageCustomizationPolicy");
}

- (void)startPageViewControllerDidUpdateContent:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "setNeedsSnapshotUpdateForActiveTabIfTabIsBlank");

}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  self->_contentOverlayInsets = a3;
  if (!self->_contentBorrowed)
  {
    v3.receiver = self;
    v3.super_class = (Class)CatalogViewController;
    -[CatalogViewController _setContentOverlayInsets:](&v3, sel__setContentOverlayInsets_);
  }
}

- (CatalogViewController)initWithDelegate:(id)a3 browserController:(id)a4
{
  id v6;
  id v7;
  CatalogViewController *v8;
  CatalogViewController *v9;
  void *v10;
  StartPageController *v11;
  StartPageController *startPageController;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PopoverCatalogViewController *v19;
  PopoverCatalogViewController *popoverCatalogViewController;
  uint64_t v21;
  NSMutableSet *seenVisibleResults;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSCache *v28;
  NSCache *tableViewCellHeightCache;
  CatalogViewController *v30;
  objc_super v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CatalogViewController;
  v8 = -[CatalogViewController initWithNibName:bundle:](&v32, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_browserController, v7);
    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_msgSend(v6, "catalogViewControllerStartPageVisualStyleProvider:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = -[StartPageController initWithVisualStyleProvider:]([StartPageController alloc], "initWithVisualStyleProvider:", v10);
    else
      v11 = objc_alloc_init(StartPageController);
    startPageController = v9->_startPageController;
    v9->_startPageController = v11;

    -[StartPageController setDataSource:](v9->_startPageController, "setDataSource:", v7);
    objc_msgSend(v7, "tabController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeTabDocument");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[StartPageController setLibraryType:](v9->_startPageController, "setLibraryType:", v15);

    +[Application sharedApplication](Application, "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tabGroupManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addTabGroupObserver:", v9->_startPageController);
    objc_msgSend(v17, "addCloudTabsObserver:", v9->_startPageController);
    -[CatalogViewController updateStartPageCustomizationPolicy](v9, "updateStartPageCustomizationPolicy");
    -[CatalogViewController updateStartPageHidesEmptyRootViewNavigationBar](v9, "updateStartPageHidesEmptyRootViewNavigationBar");
    -[StartPageController viewController](v9->_startPageController, "viewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_startPageViewController, v18);
    v19 = objc_alloc_init(PopoverCatalogViewController);
    popoverCatalogViewController = v9->_popoverCatalogViewController;
    v9->_popoverCatalogViewController = v19;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    seenVisibleResults = v9->_seenVisibleResults;
    v9->_seenVisibleResults = (NSMutableSet *)v21;

    -[PopoverCatalogViewController setPrimaryCatalogViewController:](v9->_popoverCatalogViewController, "setPrimaryCatalogViewController:", v9);
    if (objc_msgSend(v6, "catalogViewControllerShouldRequestNetworkedSuggestions:", v9))
      -[CatalogViewController _beginParsecSessionIfNeeded](v9, "_beginParsecSessionIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel__parsecEnabledDidChange_, *MEMORY[0x1E0D8B5B0], 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel__keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, sel__keyboardDidHide_, *MEMORY[0x1E0DC4E68], 0);
    v34[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)-[CatalogViewController registerForTraitChanges:withTarget:action:](v9, "registerForTraitChanges:withTarget:action:", v24, v9, sel_horizontalSizeClassDidChange_previousTraitCollection_);

    v33 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)-[CatalogViewController registerForTraitChanges:withTarget:action:](v9, "registerForTraitChanges:withTarget:action:", v26, v9, sel__preferredContentSizeCategoryDidChange);

    v28 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    tableViewCellHeightCache = v9->_tableViewCellHeightCache;
    v9->_tableViewCellHeightCache = v28;

    -[NSCache setCountLimit:](v9->_tableViewCellHeightCache, "setCountLimit:", 45);
    v30 = v9;

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CatalogViewController;
  -[CatalogViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[CatalogViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);
  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v5);

  -[SFStartPageViewController title](self->_startPageViewController, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController setTitle:](self, "setTitle:", v6);

  -[SFStartPageViewController view](self->_startPageViewController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 0);
  objc_msgSend(v7, "setInsetsLayoutMarginsFromSafeArea:", 0);
  if (self->_usesPopoverStyleForFavorites)
  {
    -[AbstractCatalogViewController takeOwnershipOfStartPageViewController](self->_popoverCatalogViewController, "takeOwnershipOfStartPageViewController");
    -[PopoverCatalogViewController updateStartPagePreferredContentSize](self->_popoverCatalogViewController, "updateStartPagePreferredContentSize");
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sf_viewControllerToPresentFrom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[CatalogViewController _presentPopoverWithViewController:](self, "_presentPopoverWithViewController:", self->_popoverCatalogViewController);
  }
  else
  {
    -[AbstractCatalogViewController takeOwnershipOfStartPageViewController](self, "takeOwnershipOfStartPageViewController");
  }
  -[CatalogViewController updateStartPageControlTintColor](self, "updateStartPageControlTintColor");

}

- (void)updateStartPageControlTintColor
{
  int v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[StartPageController viewController](self->_startPageController, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredControlTintColor:", v4);

  if (v3)
}

- (void)didGainOwnershipOfStartPageViewController
{
  -[CatalogViewController _updateBackgroundColorWhenShowingFavoritesNavigationController](self, "_updateBackgroundColorWhenShowingFavoritesNavigationController");
  -[StartPageController setShowingAsPopover:](self->_startPageController, "setShowingAsPopover:", 0);
}

- (void)_updateBackgroundColorWhenShowingFavoritesNavigationController
{
  -[SFStartPageViewController setBackgroundDisplayMode:](self->_startPageViewController, "setBackgroundDisplayMode:", 0);
}

- (void)startPageViewControllerDidAppear:(id)a3
{
  id WeakRetained;

  if (!self->_startPageDidAppearAtLeastOnce)
  {
    self->_startPageDidAppearAtLeastOnce = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "catalogViewControllerDidAppear:", self);

  }
}

- (void)updateStartPageHidesEmptyRootViewNavigationBar
{
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isUsingBottomCapsule"))
    v4 = objc_msgSend(WeakRetained, "usesNarrowLayout") ^ 1;
  else
    v4 = 1;
  -[StartPageController viewController](self->_startPageController, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRootViewHidesEmptyNavigationBar:", v4);

}

- (id)startPageViewControllerTitleForRootView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[StartPageController libraryType](self->_startPageController, "libraryType", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    startPageTitleForCollectionType(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)startPageViewControllerTopPadding:(id)a3
{
  void *v4;
  double result;
  id WeakRetained;
  int v7;

  -[StartPageController libraryType](self->_startPageController, "libraryType", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0.0;
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    v7 = objc_msgSend(WeakRetained, "shouldIncreaseTopSpacingForStartPageController:", self->_startPageController);

    result = *MEMORY[0x1E0D4F208];
    if (v7)
      return 34.0;
  }
  return result;
}

- (void)startPageUpdatePolicyDidChange
{
  void *v3;
  _QWORD v4[5];

  -[StartPageController viewController](self->_startPageController, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CatalogViewController_startPageUpdatePolicyDidChange__block_invoke;
  v4[3] = &unk_1E9CF1900;
  v4[4] = self;
  objc_msgSend(v3, "coalesceDataReloadWithBlock:animatingDifferences:", v4, 1);

}

- (void)updateStartPageCustomizationPolicy
{
  int64_t v3;
  id v4;

  v3 = -[CatalogViewController startPageCustomizationPolicy](self, "startPageCustomizationPolicy");
  -[StartPageController viewController](self->_startPageController, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomizationPolicy:", v3);

}

- (int64_t)startPageCustomizationPolicy
{
  id WeakRetained;
  void *v4;
  id v5;
  int64_t v6;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (self->_usesPopoverStyleForFavorites)
    goto LABEL_8;
  -[StartPageController libraryType](self->_startPageController, "libraryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_8:
    v6 = 2;
    goto LABEL_9;
  }
  if (!objc_msgSend(WeakRetained, "canPerformPostLaunchActions"))
    goto LABEL_8;
  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(v5, "catalogViewControllerShouldUsePopoverForCompletions:", self) & 1) != 0
    || self->_usesPopoverStyleForFavorites)
  {

    v6 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "tabController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeTabDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isBlank") ^ 1;

  }
LABEL_9:

  return v6;
}

- (void)dismissWebSearchTipIfNeeded
{
  -[CompletionListTableViewController setShowsWebSearchTipIfExists:](self->_completionsViewController, "setShowsWebSearchTipIfExists:", 0);
}

- (void)setLibraryType:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[StartPageController libraryType](self->_startPageController, "libraryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    -[StartPageController setLibraryType:](self->_startPageController, "setLibraryType:", v7);
    -[StartPageController viewController](self->_startPageController, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetToRootViewWithCustomizationPolicy:", -[CatalogViewController startPageCustomizationPolicy](self, "startPageCustomizationPolicy"));

    -[CatalogViewController reloadNavigationItemAnimated:](self, "reloadNavigationItemAnimated:", 0);
  }

}

- (id)startPageViewController:(id)a3 trailingBarItemsForSection:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v6 = WeakRetained;
  if (self->_usesPopoverStyleForFavorites)
    goto LABEL_3;
  objc_msgSend(WeakRetained, "tabBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "displayMode");

  if (v8)
    goto LABEL_3;
  objc_msgSend(v6, "tabController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTabDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isBlank") && !objc_msgSend(v6, "isFavoritesFieldFocused"))
  {
    -[UnifiedField superview](self->_textField, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
LABEL_3:
      v9 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_4;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "rootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "capsuleCollectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && objc_msgSend(v14, "integerValue") == 2)
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CatalogViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return v9;
}

- (StartPageController)startPageController
{
  return self->_startPageController;
}

- (void)setUsesPopoverStyleForFavorites:(BOOL)a3
{
  void *v4;

  if (self->_usesPopoverStyleForFavorites != a3)
  {
    self->_usesPopoverStyleForFavorites = a3;
    -[StartPageController viewController](self->_startPageController, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadNavigationItemAnimated:", objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));

    -[CatalogViewController updateStartPageCustomizationPolicy](self, "updateStartPageCustomizationPolicy");
  }
}

- (void)setNavigationBar:(id)a3
{
  _SFNavigationBarCommon *v5;
  void *v6;
  _SFNavigationBarCommon *v7;

  v5 = (_SFNavigationBarCommon *)a3;
  if (self->_navigationBar != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_navigationBar, a3);
    -[_SFNavigationBarCommon textField](self->_navigationBar, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController setTextField:](self, "setTextField:", v6);

    v5 = v7;
  }

}

- (void)setStartPageScrollObserver:(id)a3
{
  StartPageController *startPageController;
  id v4;
  id v5;

  startPageController = self->_startPageController;
  v4 = a3;
  -[StartPageController viewController](startPageController, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollObserver:", v4);

}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CatalogViewController updateStartPageHidesEmptyRootViewNavigationBar](self, "updateStartPageHidesEmptyRootViewNavigationBar");
  -[StartPageController viewController](self->_startPageController, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadNavigationItemAnimated:", v3);

}

- (void)setLoadProgressObserver:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_loadProgressObserver, obj);
    -[CompletionList setLoadProgressObserver:](self->_completionList, "setLoadProgressObserver:", obj);
  }

}

- (void)resetFavorites
{
  void *v3;
  id v4;

  -[StartPageController libraryType](self->_startPageController, "libraryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[StartPageController updatePrivateBrowsingExplanationState](self->_startPageController, "updatePrivateBrowsingExplanationState");
    -[StartPageController viewController](self->_startPageController, "viewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resetToRootViewWithCustomizationPolicy:", -[CatalogViewController startPageCustomizationPolicy](self, "startPageCustomizationPolicy"));

  }
}

- (BOOL)startPageDidAppearAtLeastOnce
{
  return self->_startPageDidAppearAtLeastOnce;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (!v4 && !self->_transitioningToNewSizeClass)
    -[CatalogViewController dismissCompletionDetailWindowAndResumeEditingIfNeeded:completionHandler:](self, "dismissCompletionDetailWindowAndResumeEditingIfNeeded:completionHandler:", 0, 0);
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _updateVisibilityForCompletionListTableView:](self, "_updateVisibilityForCompletionListTableView:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CatalogViewController;
  -[CatalogViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v4);

}

- (void)_updateVisibilityForCompletionListTableView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "liveCompletionList");

  if ((v5 & 1) == 0)
    objc_msgSend(v6, "setHidden:", -[UnifiedField voiceSearchState](self->_textField, "voiceSearchState") == 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CatalogViewController;
  -[CatalogViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CatalogViewController _deselectCompletionsViewControllerSelectedRow](self, "_deselectCompletionsViewControllerSelectedRow");
}

- (void)_deselectCompletionsViewControllerSelectedRow
{
  void *v2;
  id v3;

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v3, "deselectRowAtIndexPath:animated:", v2, 1);

}

- (UIButton)sidebarButton
{
  UIButton *sidebarButton;
  id WeakRetained;
  UIButton *v5;
  UIButton *v6;

  sidebarButton = self->_sidebarButton;
  if (!sidebarButton)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "makeSidebarButton");
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sidebarButton;
    self->_sidebarButton = v5;

    sidebarButton = self->_sidebarButton;
  }
  return sidebarButton;
}

- (void)resume
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "catalogViewControllerShouldRequestNetworkedSuggestions:", self);

  if (v4)
    -[CatalogViewController _beginParsecSessionIfNeeded](self, "_beginParsecSessionIfNeeded");
}

- (void)_beginParsecSessionIfNeeded
{
  _BOOL4 v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  UniversalSearchSession *v7;
  UniversalSearchSession *parsecSearchSession;
  UniversalSearchSession *v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = +[UniversalSearchFirstTimeExperienceViewController hasShownParsecFirstTimeUserExperience](UniversalSearchFirstTimeExperienceViewController, "hasShownParsecFirstTimeUserExperience");
  if (!self->_parsecSearchSession)
  {
    v4 = v3;
    if (objc_msgSend(MEMORY[0x1E0D8AC58], "areSiriSearchSuggestionsEnabled"))
    {
      objc_msgSend(WeakRetained, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "allowsSearchFeedback") & v4;

      if (v6 == 1)
      {
        objc_msgSend(WeakRetained, "universalSearchSession");
        v7 = (UniversalSearchSession *)objc_claimAutoreleasedReturnValue();
        parsecSearchSession = self->_parsecSearchSession;
        self->_parsecSearchSession = v7;

        v9 = self->_parsecSearchSession;
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scale");
        -[WBSParsecDSession setUIScale:](v9, "setUIScale:");

        -[CompletionList setParsecSearchSession:](self->_completionList, "setParsecSearchSession:", self->_parsecSearchSession);
      }
    }
  }

}

- (id)startPageViewController:(id)a3 leadingBarItemsForSection:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v6 = WeakRetained;
  if (!self->_usesPopoverStyleForFavorites)
  {
    objc_msgSend(WeakRetained, "tabBarManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "displayMode"))
    {
      -[StartPageController libraryType](self->_startPageController, "libraryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
        -[CatalogViewController sidebarButton](self, "sidebarButton");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithCustomView:", v12);

        _SFAccessibilityIdentifierForBarItem();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAccessibilityIdentifier:", v14);

        v15[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_3;
      }
    }
    else
    {

    }
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_3:

  return v7;
}

- (void)setShowingCompletions:(BOOL)a3 completionHandler:(id)a4
{
  -[CatalogViewController _setShowingCompletions:popoverDismissalReason:completionHandler:](self, "_setShowingCompletions:popoverDismissalReason:completionHandler:", a3, 2, a4);
}

- (void)_setShowingCompletions:(BOOL)a3 popoverDismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  int v15;
  void *popoverCatalogViewController;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD aBlock[4];
  id v23;

  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke;
  aBlock[3] = &unk_1E9CF1950;
  v10 = v8;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (self->_showingCompletions != v6)
  {
    self->_showingCompletions = v6;
    if (a4 != 1 && !v6)
      -[CompletionList clearCompletionListings](self->_completionList, "clearCompletionListings");
    v13 = dispatch_group_create();
    if (!v6)
    {
      if (a4 != 1)
        -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
      if (!self->_usesPopoverStyleForFavorites)
      {
        dispatch_group_enter(v13);
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_3;
        v18[3] = &unk_1E9CF1900;
        v19 = v13;
        -[CatalogViewController _dismissPopoverAnimated:dismissalReason:completionHandler:](self, "_dismissPopoverAnimated:dismissalReason:completionHandler:", 0, a4, v18);

      }
      -[CatalogViewController relinquishOwnershipOfCompletionsViewControllerFromCurrentParent](self, "relinquishOwnershipOfCompletionsViewControllerFromCurrentParent");
      -[CatalogViewController _showStartPageInPopover](self, "_showStartPageInPopover");
      goto LABEL_21;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_msgSend(WeakRetained, "catalogViewControllerShouldUsePopoverForCompletions:", self);

    if (v15)
    {
      if (-[UnifiedField voiceSearchState](self->_textField, "voiceSearchState") || self->_voiceSearchWasInProgress)
        goto LABEL_18;
      popoverCatalogViewController = self->_popoverCatalogViewController;
    }
    else
    {
      popoverCatalogViewController = self;
    }
    objc_msgSend(popoverCatalogViewController, "takeOwnershipOfCompletionsViewController");
LABEL_18:
    -[CatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      dispatch_group_enter(v13);
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2;
      v20[3] = &unk_1E9CF1900;
      v21 = v13;
      -[CatalogViewController _dismissUniversalSearchFirstTimeExperience:dismissalReason:completionHandler:](self, "_dismissUniversalSearchFirstTimeExperience:dismissalReason:completionHandler:", v17, a4, v20);

    }
LABEL_21:
    dispatch_group_notify(v13, MEMORY[0x1E0C80D38], v12);

    goto LABEL_22;
  }
  (*((void (**)(void *))v11 + 2))(v11);
LABEL_22:

}

uint64_t __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)test_simulateTyping:(id)a3 inGroup:(id)a4 startIndex:(unint64_t)a5
{
  id v8;
  id v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  CatalogViewController *v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") >= a5)
  {
    v10 = dispatch_time(0, 500000000);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke;
    v11[3] = &unk_1E9CF2B48;
    v15 = a5;
    v12 = v8;
    v13 = v9;
    v14 = self;
    dispatch_after(v10, MEMORY[0x1E0C80D38], v11);

  }
}

void __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startedSubTest:forTest:withMetrics:", CFSTR("SearchPerformanceCompletionListRedraw"), gCurrentTestName, &unk_1E9D62820);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_2;
    v13 = &unk_1E9CF1830;
    v14 = v3;
    v15 = *(id *)(a1 + 40);
    v4 = v3;
    objc_msgSend(v4, "installCACommitCompletionBlock:", &v10);

  }
  objc_msgSend(*(id *)(a1 + 48), "textField", v10, v11, v12, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_ensureCompletionListAndParsecSession");
  v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:", 0, *(_QWORD *)(a1 + 56));
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v9);

  objc_msgSend(v5, "_textDidChangeFromTyping");
  objc_msgSend(*(id *)(a1 + 48), "_textFieldEditingChanged");
  objc_msgSend(*(id *)(a1 + 48), "test_simulateTyping:inGroup:startIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v8 + 1);

}

void __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("SearchPerformanceCompletionListRedraw"), gCurrentTestName);
  v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_3;
  block[3] = &unk_1E9CF1900;
  v4 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

void __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (int64_t)_completionListQueryID
{
  void *v2;
  int64_t v3;

  -[CompletionList query](self->_completionList, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "queryID");
  if (!v3)
    v3 = objc_msgSend(MEMORY[0x1E0D8A860], "currentQueryID");

  return v3;
}

- (void)_parsecEnabledDidChange:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E0D8AC58], "areSiriSearchSuggestionsEnabled", a3) & 1) == 0)
    -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
}

- (void)dealloc
{
  void *v3;
  CatalogViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[CatalogViewController _invalidatePendingVoiceSearchTimer](self, "_invalidatePendingVoiceSearchTimer");
  -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
  -[CatalogViewController unifiedTextField](self, "unifiedTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[CompletionList delegate](self->_completionList, "delegate");
  v4 = (CatalogViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[CompletionList setDelegate:](self->_completionList, "setDelegate:", 0);
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", 0);
  objc_msgSend(v5, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  +[Application sharedApplication](Application, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabGroupManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTabGroupObserver:", self->_startPageController);

  v9.receiver = self;
  v9.super_class = (Class)CatalogViewController;
  -[CatalogViewController dealloc](&v9, sel_dealloc);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__CatalogViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E9CFA938;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

void __76__CatalogViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1272);
  v3 = a2;
  objc_msgSend(v2, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimated");

  objc_msgSend(v5, "reloadNavigationItemAnimated:", v4);
}

- (void)_preferredContentSizeCategoryDidChange
{
  -[NSCache removeAllObjects](self->_tableViewCellHeightCache, "removeAllObjects");
  -[CatalogViewController _reloadCompletionTable](self, "_reloadCompletionTable");
}

- (void)horizontalSizeClassDidChange:(id)a3 previousTraitCollection:(id)a4
{
  CompletionList *completionList;

  if (objc_msgSend(a4, "horizontalSizeClass", a3)
    && !self->_showingCompletions
    && (-[UnifiedField isFirstResponder](self->_textField, "isFirstResponder") & 1) == 0
    && !self->_transitioningToNewSizeClass)
  {
    completionList = self->_completionList;
    self->_completionList = 0;

    -[CatalogViewController _reloadCompletionTable](self, "_reloadCompletionTable");
  }
}

- (void)willUpdateObscuredInsetsForSizeTransition
{
  self->_startPageGeometryIsFrozen = 1;
}

- (void)didUpdateObscuredInsetsForSizeTransition
{
  id v2;

  self->_startPageGeometryIsFrozen = 0;
  if (self->_startPageGeometryWasFrozenDuringLastLayout)
  {
    -[CatalogViewController view](self, "view");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

  }
}

- (id)completionsViewController
{
  CompletionListTableViewController *completionsViewController;
  CompletionListTableViewController *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CompletionListTableViewController *v10;
  CompletionListDismissalAnalyticsReporter *v11;
  CompletionListDismissalAnalyticsReporter *completionDismissalReporter;

  completionsViewController = self->_completionsViewController;
  if (!completionsViewController)
  {
    v4 = objc_alloc_init(CompletionListTableViewController);
    -[CompletionListTableViewController setClearsSelectionOnViewWillAppear:](v4, "setClearsSelectionOnViewWillAppear:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tipsCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "webSearchTipView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionListTableViewController setWebSearchTipView:](v4, "setWebSearchTipView:", v8);

    -[CompletionListTableViewController tableView](v4, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDataSource:", self);
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setEstimatedRowHeight:", +[UITableViewCell safari_defaultHeightOfTrivialInstance]());
    objc_msgSend(v9, "setLayoutMarginsFollowReadableWidth:", 0);
    objc_msgSend(v9, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
    -[CatalogViewController _updateVisibilityForCompletionListTableView:](self, "_updateVisibilityForCompletionListTableView:", v9);

    v10 = self->_completionsViewController;
    self->_completionsViewController = v4;

    v11 = objc_alloc_init(CompletionListDismissalAnalyticsReporter);
    completionDismissalReporter = self->_completionDismissalReporter;
    self->_completionDismissalReporter = v11;

    completionsViewController = self->_completionsViewController;
  }
  return completionsViewController;
}

- (void)didGainOwnershipOfCompletionsViewController
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionListTableViewController setShowsWebSearchTipIfExists:](self->_completionsViewController, "setShowsWebSearchTipIfExists:", objc_msgSend(v4, "isUsingBottomCapsule") ^ 1);

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSeparatorEffect:", 0);
  objc_msgSend(v11, "indexPathsForVisibleRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 5);

  if (!self->_usesPopoverStyleForFavorites)
  {
    if (!-[UnifiedField voiceSearchState](self->_textField, "voiceSearchState")
      || (objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "liveCompletionList"),
          v6,
          v7))
    {
      -[CatalogViewController _updateAlternateContentViewController](self, "_updateAlternateContentViewController");
    }
  }
  objc_msgSend(v11, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[StartPageController viewController](self->_startPageController, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showsWallpaper");

  if (v9)
  {
    -[UIBarButtonItem customView](self->_cancelBarButton, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOpaqueBackgroundVisibility:", 1.0);

  }
}

- (void)relinquishOwnershipOfCompletionsViewControllerFromCurrentParent
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlternateContentViewController:", 0);

  -[StartPageController viewController](self->_startPageController, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showsWallpaper");

  if (v5)
  {
    -[UIBarButtonItem customView](self->_cancelBarButton, "customView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOpaqueBackgroundVisibility:", 0.0);

  }
  v7.receiver = self;
  v7.super_class = (Class)CatalogViewController;
  -[AbstractCatalogViewController relinquishOwnershipOfCompletionsViewControllerFromCurrentParent](&v7, sel_relinquishOwnershipOfCompletionsViewControllerFromCurrentParent);
}

- (void)relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent
{
  void *v3;
  UniversalSearchFirstTimeExperienceViewController *v4;
  UniversalSearchFirstTimeExperienceViewController *universalSearchFirstTimeExperienceViewController;
  void *v6;
  objc_super v7;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateContentViewController");
  v4 = (UniversalSearchFirstTimeExperienceViewController *)objc_claimAutoreleasedReturnValue();
  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;

  if (v4 == universalSearchFirstTimeExperienceViewController)
  {
    -[StartPageController viewController](self->_startPageController, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlternateContentViewController:", 0);

  }
  v7.receiver = self;
  v7.super_class = (Class)CatalogViewController;
  -[AbstractCatalogViewController relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent](&v7, sel_relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent);
}

- (void)_updateAlternateContentViewController
{
  CatalogViewController *v3;
  CompletionListTableViewController *completionsViewController;
  id v5;

  -[CompletionListTableViewController parentViewController](self->_completionsViewController, "parentViewController");
  v3 = (CatalogViewController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    completionsViewController = self->_completionsViewController;
    -[StartPageController viewController](self->_startPageController, "viewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlternateContentViewController:", completionsViewController);

  }
}

- (void)didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController
{
  void *v3;
  void *v4;
  UniversalSearchFirstTimeExperienceViewController *universalSearchFirstTimeExperienceViewController;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UniversalSearchFirstTimeExperienceViewController view](self->_universalSearchFirstTimeExperienceViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
  -[StartPageController viewController](self->_startPageController, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlternateContentViewController:", universalSearchFirstTimeExperienceViewController);

}

- (double)navigationBarHeight
{
  void *v2;
  double v3;
  double v4;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBarHeight");
  v4 = v3;

  return v4;
}

- (void)updateStartPageTopSpacing
{
  id v2;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStartPageTopPadding");

}

- (void)ignorePreviousLayoutSize
{
  id v2;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignorePreviousLayoutSize");

}

- (id)unifiedTextField
{
  return self->_textField;
}

- (void)setCompletionList:(id)a3
{
  CompletionList **p_completionList;
  id WeakRetained;
  CompletionList *v7;
  void *v8;
  CompletionList *v9;

  p_completionList = &self->_completionList;
  v9 = (CompletionList *)a3;
  if (*p_completionList != v9)
  {
    objc_storeStrong((id *)&self->_completionList, a3);
    -[CompletionList setDelegate:](*p_completionList, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
    -[CompletionList setLoadProgressObserver:](*p_completionList, "setLoadProgressObserver:", WeakRetained);

    -[CompletionList setParsecSearchSession:](*p_completionList, "setParsecSearchSession:", self->_parsecSearchSession);
    if (self->_showingCompletions)
    {
      v7 = *p_completionList;
      -[CompletionList query](v7, "query");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CatalogViewController completionListDidUpdate:forQuery:](self, "completionListDidUpdate:forQuery:", v7, v8);

    }
  }

}

- (void)cancelFavoritesGestures
{
  -[SFStartPageViewController cancelGestures](self->_startPageViewController, "cancelGestures");
}

- (NSString)queryString
{
  return (NSString *)-[UnifiedField text](self->_textField, "text");
}

- (void)setQueryString:(id)a3
{
  id v4;

  v4 = a3;
  -[CatalogViewController _ensureCompletionListAndParsecSession](self, "_ensureCompletionListAndParsecSession");
  -[UnifiedField clearUserTypedText](self->_textField, "clearUserTypedText");
  -[UnifiedField setText:](self->_textField, "setText:", v4);

  -[CatalogViewController _textFieldEditingChanged](self, "_textFieldEditingChanged");
}

- (void)_presentPopoverWithViewController:(id)a3
{
  -[CatalogViewController _presentPopoverWithViewController:completionHandler:](self, "_presentPopoverWithViewController:completionHandler:", a3, 0);
}

- (void)_presentPopoverWithViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  UIPopoverPresentationController *v12;
  UIPopoverPresentationController *popoverPresentationController;
  id WeakRetained;
  _QWORD aBlock[4];
  id v16;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CatalogViewController__presentPopoverWithViewController_completionHandler___block_invoke;
  aBlock[3] = &unk_1E9CF1950;
  v8 = v7;
  v16 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v6, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v6, "presentingViewController"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v9[2](v9);
    goto LABEL_5;
  }
  objc_msgSend(v6, "_popoverController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  objc_msgSend(v6, "popoverPresentationController");
  v12 = (UIPopoverPresentationController *)objc_claimAutoreleasedReturnValue();
  popoverPresentationController = self->_popoverPresentationController;
  self->_popoverPresentationController = v12;

  -[UIPopoverPresentationController setDelegate:](self->_popoverPresentationController, "setDelegate:", self);
  -[UIPopoverPresentationController _setShouldDisableInteractionDuringTransitions:](self->_popoverPresentationController, "_setShouldDisableInteractionDuringTransitions:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIPopoverPresentationController _setAllowsFocusInPresentingViewController:](self->_popoverPresentationController, "_setAllowsFocusInPresentingViewController:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:presentViewControllerWithinPopover:completionHandler:", self, v6, v8);

LABEL_5:
}

uint64_t __77__CatalogViewController__presentPopoverWithViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didTogglePrivateBrowsing
{
  id WeakRetained;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v4 = objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled");

  if (v4)
    -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
  -[CatalogViewController updateStartPageControlTintColor](self, "updateStartPageControlTintColor");
  -[SFStartPageViewController reloadDataAnimatingDifferences:](self->_startPageViewController, "reloadDataAnimatingDifferences:", 0);
  self->_nextSnapshotRequiresScreenUpdates = 1;
}

- (void)resetPrivateBrowsingExplanation
{
  id v3;

  -[StartPageController updatePrivateBrowsingExplanationState](self->_startPageController, "updatePrivateBrowsingExplanationState");
  -[StartPageController viewController](self->_startPageController, "viewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadDataAnimatingDifferences:", 0);

}

- (void)_reloadCompletionTable
{
  void *v3;

  self->_completionTableIsReloading = 1;
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[CompletionListTableViewController setNeedsScrollOffsetReset](self->_completionsViewController, "setNeedsScrollOffsetReset");
}

- (BOOL)_shouldUsePopoverForCompletions
{
  id WeakRetained;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "catalogViewControllerShouldUsePopoverForCompletions:", self)
    && !-[UnifiedField voiceSearchState](self->_textField, "voiceSearchState")
    && !self->_voiceSearchWasInProgress;

  return v4;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)_dismissPopoverAnimated:(BOOL)a3 dismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  CatalogViewController *v20;
  id v21;
  BOOL v22;
  _QWORD aBlock[4];
  id v24;

  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke;
  aBlock[3] = &unk_1E9CF1950;
  v10 = v8;
  v24 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (self->_dismissingPopover || !self->_popoverPresentationController)
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
  else
  {
    self->_dismissingPopover = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "catalogViewControllerPopoverWillDismiss:dismissalReason:", self, a4);

    v16 = v9;
    v17 = 3221225472;
    v18 = __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_2;
    v19 = &unk_1E9CFB1C0;
    v20 = self;
    v22 = v6;
    v21 = v12;
    v14 = _Block_copy(&v16);
    v15 = v14;
    if (v6)
      (*((void (**)(void *))v14 + 2))(v14);
    else
      objc_msgSend(MEMORY[0x1E0DC3F20], "_performWithoutDeferringTransitions:", v14, v16, v17, v18, v19, v20);

  }
}

uint64_t __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1264), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_3;
  v5[3] = &unk_1E9CF26B8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", v3, v5);

}

uint64_t __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_popoverDismissCompletion");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_popoverDismissCompletion
{
  UIPopoverPresentationController *popoverPresentationController;

  -[UIPopoverPresentationController setDelegate:](self->_popoverPresentationController, "setDelegate:", 0);
  popoverPresentationController = self->_popoverPresentationController;
  self->_popoverPresentationController = 0;

  self->_dismissingPopover = 0;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  if (!self->_dismissingPopover)
  {
    self->_dismissingPopover = 1;
    -[UIPopoverPresentationController presentedViewController](self->_popoverPresentationController, "presentedViewController", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CatalogViewController_presentationControllerWillDismiss___block_invoke;
    v7[3] = &unk_1E9CFA938;
    v7[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__CatalogViewController_presentationControllerWillDismiss___block_invoke_2;
    v6[3] = &unk_1E9CFA938;
    objc_msgSend(v5, "animateAlongsideTransition:completion:", v7, v6);

  }
}

void __59__CatalogViewController_presentationControllerWillDismiss___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1240));
  objc_msgSend(WeakRetained, "catalogViewControllerPopoverWillDismiss:dismissalReason:", *(_QWORD *)(a1 + 32), 2);

}

uint64_t __59__CatalogViewController_presentationControllerWillDismiss___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopCompleting");
  return objc_msgSend(*(id *)(a1 + 32), "_popoverDismissCompletion");
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:willRepositionPopoverToRect:inView:", self, a4, a5);

}

- (void)setContentBorrowed:(BOOL)a3
{
  if (self->_contentBorrowed != a3)
  {
    self->_contentBorrowed = a3;
    -[CatalogViewController _setContentOverlayInsets:](self, "_setContentOverlayInsets:", self->_contentOverlayInsets.top, self->_contentOverlayInsets.left, self->_contentOverlayInsets.bottom, self->_contentOverlayInsets.right);
  }
}

- (SFStartPageScrollObserver)startPageScrollObserver
{
  void *v2;
  void *v3;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFStartPageScrollObserver *)v3;
}

- (NSString)libraryType
{
  void *startPageController;

  startPageController = self->_startPageController;
  if (startPageController)
  {
    objc_msgSend(startPageController, "libraryType");
    startPageController = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)startPageController;
}

- (double)chromelessScrollDistance
{
  void *v2;
  double v3;
  double v4;

  -[StartPageController viewController](self->_startPageController, "viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isShowingRootView"))
  {
    objc_msgSend(v2, "scrollDistance");
    v4 = v3;
  }
  else
  {
    v4 = 1.79769313e308;
  }

  return v4;
}

- (void)setTextField:(id)a3
{
  UnifiedField *v5;
  UnifiedField **p_textField;
  void *v7;
  void *v8;
  UnifiedField *v9;

  v5 = (UnifiedField *)a3;
  p_textField = &self->_textField;
  if (self->_textField != v5)
  {
    v9 = v5;
    -[CatalogViewController unifiedTextField](self, "unifiedTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
    objc_msgSend(v7, "setDelegate:", 0);
    objc_msgSend(v7, "setInputAccessoryView:", 0);
    objc_storeStrong((id *)&self->_textField, a3);
    -[UnifiedField setDelegate:](*p_textField, "setDelegate:", self);
    if (-[UnifiedField isFirstResponder](*p_textField, "isFirstResponder"))
      -[CatalogViewController _ensureCompletionListAndParsecSession](self, "_ensureCompletionListAndParsecSession");
    -[StartPageController viewController](self->_startPageController, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadNavigationItemAnimated:", 1);

    v5 = v9;
  }

}

- (void)_clearParsecSearchSession
{
  UniversalSearchSession *parsecSearchSession;

  -[WBSParsecDSession setDelegate:](self->_parsecSearchSession, "setDelegate:", 0);
  parsecSearchSession = self->_parsecSearchSession;
  self->_parsecSearchSession = 0;

  -[CompletionList setParsecSearchSession:](self->_completionList, "setParsecSearchSession:", 0);
}

- (void)displayPopover
{
  -[CatalogViewController _presentPopoverWithViewController:](self, "_presentPopoverWithViewController:", self->_popoverCatalogViewController);
}

- (void)setShowingCompletions:(BOOL)a3
{
  -[CatalogViewController _setShowingCompletions:popoverDismissalReason:completionHandler:](self, "_setShowingCompletions:popoverDismissalReason:completionHandler:", a3, 2, 0);
}

void __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_showCompletionsInPopover
{
  _BOOL4 v3;
  _BOOL4 usesPopoverStyleForFavorites;

  v3 = -[CatalogViewController _shouldUsePopoverForCompletions](self, "_shouldUsePopoverForCompletions");
  if (v3)
  {
    usesPopoverStyleForFavorites = self->_usesPopoverStyleForFavorites;
    -[AbstractCatalogViewController takeOwnershipOfCompletionsViewController](self->_popoverCatalogViewController, "takeOwnershipOfCompletionsViewController");
    if (!usesPopoverStyleForFavorites && !-[CatalogViewController popoverIsShowing](self, "popoverIsShowing"))
      -[CatalogViewController _presentPopoverWithViewController:](self, "_presentPopoverWithViewController:", self->_popoverCatalogViewController);
  }
  return v3;
}

- (void)_showStartPageInPopover
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__CatalogViewController__showStartPageInPopover__block_invoke;
  v2[3] = &unk_1E9CF1900;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

uint64_t __48__CatalogViewController__showStartPageInPopover__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "updateStartPagePreferredContentSize");
  return objc_msgSend(*(id *)(a1 + 32), "updatePreferredContentSize");
}

- (void)updateQuerySuggestionsFromResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CatalogViewController textField](self, "textField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContextCompleter:", v5);
}

- (void)stopCompleting
{
  CompletionListDismissalAnalyticsReporter *completionDismissalReporter;
  void *v4;
  id v5;

  self->_hasScheduledCompletionListDismissal = 0;
  -[CompletionListDismissalAnalyticsReporter reportAnalytics](self->_completionDismissalReporter, "reportAnalytics");
  completionDismissalReporter = self->_completionDismissalReporter;
  self->_completionDismissalReporter = 0;

  if (-[CatalogViewController isShowingUniversalSearchFirstTimeExperience](self, "isShowingUniversalSearchFirstTimeExperience"))
  {
    -[CatalogViewController _dismissUniversalSearchFirstTimeExperience:dismissalReason:](self, "_dismissUniversalSearchFirstTimeExperience:dismissalReason:", self->_universalSearchFirstTimeExperienceViewController, 2);
  }
  -[CatalogViewController textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextCompleter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discard");

  objc_msgSend(v5, "setContextCompleter:", 0);
  -[CompletionList stopCompleting](self->_completionList, "stopCompleting");
  -[CatalogViewController _reloadCompletionTable](self, "_reloadCompletionTable");
  -[CatalogViewController setShowingCompletions:](self, "setShowingCompletions:", 0);
  -[CatalogViewController _dismissPopoverAnimated:dismissalReason:completionHandler:](self, "_dismissPopoverAnimated:dismissalReason:completionHandler:", 0, 2, 0);
  -[CatalogViewController _clearCompletionListCachesSoon](self, "_clearCompletionListCachesSoon");

}

- (void)_cancelClearingCompletionListCaches
{
  NSTimer *timerForClearingCompletionListCaches;

  -[NSTimer invalidate](self->_timerForClearingCompletionListCaches, "invalidate");
  timerForClearingCompletionListCaches = self->_timerForClearingCompletionListCaches;
  self->_timerForClearingCompletionListCaches = 0;

}

- (void)_clearCompletionListCachesSoon
{
  void *v3;
  NSTimer *v4;
  NSTimer *timerForClearingCompletionListCaches;
  _QWORD v6[4];
  id v7;
  id location;

  -[CatalogViewController _cancelClearingCompletionListCaches](self, "_cancelClearingCompletionListCaches");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CatalogViewController__clearCompletionListCachesSoon__block_invoke;
  v6[3] = &unk_1E9CF5FD8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 480.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timerForClearingCompletionListCaches = self->_timerForClearingCompletionListCaches;
  self->_timerForClearingCompletionListCaches = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__CatalogViewController__clearCompletionListCachesSoon__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[154], "clearCachedSearches");
    objc_msgSend(v2[149], "removeAllObjects");
    WeakRetained = v2;
  }

}

- (void)reportUnifiedFieldSearchDidCancel
{
  id v3;

  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchViewDisappearedBecauseOfEvent:forQueryID:", 4, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

}

- (void)_ensureCompletionListAndParsecSession
{
  id WeakRetained;
  int v4;
  CompletionList *v5;
  UniversalSearchSession *parsecSearchSession;
  id v7;
  CompletionList *v8;
  CompletionList *completionList;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "catalogViewControllerShouldRequestNetworkedSuggestions:", self))
    v4 = objc_msgSend(MEMORY[0x1E0D8AC58], "areSiriSearchSuggestionsEnabled");
  else
    v4 = 0;

  if (!self->_completionList)
  {
    v5 = [CompletionList alloc];
    parsecSearchSession = self->_parsecSearchSession;
    v7 = objc_loadWeakRetained((id *)&self->_browserController);
    v8 = -[CompletionList initWithParsecSearchSession:browserController:](v5, "initWithParsecSearchSession:browserController:", parsecSearchSession, v7);
    completionList = self->_completionList;
    self->_completionList = v8;

    -[CompletionList setDelegate:](self->_completionList, "setDelegate:", self);
    v10 = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
    -[CompletionList setLoadProgressObserver:](self->_completionList, "setLoadProgressObserver:", v10);

  }
  if (v4)
    -[CatalogViewController _beginParsecSessionIfNeeded](self, "_beginParsecSessionIfNeeded");
  else
    -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
  -[CatalogViewController _clearCompletionListCachesSoon](self, "_clearCompletionListCachesSoon");
}

- (void)_textFieldEditingChanged
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218243;
  v4 = a2;
  v5 = 2117;
  v6 = a1;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Text field editing changed; text length: %lu; current text: %{sensitive}@",
    (uint8_t *)&v3,
    0x16u);
}

id __49__CatalogViewController__textFieldEditingChanged__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0D8AB50];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topicId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithTitle:identifier:type:tag:", v5, v6, 0, v3);

  return v7;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3;

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)completionListDidUpdate:(id)a3 forQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint8_t v15[8];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_dismissingPopover && !self->_isCachedCompletionList)
  {
    -[CatalogViewController _reloadCompletionTable](self, "_reloadCompletionTable");
    objc_msgSend(v7, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController _preselectCompletionItemIfNecessaryForQueryString:](self, "_preselectCompletionItemIfNecessaryForQueryString:", v8);

    -[CatalogViewController _showCompletionsPopoverIfNecessary](self, "_showCompletionsPopoverIfNecessary");
  }
  if (self->_waitingOnFirstCompletionListUpdateForTelemetry)
  {
    self->_waitingOnFirstCompletionListUpdateForTelemetry = 0;
    v9 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldFirstKeyTapToCompletionListUpdate", " enableTelemetry=YES ", v15, 2u);
    }
  }
  if (self->_hasPendingVoiceSearchUpdate)
    -[CatalogViewController _commitVoiceSearchIfNecessary](self, "_commitVoiceSearchIfNecessary");
  v16[0] = CFSTR("time");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("query");
  v17[0] = v10;
  objc_msgSend(v7, "queryString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E9CFDBB0;
  if (v11)
    v13 = (const __CFString *)v11;
  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[Application postTestNotificationName:object:userInfo:](Application, "postTestNotificationName:object:userInfo:", CFSTR("catalogViewControllerDidFinish"), self, v14);

}

- (void)_preselectCompletionItemIfNecessaryForQueryString:(id)a3
{
  CompletionItem *lastTopHitMatch;
  CompletionItem *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  lastTopHitMatch = self->_lastTopHitMatch;
  if (lastTopHitMatch
    && (-[UnifiedField reflectedItem](self->_textField, "reflectedItem"),
        v5 = (CompletionItem *)objc_claimAutoreleasedReturnValue(),
        v5,
        lastTopHitMatch == v5))
  {
    v6 = 1;
  }
  else
  {
    v6 = !-[UnifiedField lastEditWasADeletion](self->_textField, "lastEditWasADeletion");
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEquivalentTo:", self->_lastTopHitMatch);

  if (v6 && v9)
  {
    -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);
  }
  else
  {
    -[CompletionList indexPathOfAsTypedSearchSuggestion](self->_completionList, "indexPathOfAsTypedSearchSuggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = WBSUnifiedFieldInputTypeForString();
    if (!self->_lastInputWasSearchTextCompletion && (v11 == 3 || !v11))
    {
      if (objc_msgSend(v10, "isEqual:", v7))
      {
        -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UnifiedField setReflectedItem:](self->_textField, "setReflectedItem:", v12);

        -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "selectRowAtIndexPath:animated:scrollPosition:", v10, 0, 0);

      }
    }
  }

}

- (void)_showCompletionsPopoverIfNecessary
{
  id WeakRetained;
  char v4;

  if (self->_showingCompletions
    && -[CompletionList numberOfGroups](self->_completionList, "numberOfGroups")
    && -[CatalogViewController _shouldUsePopoverForCompletions](self, "_shouldUsePopoverForCompletions"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_msgSend(WeakRetained, "catalogViewControllerShouldSuppressPopover:", self);

    if ((v4 & 1) == 0)
      -[CatalogViewController _showCompletionsInPopover](self, "_showCompletionsInPopover");
  }
}

- (void)_generateVisibleResultsFeedbackForEvent:(int64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t i;
  uint64_t v18;
  double x;
  double y;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat rect2;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v65 = *MEMORY[0x1E0C80C00];
  if (!self->_feedbackIsBeingGenerated
    && (a3 != 3 || !self->_lastFeedbackSentWasScrolling)
    && -[CompletionList hasCompletions](self->_completionList, "hasCompletions")
    && -[UnifiedField voiceSearchState](self->_textField, "voiceSearchState") != 1)
  {
    self->_feedbackIsBeingGenerated = 1;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_seenVisibleResults);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
    }
    -[NSMutableSet removeAllObjects](self->_seenVisibleResults, "removeAllObjects");
    v48 = (void *)objc_opt_new();
    -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v52 = v7;
    v53 = v6;
    v50 = v9;
    v51 = v8;

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(v4, "indexPathsForVisibleRows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v59;
      v14 = *MEMORY[0x1E0C9D648];
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      rect2 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v59 != v13)
            objc_enumerationMutation(v10);
          v18 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v4, "rectForRowAtIndexPath:", v18);
          x = v66.origin.x;
          y = v66.origin.y;
          width = v66.size.width;
          height = v66.size.height;
          v73.origin.x = v14;
          v73.origin.y = v15;
          v73.size.width = v16;
          v73.size.height = rect2;
          if (!CGRectEqualToRect(v66, v73))
          {
            objc_msgSend(v4, "convertRect:toView:", 0, x, y, width, height);
            v55 = v24;
            v56 = v23;
            v54 = v25;
            v27 = v26;
            objc_msgSend(v4, "window");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
            v30 = v29;
            v31 = v14;
            v33 = v32;
            v34 = v15;
            v36 = v35;
            v37 = v16;
            v39 = v38;

            v67.origin.x = v30;
            v67.origin.y = v33;
            v14 = v31;
            v67.size.width = v36;
            v15 = v34;
            v67.size.height = v39;
            v16 = v37;
            v74.origin.x = v56;
            v74.origin.y = v55;
            v74.size.width = v54;
            v74.size.height = v27;
            v68 = CGRectIntersection(v67, v74);
            v40 = CGRectGetHeight(v68);
            v69.origin.x = v56;
            v69.origin.y = v55;
            v69.size.width = v54;
            v69.size.height = v27;
            if (v40 < CGRectGetHeight(v69) * 0.5)
            {
              v70.origin.y = v52;
              v70.origin.x = v53;
              v70.size.height = v50;
              v70.size.width = v51;
              v75.origin.x = v56;
              v75.origin.y = v55;
              v75.size.width = v54;
              v75.size.height = v27;
              v71 = CGRectIntersection(v70, v75);
              v41 = CGRectGetHeight(v71);
              v72.origin.x = v56;
              v72.origin.y = v55;
              v72.size.width = v54;
              v72.size.height = v27;
              if (v41 > CGRectGetHeight(v72) * 0.5)
              {
                -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v18);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                if (v42)
                {
                  -[NSMutableSet addObject:](self->_seenVisibleResults, "addObject:", v42);
                  if (!a3 || (objc_msgSend(v47, "containsObject:", v42) & 1) == 0)
                    objc_msgSend(v48, "addObject:", v42);
                }
                else
                {
                  v43 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v63 = v18;
                    _os_log_error_impl(&dword_1D7CA3000, v43, OS_LOG_TYPE_ERROR, "Skipped generating feedback for cell at %@ due to nil completion list item", buf, 0xCu);
                  }
                }

              }
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v12);
    }

    v44 = objc_msgSend(v48, "count");
    if (a3 == 3 || v44)
    {
      -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionList query](self->_completionList, "query");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "didDisplayCompletionListItems:forQuery:forEvent:", v48, v46, a3);

    }
    self->_feedbackIsBeingGenerated = 0;
    self->_lastFeedbackSentWasScrolling = (unint64_t)(a3 - 1) < 2;

  }
}

- (void)_logTopHitWasChosen:(BOOL)a3
{
  _BOOL8 v3;
  char isKindOfClass;
  void *v6;
  CompletionItem *v7;
  unint64_t lastTopHitMatchLength;
  int v9;
  int v10;
  double v11;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ((objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled") & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
    v6 = (void *)MEMORY[0x1E0D89B98];
    v7 = self->_lastTopHitMatch;
    objc_msgSend(v6, "sharedLogger");
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    lastTopHitMatchLength = self->_lastTopHitMatchLength;
    -[CompletionItem weight](v7, "weight");
    v10 = v9;

    LODWORD(v11) = v10;
    objc_msgSend(WeakRetained, "didChooseTopHit:matchLength:matchScore:", v3, lastTopHitMatchLength, v11);
  }

}

- (void)completionList:(id)a3 didRemoveItem:(id)a4 wasLastInSection:(BOOL)a5 atIndexPath:(id)a6 withCompletionHandler:(id)a7
{
  id v11;
  CompletionListTableViewController *completionsViewController;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  CompletionItem *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  BOOL v26;

  v18 = (CompletionItem *)a4;
  v11 = a6;
  completionsViewController = self->_completionsViewController;
  v13 = a7;
  -[CompletionListTableViewController tableView](completionsViewController, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __105__CatalogViewController_completionList_didRemoveItem_wasLastInSection_atIndexPath_withCompletionHandler___block_invoke;
  v23 = &unk_1E9CF1D28;
  v26 = a5;
  v15 = v14;
  v24 = v15;
  v16 = v11;
  v25 = v16;
  objc_msgSend(v15, "performBatchUpdates:completion:", &v20, v13);

  if (self->_lastTopHitMatch == v18)
  {
    self->_lastTopHitMatch = 0;

  }
  -[UnifiedField reflectedItem](self->_textField, "reflectedItem", v18, v20, v21, v22, v23);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v19)
    -[UnifiedField setReflectedItem:](self->_textField, "setReflectedItem:", 0);

}

void __105__CatalogViewController_completionList_didRemoveItem_wasLastInSection_atIndexPath_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deleteSections:withRowAnimation:");

  }
  else
  {
    v4[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deleteRowsAtIndexPaths:withRowAnimation:", v2, 0);

  }
}

- (void)completionList:(id)a3 topHitDidBecomeReadyForString:(id)a4
{
  UnifiedField *textField;
  id v7;
  CompletionItem *v8;
  void *v9;
  void *v10;
  char v11;
  id WeakRetained;
  id v13;

  v13 = a4;
  textField = self->_textField;
  v7 = a3;
  -[UnifiedField topHitDidBecomeReady](textField, "topHitDidBecomeReady");
  objc_msgSend(v7, "topHitForString:", v13);
  v8 = (CompletionItem *)objc_claimAutoreleasedReturnValue();

  if (self->_lastTopHitMatch != v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CompletionItem originalURLString](self->_lastTopHitMatch, "originalURLString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CompletionItem originalURLString](v8, "originalURLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
        -[CatalogViewController _logTopHitWasChosen:](self, "_logTopHitWasChosen:", 0);
    }
    objc_storeStrong((id *)&self->_lastTopHitMatch, v8);
    self->_lastTopHitMatchLength = objc_msgSend(v13, "length");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:mightSelectCompletionItem:forString:", self, v8, v13);

}

- (void)completionListDidRestoreCachedCompletions:(id)a3
{
  id v3;

  self->_isCachedCompletionList = 1;
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)completionList:(id)a3 didFetchFavicon:(id)a4 forRowAtIndexPath:(id)a5
{
  CompletionListTableViewController *completionsViewController;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_completionList == a3)
  {
    completionsViewController = self->_completionsViewController;
    v7 = a5;
    v8 = a4;
    -[CompletionListTableViewController tableView](completionsViewController, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForRowAtIndexPath:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v8);

    objc_msgSend(v11, "setNeedsLayout");
  }
}

- (BOOL)completionListHasScheduledDismissal:(id)a3
{
  return self->_hasScheduledCompletionListDismissal;
}

- (void)completionListDidDismissSearchUIViewController:(id)a3
{
  -[CatalogViewController resumeEditingIfNeeded:](self, "resumeEditingIfNeeded:", 1);
}

- (void)completionList:(id)a3 willGoToURL:(id)a4 fromPegasusSearchResult:(id)a5 forImageAttribution:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id WeakRetained;

  v6 = a6;
  v9 = a4;
  -[CatalogViewController willGoToURLFromPegasusSearchResult:](self, "willGoToURLFromPegasusSearchResult:", a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:loadURL:inExternalApplication:forImageAttribution:", self, v9, 0, v6);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CompletionList completionsForGroupAtIndex:](self->_completionList, "completionsForGroupAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)_completionItemAtIndexPath:(id)a3
{
  CompletionList *completionList;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  if (a3)
  {
    completionList = self->_completionList;
    v4 = a3;
    -[CompletionList completionsForGroupAtIndex:](completionList, "completionsForGroupAtIndex:", objc_msgSend(v4, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "row");

    if (v6 >= objc_msgSend(v5, "count"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_completionsViewControllerIsTranslucent
{
  return -[AbstractCatalogViewController isResponsibleForLayoutOfViewController:](self->_popoverCatalogViewController, "isResponsibleForLayoutOfViewController:", self->_completionsViewController);
}

- (void)tableViewDidFinishReload:(id)a3
{
  self->_completionTableIsReloading = 0;
  -[CatalogViewController _generateVisibleResultsFeedbackForEvent:](self, "_generateVisibleResultsFeedbackForEvent:", 0);
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v11 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v9, "bounds");
    v16 = CGRectInset(v15, 0.0, 0.0);
    objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisiblePath:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v9, v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  int v14;
  void *v15;
  void *v16;
  CGRect v18;
  CGRect v19;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v11 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v9, "bounds");
    v19 = CGRectInset(v18, 0.0, 0.0);
    objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height, 20.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisiblePath:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_msgSend(WeakRetained, "catalogViewControllerShouldUsePopoverForCompletions:", self);

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackgroundColor:", v15);

    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v9, v10);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)tableView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;

  if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode", a3, a4, a5))
  {
    -[CatalogViewController textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endEditing:", 1);

    -[CatalogViewController textField](self, "textField");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "setTextRangeToRestoreAfterCompletionDetailIsDismissed:", v7);

  }
}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  self->_completionDetailIsPresented = 0;
  if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode", a3, a4, a5))
  {
    -[CatalogViewController textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "textRangeToRestoreAfterCompletionDetailIsDismissed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController textField](self, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectedTextRange:", v7);

    objc_msgSend(WeakRetained, "setTextRangeToRestoreAfterCompletionDetailIsDismissed:", 0);
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;

  v7 = a3;
  v8 = a4;
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      getSearchUITableViewCellClass();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        self->_completionDetailIsPresented = 1;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = (void *)MEMORY[0x1E0DC36B8];
          objc_msgSend(v10, "contextMenuActionProvider");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "configurationWithIdentifier:previewProvider:actionProvider:", v8, 0, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
          goto LABEL_13;
        }
      }
      else
      {
        v16 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[CatalogViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:].cold.2(v16);
      }
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CatalogViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:].cold.1((uint64_t)v8, v14, v15);
    }
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  double v11;

  v5 = a4;
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _cellHeightCacheKeyForCompletionItem:indexPath:](self, "_cellHeightCacheKeyForCompletionItem:indexPath:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (-[NSCache objectForKey:](self->_tableViewCellHeightCache, "objectForKey:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "floatValue"),
        v10 = v9,
        v8,
        v10 != 0.0))
  {
    v11 = v10;
  }
  else
  {
    v11 = *MEMORY[0x1E0DC53D8];
  }

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CGFloat Height;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a4;
  v7 = a5;
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _cellHeightCacheKeyForCompletionItem:indexPath:](self, "_cellHeightCacheKeyForCompletionItem:indexPath:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v13, "bounds");
    Height = CGRectGetHeight(v14);
    *(float *)&Height = Height;
    objc_msgSend(v10, "numberWithFloat:", Height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](self->_tableViewCellHeightCache, "setObject:forKey:", v12, v9);

  }
}

- (id)_cellHeightCacheKeyForCompletionItem:(id)a3 indexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "sfSearchResultValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  char isKindOfClass;
  uint64_t v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  _BOOL8 v26;
  id v27;
  void *v28;
  NSObject *v29;
  const __CFString *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  id val;
  _QWORD aBlock[4];
  id v41;
  id v42;
  id location;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  val = a3;
  v6 = a4;
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completionTableViewCellReuseIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "inlineCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSeparatorStyle:", 1);

  }
  objc_msgSend(val, "dequeueReusableCellWithIdentifier:", v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v7, "completionTableViewCellForCompletionList:", self->_completionList);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "completionTableViewCellReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", v12);

  objc_msgSend(v7, "configureCompletionTableViewCell:forCompletionList:", v11, self->_completionList);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v13);
  v37 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "safari_configureBackgroundColorForCompletionList:", self->_completionList);
  if (!objc_msgSend(v6, "section")
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)v37, "completionCellBackgroundModeInTopSection") == 1)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "inlineCard");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cardSections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v17, "separatorStyle");

    }
    else
    {
      v14 = 2;
    }
  }
  if (objc_msgSend(v6, "section") || (objc_opt_respondsToSelector() & 1) == 0)
    v18 = 0;
  else
    v18 = objc_msgSend(v7, "completionCellBackgroundModeInTopSection");
  if (objc_msgSend(v6, "row"))
    v19 = 0;
  else
    v19 = (objc_msgSend(v6, "section") | v37) == 0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v21 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v22 = v7;
    objc_msgSend(v22, "resultType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("web_index")) & 1) != 0)
    {
      v24 = objc_msgSend(v22, "topHit");

      if (v24)
        v21 = v18;
      else
        v21 = 1;
    }
    else
    {

      v21 = v18;
    }
  }
  if (v19)
    v25 = v21;
  else
    v25 = v18;
  v26 = v25 == 1 && objc_msgSend(v6, "row") != 0;
  objc_initWeak(&location, val);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__CatalogViewController_tableView_cellForRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E9CFB228;
  objc_copyWeak(&v42, &location);
  v27 = v6;
  v41 = v27;
  v28 = _Block_copy(aBlock);
  +[CompletionListTableViewController configureCell:backgroundMode:separatorStyle:shouldHaveTopPadding:configurationStateDidChangeCallback:](CompletionListTableViewController, "configureCell:backgroundMode:separatorStyle:shouldHaveTopPadding:configurationStateDidChangeCallback:", v11, v25, v14, v26, v28);
  objc_msgSend(v11, "setClipsToBounds:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setHandlerForActionItem:", self);
  if (!v11)
  {
    v29 = (id)WBS_LOG_CHANNEL_PREFIXParsec();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      if (self->_completionList)
        v31 = CFSTR("IS NOT");
      else
        v31 = CFSTR("IS");
      v36 = v31;
      v32 = objc_opt_class();
      v33 = -[CompletionList numberOfGroups](self->_completionList, "numberOfGroups");
      -[CompletionList completionsForGroupAtIndex:](self->_completionList, "completionsForGroupAtIndex:", objc_msgSend(v27, "section"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");
      *(_DWORD *)buf = 138544386;
      v45 = v27;
      v46 = 2114;
      v47 = v36;
      v48 = 2114;
      v49 = v32;
      v50 = 2048;
      v51 = v33;
      v52 = 2048;
      v53 = v35;
      _os_log_fault_impl(&dword_1D7CA3000, v29, OS_LOG_TYPE_FAULT, "No cell returned for completion item at index path %{public}@; completion list %{public}@ nil; item class: %{pub"
        "lic}@; number of groups: %ld; number of completions in group: %ld",
        buf,
        0x34u);

    }
  }

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

  return v11;
}

void __57__CatalogViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !objc_msgSend(*(id *)(a1 + 32), "row"))
  {
    objc_msgSend(WeakRetained, "headerViewForSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v6, "isSelected") & 1) != 0)
        v5 = 0;
      else
        v5 = objc_msgSend(v6, "isHighlighted") ^ 1;
      objc_msgSend(v4, "setShowsSeparator:", v5);
    }

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[CompletionList numberOfGroups](self->_completionList, "numberOfGroups", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[CompletionList defaultSectionTitleForGroupAtIndex:](self->_completionList, "defaultSectionTitleForGroupAtIndex:", a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[CatalogViewController _selectedCompletionItemAtIndexPath:](self, "_selectedCompletionItemAtIndexPath:", a4);
}

- (void)_selectedCompletionItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  int v11;
  CatalogViewController *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  char v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_28;
  v6 = objc_msgSend(v4, "row") + 1;
  v7 = objc_msgSend(v4, "section");
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    for (i = 0; i != v7; ++i)
      v6 += objc_msgSend(v8, "numberOfRowsInSection:", i);
  }
  objc_msgSend(v5, "auditAcceptedCompletionWithRank:", v6);
  if (v6 == 1)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v5, "isTopHit");

      if (v11)
      {
        v12 = self;
        v13 = 1;
LABEL_12:
        -[CatalogViewController _logTopHitWasChosen:](v12, "_logTopHitWasChosen:", v13);
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  if (self->_lastTopHitMatch)
  {
    v12 = self;
    v13 = 0;
    goto LABEL_12;
  }
LABEL_13:
  -[UnifiedField text](self->_textField, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _updatePersonalisationDataForDonation:forPosition:](self, "_updatePersonalisationDataForDonation:forPosition:", v14, v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[UnifiedField text](self->_textField, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "catalogViewController:completionItem:wasAcceptedForString:", self, v5, v16);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[UnifiedField querySuggestions](self->_textField, "querySuggestions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v25 = v4;
      v20 = *(_QWORD *)v27;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "title");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "safari_isCaseAndDiacriticInsensitiveEqualToString:", v17);

          if ((v23 & 1) != 0)
          {
            v19 = 1;
            goto LABEL_25;
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v19)
          continue;
        break;
      }
LABEL_25:
      v4 = v25;
    }

  }
  else
  {
    v19 = 0;
  }
  -[CatalogViewController _logQueryEngagement](self, "_logQueryEngagement");
  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "userDidEngageWithCompletionListItem:onActionButton:method:doesMatchSiriSuggestion:", v5, 0, 0, v19);

  -[CompletionListDismissalAnalyticsReporter setAcceptedCompletionListItem:](self->_completionDismissalReporter, "setAcceptedCompletionListItem:", 1);
  objc_msgSend(v5, "acceptCompletionWithActionHandler:", self);
  -[CatalogViewController _executeActionForParsecResultAtIndexPath:tableView:](self, "_executeActionForParsecResultAtIndexPath:tableView:", v4, v8);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v4, 1);

LABEL_28:
}

- (void)_executeActionForParsecResultAtIndexPath:(id)a3 tableView:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id SearchUIClass_0;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "isSMARTParsecResultsEnabled"))
  {
    objc_msgSend(v6, "cellForRowAtIndexPath:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getSearchUITableViewCellClass();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getSearchUIClass_0();
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_5;
      SearchUIClass_0 = getSearchUIClass_0();
      objc_msgSend(v9, "sfSearchResultValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSParsecDSession sharedPARSession](UniversalSearchSession, "sharedPARSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(SearchUIClass_0) = objc_msgSend(SearchUIClass_0, "hasValidCommandForResult:feedbackListener:", v11, v12);

      if ((_DWORD)SearchUIClass_0)
      {
LABEL_5:
        objc_msgSend(v6, "cellForRowAtIndexPath:", v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          self->_completionDetailIsPresented = 1;
          -[CatalogViewController navigationBar](self, "navigationBar");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "textField");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "selectedTextRange");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
          objc_msgSend(WeakRetained, "setTextRangeToRestoreAfterCompletionDetailIsDismissed:", v16);

          objc_msgSend(v13, "executeCommandWithTriggerEvent:", 2);
          self->_completionDetailIsPresented = 0;
          objc_msgSend(MEMORY[0x1E0D8AC30], "sharedRecorder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sfSearchResultValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "url");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "didActualizeImpressionForURL:provenance:", v20, 1);

        }
      }

    }
  }

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *WeakRetained;
  uint64_t v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;

  v6 = a3;
  -[CompletionList headerViewReuseIdentifierForGroupAtIndex:](self->_completionList, "headerViewReuseIdentifierForGroupAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CompletionList headerViewForGroupAtIndex:](self->_completionList, "headerViewForGroupAtIndex:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F01E64E8))
      objc_msgSend(v8, "setFeedbackDelegate:", self);
    -[CompletionList configureHeaderView:forGroupAtIndex:](self->_completionList, "configureHeaderView:forGroupAtIndex:", v8, a4);
  }
  else
  {
    -[CompletionList defaultSectionTitleForGroupAtIndex:](self->_completionList, "defaultSectionTitleForGroupAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v9);
      objc_msgSend(v10, "directionalLayoutMargins");
      v12 = v11;
      if (a4)
      {
        -[CompletionList completionsForGroupAtIndex:](self->_completionList, "completionsForGroupAtIndex:", 0);
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(WeakRetained, "count");
        v15 = v14 == 1;
        objc_msgSend(WeakRetained, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          if (objc_msgSend(v16, "completionCellBackgroundModeInTopSection"))
            v17 = 1;
          else
            v17 = v14 == 1;
          v15 = v17;
        }
        v18 = a4 != 1 || !v15;
        v19 = 16.0;
        v20 = 24.0;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        objc_msgSend(WeakRetained, "rootViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isUsingBottomCapsule") == 0;
        v19 = 16.0;
        v20 = 0.0;
      }
      if (v18)
        v21 = v19;
      else
        v21 = v20;

      objc_msgSend(v10, "setDirectionalLayoutMargins:", v21, 16.0, v12, 16.0);
      objc_msgSend(v10, "textProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4B10], *MEMORY[0x1E0DC1438]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v23);

      objc_msgSend(v22, "setTransform:", 0);
      -[CompletionListTableViewController defaultHeaderFooterView](self->_completionsViewController, "defaultHeaderFooterView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentConfiguration:", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "indexPathForSelectedRow");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "row"))
          v25 = 1;
        else
          v25 = objc_msgSend(v24, "section") != a4;
        if (v24)
          v26 = v25;
        else
          v26 = 1;
        objc_msgSend(v8, "setShowsSeparator:", v26);

      }
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  id WeakRetained;
  void *v12;

  -[CompletionList headerViewReuseIdentifierForGroupAtIndex:](self->_completionList, "headerViewReuseIdentifierForGroupAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *MEMORY[0x1E0DC53D8];
  }
  else
  {
    -[CompletionList defaultSectionTitleForGroupAtIndex:](self->_completionList, "defaultSectionTitleForGroupAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v7 = *MEMORY[0x1E0DC53D8];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "directionalLayoutMargins");
      v7 = v10;

      if (!a4)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        objc_msgSend(WeakRetained, "rootViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isUsingBottomCapsule"))
          v7 = 1.0;

      }
    }

  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  -[CompletionList swipeActionsForCompletionItemAtIndexPath:](self->_completionList, "swipeActionsForCompletionItemAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPerformsFirstActionWithFullSwipe:", 0);

  return v5;
}

- (void)_keyboardWillShow:(id)a3
{
  CGRect *p_keyboardFrame;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;

  p_keyboardFrame = &self->_keyboardFrame;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  p_keyboardFrame->origin.x = v7;
  p_keyboardFrame->origin.y = v8;
  p_keyboardFrame->size.width = v9;
  p_keyboardFrame->size.height = v10;

  self->_lastFeedbackSentWasScrolling = 0;
  if (self->_hasKeyboardBeenDismissedForThisQuery && !self->_completionDetailIsPresented)
    -[CatalogViewController _generateVisibleResultsFeedbackForEvent:](self, "_generateVisibleResultsFeedbackForEvent:", 3);
}

- (void)_keyboardDidShow:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[UnifiedField isFirstResponder](self->_textField, "isFirstResponder", a3))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)v4 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldKeyboardPresentation", " enableTelemetry=YES ", v4, 2u);
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  CGSize v4;
  _BOOL4 completionDetailIsPresented;
  id v6;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_keyboardFrame.size = v4;
  self->_hasKeyboardBeenDismissedForThisQuery = 1;
  self->_keyboardIsBeingDismissed = 1;
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isDragging") & 1) != 0)
  {

  }
  else
  {
    completionDetailIsPresented = self->_completionDetailIsPresented;

    if (!completionDetailIsPresented)
      -[CatalogViewController _generateVisibleResultsFeedbackForEvent:](self, "_generateVisibleResultsFeedbackForEvent:", 3);
  }
}

- (void)_keyboardDidHide:(id)a3
{
  self->_keyboardIsBeingDismissed = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "contentOffset");
  v5 = v4;
  objc_msgSend(v16, "contentInset");
  if (self->_keyboardIsBeingDismissed
    || ((v10 = -v6, self->_lastScrollOffset != v5) ? (v11 = v5 < v10) : (v11 = 1),
        !v11
     && (v12 = v7, objc_msgSend(v16, "contentSize"), v14 = v12 + v13, objc_msgSend(v16, "bounds"), v5 <= v14 - v15)))
  {
    objc_msgSend(v16, "contentOffset");
    if (v8 < self->_lastScrollOffset)
      v9 = 1;
    else
      v9 = 2;
    -[CatalogViewController _generateVisibleResultsFeedbackForEvent:](self, "_generateVisibleResultsFeedbackForEvent:", v9);
    self->_lastScrollOffset = v5;
  }

}

- (id)browserController
{
  return objc_loadWeakRetained((id *)&self->_browserController);
}

- (id)searchUIFeedbackDelegate
{
  return self->_completionList;
}

- (void)search:(id)a3
{
  CatalogViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:didSelectSearch:", self, v5);

}

- (void)goToURLString:(id)a3
{
  CatalogViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:didSelectAddress:", self, v5);

}

- (void)goToURL:(id)a3
{
  CatalogViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:loadURL:inExternalApplication:forImageAttribution:", self, v5, 0, 0);

}

- (void)openURLInExternalApplication:(id)a3
{
  CatalogViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:loadURL:inExternalApplication:forImageAttribution:", self, v5, 1, 0);

}

- (void)willGoToURLFromPegasusSearchResult:(id)a3
{
  CatalogViewControllerDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  -[UnifiedField text](self->_textField, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "catalogViewController:completionItem:wasAcceptedForString:", self, v5, v6);

}

- (void)findOnPage
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerDidSelectFindOnPage:", self);

}

- (void)presentDetail:(id)a3
{
  BrowserController **p_browserController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CompletionDetailViewController *v12;
  UIViewController *completionDetailViewController;
  id WeakRetained;

  self->_completionDetailIsPresented = 1;
  p_browserController = &self->_browserController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  -[CatalogViewController navigationBar](self, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isFirstResponder"))
  {
    objc_msgSend(v7, "selectedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setTextRangeToRestoreAfterCompletionDetailIsDismissed:", v8);

    objc_msgSend(v7, "resignFirstResponder");
  }
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForSelectedRow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v11, 0);

  v12 = -[CompletionDetailViewController initWithRootViewController:]([CompletionDetailViewController alloc], "initWithRootViewController:", v5);
  -[CompletionDetailViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 2);
  -[CompletionDetailViewController setCompletionDetailViewControllerDelegate:](v12, "setCompletionDetailViewControllerDelegate:", WeakRetained);
  completionDetailViewController = self->_completionDetailViewController;
  self->_completionDetailViewController = &v12->super.super;

  -[CatalogViewController _presentStagedCompletionDetailViewControllerAnimated:](self, "_presentStagedCompletionDetailViewControllerAnimated:", 1);
}

- (void)_presentStagedCompletionDetailViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *popoverCatalogViewController;
  UIViewController *v7;
  UIViewController *completionDetailViewControllerBeingPresented;
  id v9;
  UIViewController *completionDetailViewController;
  _QWORD v11[5];

  if (self->_completionDetailViewController != self->_completionDetailViewControllerBeingPresented)
  {
    v3 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "catalogViewController:willPresentDetailViewController:", self, self->_completionDetailViewController);
    popoverCatalogViewController = self;
    if (objc_msgSend(WeakRetained, "catalogViewControllerShouldUsePopoverForCompletions:", self))
      popoverCatalogViewController = self->_popoverCatalogViewController;
    v7 = self->_completionDetailViewController;
    completionDetailViewControllerBeingPresented = self->_completionDetailViewControllerBeingPresented;
    self->_completionDetailViewControllerBeingPresented = v7;
    v9 = popoverCatalogViewController;

    completionDetailViewController = self->_completionDetailViewController;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__CatalogViewController__presentStagedCompletionDetailViewControllerAnimated___block_invoke;
    v11[3] = &unk_1E9CF1900;
    v11[4] = self;
    objc_msgSend(v9, "presentViewController:animated:completion:", completionDetailViewController, v3, v11);

  }
}

void __78__CatalogViewController__presentStagedCompletionDetailViewControllerAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1000);
  *(_QWORD *)(v1 + 1000) = 0;

}

- (void)dismissCompletionDetailWindowAndResumeEditingIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  UIViewController *completionDetailViewController;
  NSObject *v11;
  UIViewController *v12;
  PopoverCatalogViewController *popoverCatalogViewController;
  void *v14;
  NSObject *v15;
  PopoverCatalogViewController *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[8];
  _QWORD v23[4];
  NSObject *v24;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  if (self->_completionDetailViewController)
  {
    dispatch_group_enter(v7);
    completionDetailViewController = self->_completionDetailViewController;
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke;
    v23[3] = &unk_1E9CF1900;
    v11 = v8;
    v24 = v11;
    -[UIViewController dismissViewControllerAnimated:completion:](completionDetailViewController, "dismissViewControllerAnimated:completion:", 1, v23);
    v12 = self->_completionDetailViewController;
    self->_completionDetailViewController = 0;

    if (self->_usesPopoverStyleForFavorites)
    {
      popoverCatalogViewController = self->_popoverCatalogViewController;
      if (popoverCatalogViewController)
      {
        -[PopoverCatalogViewController presentingViewController](popoverCatalogViewController, "presentingViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_DEFAULT, "Cataglog popover is not in view hierachy after completion detail VC dismissed.", buf, 2u);
          }
          dispatch_group_enter(v11);
          v16 = self->_popoverCatalogViewController;
          v20[0] = v9;
          v20[1] = 3221225472;
          v20[2] = __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_183;
          v20[3] = &unk_1E9CF1900;
          v21 = v11;
          -[CatalogViewController _presentPopoverWithViewController:completionHandler:](self, "_presentPopoverWithViewController:completionHandler:", v16, v20);

        }
      }
    }

  }
  -[CatalogViewController resumeEditingIfNeeded:](self, "resumeEditingIfNeeded:", v4);
  self->_completionDetailIsPresented = 0;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_2;
  v18[3] = &unk_1E9CF1950;
  v19 = v6;
  v17 = v6;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v18);

}

void __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_183(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resumeEditingIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "textRangeToRestoreAfterCompletionDetailIsDismissed");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 && v5)
  {
    -[CatalogViewController navigationBar](self, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "becomeFirstResponder");
    objc_msgSend(v8, "setSelectedTextRange:", v6);

  }
  objc_msgSend(WeakRetained, "setTextRangeToRestoreAfterCompletionDetailIsDismissed:", 0);

}

- (BOOL)isShowingCompletionDetail
{
  return self->_completionDetailViewController != 0;
}

- (void)resumeSearchWithQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CatalogViewController unifiedTextField](self, "unifiedTextField");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v5);

  objc_msgSend(v11, "becomeFirstResponder");
  objc_msgSend(v11, "endOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textRangeFromPosition:toPosition:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSelectedTextRange:", v8);

  -[CompletionList didResumeSearchWithQuery:](self->_completionList, "didResumeSearchWithQuery:", v4);
  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteSections:withRowAnimation:", v10, 100);

  -[CatalogViewController _generateVisibleResultsFeedbackForEvent:](self, "_generateVisibleResultsFeedbackForEvent:", 0);
}

- (void)searchTextCompletionAccessoryButtonTappedForCompletionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  self->_lastInputWasSearchTextCompletion = 1;
  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController setQueryString:](self, "setQueryString:", v6);

  -[UnifiedField sendActionsForControlEvents:](self->_textField, "sendActionsForControlEvents:", 0x20000);
  -[UnifiedField focusAndInsertCursorAtEnd](self->_textField, "focusAndInsertCursorAtEnd");
  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userDidEngageWithCompletionListItem:onActionButton:method:", v4, 0, 0);

  self->_lastInputWasSearchTextCompletion = 0;
}

- (void)switchToTabWithUUID:(id)a3 inWindowWithUUID:(id)a4 forTabGroupWithUUID:(id)a5
{
  BrowserController **p_browserController;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_browserController = &self->_browserController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "switchToTabWithUUID:inWindowWithUUID:forTabGroupWithUUID:", v10, v9, v8);

}

- (void)clearCachedTabCompletionData
{
  -[CompletionList clearCachedTabCompletionData](self->_completionList, "clearCachedTabCompletionData");
}

- (void)toggleVoiceSearch
{
  int64_t v3;
  void *v4;
  id v5;

  v3 = -[UnifiedField voiceSearchState](self->_textField, "voiceSearchState");
  if (v3 == 2)
  {
LABEL_4:
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A860]), "initWithQueryString:triggerEvent:", &stru_1E9CFDBB0, 4);
    -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userDidTapMicKey:", objc_msgSend(v5, "queryID"));

    -[UnifiedField setVoiceSearchState:](self->_textField, "setVoiceSearchState:", 1);
    return;
  }
  if (v3 != 1)
  {
    if (v3)
      return;
    goto LABEL_4;
  }
  -[UnifiedField setVoiceSearchState:](self->_textField, "setVoiceSearchState:", 0);
}

- (void)_commitVoiceSearchIfNecessary
{
  id WeakRetained;
  int64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  int64_t v13;
  int64_t v14;
  id v15;
  void *v16;
  UnifiedField *v17;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[CatalogViewController _invalidatePendingVoiceSearchTimer](self, "_invalidatePendingVoiceSearchTimer");
  if (self->_hasPendingVoiceSearchUpdate)
  {
    self->_hasPendingVoiceSearchUpdate = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v25 = -[CompletionList numberOfGroups](self->_completionList, "numberOfGroups");
    if (v25)
    {
      v24 = WeakRetained;
      v4 = 0;
      v5 = 0;
      for (i = 0; i != v25; ++i)
      {
        -[CompletionList completionsForGroupAtIndex:](self->_completionList, "completionsForGroupAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              v13 = -[CatalogViewController _relevanceForItem:](self, "_relevanceForItem:", v12);
              if (v13 > v4)
              {
                v14 = v13;
                v15 = v12;

                v5 = v15;
                v4 = v14;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v9);
        }

      }
      if (v5 && v4 != 2)
      {
        -[UnifiedField text](self->_textField, "text");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = self->_textField;
        if (v4)
        {
          if (v4 != 3)
          {
            v18 = v4 == 1;
            WeakRetained = v24;
            if (!v18)
              goto LABEL_28;
            -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_loadWeakRetained((id *)&self->_browserController);
            objc_msgSend(v20, "activeSearchEngine");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "userTypedGoToSearch:endpoint:triggerEvent:forQueryID:", v16, objc_msgSend(v21, "parsecSearchEndpointType"), 1, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

LABEL_27:
LABEL_28:
            -[UnifiedField text](self->_textField, "text");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "catalogViewController:completionItem:wasAcceptedForString:", self, v5, v23);

            objc_msgSend(v5, "acceptCompletionWithActionHandler:", self);
            -[UnifiedField setVoiceSearchState:](v17, "setVoiceSearchState:", 0);
            objc_msgSend(WeakRetained, "catalogViewController:didFinishVoiceSearchWithNavigation:", self, 1);

            goto LABEL_29;
          }
          -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "userDidEngageWithCompletionListItem:onActionButton:method:doesMatchSiriSuggestion:", v5, 0, 2, 1);
        }
        else
        {
          -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CompletionList query](self->_completionList, "query");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "userTypedURLDirectlyForQuery:triggerEvent:", v22, 1);

        }
        WeakRetained = v24;
        goto LABEL_27;
      }
      WeakRetained = v24;
    }
    else
    {
      v5 = 0;
    }
    -[UnifiedField setVoiceSearchState:](self->_textField, "setVoiceSearchState:", 0);
    objc_msgSend(WeakRetained, "catalogViewController:didFinishVoiceSearchWithNavigation:", self, 0);
LABEL_29:

  }
}

- (int64_t)_relevanceForItem:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = -[CatalogViewController _relevanceForResult:](self, "_relevanceForResult:", v4);
      else
        v5 = 0;
    }
  }

  return v5;
}

- (int64_t)_relevanceForResult:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "shouldAutoNavigate") & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isInstantAnswer"))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_invalidatePendingVoiceSearchTimer
{
  NSTimer *pendingVoiceSearchTimer;

  -[NSTimer invalidate](self->_pendingVoiceSearchTimer, "invalidate");
  pendingVoiceSearchTimer = self->_pendingVoiceSearchTimer;
  self->_pendingVoiceSearchTimer = 0;

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id buf[2];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXSignposts();
  if (os_signpost_enabled(v5))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldKeyboardPresentation", (const char *)&unk_1D7ED143D, (uint8_t *)buf, 2u);
  }
  objc_msgSend(v4, "setClearingBehavior:", 3);
  objc_msgSend(v4, "setTextAlignment:", 0);
  -[CatalogViewController textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContextCompleter:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeTabDocument");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_initWeak(buf, self);
    objc_msgSend(v9, "contextController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke;
    v13[3] = &unk_1E9CFB250;
    objc_copyWeak(&v14, buf);
    objc_msgSend(v11, "cachedResponseForURL:completionHandler:", v10, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }

  return 1;
}

void __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v3, "completer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke_2;
      v7[3] = &unk_1E9CF1830;
      v7[4] = WeakRetained;
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }

}

void __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextCompleter:", v1);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CatalogViewController _ensureCompletionListAndParsecSession](self, "_ensureCompletionListAndParsecSession", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerDidBeginEditing:", self);

  v11 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v11, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "capsuleCollectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = WBSIsEqual();

  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tabController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeTabDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchViewAppearedBecauseOfEvent:isSafariReaderAvailable:forQueryID:usesLoweredSearchBar:", 9, objc_msgSend(v10, "isReaderAvailable"), -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"), v7);

  -[CompletionList unifiedFieldDidBecomeFirstResponder](self->_completionList, "unifiedFieldDidBecomeFirstResponder");
}

- (void)textFieldDidEndEditing:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerDidEndEditing:", self);

}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v4;

  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendClearInputFeedbackWithTriggerEvent:forQueryID:", 1, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

  return 1;
}

- (void)_logQueryEngagement
{
  void *v3;
  id v4;

  if (-[UnifiedField hasSelectedQuerySuggestion](self->_textField, "hasSelectedQuerySuggestion"))
  {
    -[UnifiedField contextCompleter](self->_textField, "contextCompleter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UnifiedField text](self->_textField, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logTransactionSuccessfulForInput:", v3);

  }
}

- (void)unifiedField:(id)a3 willUpdateUserTypedText:(id)a4 toText:(id)a5
{
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v7 = a5;
  if (!objc_msgSend(a4, "length") && objc_msgSend(v7, "length"))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldFirstKeyTapToCompletionListUpdate", (const char *)&unk_1D7ED143D, v9, 2u);
    }
    self->_waitingOnFirstCompletionListUpdateForTelemetry = 1;
  }

}

- (void)unifiedField:(id)a3 didEndEditingWithAddress:(id)a4
{
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;

  v15 = a4;
  -[CompletionListDismissalAnalyticsReporter setUnifiedFieldContentType:](self->_completionDismissalReporter, "setUnifiedFieldContentType:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[CompletionItem userVisibleURLString](self->_lastTopHitMatch, "userVisibleURLString"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", v15),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
    -[CatalogViewController _logTopHitWasChosen:](self, "_logTopHitWasChosen:", 1);
    -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userDidEngageWithCompletionListItem:onActionButton:method:", self->_lastTopHitMatch, 0, 1);

    -[CatalogViewController _logQueryEngagement](self, "_logQueryEngagement");
  }
  else
  {
    if (self->_lastTopHitMatch)
      -[CatalogViewController _logTopHitWasChosen:](self, "_logTopHitWasChosen:", 0);
    v9 = -[UnifiedField voiceSearchState](self->_textField, "voiceSearchState") != 0;
    -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CompletionList query](self->_completionList, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userTypedURLDirectlyForQuery:triggerEvent:", v11, v9);

    v7 = -1;
  }
  -[CompletionList query](self->_completionList, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _updatePersonalisationDataForDonation:forPosition:](self, "_updatePersonalisationDataForDonation:forPosition:", v13, v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:didSelectAddress:", self, v15);

  -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
}

- (void)unifiedField:(id)a3 didEndEditingWithSearch:(id)a4
{
  CompletionListDismissalAnalyticsReporter *completionDismissalReporter;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;

  completionDismissalReporter = self->_completionDismissalReporter;
  v6 = a4;
  -[CompletionListDismissalAnalyticsReporter setUnifiedFieldContentType:](completionDismissalReporter, "setUnifiedFieldContentType:", 1);
  if (self->_lastTopHitMatch)
    -[CatalogViewController _logTopHitWasChosen:](self, "_logTopHitWasChosen:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (-[CompletionList hasParsecResults](self->_completionList, "hasParsecResults"))
    objc_msgSend(WeakRetained, "catalogViewController:cacheSearchQueryID:", self, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));
  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v8, "activeSearchEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userTypedGoToSearch:endpoint:triggerEvent:forQueryID:", v6, objc_msgSend(v9, "parsecSearchEndpointType"), 0, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

  -[CatalogViewController _logQueryEngagement](self, "_logQueryEngagement");
  objc_msgSend(WeakRetained, "catalogViewController:didSelectSearch:", self, v6);

  -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
}

- (void)unifiedField:(id)a3 didEndEditingWithParsecTopHit:(id)a4
{
  CompletionListDismissalAnalyticsReporter *completionDismissalReporter;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  completionDismissalReporter = self->_completionDismissalReporter;
  v6 = a4;
  -[CompletionListDismissalAnalyticsReporter setUnifiedFieldContentType:](completionDismissalReporter, "setUnifiedFieldContentType:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[UnifiedField text](self->_textField, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "catalogViewController:completionItem:wasAcceptedForString:", self, v6, v8);

  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userDidEngageWithCompletionListItem:onActionButton:method:", v6, 0, 1);

  -[CatalogViewController _logQueryEngagement](self, "_logQueryEngagement");
  -[CatalogViewController _clearParsecSearchSession](self, "_clearParsecSearchSession");
  objc_msgSend(v6, "acceptCompletionWithActionHandler:", self);

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexPathForSelectedRow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _executeActionForParsecResultAtIndexPath:tableView:](self, "_executeActionForParsecResultAtIndexPath:tableView:", v10, v11);

}

- (BOOL)unifiedField:(id)a3 shouldWaitForTopHitForText:(id)a4
{
  id v5;
  CompletionList *completionList;
  _BOOL4 v7;

  v5 = a4;
  if (objc_msgSend(v5, "length") && (completionList = self->_completionList) != 0)
    v7 = !-[CompletionList isTopHitReadyForString:](completionList, "isTopHitReadyForString:", v5);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (id)unifiedField:(id)a3 topHitForText:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
  {
    -[CompletionList topHitForString:](self->_completionList, "topHitForString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)unifiedFieldVoiceSearchStateDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "voiceSearchState");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
LABEL_5:
    objc_msgSend(v5, "didActivateVoiceSearchAccidentally:", v7);

  }
  -[CatalogViewController _updateVoiceSearchState](self, "_updateVoiceSearchState");
}

- (BOOL)_shouldTakeOwnershipOfCompletionsViewController
{
  char isKindOfClass;
  void *v4;

  if (-[UnifiedField isFirstResponder](self->_textField, "isFirstResponder")
    && !-[CatalogViewController _showCompletionsInPopover](self, "_showCompletionsInPopover"))
  {
    -[CompletionListTableViewController parentViewController](self->_completionsViewController, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 || self->_voiceSearchWasInProgress)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 1;
    }

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_updateVoiceSearchState
{
  int64_t v3;
  void *v4;
  char v5;
  void *v6;
  NSTimer *v7;
  NSTimer *pendingVoiceSearchTimer;
  void *v9;

  v3 = -[UnifiedField voiceSearchState](self->_textField, "voiceSearchState");
  objc_msgSend(MEMORY[0x1E0D4EED8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "liveCompletionList");

  if (v3 == 2)
  {
    self->_voiceSearchWasInProgress = 0;
    self->_hasPendingVoiceSearchUpdate = 1;
    -[CatalogViewController _invalidatePendingVoiceSearchTimer](self, "_invalidatePendingVoiceSearchTimer");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__commitVoiceSearchIfNecessary, 0, 0, 0.3);
    v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    pendingVoiceSearchTimer = self->_pendingVoiceSearchTimer;
    self->_pendingVoiceSearchTimer = v7;

  }
  else if (v3 == 1)
  {
    self->_voiceSearchWasInProgress = 1;
    if ((v5 & 1) == 0)
    {
      -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[CatalogViewController relinquishOwnershipOfCompletionsViewControllerFromCurrentParent](self, "relinquishOwnershipOfCompletionsViewControllerFromCurrentParent");
      -[CatalogViewController _showStartPageInPopover](self, "_showStartPageInPopover");
    }
  }
  else if (!v3 && (v5 & 1) == 0)
  {
    -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    if (-[CatalogViewController _shouldTakeOwnershipOfCompletionsViewController](self, "_shouldTakeOwnershipOfCompletionsViewController"))
    {
      -[AbstractCatalogViewController takeOwnershipOfCompletionsViewController](self, "takeOwnershipOfCompletionsViewController");
      -[CatalogViewController _updateAlternateContentViewController](self, "_updateAlternateContentViewController");
    }
    self->_voiceSearchWasInProgress = 0;
  }
}

- (void)unifiedFieldExternalSearchDidEnd:(id)a3
{
  NSTimer *v4;
  NSTimer *pendingVoiceSearchTimer;

  self->_hasPendingVoiceSearchUpdate = 1;
  -[CatalogViewController _invalidatePendingVoiceSearchTimer](self, "_invalidatePendingVoiceSearchTimer", a3);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__commitVoiceSearchIfNecessary, 0, 0, 0.3);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  pendingVoiceSearchTimer = self->_pendingVoiceSearchTimer;
  self->_pendingVoiceSearchTimer = v4;

}

- (void)unifiedFieldReflectedItemDidChange:(id)a3
{
  char v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "lastEditWasADeletion");
  v5 = v8;
  if ((v4 & 1) != 0 || (v6 = objc_msgSend(v8, "isResigningFirstResponder"), v5 = v8, v6))
  {
    objc_msgSend(v5, "reflectedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      -[CatalogViewController _deselectCompletionsViewControllerSelectedRow](self, "_deselectCompletionsViewControllerSelectedRow");

    v5 = v8;
  }

}

- (void)unifiedField:(id)a3 moveCompletionSelectionByRowOffset:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView safari_moveSelectionByRowOffset:](v8, a4);
  objc_msgSend(v8, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField setReflectedItem:](self->_textField, "setReflectedItem:", v7);

}

- (void)unifiedField:(id)a3 moveCompletionSelectionBySectionOffset:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView safari_moveSelectionBySectionOffset:](v8, a4);
  objc_msgSend(v8, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CatalogViewController _completionItemAtIndexPath:](self, "_completionItemAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField setReflectedItem:](self->_textField, "setReflectedItem:", v7);

}

- (void)unifiedFieldSelectCompletionItemIfAvailable:(id)a3
{
  void *v4;
  id v5;

  -[CompletionListTableViewController tableView](self->_completionsViewController, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForSelectedRow");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[CatalogViewController _selectedCompletionItemAtIndexPath:](self, "_selectedCompletionItemAtIndexPath:", v5);
  else
    -[UnifiedField sendActionsForControlEvents:](self->_textField, "sendActionsForControlEvents:", 0x80000);

}

- (void)unifiedField:(id)a3 focusNextKeyView:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:focusNextKeyView:", self, v4);

}

- (BOOL)unifiedFieldCanBecomeFirstResponder:(id)a3
{
  CatalogViewController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "catalogViewControllerUnifiedFieldCanBecomeFirstResponder:", v3);

  return (char)v3;
}

- (void)unifiedFieldMakeWindowKey:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerMakeWindowKey:", self);

}

- (void)unifiedFieldShouldPasteAndNavigate:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CatalogViewController_unifiedFieldShouldPasteAndNavigate___block_invoke;
  v6[3] = &unk_1E9CFB278;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "safari_bestStringForPastingIntoURLFieldCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __60__CatalogViewController_unifiedFieldShouldPasteAndNavigate___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 155);
    objc_msgSend(v5, "catalogViewController:didPasteText:", v4, v6);

  }
}

- (void)unifiedField:(id)a3 didEngageWithQuerySuggestion:(id)a4 forQueryString:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a4;
  v8 = a5;
  -[WBSParsecDSession feedbackDispatcher](self->_parsecSearchSession, "feedbackDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D8C778]);
  v11 = (objc_class *)MEMORY[0x1E0D8C6B0];
  v18 = v7;
  v12 = v8;
  v13 = [v11 alloc];
  objc_msgSend(v18, "topicId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v13, "initWithIdentifier:suggestion:query:score:type:", v14, v15, v12, 2, 0.0);
  v17 = (void *)objc_msgSend(v10, "initWithSuggestion:", v16);
  objc_msgSend(v9, "postFeedback:forQueryID:", v17, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

}

- (BOOL)shouldPutMetadataOnPasteboardForUnifiedField:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[UnifiedField text](self->_textField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UnifiedField selectionRange](self->_textField, "selectionRange") || v5 != objc_msgSend(v4, "length"))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "tabController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeTabDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "urlForSharing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v6, "safari_isEqualToURL:", v10);
  }

  return v11;
}

- (id)currentMetadataForUnifiedField:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "linkMetadataForSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)feedbackButtonWasTappedWithProblemURL:(id)a3
{
  CatalogViewControllerDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:loadURL:inExternalApplication:forImageAttribution:", self, v5, 0, 0);

}

- (void)showUniversalSearchFirstTimeExperienceIfNotShowing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UniversalSearchFirstTimeExperienceViewController *v7;
  uint64_t v8;
  UniversalSearchFirstTimeExperienceViewController *universalSearchFirstTimeExperienceViewController;
  id WeakRetained;

  if (!-[CatalogViewController isShowingUniversalSearchFirstTimeExperience](self, "isShowingUniversalSearchFirstTimeExperience"))
  {
    +[WBSParsecDSession sharedPARSession](UniversalSearchSession, "sharedPARSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstUseDescriptionText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = objc_alloc_init(UniversalSearchFirstTimeExperienceViewController);
      -[UniversalSearchFirstTimeExperienceViewController setDelegate:](v7, "setDelegate:", self);
      -[CatalogViewController requiredContentWidth](self, "requiredContentWidth");
      -[UniversalSearchFirstTimeExperienceViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
      -[UniversalSearchFirstTimeExperienceViewController view](v7, "view");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "setAccessibilityIdentifier:", CFSTR("UniversalSearchFirstTimeExperienceView"));

      universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
      self->_universalSearchFirstTimeExperienceViewController = v7;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      LOBYTE(v8) = objc_msgSend(WeakRetained, "catalogViewControllerShouldUsePopoverForCompletions:", self);

      if ((v8 & 1) != 0)
      {
        -[AbstractCatalogViewController takeOwnershipOfUniversalSearchFirstTimeExperienceViewController](self->_popoverCatalogViewController, "takeOwnershipOfUniversalSearchFirstTimeExperienceViewController");
        if (!-[CatalogViewController popoverIsShowing](self, "popoverIsShowing"))
          -[CatalogViewController _presentPopoverWithViewController:](self, "_presentPopoverWithViewController:", self->_popoverCatalogViewController);
      }
      else
      {
        -[AbstractCatalogViewController takeOwnershipOfUniversalSearchFirstTimeExperienceViewController](self, "takeOwnershipOfUniversalSearchFirstTimeExperienceViewController");
      }
    }
  }
}

- (void)firstTimeExperienceContinueButtonPressed
{
  -[CatalogViewController didInteractWithUniversalSearchFirstTimeExperienceViewController:](self, "didInteractWithUniversalSearchFirstTimeExperienceViewController:", self->_universalSearchFirstTimeExperienceViewController);
}

- (void)dismissCompletionsForSizeClassTransition
{
  -[CatalogViewController _setShowingCompletions:popoverDismissalReason:completionHandler:](self, "_setShowingCompletions:popoverDismissalReason:completionHandler:", 0, 1, 0);
  -[CatalogViewController _dismissUniversalSearchFirstTimeExperience:dismissalReason:](self, "_dismissUniversalSearchFirstTimeExperience:dismissalReason:", self->_universalSearchFirstTimeExperienceViewController, 1);
}

- (void)didInteractWithUniversalSearchFirstTimeExperienceViewController:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "userDidInteractWithParsecFirstTimeUserExperience");
  -[CatalogViewController _dismissUniversalSearchFirstTimeExperience:dismissalReason:](self, "_dismissUniversalSearchFirstTimeExperience:dismissalReason:", v4, 0);

}

- (void)dismissUniversalSearchFirstTimeExperienceViewControllerIfNeeded
{
  id v3;

  if (-[CatalogViewController isShowingUniversalSearchFirstTimeExperience](self, "isShowingUniversalSearchFirstTimeExperience"))
  {
    -[CatalogViewController universalSearchFirstTimeExperienceViewController](self, "universalSearchFirstTimeExperienceViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController didCancelUniversalSearchFirstTimeExperienceViewController:](self, "didCancelUniversalSearchFirstTimeExperienceViewController:", v3);

  }
}

- (void)didCancelUniversalSearchFirstTimeExperienceViewController:(id)a3
{
  -[CatalogViewController _dismissUniversalSearchFirstTimeExperience:dismissalReason:](self, "_dismissUniversalSearchFirstTimeExperience:dismissalReason:", a3, 2);
}

- (void)_dismissUniversalSearchFirstTimeExperience:(id)a3 dismissalReason:(int64_t)a4
{
  -[CatalogViewController _dismissUniversalSearchFirstTimeExperience:dismissalReason:completionHandler:](self, "_dismissUniversalSearchFirstTimeExperience:dismissalReason:completionHandler:", a3, a4, 0);
}

- (void)_dismissUniversalSearchFirstTimeExperience:(id)a3 dismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  void *v7;
  id WeakRetained;
  _BOOL4 usesPopoverStyleForFavorites;
  CatalogViewController *v10;
  uint64_t v11;
  int64_t v12;
  UniversalSearchFirstTimeExperienceViewController *universalSearchFirstTimeExperienceViewController;
  id v14;

  v14 = a5;
  -[UniversalSearchFirstTimeExperienceViewController presentedViewController](self->_universalSearchFirstTimeExperienceViewController, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!objc_msgSend(WeakRetained, "catalogViewControllerShouldUsePopoverForCompletions:", self))
  {

    goto LABEL_6;
  }
  usesPopoverStyleForFavorites = self->_usesPopoverStyleForFavorites;

  if (usesPopoverStyleForFavorites)
  {
LABEL_6:
    if (a4 == 1)
      -[CatalogViewController _dismissPopoverAnimated:dismissalReason:completionHandler:](self, "_dismissPopoverAnimated:dismissalReason:completionHandler:", 0, 1, 0);
    -[CatalogViewController relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent](self, "relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent");
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    v10 = self;
    v11 = 0;
    v12 = 2;
LABEL_12:
    -[CatalogViewController _dismissPopoverAnimated:dismissalReason:completionHandler:](v10, "_dismissPopoverAnimated:dismissalReason:completionHandler:", v11, v12, v14);
    goto LABEL_9;
  }
  if ((-[UnifiedField hasText](self->_textField, "hasText") & 1) == 0)
  {
    v10 = self;
    v11 = 1;
    v12 = a4;
    goto LABEL_12;
  }
LABEL_9:
  -[UniversalSearchFirstTimeExperienceViewController setDelegate:](self->_universalSearchFirstTimeExperienceViewController, "setDelegate:", 0);
  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
  self->_universalSearchFirstTimeExperienceViewController = 0;

}

- (BOOL)isShowingUniversalSearchFirstTimeExperience
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UniversalSearchFirstTimeExperienceViewController parentViewController](self->_universalSearchFirstTimeExperienceViewController, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[UniversalSearchFirstTimeExperienceViewController presentingViewController](self->_universalSearchFirstTimeExperienceViewController, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)isShowingUniversalSearchPrivacyDetails
{
  void *v2;
  BOOL v3;

  -[UniversalSearchFirstTimeExperienceViewController presentedViewController](self->_universalSearchFirstTimeExperienceViewController, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_updatePersonalisationDataForDonation:(id)a3 forPosition:(unint64_t)a4
{
  BrowserController **p_browserController;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  p_browserController = &self->_browserController;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeTabDocument");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "personalizationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSearchQuery:", v6);

  objc_msgSend(v11, "personalizationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosition:", a4);

}

- (UIView)snapshotContentView
{
  return (UIView *)-[SFStartPageViewController view](self->_startPageViewController, "view");
}

- (UIColor)snapshotBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (CGRect)snapshotContentRectInBounds:(CGRect)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double left;
  double v16;
  double Width;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  y = a3.origin.y;
  x = a3.origin.x;
  -[SFStartPageViewController view](self->_startPageViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  left = self->_obscuredInsets.left;
  v16 = left + self->_obscuredInsets.right;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size = a3.size;
  Width = CGRectGetWidth(v28);
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  v18 = v16;
  v19 = Width / (CGRectGetWidth(v29) - v16);
  v20 = -(left * v19);
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  v21 = CGRectGetMinY(v30) * v19;
  v22 = CGRectGetWidth(a3) + v18 * v19;
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  v23 = v19 * CGRectGetHeight(v31);
  v24 = v20;
  v25 = v21;
  v26 = v22;
  result.size.height = v23;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)checkAndResetIfNextSnapshotRequiresScreenUpdates
{
  BOOL nextSnapshotRequiresScreenUpdates;

  nextSnapshotRequiresScreenUpdates = self->_nextSnapshotRequiresScreenUpdates;
  self->_nextSnapshotRequiresScreenUpdates = 0;
  return nextSnapshotRequiresScreenUpdates;
}

- (void)beginTransitionToNewSizeClassWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIViewController *completionDetailViewController;
  void *v8;
  UIViewController *v9;

  self->_transitioningToNewSizeClass = 1;
  v4 = a3;
  -[CatalogViewController queryString](self, "queryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryString:", v5);

  objc_msgSend(v4, "setShowingCompletions:", -[CatalogViewController isShowingCompletions](self, "isShowingCompletions"));
  objc_msgSend(v4, "setShowingUniversalFirstTimeExperience:", -[CatalogViewController isShowingUniversalSearchFirstTimeExperience](self, "isShowingUniversalSearchFirstTimeExperience"));
  objc_msgSend(v4, "setCompletionDetailViewController:", self->_completionDetailViewController);
  -[UnifiedField text](self->_textField, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFieldIsEmpty:", objc_msgSend(v6, "length") == 0);

  completionDetailViewController = self->_completionDetailViewController;
  if (completionDetailViewController)
  {
    -[UIViewController presentedViewController](completionDetailViewController, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

    -[UIViewController dismissViewControllerAnimated:completion:](self->_completionDetailViewController, "dismissViewControllerAnimated:completion:", 0, 0);
    v9 = self->_completionDetailViewController;
    self->_completionDetailViewController = 0;

  }
}

- (void)endTransitionToNewSizeClassWithState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  self->_transitioningToNewSizeClass = 0;
  -[PopoverCatalogViewController resetStartPagePreferredHeight](self->_popoverCatalogViewController, "resetStartPagePreferredHeight");
  if (objc_msgSend(v6, "isShowingCompletions"))
  {
    objc_msgSend(v6, "queryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CatalogViewController setQueryString:](self, "setQueryString:", v4);

    -[CatalogViewController _reloadCompletionTable](self, "_reloadCompletionTable");
  }
  else if (objc_msgSend(v6, "isShowingUniversalFirstTimeExperience"))
  {
    -[CatalogViewController showUniversalSearchFirstTimeExperienceIfNotShowing](self, "showUniversalSearchFirstTimeExperienceIfNotShowing");
  }
  if (objc_msgSend(v6, "fieldIsEmpty"))
    -[UnifiedField setText:](self->_textField, "setText:", 0);
  objc_msgSend(v6, "completionDetailViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CatalogViewController _shouldPresentCompletionDetailViewControllerAfterSizeTransition:](self, "_shouldPresentCompletionDetailViewControllerAfterSizeTransition:", v5))
  {
    objc_storeStrong((id *)&self->_completionDetailViewController, v5);
    -[CatalogViewController _presentStagedCompletionDetailViewControllerAnimated:](self, "_presentStagedCompletionDetailViewControllerAnimated:", 0);
    self->_completionDetailIsPresented = 1;
  }

}

- (BOOL)_shouldPresentCompletionDetailViewControllerAfterSizeTransition:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isBeingDismissed") ^ 1;
  else
    return 0;
}

- (id)_cancelBarButtonItem
{
  UIBarButtonItem *cancelBarButton;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *v12;
  void *v13;
  UIBarButtonItem *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  cancelBarButton = self->_cancelBarButton;
  if (cancelBarButton)
    return cancelBarButton;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __45__CatalogViewController__cancelBarButtonItem__block_invoke;
  v18 = &unk_1E9CF2C28;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, 0, 0, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D4EC38]);
  v9 = (void *)objc_msgSend(v8, "initWithStyle:primaryAction:", 2, v7, v15, v16, v17, v18);
  -[StartPageController viewController](self->_startPageController, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOpaqueBackgroundVisibility:", (double)(objc_msgSend(v10, "showsWallpaper") ^ 1));

  v11 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
  v12 = self->_cancelBarButton;
  self->_cancelBarButton = v11;

  _SFAccessibilityIdentifierForBarItem();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelBarButton, "setAccessibilityIdentifier:", v13);

  v14 = self->_cancelBarButton;
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v14;
}

void __45__CatalogViewController__cancelBarButtonItem__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 121);
    objc_msgSend(v2, "navigationBarCancelButtonWasTapped:", 0);

    WeakRetained = v3;
  }

}

- (void)startPageControllerDidCompleteDismissGesture:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dismissCatalogViewController:", self);

}

- (void)startPageControllerDidCompleteUnfocusGesture:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "catalogViewControllerWillUnfocusUnifiedField:", self);
  -[CatalogViewController textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)startPageViewController:(id)a3 willPresentCustomizationViewController:(id)a4
{
  CatalogViewControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "catalogViewController:willPresentCustomizationViewController:", self, v6);

}

- (BOOL)startPageViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBlank") ^ 1;

  return v6;
}

- (CompletionList)completionList
{
  return self->_completionList;
}

- (BOOL)isContentBorrowed
{
  return self->_contentBorrowed;
}

- (CatalogViewControllerDelegate)delegate
{
  return (CatalogViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (LoadProgressObserver)loadProgressObserver
{
  return (LoadProgressObserver *)objc_loadWeakRetained((id *)&self->_loadProgressObserver);
}

- (_SFNavigationBarCommon)navigationBar
{
  return self->_navigationBar;
}

- (UIEdgeInsets)obscuredInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  bottom = self->_obscuredInsets.bottom;
  right = self->_obscuredInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)usesPopoverStyleForFavorites
{
  return self->_usesPopoverStyleForFavorites;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return self->_popoverPresentationController;
}

- (BOOL)hasScheduledCompletionListDismissal
{
  return self->_hasScheduledCompletionListDismissal;
}

- (void)setHasScheduledCompletionListDismissal:(BOOL)a3
{
  self->_hasScheduledCompletionListDismissal = a3;
}

- (BOOL)completionDetailIsPresented
{
  return self->_completionDetailIsPresented;
}

- (CompletionItem)lastTopHitMatch
{
  return self->_lastTopHitMatch;
}

- (void)setLastTopHitMatch:(id)a3
{
  objc_storeStrong((id *)&self->_lastTopHitMatch, a3);
}

- (UniversalSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (void)setParsecSearchSession:(id)a3
{
  objc_storeStrong((id *)&self->_parsecSearchSession, a3);
}

- (UnifiedField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_storeStrong((id *)&self->_lastTopHitMatch, 0);
  objc_storeStrong((id *)&self->_startPageController, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionList, 0);
  objc_storeStrong((id *)&self->_universalSearchFirstTimeExperienceViewController, 0);
  objc_storeStrong((id *)&self->_startPageViewController, 0);
  objc_storeStrong((id *)&self->_completionsViewController, 0);
  objc_storeStrong((id *)&self->_tableViewCellHeightCache, 0);
  objc_storeStrong((id *)&self->_cancelBarButton, 0);
  objc_storeStrong((id *)&self->_timerForClearingCompletionListCaches, 0);
  objc_storeStrong((id *)&self->_completionDismissalReporter, 0);
  objc_storeStrong((id *)&self->_pendingVoiceSearchTimer, 0);
  objc_storeStrong((id *)&self->_seenVisibleResults, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_sidebarButton, 0);
  objc_storeStrong((id *)&self->_completionDetailViewControllerBeingPresented, 0);
  objc_storeStrong((id *)&self->_completionDetailViewController, 0);
  objc_storeStrong((id *)&self->_popoverCatalogViewController, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

- (void)tableView:(uint64_t)a1 contextMenuConfigurationForRowAtIndexPath:(NSObject *)a2 point:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, a2, a3, "Table view cell is nil for item at index path: %@", (uint8_t *)&v3);
}

- (void)tableView:(void *)a1 contextMenuConfigurationForRowAtIndexPath:point:.cold.2(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2(&dword_1D7CA3000, v1, v4, "Completion list and table view are out of sync. Completion item for context menu configuration is SFSearchResult but table view cell is kind of %@", (uint8_t *)&v5);

}

@end
