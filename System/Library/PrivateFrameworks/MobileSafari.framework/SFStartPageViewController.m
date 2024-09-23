@implementation SFStartPageViewController

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void)updateNavigationBarTitleInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;

  -[SFStartPageViewController view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v17, "directionalLayoutMargins");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v17, "_sf_usesLeftToRightLayout");
  -[SFStartPageCollectionViewController navigationItem](self->_rootCollectionViewController, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    v14 = v6;
  else
    v14 = v4;
  v15 = v10 + v14;
  if (v11)
    v16 = v4;
  else
    v16 = v6;
  objc_msgSend(v12, "setLargeTitleInsets:", 0.0, v8 + v16, 0.0, v15);

}

- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(WeakRetained, "startPageViewController:isSectionExpanded:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (id)sectionsForStartPageCollectionViewController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "sectionsForStartPageViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3
{
  id WeakRetained;
  int64_t customizationPolicy;

  WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDataSource);
  if (WeakRetained)
    customizationPolicy = self->_customizationPolicy;
  else
    customizationPolicy = 2;

  return customizationPolicy;
}

- (void)updateOverrideTraitCollection
{
  WBSStartPageBackgroundManager *wallpaperManager;
  void *v4;
  uint64_t v5;

  if (self->_alternateContentViewController || !-[SFStartPageViewController showsWallpaper](self, "showsWallpaper"))
  {
    v5 = 0;
  }
  else
  {
    wallpaperManager = self->_wallpaperManager;
    -[SFStartPageViewController _wallpaperImageIdentifier](self, "_wallpaperImageIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WBSStartPageBackgroundManager appearanceForImageWithIdentifier:forProfile:](wallpaperManager, "appearanceForImageWithIdentifier:forProfile:", v4, self->_profile);

  }
  -[SFStartPageViewController _updateOverrideTraitCollectionWithUserInterfaceStyle:](self, "_updateOverrideTraitCollectionWithUserInterfaceStyle:", v5);
  -[SFStartPageViewController updateNavigationBarTintColor](self, "updateNavigationBarTintColor");
  -[SFStartPageViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)_updateOverrideTraitCollectionWithUserInterfaceStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[UINavigationController traitOverrides](self->_navigationController, "traitOverrides");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_alternateContentViewController)
  {
    objc_msgSend(v10, "removeTrait:", objc_opt_class());
    objc_msgSend(MEMORY[0x1E0DC3E88], "safari_removeAllCustomTraits:", v10);
  }
  else
  {
    if (a3)
      objc_msgSend(v10, "setNSIntegerValue:forTrait:", a3, objc_opt_class());
    else
      objc_msgSend(v10, "removeTrait:", objc_opt_class());
    if (self->_backgroundDisplayMode == 1)
    {
      objc_msgSend(v10, "setNSIntegerValue:forTrait:", 1, objc_opt_class());
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forTrait:", v5, objc_opt_class());

    }
    else
    {
      -[UIImageView image](self->_wallpaperView, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v10, "setNSIntegerValue:forTrait:", 1, objc_opt_class());
      else
        objc_msgSend(v10, "removeTrait:", objc_opt_class());
      objc_msgSend(v10, "removeTrait:", objc_opt_class());
    }
    -[SFStartPageViewController effectiveControlTintColor](self, "effectiveControlTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v10, "setObject:forTrait:", v7, objc_opt_class());
    else
      objc_msgSend(v10, "removeTrait:", objc_opt_class());

    -[SFStartPageViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if (v9 == 2)
      objc_msgSend(v10, "setNSIntegerValue:forTrait:", 1, objc_opt_class());
    else
      objc_msgSend(v10, "removeTrait:", objc_opt_class());
  }

}

- (void)_reloadCustomizationViewController
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_dataSourceObservers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "reloadDataAnimatingDifferences:", 1, (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  UIScrollView *foregroundScrollView;
  UIScrollView *v11;
  UIScrollView *v12;
  UIScrollView *v13;
  id WeakRetained;
  NSString *expandedSectionIdentifier;
  id v16;

  v5 = a5;
  v16 = a4;
  objc_msgSend(v16, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[SFStartPageViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");
  objc_msgSend(v7, "setLayoutMargins:");

  objc_msgSend(v16, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageViewController configurePaletteForNavigationItem:](self, "configurePaletteForNavigationItem:", v9);

  foregroundScrollView = self->_foregroundScrollView;
  if (foregroundScrollView)
  {
    -[UIScrollView _removeScrollViewScrollObserver:](foregroundScrollView, "_removeScrollViewScrollObserver:", self);
    v11 = self->_foregroundScrollView;
    self->_foregroundScrollView = 0;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[SFStartPageViewController scrollViewForStartPageCollectionViewsOnly:](self, "scrollViewForStartPageCollectionViewsOnly:", 0);
    v12 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
    v13 = self->_foregroundScrollView;
    self->_foregroundScrollView = v12;

    -[UIScrollView _addScrollViewScrollObserver:](self->_foregroundScrollView, "_addScrollViewScrollObserver:", self);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewControllerDidScroll:animated:", self, v5);
  -[SFStartPageViewController updateNavigationBarTintColor](self, "updateNavigationBarTintColor");
  if (-[SFStartPageViewController isShowingRootView](self, "isShowingRootView"))
  {
    if (-[NSString isEqualToString:](self->_expandedSectionIdentifier, "isEqualToString:", *MEMORY[0x1E0D8A698]))
      -[SFStartPageViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
    expandedSectionIdentifier = self->_expandedSectionIdentifier;
    self->_expandedSectionIdentifier = 0;

  }
}

- (void)startPageCollectionViewControllerDidScroll:(id)a3
{
  id v4;
  id WeakRetained;

  -[SFStartPageViewController updateNavigationBarTintColor](self, "updateNavigationBarTintColor", a3);
  -[SFStartPageViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewControllerDidScroll:animated:", self, 0);
  v4 = objc_loadWeakRetained((id *)&self->_scrollObserver);
  objc_msgSend(v4, "startPageViewControllerDidScroll:", self);

}

- (void)updateNavigationBarTintColor
{
  UINavigationController **p_navigationController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16[4];
  id v17;
  SFStartPageViewController *v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  p_navigationController = &self->_navigationController;
  -[UINavigationController traitCollection](self->_navigationController, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke;
  v20[3] = &unk_1E21E49A0;
  v20[4] = self;
  -[UINavigationController navigationBar](*p_navigationController, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke((uint64_t)v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v5;
  v16[1] = (id)3221225472;
  v16[2] = __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke_2;
  v16[3] = &unk_1E21E49C8;
  v10 = v9;
  v17 = v10;
  v18 = self;
  v11 = v4;
  v19 = v11;
  __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke_2(v16);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v21 = *MEMORY[0x1E0DC1140];
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "standardAppearance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleTextAttributes:", v14);

  }
  else
  {
    objc_msgSend(v10, "standardAppearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitleTextAttributes:", MEMORY[0x1E0C9AA70]);
  }

}

- (BOOL)showsWallpaper
{
  void *v3;
  char v4;
  WBSStartPageBackgroundManager *wallpaperManager;
  void *v6;
  void *v7;
  BOOL result;

  -[SFStartPageViewController topStartPageCollectionViewController](self, "topStartPageCollectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsWallpaperHiddenForCurrentBackgroundStyle");

  result = (v4 & 1) == 0
        && (wallpaperManager = self->_wallpaperManager,
            -[SFStartPageViewController _wallpaperImageIdentifier](self, "_wallpaperImageIdentifier"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            -[WBSStartPageBackgroundManager imageForIdentifier:forProfile:](wallpaperManager, "imageForIdentifier:forProfile:", v6, self->_profile), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v6, v7)&& self->_backgroundDisplayMode == 0;
  return result;
}

- (id)_wallpaperImageIdentifier
{
  id WeakRetained;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "backgroundImageIdentifierForStartPageViewController:", self);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E21FE780;
  }

  return v4;
}

- (id)topStartPageCollectionViewController
{
  void *v2;
  id v3;

  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[150])
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "effectiveControlTintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "sf_alternateUserInterfaceStyle"))
      {
        objc_msgSend(*(id *)(a1 + 32), "scrollDistance");
        v7 = SFChromeVisibilityForScrollDistance(v6);
        objc_msgSend(v5, "sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "resolvedColorWithTraitCollection:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        SFInterpolateColor(v9, v4, v7);
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = v4;
      }

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

- (id)effectiveControlTintColor
{
  UIColor *preferredControlTintColor;
  UIColor *v3;
  void *v5;
  UIColor *v6;

  preferredControlTintColor = self->_preferredControlTintColor;
  if (preferredControlTintColor)
  {
    v3 = preferredControlTintColor;
  }
  else
  {
    -[UIImageView image](self->_wallpaperView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = self->_preferredControlTintColor;
    }
    v3 = v6;

  }
  return v3;
}

id __57__SFStartPageViewController_updateNavigationBarTintColor__block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(a1[4], "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    v4 = 0;
LABEL_7:

    return v4;
  }
  v3 = *((_QWORD *)a1[5] + 150);

  if (!v3 && objc_msgSend(a1[6], "sf_alternateUserInterfaceStyle"))
  {
    objc_msgSend(a1[5], "scrollDistance");
    v6 = SFChromeVisibilityForScrollDistance(v5);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "sf_traitCollectionWithAlternateUserInterfaceColorAsPrimary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resolvedColorWithTraitCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    SFInterpolateColor(v8, v2, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v4 = 0;
  return v4;
}

- (void)configurePaletteForNavigationItem:(id)a3
{
  id v4;
  double navigationBarPaletteHeight;
  double top;
  double bottom;
  void *v8;
  void *v9;
  double v10;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  navigationBarPaletteHeight = self->_navigationBarPaletteHeight;
  top = self->_navigationBarPaletteInsets.top;
  bottom = self->_navigationBarPaletteInsets.bottom;
  v16 = v4;
  objc_msgSend(v4, "_bottomPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = navigationBarPaletteHeight + top + bottom;
  if (v10 != 0.0 && v8 == 0)
  {
    v13 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v14, "setFrame:", 0.0, 0.0, 0.0, v10);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4290]), "initWithContentView:", v14);
    objc_msgSend(v16, "_setBottomPalette:", v15);

  }
  else if (v10 == 0.0)
  {
    objc_msgSend(v16, "_setBottomPalette:", 0);
  }
  else
  {
    objc_msgSend(v8, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, 0.0, v10);

    objc_msgSend(v16, "_setBottomPaletteNeedsUpdate");
  }

}

- (void)setRootViewHidesEmptyNavigationBar:(BOOL)a3
{
  -[SFStartPageCollectionViewController setHidesEmptyNavigationBar:](self->_rootCollectionViewController, "setHidesEmptyNavigationBar:", a3);
}

- (void)setCustomizationPolicy:(int64_t)a3
{
  if (self->_customizationPolicy != a3)
  {
    self->_customizationPolicy = a3;
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 0);
  }
}

- (void)viewLayoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFStartPageViewController;
  -[SFStartPageViewController viewLayoutMarginsDidChange](&v3, sel_viewLayoutMarginsDidChange);
  -[SFStartPageViewController updateNavigationBarTitleInsets](self, "updateNavigationBarTitleInsets");
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFStartPageViewController;
  -[SFStartPageViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[SFStartPageViewController updateNavigationBarTitleInsets](self, "updateNavigationBarTitleInsets");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIPanGestureRecognizer *v8;
  UIPanGestureRecognizer *unfocusGesture;
  void *v10;
  UIVisualEffectView *v11;
  UIVisualEffectView *statusBarBackdrop;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SFStartPageViewController;
  -[SFStartPageViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[SFStartPageViewController addChildViewController:](self, "addChildViewController:", self->_navigationController);
  -[UINavigationController view](self->_navigationController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[SFStartPageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[SFStartPageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

  -[UINavigationController didMoveToParentViewController:](self->_navigationController, "didMoveToParentViewController:", self);
  v18[0] = self->_rootCollectionViewController;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController setViewControllers:](self->_navigationController, "setViewControllers:", v6);

  -[SFStartPageViewController navigationController:willShowViewController:animated:](self, "navigationController:willShowViewController:animated:", self->_navigationController, self->_rootCollectionViewController, 0);
  -[SFStartPageViewController _wallpaperDidChange:](self, "_wallpaperDidChange:", 0);
  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersLargeTitles:", 1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SFStartPageVisualStyleProviding prepareNavigationController:forStartPageViewController:](self->_visualStyleProvider, "prepareNavigationController:forStartPageViewController:", self->_navigationController, self);
  v8 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_unfocusGestureDidUpdate_);
  unfocusGesture = self->_unfocusGesture;
  self->_unfocusGesture = v8;

  -[UIPanGestureRecognizer setDelegate:](self->_unfocusGesture, "setDelegate:", self);
  -[SFStartPageViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", self->_unfocusGesture);

  if (-[SFStartPageViewController startPageCollectionViewControllerShouldInstallCustomBackdrops:](self, "startPageCollectionViewControllerShouldInstallCustomBackdrops:", self->_rootCollectionViewController))
  {
    objc_msgSend(MEMORY[0x1E0DC3F58], "safari_statusBarGradientBlurEffectView");
    v11 = (UIVisualEffectView *)objc_claimAutoreleasedReturnValue();
    statusBarBackdrop = self->_statusBarBackdrop;
    self->_statusBarBackdrop = v11;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusBarBackdrop, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", 0.0);
    -[SFStartPageViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", self->_statusBarBackdrop);

  }
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)-[SFStartPageViewController registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v14, self, sel_updateOverrideTraitCollection);

}

- (BOOL)startPageCollectionViewControllerShouldInstallCustomBackdrops:(id)a3
{
  SFStartPageCollectionViewController *v4;
  BOOL v5;

  v4 = (SFStartPageCollectionViewController *)a3;
  v5 = (_SFDeviceIsPad() & 1) == 0 && self->_rootCollectionViewController == v4;

  return v5;
}

- (SFStartPageViewController)initWithVisualStyleProvider:(id)a3 forProfile:(id)a4
{
  id v7;
  id v8;
  SFStartPageViewController *v9;
  SFStartPageViewController *v10;
  uint64_t v11;
  UINavigationController *navigationController;
  SFStartPageCollectionViewController *v13;
  SFStartPageCollectionViewController *rootCollectionViewController;
  uint64_t v15;
  NSHashTable *dataSourceObservers;
  uint64_t v17;
  WBSStartPageBackgroundManager *wallpaperManager;
  void *v19;
  const __CFString *v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  WBSUserDefaultObservation *wallpaperDefaultsObservation;
  SFStartPageViewController *v28;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SFStartPageViewController;
  v9 = -[SFStartPageViewController initWithNibName:bundle:](&v33, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_visualStyleProvider, a3);
    v10->_customizationPolicy = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
    navigationController = v10->_navigationController;
    v10->_navigationController = (UINavigationController *)v11;

    -[UINavigationController _setClipUnderlapWhileTransitioning:](v10->_navigationController, "_setClipUnderlapWhileTransitioning:", 1);
    -[UINavigationController setDelegate:](v10->_navigationController, "setDelegate:", v10);
    v13 = -[SFStartPageCollectionViewController initWithVisualStyleProvider:]([SFStartPageCollectionViewController alloc], "initWithVisualStyleProvider:", v7);
    rootCollectionViewController = v10->_rootCollectionViewController;
    v10->_rootCollectionViewController = v13;

    -[SFStartPageCollectionViewController setDataSource:](v10->_rootCollectionViewController, "setDataSource:", v10);
    -[SFStartPageCollectionViewController setDelegate:](v10->_rootCollectionViewController, "setDelegate:", v10);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    dataSourceObservers = v10->_dataSourceObservers;
    v10->_dataSourceObservers = (NSHashTable *)v15;

    -[NSHashTable addObject:](v10->_dataSourceObservers, "addObject:", v10->_rootCollectionViewController);
    objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
    v17 = objc_claimAutoreleasedReturnValue();
    wallpaperManager = v10->_wallpaperManager;
    v10->_wallpaperManager = (WBSStartPageBackgroundManager *)v17;

    objc_storeStrong((id *)&v10->_profile, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__wallpaperDidChange_, *MEMORY[0x1E0D8B5C8], 0);
    v20 = (const __CFString *)*MEMORY[0x1E0D8B5B8];
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__wallpaperDidChange_, *MEMORY[0x1E0D8B5B8], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__wallpaperDidChangeRemotely, *MEMORY[0x1E0D8B5D0], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__wallpaperWasDeletedRemotely, *MEMORY[0x1E0D8B5C0], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel__backgroundImageDidToggle, *MEMORY[0x1E0D8B2E8], 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)_settingsBundleUpdatedWallpaper, v20, 0, (CFNotificationSuspensionBehavior)1028);
    objc_initWeak(&location, v10);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D8A628];
    v24 = MEMORY[0x1E0C80D38];
    v25 = MEMORY[0x1E0C80D38];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __68__SFStartPageViewController_initWithVisualStyleProvider_forProfile___block_invoke;
    v30[3] = &unk_1E21E40F0;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v22, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", v23, v24, 0, v30);
    v26 = objc_claimAutoreleasedReturnValue();
    wallpaperDefaultsObservation = v10->_wallpaperDefaultsObservation;
    v10->_wallpaperDefaultsObservation = (WBSUserDefaultObservation *)v26;

    v28 = v10;
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (void)_wallpaperDidChange:(id)a3
{
  id v4;
  void *v5;
  WBSStartPageBackgroundManager *v6;
  WBSStartPageBackgroundManager *wallpaperManager;
  _QWORD v8[5];

  v4 = a3;
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "object"),
        v6 = (WBSStartPageBackgroundManager *)objc_claimAutoreleasedReturnValue(),
        wallpaperManager = self->_wallpaperManager,
        v6,
        v6 == wallpaperManager))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__SFStartPageViewController__wallpaperDidChange___block_invoke;
    v8[3] = &unk_1E21E4950;
    v8[4] = self;
    -[SFStartPageViewController _updateWallpaperIfNeededWithCompletionHandler:](self, "_updateWallpaperIfNeededWithCompletionHandler:", v8);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartPageViewController;
  -[SFStartPageViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SFStartPageViewController _updateWallpaperIfNeededWithCompletionHandler:](self, "_updateWallpaperIfNeededWithCompletionHandler:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewControllerDidAppear:", self);

}

- (void)startPageCollectionViewControllerDidUpdateContent:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewControllerDidUpdateContent:", self);

}

- (void)setDataSource:(id)a3
{
  id v4;
  id WeakRetained;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_dataSource, v4);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_dataSourceObservers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "reloadDataAnimatingDifferences:", 0, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

void __68__SFStartPageViewController_resetToRootViewWithCustomizationPolicy___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "popToRootViewControllerAnimated:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "updateStartPageTopPadding");
  objc_msgSend(*(id *)(a1 + 32), "reloadDataAnimatingDifferences:", 0);
  objc_msgSend(*(id *)(a1 + 32), "reloadNavigationItemAnimated:", 0);
  objc_msgSend(*(id *)(a1 + 32), "topStartPageCollectionViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollToTop");

}

