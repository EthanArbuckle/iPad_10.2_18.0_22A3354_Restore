@implementation HUDashboardNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;
  char v12;

  v4 = a4;
  v6 = a3;
  if (-[HUDashboardNavigationController _shouldDisableAnimationForViewController:](self, "_shouldDisableAnimationForViewController:", v6)&& v4)
  {
    -[HUDashboardNavigationController _loadWallpaperForViewController:]((uint64_t)self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__HUDashboardNavigationController_pushViewController_animated___block_invoke;
    v10[3] = &unk_1E6F5B700;
    v10[4] = self;
    v11 = v6;
    v12 = 1;
    v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HUDashboardNavigationController;
    -[HUDashboardNavigationController pushViewController:animated:](&v9, sel_pushViewController_animated_, v6, v4);
  }

}

- (BOOL)_shouldDisableAnimationForViewController:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "overrideDashboardTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13 == 0;

  }
  v14 = objc_msgSend(v6, "isOverlay");
  objc_msgSend(v6, "itemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "backgroundStyle");

  v18 = (v17 != 1) & ~v14;
  if (v10)
    v18 = 0;
  if (v6)
    v19 = v18;
  else
    v19 = 0;
  if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
  {
    LOBYTE(v19) = 0;
  }
  else if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro") & 1) == 0
         && (objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad") & 1) == 0)
  {
    v19 &= objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  }

  return v19;
}

- (HUDashboardFilterBarController)filterBarController
{
  HUDashboardFilterBarController *filterBarController;
  HUDashboardFilterBarController *v4;
  HUDashboardFilterBarController *v5;

  filterBarController = self->_filterBarController;
  if (!filterBarController)
  {
    v4 = (HUDashboardFilterBarController *)objc_opt_new();
    v5 = self->_filterBarController;
    self->_filterBarController = v4;

    -[HUDashboardFilterBarController setDelegate:](self->_filterBarController, "setDelegate:", self);
    filterBarController = self->_filterBarController;
  }
  return filterBarController;
}

- (id)splitViewController
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[HUDashboardNavigationController parentViewController](self, "parentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_opt_class();
    -[HUDashboardNavigationController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v3 = v9;

  }
  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  id v5;
  int v6;

  objc_opt_class();
  -[HUDashboardNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "isBackgroundVisible");
  return v6 ^ 1u;
}

- (id)childViewControllerForStatusBarStyle
{
  void *v3;
  void *v4;

  -[HUDashboardNavigationController navigationBar](self, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[HUDashboardNavigationController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)dashboardFilterBarController:(id)a3 didUpdatePreferredHeight:(double)a4
{
  id v6;

  +[HUDashboardPresentationManager sharedManager](HUDashboardPresentationManager, "sharedManager", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController:didUpdatePreferredPaletteHeight:", self, a4);

}

- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[HUDashboardPresentationManager sharedManager](HUDashboardPresentationManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController:willPushItem:", self, v5);

  return 1;
}

- (HUDashboardNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  HUDashboardNavigationController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUDashboardNavigationController;
  v4 = -[HUDashboardNavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
  if (v4)
  {
    +[HUDashboardPresentationManager sharedManager](HUDashboardPresentationManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardNavigationController setDelegate:](v4, "setDelegate:", v5);

  }
  return v4;
}

- (void)navigationBar:(id)a3 didPushItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[HUDashboardPresentationManager sharedManager](HUDashboardPresentationManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController:didPushItem:", self, v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUDashboardNavigationController;
  -[HUDashboardNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if (-[HUDashboardNavigationController shouldUseCustomTabBarAppearance](self, "shouldUseCustomTabBarAppearance"))
      -[HUDashboardNavigationController _setUpTabBar](self, "_setUpTabBar");
  }
}

- (void)_setUpTabBar
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CEABE0], "hu_dashboardBarEffects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundEffects:", v4);

  v24 = *MEMORY[0x1E0CEA0A0];
  v5 = v24;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackedLayoutAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleTextAttributes:", v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackedLayoutAppearance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIconColor:", v10);

  v22 = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackedLayoutAppearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "normal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitleTextAttributes:", v14);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stackedLayoutAppearance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "normal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIconColor:", v17);

  -[HUDashboardNavigationController tabBarItem](self, "tabBarItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStandardAppearance:", v3);

  -[HUDashboardNavigationController tabBarItem](self, "tabBarItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScrollEdgeAppearance:", v3);

}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  return !-[HUDashboardNavigationController popToBottomNavigationControllerWithCustomAnimation](self, "popToBottomNavigationControllerWithCustomAnimation", a3, a4);
}