- (void)coalesceDataReloadWithBlock:(id)a3 animatingDifferences:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(void);
  void (**v7)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  self->_coalescingDataReload = 1;
  v7 = v6;
  v6[2]();
  self->_coalescingDataReload = 0;
  if (self->_needsDataReloadAfterBatchUpdate)
    -[SFStartPageViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", v4);

}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  _BOOL8 v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_coalescingDataReload)
  {
    self->_needsDataReloadAfterBatchUpdate = 1;
  }
  else
  {
    v3 = a3;
    self->_needsDataReloadAfterBatchUpdate = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_dataSourceObservers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reloadDataAnimatingDifferences:", v3, (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  UIViewController *alternateContentViewController;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_dataSourceObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "reloadNavigationItemAnimated:", v3, (_QWORD)v11);
      }
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  alternateContentViewController = self->_alternateContentViewController;
  if (alternateContentViewController)
  {
    -[UIViewController navigationItem](alternateContentViewController, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageViewController _setLeadingBarItems:trailingBarItems:onNavigationItem:forSection:](self, "_setLeadingBarItems:trailingBarItems:onNavigationItem:forSection:", 1, 1, v10, 0);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double Width;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SFStartPageViewController;
  -[SFStartPageViewController viewWillLayoutSubviews](&v26, sel_viewWillLayoutSubviews);
  -[SFStartPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[UINavigationController viewControllers](self->_navigationController, "viewControllers", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "viewIfLoaded");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setLayoutMargins:", v5, v7, v9, v11);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v13);
  }

  if (self->_statusBarBackdrop)
  {
    -[UINavigationController view](self->_navigationController, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeAreaInsets");
    v19 = v18;

    -[SFStartPageViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    Width = CGRectGetWidth(v29);

    -[UIVisualEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", 0.0, 0.0, Width, v19);
    if (-[UINavigationController isNavigationBarHidden](self->_navigationController, "isNavigationBarHidden"))
      -[UIVisualEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", 0.0);
  }
}

- (double)startPageCollectionViewControllerTopPadding:(id)a3
{
  id WeakRetained;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = -1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "startPageViewControllerTopPadding:", self);
    v5 = v6;
  }

  return v5;
}

- (void)updateStartPageTopPadding
{
  -[SFStartPageCollectionViewController navigationBarPositionDidChange](self->_rootCollectionViewController, "navigationBarPositionDidChange");
}

- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3
{
  id WeakRetained;
  UISearchController *searchController;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(a3, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "startPageViewControllerShouldShowSearchField:", self))
  {
    -[SFStartPageViewController _createSearchControllerIfNeeded](self, "_createSearchControllerIfNeeded");
    searchController = self->_searchController;
  }
  else
  {
    searchController = 0;
  }
  objc_msgSend(v9, "setSearchController:", searchController);
  -[SFStartPageViewController _setLeadingBarItems:trailingBarItems:onNavigationItem:forSection:](self, "_setLeadingBarItems:trailingBarItems:onNavigationItem:forSection:", 1, 1, v9, 0);
  v6 = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_alternateContentViewController || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "startPageViewControllerTitleForRootView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v9, "setTitle:", v7);
    v8 = 1;
  }
  else
  {
    objc_msgSend(v9, "setTitle:", 0);
    v8 = 2;
  }
  objc_msgSend(v9, "setLargeTitleDisplayMode:", v8);

}

- (void)_setLeadingBarItems:(BOOL)a3 trailingBarItems:(BOOL)a4 onNavigationItem:(id)a5 forSection:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "startPageViewController:leadingBarItemsForSection:", self, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLeftBarButtonItems:", v10);

  }
  else
  {
    objc_msgSend(v12, "setLeftBarButtonItems:", 0);
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "startPageViewController:trailingBarItemsForSection:", self, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItems:", v11);

  }
  else
  {
    objc_msgSend(v12, "setRightBarButtonItems:", 0);
  }

}

- (int64_t)preferredStatusBarStyle
{
  int64_t v3;
  void *v4;
  SFStartPageCollectionViewController *v5;
  void *v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  CGRect v17;

  if (!self->_wallpaperView || self->_alternateContentViewController)
    return 0;
  -[UINavigationController traitCollection](self->_navigationController, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v5 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 8.0;
  if (v5 != self->_rootCollectionViewController)
    goto LABEL_7;
  -[SFStartPageCollectionViewController navigationItem](v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sf_isEmpty");

  if (v9)
  {
    -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = CGRectGetHeight(v17) + 8.0;
LABEL_7:

  }
  -[SFStartPageViewController scrollDistance](self, "scrollDistance");
  if (v10 <= v7)
    v11 = objc_msgSend(v4, "sf_alternateUserInterfaceStyle");
  else
    v11 = objc_msgSend(v4, "userInterfaceStyle");
  v12 = v11;
  if (self->_statusBarBackdrop)
  {
    -[UINavigationController topViewController](self->_navigationController, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sf_isEmpty");

    if (v15)
      v12 = objc_msgSend(v4, "sf_alternateUserInterfaceStyle");
  }
  v3 = SFContrastingStatusBarStyleForInterfaceStyle(v12);

  return v3;
}

- (void)setScrollObserver:(id)a3
{
  objc_storeWeak((id *)&self->_scrollObserver, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCustomizationDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_customizationDataSource, a3);
}

- (void)setBackgroundDisplayMode:(int64_t)a3
{
  if (self->_backgroundDisplayMode != a3)
  {
    self->_backgroundDisplayMode = a3;
    -[SFStartPageViewController _updateWallpaperIfNeededWithCompletionHandler:](self, "_updateWallpaperIfNeededWithCompletionHandler:", 0);
  }
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSHashTable *v7;
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

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_dataSourceObservers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "reloadSection:animated:", v6, v4);
        else
          objc_msgSend(v11, "reloadDataAnimatingDifferences:", v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)resetToRootViewWithCustomizationPolicy:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__SFStartPageViewController_resetToRootViewWithCustomizationPolicy___block_invoke;
  v3[3] = &unk_1E21E4928;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

- (void)setPreferredControlTintColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredControlTintColor, a3);
    -[SFStartPageViewController _updateWallpaperIfNeededWithCompletionHandler:](self, "_updateWallpaperIfNeededWithCompletionHandler:", 0);
  }

}