- (void)navigationBar:(id)a3 didChangeBackgroundVisibility:(BOOL)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9F0]), "initWithDefaultParameters");
  objc_msgSend(v5, "setSkipFencing:", 1);
  -[HUDashboardNavigationController _setNeedsStatusBarAppearanceUpdateWithAnimationParameters:](self, "_setNeedsStatusBarAppearanceUpdateWithAnimationParameters:", v5);

}

- (HUDashboardNavigator)dashboardNavigator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[HUDashboardNavigationController tabBarController](self, "tabBarController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUDashboardNavigationController tabBarController](self, "tabBarController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUDashboardNavigationController splitViewController](self, "splitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
LABEL_10:
      v9 = 0;
      return (HUDashboardNavigator *)v9;
    }
    -[HUDashboardNavigationController splitViewController](self, "splitViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2E7E60))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v8, "dashboardNavigator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUDashboardNavigator *)v9;
}

- (id)_editActionDelegate
{
  void *v2;
  void *v3;
  id v4;

  -[HUDashboardNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2E7F50))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)editActionTitle
{
  void *v2;
  void *v3;

  -[HUDashboardNavigationController _editActionDelegate](self, "_editActionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editActionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)editActionTitleLocalizationKey
{
  void *v2;
  void *v3;

  -[HUDashboardNavigationController _editActionDelegate](self, "_editActionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editActionTitleLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsEditing
{
  void *v2;
  char v3;

  -[HUDashboardNavigationController _editActionDelegate](self, "_editActionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsEditing");

  return v3;
}

- (void)startEditing
{
  void *v3;
  id v4;

  -[HUDashboardNavigationController _editActionDelegate](self, "_editActionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startEditing");

  -[HUDashboardNavigationController filterBarController](self, "filterBarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:animated:", 1, 1);

}

- (void)endEditing
{
  void *v3;
  id v4;

  -[HUDashboardNavigationController _editActionDelegate](self, "_editActionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing");

  -[HUDashboardNavigationController filterBarController](self, "filterBarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:animated:", 0, 1);

}

- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  -[HUDashboardNavigationController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2E7F50))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "sendContextMenuMetricsWithTitleLocalizationKey:", v9);

}

- (id)_loadWallpaperForViewController:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v6, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D319F8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(v8, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "wallpaperForHomeKitObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "flatMap:", &__block_literal_global_215);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __63__HUDashboardNavigationController_pushViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HUWallpaperView *v26;
  void *v27;
  HUWallpaperView *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  HUWallpaperView *v52;
  void *v53;
  HUWallpaperView *v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  HUWallpaperView *v70;
  HUWallpaperView *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  objc_super v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  HUWallpaperView *v82;
  HUWallpaperView *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  HUWallpaperView *v88;
  uint64_t *v89;
  objc_super v90;
  objc_super v91;
  uint64_t v92;
  double *v93;
  uint64_t v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  CGRect v98;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (a2)
  {
    v5 = v2;
    v76 = a2;
    if (v3)
    {
      objc_opt_class();
      objc_msgSend(v3, "splitViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v8 = v7;

      objc_opt_class();
      objc_msgSend(v8, "viewControllerForColumn:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      objc_opt_class();
      v12 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v75 = v13;

      objc_msgSend(v8, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subviews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "na_firstObjectPassingTest:", &__block_literal_global_95);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v92 = 0;
      v93 = (double *)&v92;
      v94 = 0x4010000000;
      v95 = &unk_1B94F0049;
      v96 = 0u;
      v97 = 0u;
      objc_msgSend(v3, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "frame");
      *(_QWORD *)&v96 = v18;
      *((_QWORD *)&v96 + 1) = v19;
      *(_QWORD *)&v97 = v20;
      *((_QWORD *)&v97 + 1) = v21;

      v22 = v93;
      *((_OWORD *)v93 + 2) = *MEMORY[0x1E0C9D538];
      objc_msgSend(v16, "setFrame:", v22[4], v22[5], v22[6], v22[7]);
      v73 = v5;
      objc_msgSend(v8, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      objc_msgSend(v23, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
      v25 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addSubview:", v25);
      v72 = (void *)v25;
      v26 = [HUWallpaperView alloc];
      objc_msgSend(v8, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "frame");
      v28 = -[HUWallpaperView initWithFrame:](v26, "initWithFrame:");

      objc_msgSend(v8, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(v3, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "convertRect:toView:", v39, v32, v34, v36, v38);
      -[HUWallpaperView setFrame:](v28, "setFrame:");

      objc_msgSend(v75, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "insertSubview:atIndex:", v28, 0);

      -[HUWallpaperView populateWallpaper:withAnimation:onlyIfNeeded:](v28, "populateWallpaper:withAnimation:onlyIfNeeded:", v76, 0, 0);
      if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro", v25) & 1) != 0)
      {
        objc_msgSend(v12, "view", v72);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "snapshotViewAfterScreenUpdates:", 1);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v91.receiver = v3;
        v91.super_class = (Class)HUDashboardNavigationController;
        objc_msgSendSuper2(&v91, sel_pushViewController_animated_, v12, 0);
        objc_msgSend(v3, "view");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "snapshotViewAfterScreenUpdates:", 1);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      v44 = (void *)v42;

      objc_msgSend(v44, "frame");
      v45 = v93;
      *((_QWORD *)v93 + 4) = v46;
      *((_QWORD *)v45 + 5) = v47;
      *((_QWORD *)v45 + 6) = v48;
      *((_QWORD *)v45 + 7) = v49;
      objc_msgSend(v3, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "frame");
      v93[4] = CGRectGetWidth(v98);

      objc_msgSend(v44, "setFrame:", v93[4], v93[5], v93[6], v93[7]);
      objc_msgSend(v16, "addSubview:", v44);
      objc_msgSend(v3, "view");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addSubview:", v16);

      if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro"))
      {
        v90.receiver = v3;
        v90.super_class = (Class)HUDashboardNavigationController;
        objc_msgSendSuper2(&v90, sel_pushViewController_animated_, v12, 0);
      }
      v52 = [HUWallpaperView alloc];
      objc_msgSend(v8, "view");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "frame");
      v54 = -[HUWallpaperView initWithFrame:](v52, "initWithFrame:");

      -[HUWallpaperView frame](v54, "frame");
      v55 = v93;
      *((_QWORD *)v93 + 4) = v56;
      *((_QWORD *)v55 + 5) = v57;
      *((_QWORD *)v55 + 6) = v58;
      *((_QWORD *)v55 + 7) = v59;
      objc_msgSend(v11, "view");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "frame");
      v93[4] = -v61;

      -[HUWallpaperView setFrame:](v54, "setFrame:", v93[4], v93[5], v93[6], v93[7]);
      objc_msgSend(v11, "view");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "insertSubview:atIndex:", v54, 0);

      -[HUWallpaperView populateWallpaper:withAnimation:onlyIfNeeded:](v54, "populateWallpaper:withAnimation:onlyIfNeeded:", v76, 0, 0);
      -[HUWallpaperView setAlpha:](v54, "setAlpha:", 0.0);
      v63 = (void *)MEMORY[0x1E0CEABB0];
      v64 = MEMORY[0x1E0C809B0];
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_2;
      v84[3] = &unk_1E6F5B7F8;
      v89 = &v92;
      v65 = v44;
      v85 = v65;
      v66 = v72;
      v86 = v66;
      v67 = v11;
      v87 = v67;
      v88 = v54;
      v78[0] = v64;
      v78[1] = 3221225472;
      v78[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_5;
      v78[3] = &unk_1E6F5B820;
      v68 = v74;
      v79 = v68;
      v80 = v76;
      v69 = v16;
      v81 = v69;
      v70 = v28;
      v82 = v70;
      v71 = v88;
      v83 = v71;
      objc_msgSend(v63, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v84, v78, 0.6, 0.0);

      _Block_object_dispose(&v92, 8);
      v5 = v73;
    }

  }
  else
  {
    v43 = *(unsigned __int8 *)(a1 + 48);
    v77.receiver = *(id *)(a1 + 32);
    v77.super_class = (Class)HUDashboardNavigationController;
    objc_msgSendSuper2(&v77, sel_pushViewController_animated_, v2, v43);
  }
}

- (BOOL)popToBottomNavigationControllerWithCustomAnimation
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];

  -[HUDashboardNavigationController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUDashboardNavigationController _shouldDisableAnimationForViewController:](self, "_shouldDisableAnimationForViewController:", v3);

  if (v4)
  {
    -[HUDashboardNavigationController bottomViewController](self, "bottomViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardNavigationController _loadWallpaperForViewController:]((uint64_t)self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__HUDashboardNavigationController_popToBottomNavigationControllerWithCustomAnimation__block_invoke;
    v9[3] = &unk_1E6F5B728;
    v9[4] = self;
    v7 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

  }
  return v4;
}

void __85__HUDashboardNavigationController_popToBottomNavigationControllerWithCustomAnimation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HUWallpaperView *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  void *v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  HUWallpaperView *v53;
  void *v54;
  HUWallpaperView *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  HUWallpaperView *v83;
  void *v84;
  HUWallpaperView *v85;
  double *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  HUWallpaperView *v100;
  HUWallpaperView *v101;
  HUWallpaperView *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  HUWallpaperView *v108;
  id v109;
  objc_super v110;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  HUWallpaperView *v115;
  HUWallpaperView *v116;
  HUWallpaperView *v117;
  _QWORD v118[4];
  id v119;
  id v120;
  void *v121;
  HUWallpaperView *v122;
  uint64_t *v123;
  objc_super v124;
  objc_super v125;
  uint64_t v126;
  double *v127;
  uint64_t v128;
  void *v129;
  __int128 v130;
  __int128 v131;
  CGRect v132;
  CGRect v133;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v109 = a2;
    if (v2)
    {
      objc_opt_class();
      objc_msgSend(v2, "splitViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = v3;
      else
        v4 = 0;
      v5 = v4;

      objc_opt_class();
      objc_msgSend(v5, "viewControllerForColumn:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
      v107 = v7;

      objc_opt_class();
      objc_msgSend(v2, "bottomViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v106 = v9;

      objc_msgSend(v5, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "na_firstObjectPassingTest:", &__block_literal_global_102_0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = v12;
      objc_msgSend(v12, "setDisableWallpaperUpdate:", 1);
      v13 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      v126 = 0;
      v127 = (double *)&v126;
      v128 = 0x4010000000;
      v129 = &unk_1B94F0049;
      v130 = 0u;
      v131 = 0u;
      objc_msgSend(v2, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      *(_QWORD *)&v130 = v15;
      *((_QWORD *)&v130 + 1) = v16;
      *(_QWORD *)&v131 = v17;
      *((_QWORD *)&v131 + 1) = v18;

      v19 = v127;
      *((_OWORD *)v127 + 2) = *MEMORY[0x1E0C9D538];
      objc_msgSend(v13, "setFrame:", v19[4], v19[5], v19[6], v19[7]);
      objc_msgSend(v5, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      objc_msgSend(v20, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
      v22 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "addSubview:", v22);
      v103 = v22;
      v23 = [HUWallpaperView alloc];
      objc_msgSend(v5, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v108 = -[HUWallpaperView initWithFrame:](v23, "initWithFrame:");

      objc_msgSend(v5, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frame");
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v2, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "convertRect:toView:", v35, v28, v30, v32, v34);
      -[HUWallpaperView setFrame:](v108, "setFrame:");

      objc_msgSend(v106, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "insertSubview:atIndex:", v108, 0);

      -[HUWallpaperView populateWallpaper:withAnimation:onlyIfNeeded:](v108, "populateWallpaper:withAnimation:onlyIfNeeded:", v109, 0, 0);
      if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
      {
        objc_msgSend(v106, "view", v103);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "snapshotViewAfterScreenUpdates:", 1);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v125.receiver = v2;
        v125.super_class = (Class)HUDashboardNavigationController;
        v40 = objc_msgSendSuper2(&v125, sel_popViewControllerAnimated_, 0, v103);
        objc_msgSend(v2, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "snapshotViewAfterScreenUpdates:", 1);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v41 = (void *)v38;

      objc_msgSend(v41, "frame");
      v42 = v127;
      *((_QWORD *)v127 + 4) = v43;
      *((_QWORD *)v42 + 5) = v44;
      *((_QWORD *)v42 + 6) = v45;
      *((_QWORD *)v42 + 7) = v46;
      objc_msgSend(v2, "view");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "frame");
      v127[4] = -CGRectGetWidth(v132);

      objc_msgSend(v41, "setFrame:", v127[4], v127[5], v127[6], v127[7]);
      objc_msgSend(v13, "addSubview:", v41);
      objc_msgSend(v2, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addSubview:", v13);

      if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
      {
        v124.receiver = v2;
        v124.super_class = (Class)HUDashboardNavigationController;
        v49 = objc_msgSendSuper2(&v124, sel_popViewControllerAnimated_, 0);
        objc_msgSend(v2, "filterBarController");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "collectionView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "effectiveUserInterfaceLayoutDirection");

        v53 = [HUWallpaperView alloc];
        objc_msgSend(v5, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "frame");
        v55 = -[HUWallpaperView initWithFrame:](v53, "initWithFrame:");

        objc_msgSend(v5, "view");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "view");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "frame");
        v59 = v58;
        v61 = v60;
        v63 = v62;
        v65 = v64;
        objc_msgSend(v2, "filterBarController");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "collectionView");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "convertRect:toView:", v67, v59, v61, v63, v65);
        -[HUWallpaperView setFrame:](v55, "setFrame:");

        if (v52 == 1)
        {
          -[HUWallpaperView frame](v55, "frame");
          v68 = v127;
          *((_QWORD *)v127 + 5) = v69;
          *((_QWORD *)v68 + 6) = v70;
          *((_QWORD *)v68 + 7) = v71;
          v68[4] = 0.0;
          -[HUWallpaperView setFrame:](v55, "setFrame:", 0.0);
        }
        objc_msgSend(v2, "filterBarController");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "collectionView");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "insertSubview:atIndex:", v55, 0);

        -[HUWallpaperView populateWallpaper:withAnimation:onlyIfNeeded:](v55, "populateWallpaper:withAnimation:onlyIfNeeded:", v109, 0, 0);
        objc_msgSend(v2, "filterBarController");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "collectionView");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "snapshotViewAfterScreenUpdates:", 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v76, "frame");
        v77 = v127;
        *((_QWORD *)v127 + 4) = v78;
        *((_QWORD *)v77 + 5) = v79;
        *((_QWORD *)v77 + 6) = v80;
        *((_QWORD *)v77 + 7) = v81;
        objc_msgSend(v2, "navigationBar");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "frame");
        v127[5] = CGRectGetMinY(v133);

        objc_msgSend(v76, "setFrame:", v127[4], v127[5], v127[6], v127[7]);
        objc_msgSend(v41, "addSubview:", v76);

      }
      else
      {
        v55 = 0;
      }
      v83 = [HUWallpaperView alloc];
      objc_msgSend(v5, "view");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "frame");
      v85 = -[HUWallpaperView initWithFrame:](v83, "initWithFrame:");

      -[HUWallpaperView frame](v85, "frame");
      v86 = v127;
      *((_QWORD *)v127 + 4) = v87;
      *((_QWORD *)v86 + 5) = v88;
      *((_QWORD *)v86 + 6) = v89;
      *((_QWORD *)v86 + 7) = v90;
      objc_msgSend(v107, "view");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "frame");
      v127[4] = -v92;

      -[HUWallpaperView setFrame:](v85, "setFrame:", v127[4], v127[5], v127[6], v127[7]);
      objc_msgSend(v107, "view");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "insertSubview:atIndex:", v85, 0);

      -[HUWallpaperView populateWallpaper:withAnimation:onlyIfNeeded:](v85, "populateWallpaper:withAnimation:onlyIfNeeded:", v109, 0, 0);
      -[HUWallpaperView setAlpha:](v85, "setAlpha:", 0.0);
      v94 = (void *)MEMORY[0x1E0CEABB0];
      v95 = MEMORY[0x1E0C809B0];
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_2;
      v118[3] = &unk_1E6F5B7F8;
      v123 = &v126;
      v96 = v41;
      v119 = v96;
      v97 = v104;
      v120 = v97;
      v121 = v2;
      v122 = v85;
      v111[0] = v95;
      v111[1] = 3221225472;
      v111[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_5;
      v111[3] = &unk_1E6F4DFF8;
      v98 = v105;
      v112 = v98;
      v113 = v109;
      v99 = v13;
      v114 = v99;
      v100 = v108;
      v115 = v100;
      v101 = v122;
      v116 = v101;
      v102 = v55;
      v117 = v102;
      objc_msgSend(v94, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v118, v111, 0.6, 0.0);

      _Block_object_dispose(&v126, 8);
    }

  }
  else
  {
    v110.receiver = *(id *)(a1 + 32);
    v110.super_class = (Class)HUDashboardNavigationController;
    v39 = objc_msgSendSuper2(&v110, sel_popViewControllerAnimated_, 0);
  }
}