- (void)_updateSearchBarAppearance
{
  _BOOL4 v3;
  void *v4;
  UIVisualEffectView *searchFieldBackgroundView;
  _BOOL4 v6;
  id v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *v10;
  void *v11;
  _BOOL4 v12;
  char v13;
  id v14;

  if (self->_searchController)
  {
    v3 = -[SFStartPageViewController showsWallpaper](self, "showsWallpaper");
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTextField");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    searchFieldBackgroundView = self->_searchFieldBackgroundView;
    if (searchFieldBackgroundView)
      v6 = 0;
    else
      v6 = v3;
    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0DC3F58]);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (UIVisualEffectView *)objc_msgSend(v7, "initWithEffect:", v8);
      v10 = self->_searchFieldBackgroundView;
      self->_searchFieldBackgroundView = v9;

      -[UIVisualEffectView setClipsToBounds:](self->_searchFieldBackgroundView, "setClipsToBounds:", 1);
      -[UIVisualEffectView setUserInteractionEnabled:](self->_searchFieldBackgroundView, "setUserInteractionEnabled:", 0);
      -[UIVisualEffectView _setContinuousCornerRadius:](self->_searchFieldBackgroundView, "_setContinuousCornerRadius:", 10.0);
      objc_msgSend(v14, "bounds");
      -[UIVisualEffectView setFrame:](self->_searchFieldBackgroundView, "setFrame:");
      -[UIVisualEffectView setAutoresizingMask:](self->_searchFieldBackgroundView, "setAutoresizingMask:", 18);
      searchFieldBackgroundView = self->_searchFieldBackgroundView;
    }
    -[UIVisualEffectView superview](searchFieldBackgroundView, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = 0;
    else
      v12 = v3;
    if (v12)
    {
      objc_msgSend(v14, "insertSubview:atIndex:", self->_searchFieldBackgroundView, 0);
    }
    else
    {
      if (v11)
        v13 = v3;
      else
        v13 = 1;
      if ((v13 & 1) == 0)
        -[UIVisualEffectView removeFromSuperview](self->_searchFieldBackgroundView, "removeFromSuperview");
    }

  }
}