uint64_t __67__HUDashboardNavigationController__loadWallpaperForViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", a2);
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_3;
  v7[3] = &unk_1E6F5B7D0;
  v11 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 1.0);
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_4;
  v5[3] = &unk_1E6F4D988;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.85, 0.15);

}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CGRect v14;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  objc_msgSend(*(id *)(a1 + 48), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = -CGRectGetMaxX(v14);

  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __89__HUDashboardNavigationController__customAnimationForHomeVCToDetailVC_detailVCWallpaper___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisableWallpaperUpdate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "populateWallpaper:withAnimation:onlyIfNeeded:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_3;
  v9[3] = &unk_1E6F5B7D0;
  v13 = *(_QWORD *)(a1 + 64);
  v10 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v11 = v4;
  v12 = v5;
  objc_msgSend(v2, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v9, 0.0, 1.0);
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_4;
  v7[3] = &unk_1E6F4D988;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v6, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.05, 0.1);

}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CGRect v14;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
  objc_msgSend(*(id *)(a1 + 40), "frame");
  v7 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
  v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  objc_msgSend(*(id *)(a1 + 48), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = CGRectGetWidth(v14);

  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 56));
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __93__HUDashboardNavigationController__customAnimationForPoppingBackToHomeVCWithHomeVCWallpaper___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisableWallpaperUpdate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "populateWallpaper:withAnimation:onlyIfNeeded:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 72), "removeFromSuperview");
}

- (UINavigationBar)displayedNavigationBar
{
  return self->_displayedNavigationBar;
}

- (void)setDisplayedNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_displayedNavigationBar, a3);
}

- (UIView)duplicateWallpaperView
{
  return self->_duplicateWallpaperView;
}

- (void)setDuplicateWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateWallpaperView, a3);
}

- (BOOL)shouldUseCustomTabBarAppearance
{
  return self->_shouldUseCustomTabBarAppearance;
}

- (void)setShouldUseCustomTabBarAppearance:(BOOL)a3
{
  self->_shouldUseCustomTabBarAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateWallpaperView, 0);
  objc_storeStrong((id *)&self->_displayedNavigationBar, 0);
  objc_storeStrong((id *)&self->_filterBarController, 0);
}

@end