- (SFStartPageViewController)init
{
  void *v3;
  SFStartPageViewController *v4;

  +[SFDefaultStartPageVisualStyleProvider sharedProvider](SFDefaultStartPageVisualStyleProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFStartPageViewController initWithVisualStyleProvider:forProfile:](self, "initWithVisualStyleProvider:forProfile:", v3, 0);

  return v4;
}

void __68__SFStartPageViewController_initWithVisualStyleProvider_forProfile___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateWallpaperIfNeededWithCompletionHandler:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "postNotificationName:object:", *MEMORY[0x1E0D8B5C8], WeakRetained);

    objc_msgSend(WeakRetained, "_reloadCustomizationViewController");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageViewController;
  -[SFStartPageViewController dealloc](&v4, sel_dealloc);
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (double)scrollDistance
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;

  -[SFStartPageViewController scrollViewForStartPageCollectionViewsOnly:](self, "scrollViewForStartPageCollectionViewsOnly:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  objc_msgSend(v2, "adjustedContentInset");
  v6 = v4 + v5;

  return v6;
}

- (BOOL)isTrackingDropSession
{
  void *v2;
  char v3;

  -[SFStartPageViewController topStartPageCollectionViewController](self, "topStartPageCollectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTrackingDropSession");

  return v3;
}

- (id)scrollViewForStartPageCollectionViewsOnly:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "scrollView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v5 = v7;

  }
  return v5;
}

- (void)configureModelWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_alternateContentViewController)
  {
    v8 = self->_originalNavigationStack;
  }
  else
  {
    -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          objc_msgSend(v14, "configureModelWithIdentifier:usingBlock:", v6, v7, (_QWORD)v15);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)ignorePreviousLayoutSize
{
  id v2;

  -[SFStartPageViewController topStartPageCollectionViewController](self, "topStartPageCollectionViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ignorePreviousLayoutSize");

}

- (void)cancelGestures
{
  id v2;

  -[SFStartPageViewController topStartPageCollectionViewController](self, "topStartPageCollectionViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelGestures");

}

- (BOOL)isShowingRootView
{
  void *v3;
  SFStartPageCollectionViewController *v4;
  BOOL v5;

  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UINavigationController topViewController](self->_navigationController, "topViewController");
    v4 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == self->_rootCollectionViewController;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)rootViewHidesEmptyNavigationBar
{
  return -[SFStartPageCollectionViewController hidesEmptyNavigationBar](self->_rootCollectionViewController, "hidesEmptyNavigationBar");
}

- (void)showDetailForItemWithIdentifier:(id)a3
{
  id v4;

  -[SFStartPageViewController previewViewControllerForItemIdentifier:](self, "previewViewControllerForItemIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:");

}

- (void)presentViewController:(id)a3 fromItemWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:fromItemWithIdentifier:", v8, v6);

}

- (double)navigationBarHeight
{
  void *v2;
  double Height;
  CGRect v5;

  -[UINavigationController navigationBar](self->_navigationController, "navigationBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  Height = CGRectGetHeight(v5);

  return Height;
}

- (double)navigationBarPrimaryContentHeight
{
  double v3;
  double v4;

  v3 = _SFRoundFloatToPixels(self->_navigationBarPaletteHeight + self->_navigationBarPaletteInsets.bottom);
  -[SFStartPageViewController navigationBarHeight](self, "navigationBarHeight");
  return v4 - v3;
}

- (void)setNavigationBarPaletteHeight:(double)a3 alignmentInsets:(UIEdgeInsets)a4
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
    a4 = *(UIEdgeInsets *)*(_QWORD *)&MEMORY[0x1E0DC49E8];
  if (self->_navigationBarPaletteHeight != a3
    || (self->_navigationBarPaletteInsets.left == a4.left
      ? (v5 = self->_navigationBarPaletteInsets.top == a4.top)
      : (v5 = 0),
        v5 ? (v6 = self->_navigationBarPaletteInsets.right == a4.right) : (v6 = 0),
        v6 ? (v7 = self->_navigationBarPaletteInsets.bottom == a4.bottom) : (v7 = 0),
        !v7))
  {
    self->_navigationBarPaletteInsets = a4;
    self->_navigationBarPaletteHeight = a3;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[UINavigationController viewControllers](self->_navigationController, "viewControllers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "navigationItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFStartPageViewController configurePaletteForNavigationItem:](self, "configurePaletteForNavigationItem:", v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (int64_t)navigationBarPosition
{
  return -[UINavigationController _preferredNavigationBarPosition](self->_navigationController, "_preferredNavigationBarPosition");
}

- (void)setNavigationBarPosition:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[SFStartPageViewController navigationBarPosition](self, "navigationBarPosition") != a3)
  {
    -[UINavigationController _setPreferredNavigationBarPosition:](self->_navigationController, "_setPreferredNavigationBarPosition:", a3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[UINavigationController viewControllers](self->_navigationController, "viewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "navigationBarPositionDidChange");
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setAlternateContentViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  NSArray *originalNavigationStack;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  double v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (UIViewController *)a3;
  if (self->_alternateContentViewController != v5)
  {
    -[SFStartPageViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    -[UIViewController navigationItem](self->_alternateContentViewController, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_alternateContentViewController, a3);
    originalNavigationStack = self->_originalNavigationStack;
    if (!v5 || originalNavigationStack)
    {
      if (!v5)
      {
        v13 = originalNavigationStack;
        v14 = self->_originalNavigationStack;
        self->_originalNavigationStack = 0;

        -[UINavigationController setViewControllers:](self->_navigationController, "setViewControllers:", v13);
        -[UIImageView setHidden:](self->_wallpaperView, "setHidden:", 0);

        v12 = 0.0;
        goto LABEL_7;
      }
    }
    else
    {
      -[UINavigationController viewControllers](self->_navigationController, "viewControllers");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9 = self->_originalNavigationStack;
      self->_originalNavigationStack = v8;

    }
    -[UIViewController navigationItem](v5, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageViewController configurePaletteForNavigationItem:](self, "configurePaletteForNavigationItem:", v10);

    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UINavigationController setViewControllers:](self->_navigationController, "setViewControllers:", v11);

    -[UIImageView setHidden:](self->_wallpaperView, "setHidden:", 1);
    v12 = (double)(-[UINavigationController isNavigationBarHidden](self->_navigationController, "isNavigationBarHidden") ^ 1);
LABEL_7:
    -[UIVisualEffectView setAlpha:](self->_statusBarBackdrop, "setAlpha:", v12);
    -[SFStartPageViewController updateOverrideTraitCollection](self, "updateOverrideTraitCollection");
    -[SFStartPageViewController reloadNavigationItemAnimated:](self, "reloadNavigationItemAnimated:", 0);
    -[SFStartPageViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
    objc_msgSend(v6, "setLeftBarButtonItems:", 0);
    objc_msgSend(v6, "setRightBarButtonItems:", 0);
    objc_msgSend(v6, "_setBottomPalette:", 0);

  }
}

uint64_t __49__SFStartPageViewController__wallpaperDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPageCollectionViewControllerDidUpdateContent:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));
}

- (void)_wallpaperDidChangeRemotely
{
  WBSStartPageBackgroundManager *wallpaperManager;
  id v3;

  wallpaperManager = self->_wallpaperManager;
  -[SFStartPageViewController _wallpaperImageIdentifier](self, "_wallpaperImageIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSStartPageBackgroundManager loadImageFromDiskForIdentifier:](wallpaperManager, "loadImageFromDiskForIdentifier:");

}

- (void)_wallpaperWasDeletedRemotely
{
  -[WBSStartPageBackgroundManager clearImage](self->_wallpaperManager, "clearImage");
}

- (void)_updateWallpaperIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  BOOL v5;
  WBSStartPageBackgroundManager *wallpaperManager;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v4 = a3;
  v5 = -[SFStartPageViewController showsWallpaper](self, "showsWallpaper");
  wallpaperManager = self->_wallpaperManager;
  -[SFStartPageViewController _wallpaperImageIdentifier](self, "_wallpaperImageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBProfile identifier](self->_profile, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SFStartPageViewController__updateWallpaperIfNeededWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E21E4978;
  v12 = v5;
  v10[4] = self;
  v9 = v4;
  v11 = v9;
  -[WBSStartPageBackgroundManager getHasGeneratedBackgroundImage:forProfileWithIdentifier:completionHandler:](wallpaperManager, "getHasGeneratedBackgroundImage:forProfileWithIdentifier:completionHandler:", v7, v8, v10);

}

uint64_t __75__SFStartPageViewController__updateWallpaperIfNeededWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  int v4;
  id *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t result;

  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = *(id **)(a1 + 32);
  v6 = v5[139];
  if (v4)
  {
    if (v6)
      goto LABEL_9;
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(v7, "bounds");
    v9 = objc_msgSend(v8, "initWithFrame:");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 1112);
    *(_QWORD *)(v10 + 1112) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setAutoresizingMask:", 18);
    if ((a2 & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setContentMode:", 2);
    objc_msgSend(v7, "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112), 0);
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    objc_msgSend(v5[139], "removeFromSuperview");
    v12 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v12 + 1112);
    *(_QWORD *)(v12 + 1112) = 0;
  }

LABEL_9:
  if (*(_BYTE *)(a1 + 48))
  {
    v13 = *(_QWORD **)(a1 + 32);
    v14 = (void *)v13[138];
    objc_msgSend(v13, "_wallpaperImageIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageForIdentifier:forProfile:", v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", objc_msgSend(v16, "CGImage"), 0, 3.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resizableImageWithCapInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setImage:", v18);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setContentMode:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setContentMode:", 2);
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v16, "CGImage"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setImage:", v19);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateOverrideTraitCollection");
  objc_msgSend(*(id *)(a1 + 32), "_reloadCustomizationViewController");
  objc_msgSend(*(id *)(a1 + 32), "_updateSearchBarAppearance");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_backgroundImageDidToggle
{
  void *v3;

  -[SFStartPageViewController _updateWallpaperIfNeededWithCompletionHandler:](self, "_updateWallpaperIfNeededWithCompletionHandler:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x1E0D8B5C8], self);

  -[SFStartPageViewController _reloadCustomizationViewController](self, "_reloadCustomizationViewController");
}

- (void)unfocusGestureDidUpdate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "state") == 2)
  {
    -[SFStartPageViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "translationInView:", v4);
    v6 = v5;

    if (v6 < -5.0)
    {
      objc_msgSend(v8, "setEnabled:", 0);
      objc_msgSend(v8, "setEnabled:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "startPageControllerDidCompleteUnfocusGesture:", self);

    }
  }

}

- (void)startPageCollectionViewController:(id)a3 toggleSectionExpanded:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewController:toggleSectionExpanded:", self, v6);

}

- (void)_createSearchControllerIfNeeded
{
  UISearchController *v3;
  UISearchController *searchController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!self->_searchController)
  {
    v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    searchController = self->_searchController;
    self->_searchController = v3;

    -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
    -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
    -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
    -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
    -[UISearchController searchBar](self->_searchController, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC1140];
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v11);
    objc_msgSend(v6, "setAttributedPlaceholder:", v12);

    objc_msgSend(v6, "rightView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v8);

    -[SFStartPageViewController _updateSearchBarAppearance](self, "_updateSearchBarAppearance");
  }
}

- (void)startPageCollectionViewControllerDidChangeBackgroundStyle:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[UINavigationController topViewController](self->_navigationController, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    -[SFStartPageViewController _updateWallpaperIfNeededWithCompletionHandler:](self, "_updateWallpaperIfNeededWithCompletionHandler:", 0);

}

- (void)startPageCollectionViewController:(id)a3 didSelectItemWithIdentifier:(id)a4 atGridLocation:(id)a5
{
  int64_t var1;
  int64_t var0;
  id WeakRetained;
  id v9;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewController:didSelectItemWithIdentifier:atGridLocation:", self, v9, var0, var1);

}

- (void)beginCustomizationForStartPageCollectionViewController:(id)a3
{
  SFStartPageCustomizationViewController *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  SFStartPageCustomizationViewController *v9;

  v4 = [SFStartPageCustomizationViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_customizationDataSource);
  v9 = -[SFStartPageCustomizationViewController initWithDataSource:](v4, "initWithDataSource:", WeakRetained);

  -[SFStartPageCustomizationViewController setShowsCloseButton:](v9, "setShowsCloseButton:", 1);
  -[NSHashTable addObject:](self->_dataSourceObservers, "addObject:", v9);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "startPageViewController:willPresentCustomizationViewController:", self, v9);
  -[SFStartPageViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

  -[SFStartPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)startPageCollectionViewControllerDidCompleteDismissGesture:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageControllerDidCompleteDismissGesture:", self);

}

- (BOOL)startPageCollectionViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:(id)a3
{
  id WeakRetained;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(WeakRetained, "startPageViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:", self);
  else
    v5 = 1;

  return v5;
}

- (void)startPageCollectionViewController:(id)a3 shouldExpandSectionWithIdentifier:(id)a4
{
  NSString *v5;
  NSString *expandedSectionIdentifier;

  v5 = (NSString *)a4;
  -[SFStartPageViewController showDetailForItemWithIdentifier:](self, "showDetailForItemWithIdentifier:", v5);
  expandedSectionIdentifier = self->_expandedSectionIdentifier;
  self->_expandedSectionIdentifier = v5;

}

- (id)previewViewControllerForItemIdentifier:(id)a3
{
  id v4;
  SFStartPageMultiSectionDataSource *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id *v9;
  id *v10;
  SFStartPageMultiSectionDataSource *v11;
  SFStartPageCollectionViewController *v12;
  SFStartPageSingleSectionDataSource *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (objc_msgSend(MEMORY[0x1E0D89BE8], "is2024CloudTabsEnabled")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D8A648]))
  {
    v5 = [SFStartPageMultiSectionDataSource alloc];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke;
    v22[3] = &unk_1E21E49F0;
    v8 = v22;
    v9 = &v23;
    objc_copyWeak(&v23, &location);
    v22[4] = v4;
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_2;
    v20[3] = &unk_1E21E4A18;
    v10 = &v21;
    objc_copyWeak(&v21, &location);
    v11 = -[SFStartPageMultiSectionDataSource initWithSectionTitle:reloadHandler:navigationItemHandler:](v5, "initWithSectionTitle:reloadHandler:navigationItemHandler:", v6, v22, v20);

    -[NSHashTable addObject:](self->_dataSourceObservers, "addObject:", v11);
    v12 = -[SFStartPageCollectionViewController initWithVisualStyleProvider:]([SFStartPageCollectionViewController alloc], "initWithVisualStyleProvider:", self->_visualStyleProvider);
    -[SFStartPageCollectionViewController setDelegate:](v12, "setDelegate:", self);
    -[SFStartPageMultiSectionDataSource connectToViewController:](v11, "connectToViewController:", v12);
  }
  else
  {
    v13 = [SFStartPageSingleSectionDataSource alloc];
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_3;
    v18[3] = &unk_1E21E4A40;
    v8 = v18;
    v9 = &v19;
    objc_copyWeak(&v19, &location);
    v18[4] = v4;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_104;
    v16[3] = &unk_1E21E4A68;
    v10 = &v17;
    objc_copyWeak(&v17, &location);
    v11 = -[SFStartPageSingleSectionDataSource initWithReloadHandler:navigationItemHandler:](v13, "initWithReloadHandler:navigationItemHandler:", v18, v16);
    -[NSHashTable addObject:](self->_dataSourceObservers, "addObject:", v11);
    v12 = -[SFStartPageCollectionViewController initWithVisualStyleProvider:]([SFStartPageCollectionViewController alloc], "initWithVisualStyleProvider:", self->_visualStyleProvider);
    -[SFStartPageCollectionViewController setDelegate:](v12, "setDelegate:", self);
    -[SFStartPageMultiSectionDataSource connectToViewController:](v11, "connectToViewController:", v12);
  }

  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

  return v12;
}

id __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 145);
    objc_msgSend(v4, "startPageViewController:detailSectionsForItemIdentifier:", v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_setLeadingBarItems:trailingBarItems:onNavigationItem:forSection:", 0, 1, v8, v7);

  }
}

id __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138739971;
      v9 = v4;
      _os_log_impl(&dword_18B7B2000, v3, OS_LOG_TYPE_INFO, "Creating single data source section with identifier %{sensitive}@", (uint8_t *)&v8, 0xCu);
    }
    v5 = objc_loadWeakRetained(WeakRetained + 145);
    objc_msgSend(v5, "startPageViewController:detailSectionForItemIdentifier:", WeakRetained, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __68__SFStartPageViewController_previewViewControllerForItemIdentifier___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_setLeadingBarItems:trailingBarItems:onNavigationItem:forSection:", 0, 1, v8, v5);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageViewControllerDidChangeRootViewVisibility:", self);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  char v3;
  id WeakRetained;

  if (self->_unfocusGesture == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v3 = objc_opt_respondsToSelector();

  }
  else
  {
    v3 = 1;
  }
  return v3 & 1;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollObserver);
  objc_msgSend(WeakRetained, "startPageViewControllerDidScroll:", self);

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "startPageViewController:didUpdateSearchPattern:", self, v6);

  }
}

- (UIScrollView)test_scrollView
{
  return (UIScrollView *)-[SFStartPageViewController scrollViewForStartPageCollectionViewsOnly:](self, "scrollViewForStartPageCollectionViewsOnly:", 1);
}

- (int64_t)backgroundDisplayMode
{
  return self->_backgroundDisplayMode;
}

- (SFStartPageCustomizationDataSource)customizationDataSource
{
  return (SFStartPageCustomizationDataSource *)objc_loadWeakRetained((id *)&self->_customizationDataSource);
}

- (int64_t)customizationPolicy
{
  return self->_customizationPolicy;
}

- (SFStartPageDataSource)dataSource
{
  return (SFStartPageDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SFStartPageDelegate)delegate
{
  return (SFStartPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SFStartPageScrollObserver)scrollObserver
{
  return (SFStartPageScrollObserver *)objc_loadWeakRetained((id *)&self->_scrollObserver);
}

- (WBProfile)profile
{
  return self->_profile;
}

- (UIColor)preferredControlTintColor
{
  return self->_preferredControlTintColor;
}

- (UIViewController)alternateContentViewController
{
  return self->_alternateContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateContentViewController, 0);
  objc_storeStrong((id *)&self->_preferredControlTintColor, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_scrollObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_customizationDataSource);
  objc_storeStrong((id *)&self->_expandedSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_wallpaperManager, 0);
  objc_storeStrong((id *)&self->_wallpaperDefaultsObservation, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
  objc_storeStrong((id *)&self->_rootCollectionViewController, 0);
  objc_storeStrong((id *)&self->_originalNavigationStack, 0);
  objc_storeStrong((id *)&self->_searchFieldBackgroundView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_foregroundScrollView, 0);
  objc_storeStrong((id *)&self->_unfocusGesture, 0);
  objc_storeStrong((id *)&self->_dataSourceObservers, 0);
}

@end
