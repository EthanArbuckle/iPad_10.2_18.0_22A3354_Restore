@implementation HUDashboardViewController

- (BOOL)shouldHideNavigationBarButton:(id)a3
{
  id v4;
  int v5;
  void *v7;
  int v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
    || (-[HUDashboardViewController isEditing](self, "isEditing") & 1) != 0
    && (objc_msgSend(v4, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Done")),
        v7,
        !v8))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Done"));

    if (v10)
    {
      v11 = -[HUDashboardViewController isEditing](self, "isEditing");
LABEL_11:
      LOBYTE(v5) = v11 ^ 1;
      goto LABEL_4;
    }
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Announce"));

    if (v13)
    {
      v11 = -[HUDashboardViewController shouldShowAnnounceButton](self, "shouldShowAnnounceButton");
      goto LABEL_11;
    }
    objc_msgSend(v4, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Add"));

    if (v15)
    {
      -[HUDashboardViewController context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v16, "allowsAdding") ^ 1;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("HomesAndRooms"));

      if (!v18)
      {
        LOBYTE(v5) = 0;
        goto LABEL_4;
      }
      -[HUDashboardViewController context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "allowsHomeNavigation"))
      {
        -[HUDashboardViewController context](self, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "home");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade"))
        {
          objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "homeManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "homes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = objc_msgSend(v23, "count") == 1;

        }
        else
        {
          LOBYTE(v5) = 0;
        }

      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }

  }
LABEL_4:

  return v5;
}

- (void)_updateHomeEnergyIndicatorVisibility
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HUEnergyIndicatorAccessoryView *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HUEnergyIndicatorAccessoryView *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  HUDashboardViewController *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isGridForecastVisible");

  -[HUDashboardViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_isHomeEnergyHomeEmpty");

  -[HUDashboardViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "allowsEnergyIndicator"))
    v10 = v5 & (v8 ^ 1);
  else
    v10 = 0;

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HUDashboardViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138413570;
    v29 = self;
    v30 = 2080;
    v31 = "-[HUDashboardViewController(NavigationBar) _updateHomeEnergyIndicatorVisibility]";
    v32 = 1024;
    v33 = v10;
    v34 = 1024;
    v35 = objc_msgSend(v12, "allowsEnergyIndicator");
    v36 = 1024;
    v37 = v5;
    v38 = 1024;
    v39 = v8 ^ 1;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%s setting Indicator visibility to %{BOOL}d (contextAllows = %{BOOL}d, isGridForecastVisible = %{BOOL}d, NOT isHomeEnergyHomeEmpty = %{BOOL}d", (uint8_t *)&v28, 0x2Eu);

  }
  if (v10)
  {
    -[HUDashboardViewController energyIndicatorViewController](self, "energyIndicatorViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HUDashboardViewController energyIndicatorViewController](self, "energyIndicatorViewController");
      v14 = (HUEnergyIndicatorAccessoryView *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUEnergyIndicatorAccessoryViewWrapper updateWithEnergyIndicatorView:with:](HUEnergyIndicatorAccessoryViewWrapper, "updateWithEnergyIndicatorView:with:", v14, v16);
    }
    else
    {
      -[HUDashboardViewController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUEnergyIndicatorAccessoryViewWrapper createEnergyIndicatorViewWithHome:](HUEnergyIndicatorAccessoryViewWrapper, "createEnergyIndicatorViewWithHome:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController setEnergyIndicatorViewController:](self, "setEnergyIndicatorViewController:", v21);

      -[HUDashboardViewController energyIndicatorViewController](self, "energyIndicatorViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v24 = [HUEnergyIndicatorAccessoryView alloc];
      -[HUDashboardViewController energyIndicatorViewController](self, "energyIndicatorViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HUEnergyIndicatorAccessoryView initWithEnergyIndicator:](v24, "initWithEnergyIndicator:", v26);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_homeEnergyNavigationBarIndicatorTapped_);
      -[HUEnergyIndicatorAccessoryView addGestureRecognizer:](v14, "addGestureRecognizer:", v15);
      -[HUEnergyIndicatorAccessoryView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 1);
      -[HUDashboardViewController navigationItem](self, "navigationItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_setLargeTitleAccessoryView:alignToBaseline:", v14, 0);

      -[HUDashboardViewController navigationItem](self, "navigationItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_setSupportsTwoLineLargeTitles:", 1);
    }

    -[HUDashboardViewController _updateHomeEnergyTipVisibility](self, "_updateHomeEnergyTipVisibility");
  }
  else
  {
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412546;
      v29 = self;
      v30 = 2080;
      v31 = "-[HUDashboardViewController(NavigationBar) _updateHomeEnergyIndicatorVisibility]";
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%s Not creating Indicator", (uint8_t *)&v28, 0x16u);
    }

    -[HUDashboardViewController _updateHomeEnergyTipVisibility](self, "_updateHomeEnergyTipVisibility");
    -[HUDashboardViewController setEnergyIndicatorViewController:](self, "setEnergyIndicatorViewController:", 0);
    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setLargeTitleAccessoryView:alignToBaseline:", 0, 0);

  }
}

- (UIViewController)energyIndicatorViewController
{
  return self->_energyIndicatorViewController;
}

- (void)_updateHomeEnergyTipVisibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_isGridForecastEnabled"))
  {
    -[HUDashboardViewController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsEnergyIndicator");

  }
  else
  {
    v6 = 0;
  }

  -[HUDashboardViewController changeHomeEnergyTipShouldDisplayTo:](self, "changeHomeEnergyTipShouldDisplayTo:", v6);
}

- (BOOL)shouldShowAnnounceButton
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "allowsAnnounce"))
  {
    v5 = 0;
LABEL_12:

    return v5;
  }
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEmptyDashboard") & 1) != 0)
  {
    v5 = 0;
LABEL_11:

    goto LABEL_12;
  }
  -[HUDashboardViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_shouldBlockCurrentUserFromHome");

  if ((v8 & 1) == 0)
  {
    -[HUDashboardViewController context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUDashboardViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v11;
    if (v10)
    {
      objc_msgSend(v11, "room");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "hf_shouldShowAnnounceButtonForThisRoom");
    }
    else
    {
      objc_msgSend(v11, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "hf_shouldShowAnnounceButtonForThisHome");
    }
    v5 = v12;
    goto LABEL_11;
  }
  return 0;
}

- (HUDashboardLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (id)roomForNavigationBarButton:(id)a3
{
  void *v3;
  void *v4;

  -[HUDashboardViewController context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tipsObserver
{
  return self->_tipsObserver;
}

- (UIViewController)tipPopoverController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_tipPopoverController);
}

- (void)setTipsObserver:(id)a3
{
  objc_storeStrong(&self->_tipsObserver, a3);
}

- (void)setEnergyIndicatorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_energyIndicatorViewController, a3);
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideDashboardTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)HUDashboardViewController;
  return -[HUItemCollectionViewController automaticallyUpdatesViewControllerTitle](&v7, sel_automaticallyUpdatesViewControllerTitle);
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController diffableDataItemManager:didUpdateItems:addItems:removeItems:](&v11, sel_diffableDataItemManager_didUpdateItems_addItems_removeItems_, a3, a4, a5, a6);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overrideDashboardTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

  }
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  double v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  char v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  objc_super v94;

  v6 = a3;
  v7 = a4;
  v94.receiver = self;
  v94.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController configureCell:forItem:](&v94, sel_configureCell_forItem_, v6, v7);
  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  v11 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v7, "latestResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D30DB8];
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DB8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16 || !v13)
    goto LABEL_22;
  v17 = objc_opt_class();
  v18 = v11;
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v18;
    if (v19)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

    v10 = v22;
  }
  v20 = 0;
LABEL_16:

  objc_msgSend(v20, "viewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_opt_class();
    objc_msgSend(v7, "latestResults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47BD0]), "initWithRouteUID:", v28);
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(v29, "setLayout:", 3);
    objc_msgSend(v29, "setSupportsHorizontalLayout:", 1);
    objc_msgSend(v29, "setContext:", 3);
    v31 = (void *)objc_opt_new();
    objc_msgSend(v29, "setStylingProvider:", v31);

    objc_msgSend(v20, "setAllowSelfSizing:", 1);
    objc_msgSend(v20, "setUseDefaultCellBackgroundColor:", 1);
    objc_msgSend(v20, "setViewController:", v29);

  }
LABEL_22:
  v32 = v11;
  if (objc_msgSend(v32, "conformsToProtocol:", &unk_1EF2426E0))
    v33 = v32;
  else
    v33 = 0;
  v34 = v33;

  if (v34)
  {
    -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      NSLog(CFSTR("blur Grouping shouldn't ever be nil for dashboard"));
    -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundEffectGrouper:", v36);

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2AC0A8))
  {
    v92 = v34;
    v37 = v13;
    v38 = v10;
    objc_opt_class();
    v39 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;
    v41 = v40;

    objc_msgSend(v41, "setDelegate:", self);
    objc_msgSend(v41, "setToggleable:", -[HUControllableItemCollectionViewController itemSupportsToggleInteraction:](self, "itemSupportsToggleInteraction:", v7));
    -[HUDashboardViewController layoutManager](self, "layoutManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "gridSizeForItem:", v7);
    objc_msgSend(v41, "setGridSize:", v43, v44);

    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "indexPathForItem:", v7);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v47, "section"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v48, "isEqualToString:", CFSTR("favoritesSection")))
    {
      objc_msgSend(v41, "setShowPrefixLabel:", 1);
      -[HUDashboardViewController layoutManager](self, "layoutManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "favoritesSectionGridSize");
      objc_msgSend(v41, "setGridSize:", v50, v51);

    }
    if (-[HUDashboardViewController isEditing](self, "isEditing"))
    {
      -[HUDashboardViewController itemShowingSizeToggleButton](self, "itemShowingSizeToggleButton");
      v52 = (id)objc_claimAutoreleasedReturnValue();

      if (v52 == v7)
        v53 = 1.0;
      else
        v53 = 0.0;
      objc_msgSend(v41, "setShowsSizeChangeButton:animated:", v52 == v7, 0);
      objc_msgSend(v41, "layer");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setZPosition:", v53);
      v10 = v38;
      v13 = v37;
      v34 = v92;
LABEL_49:

      goto LABEL_50;
    }
    v10 = v38;
    v13 = v37;
    v34 = v92;
    goto LABEL_50;
  }
  objc_opt_class();
  v41 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v55 = v41;
  else
    v55 = 0;
  v56 = v55;

  if (!v56)
  {
    objc_msgSend(v10, "alwaysAllowedScheduleItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqual:", v48) & 1) == 0)
    {
      objc_msgSend(v10, "pinCodeAccessItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v41, "isEqual:", v54) & 1) == 0)
      {
        objc_msgSend(v10, "homeKeyItem");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v41, "isEqual:", v57);

        if ((v58 & 1) != 0)
        {
          v41 = 0;
          goto LABEL_51;
        }
        objc_msgSend(v10, "contactOwnerItem");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v41, "isEqual:", v59);

        if (v60)
        {
          objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "latestResults");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setText:", v62);

          objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "textProperties");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setColor:", v63);

          objc_msgSend(v48, "textProperties");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setAlignment:", 1);

          objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB588], 2, 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v54, 0.0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "textProperties");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setFont:", v66);

          objc_msgSend(v32, "setContentConfiguration:", v48);
          objc_msgSend(MEMORY[0x1E0CEA370], "listGroupedCellConfiguration");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setCornerRadius:", 16.0);
          objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setBackgroundColor:", v69);

          objc_msgSend(v32, "setBackgroundConfiguration:", v68);
        }
        else
        {
          objc_msgSend(v10, "accessoryNoAccessItem");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v41, "isEqual:", v70);

          objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "latestResults");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setText:", v73);

          if (v71)
          {
            objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "textProperties");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setColor:", v74);

            objc_msgSend(v48, "textProperties");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setAlignment:", 1);

            v93 = *MEMORY[0x1E0CEB588];
            objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v54, 0.0);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "textProperties");
            v78 = v34;
            v79 = v13;
            v80 = v10;
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setFont:", v77);

            v10 = v80;
            v13 = v79;
            v34 = v78;

            objc_msgSend(v41, "latestResults");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BF8]);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setSecondaryText:", v83);

            objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "secondaryTextProperties");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "setColor:", v84);

            objc_msgSend(v48, "secondaryTextProperties");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setAlignment:", 1);

            objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", v93);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v87, 0.0);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "secondaryTextProperties");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setFont:", v88);

            objc_msgSend(v32, "setContentConfiguration:", v48);
            objc_msgSend(MEMORY[0x1E0CEA370], "listGroupedCellConfiguration");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setCornerRadius:", 16.0);
            objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.8, 0.3);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setBackgroundColor:", v91);

            objc_msgSend(v32, "setBackgroundConfiguration:", v90);
          }
          else
          {
            objc_msgSend(v32, "setContentConfiguration:", v48);
            objc_msgSend(MEMORY[0x1E0CEA370], "listGroupedCellConfiguration");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setBackgroundConfiguration:", v54);
          }
        }
      }
      v41 = 0;
      goto LABEL_49;
    }
    v41 = 0;
LABEL_50:

  }
LABEL_51:

}

- (HUBlurGroupingEffectView)blurGroupingEffectView
{
  return self->_blurGroupingEffectView;
}

- (HUDashboardContext)context
{
  void *v2;
  void *v3;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUDashboardContext *)v3;
}

void __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0D319D0];
    objc_msgSend(*(id *)(a1 + 32), "navigationBarButtonIdentifierOrderForEdge:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "comparatorWithSortedObjects:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_4;
    v13[3] = &unk_1E6F5CF28;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v12, "sortedArrayUsingComparator:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_setNavigationButtons:forEdge:", v11, v6);

  }
}

- (id)navigationBarButtonIdentifierOrderForEdge:(unint64_t)a3
{
  uint64_t *v3;
  dispatch_once_t *v5;
  void *v6;

  if (a3 != 8)
  {
    if (qword_1ED580610 == -1)
    {
      v3 = &qword_1ED580618;
      return (id)*v3;
    }
    v5 = &qword_1ED580610;
    v6 = &__block_literal_global_1050;
LABEL_9:
    dispatch_once(v5, v6);
    v3 = v5 + 1;
    return (id)*v3;
  }
  if (_MergedGlobals_7 != -1)
  {
    v5 = &_MergedGlobals_7;
    v6 = &__block_literal_global_1048;
    goto LABEL_9;
  }
  v3 = &qword_1ED580608;
  return (id)*v3;
}

- (void)_setNavigationButtons:(id)a3 forEdge:(unint64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  if (a4 == 8)
  {
    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItems:", v8);
  }
  else if (a4 == 2)
  {
    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItems:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDashboardViewController.m"), 2852, CFSTR("-setNavigationButtons only supports UIRectEdgeLeft or UIRectEdgeRight"));
  }

}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  HUDashboardViewController *v8;
  char v9;
  uint64_t v11;

  v4 = sub_1B93EB900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v8 = self;
  v9 = HUDashboardViewController.canReorderItem(at:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "section");

  objc_msgSend(v10, "displayedSectionIdentifierForSectionIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("NowPlayingSection"))
    && (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0
    && _os_feature_enabled_impl()
    || objc_msgSend(v12, "isEqualToString:", CFSTR("favoritesSection"))
    || objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2AC0A8))
  {
    objc_opt_class();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v6, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0D30B28];
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B28]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_13:
    objc_opt_class();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    objc_opt_class();
    v22 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (v24)
      goto LABEL_25;
    objc_msgSend(v21, "alwaysAllowedScheduleItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqual:", v25) & 1) == 0)
    {
      objc_msgSend(v21, "pinCodeAccessItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v22, "isEqual:", v26))
      {
        objc_msgSend(v21, "homeKeyItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "isEqual:", v27);

        goto LABEL_25;
      }

    }
LABEL_25:
    objc_opt_class();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v6, "latestResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!object_isClass(v13) || !v13 || (objc_msgSend(v13, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {

    goto LABEL_13;
  }
LABEL_7:

  return (Class)v13;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUDashboardViewController *v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = HUDashboardViewController.layoutSection(forSection:layoutEnvironment:)(a3, a4);
  swift_unknownObjectRelease();

  return v8;
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

  -[HUDashboardViewController tabBarItem](self, "tabBarItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStandardAppearance:", v3);

  -[HUDashboardViewController tabBarItem](self, "tabBarItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setScrollEdgeAppearance:", v3);

}

- (id)displayedItemsInSection:(id)a3
{
  HUDashboardViewController *v4;
  HFItemManager *v5;
  void *v6;
  id v7;
  void *v8;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = (void *)sub_1B93EDD84();
  v7 = -[HFItemManager displayedItemsInSectionWithIdentifier:](v5, sel_displayedItemsInSectionWithIdentifier_, v6);

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B93EDF4C();

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  HUDashboardViewController *v7;
  Swift::String v8;

  v4 = sub_1B93EDDB4();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = HUDashboardViewController.shouldShowHeader(forSection:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)transform:(id)a3
{
  id v4;
  HUDashboardViewController *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setSectionLeadingMargin_, 0.0);
  objc_msgSend(v4, sel_setSectionTrailingMargin_, 0.0);

  return v4;
}

- (BOOL)allowsCondensedAccessoryTiles
{
  HUDashboardViewController *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = HUDashboardViewController.allowsCondensedAccessoryTiles()();

  return v3;
}

- (void)viewLayoutMarginsDidChange
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUDashboardViewController;
  -[HUDashboardViewController viewLayoutMarginsDidChange](&v14, sel_viewLayoutMarginsDidChange);
  -[HUDashboardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HUDashboardViewController _filterBarController](self, "_filterBarController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLayoutMargins:", v5, v7, v9, v11);

}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v10, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3B8]) & 1) == 0)
    NSLog(CFSTR("Asked for a view for an unexpected kind: %@"), v9);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleForSection:", objc_msgSend(v10, "section"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    NSLog(CFSTR("Asked for header for a section without a title: %@"), v10);
  +[HUGridSectionHeaderView reuseIdentifier](HUGridSectionHeaderView, "reuseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v8;
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setOverrideUserInterfaceStyle:", 2);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "plainHeaderConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0CEB5F8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setColor:", v20);

  }
  else
  {
    +[HUCollectionLayoutManager defaultProminentInsetGroupedHeader](HUCollectionLayoutManager, "defaultProminentInsetGroupedHeader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v17, "setText:", v14);
  objc_msgSend(v16, "setContentConfiguration:", v17);
  v22 = (void *)MEMORY[0x1E0CB3940];
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E6F60E80);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@.SectionHeader-%@"), v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v26);

  -[HUDashboardViewController _updateHeaderView:atIndexPath:](self, "_updateHeaderView:atIndexPath:", v16, v10);
  -[HUDashboardViewController context](self, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v27, "canPresentDetailsViewControllerForSectionWithIdentifier:", v12);

  if ((_DWORD)v26)
  {
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __90__HUDashboardViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
    v30[3] = &unk_1E6F4C7A8;
    objc_copyWeak(&v33, &location);
    v31 = v14;
    v32 = v12;
    objc_msgSend(v16, "setActionHandler:", v30);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)_updateHeaderView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[6];

  v6 = a4;
  v7 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "displayedSectionIdentifierForSectionIndex:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HUDashboardViewController__updateHeaderView_atIndexPath___block_invoke;
  v11[3] = &unk_1E6F51BE0;
  v11[4] = self;
  v11[5] = v10;
  objc_msgSend(v7, "setShowsDisclosureIndicator:", __59__HUDashboardViewController__updateHeaderView_atIndexPath___block_invoke((uint64_t)v11));

}

uint64_t __59__HUDashboardViewController__updateHeaderView_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "canPresentDetailsViewControllerForSectionWithIdentifier:", *(_QWORD *)(a1 + 40))
    && (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") & 1) == 0)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isEditing") ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_setupBackgroundView
{
  void *v3;
  void *v4;
  HUBlurGroupingEffectView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  HUBlurGroupingEffectView *v10;
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
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  HUWallpaperView *v32;
  HUWallpaperView *wallpaperView;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  _QWORD v73[6];

  v73[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [HUBlurGroupingEffectView alloc];
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[HUBlurGroupingEffectView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  -[HUDashboardViewController setBlurGroupingEffectView:](self, "setBlurGroupingEffectView:", v10);

  -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUDashboardViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSubview:below:", v13, v14);

  v52 = (void *)MEMORY[0x1E0CB3718];
  -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController view](self, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v64);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v62;
  -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController view](self, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v54);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v50;
  -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v17;
  -[HUDashboardViewController blurGroupingEffectView](self, "blurGroupingEffectView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activateConstraints:", v23);

  if (-[HUDashboardViewController isOverlay](self, "isOverlay")
    || (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") & 1) != 0
    || (-[HUDashboardViewController context](self, "context"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "allowsEditing"),
        v24,
        v25))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleBackgroundTap_);
    v27 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v28);

    objc_msgSend(v27, "addGestureRecognizer:", v26);
    -[HUDashboardViewController collectionView](self, "collectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBackgroundView:", v27);

  }
  -[HUDashboardViewController context](self, "context");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "backgroundStyle");

  if (v31 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v46);
  }
  else
  {
    if (v31 != 2)
      return;
    v32 = -[HUWallpaperView initWithFrame:]([HUWallpaperView alloc], "initWithFrame:", v6, v7, v8, v9);
    wallpaperView = self->_wallpaperView;
    self->_wallpaperView = v32;

    -[HUWallpaperView setTranslatesAutoresizingMaskIntoConstraints:](self->_wallpaperView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUDashboardViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "insertSubview:atIndex:", v35, 0);

    v55 = (void *)MEMORY[0x1E0CB3718];
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController view](self, "view");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "topAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v69);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v67;
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController view](self, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v57);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v53;
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v39;
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v45);

    v46 = v59;
  }

}

- (HUWallpaperView)wallpaperView
{
  return self->_wallpaperView;
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (void)setBlurGroupingEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_blurGroupingEffectView, a3);
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)HUDashboardViewController;
  -[HUItemCollectionViewController hu_preloadContent](&v26, sel_hu_preloadContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "backgroundStyle") == 2)
  {
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    if (v6)
      goto LABEL_8;
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "room");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "refreshWallpaperForHomeKitObject:withAnimation:", v9, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUDashboardViewController context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "refreshWallpaperForHomeKitObject:withAnimation:", v11, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = (void *)MEMORY[0x1E0D519C0];
    v27[0] = v3;
    v27[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "combineAllFutures:scheduler:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v15;
  }

LABEL_8:
  objc_initWeak(&location, self);
  objc_msgSend(v3, "recover:", &__block_literal_global_357);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __46__HUDashboardViewController_hu_preloadContent__block_invoke_2;
  v23[3] = &unk_1E6F4D9D8;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v16, "flatMap:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "shouldRecordExtendedLaunchTime"))
  {
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __46__HUDashboardViewController_hu_preloadContent__block_invoke_3;
    v22[3] = &unk_1E6F514A0;
    v22[4] = self;
    objc_msgSend(v18, "flatMap:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "addCompletionBlock:", &__block_literal_global_360);

  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  return v18;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __objc2_class *v8;
  void *v9;
  void *v10;
  int v11;
  HUBannerItemModuleController *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HUDashboardCameraItemModuleController *v19;

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusItemModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    v8 = HUStatusItemModuleController;
LABEL_12:
    v13 = objc_msgSend([v8 alloc], "initWithModule:", v4);
    goto LABEL_13;
  }
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bannerItemModule");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqual:", v10);

  if (v11)
  {
    v12 = -[HUBannerItemModuleController initWithModule:host:delegate:]([HUBannerItemModuleController alloc], "initWithModule:host:delegate:", v4, self, self);
    -[HUDashboardViewController setBannerItemModuleController:](self, "setBannerItemModuleController:", v12);

    -[HUDashboardViewController bannerItemModuleController](self, "bannerItemModuleController");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = HUDashboardActionSetItemModuleController;
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUDashboardViewController context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[HUDashboardViewController context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "cameraPresentationStyle");

      }
      else
      {
        v16 = 1;
      }

      v19 = -[HUDashboardCameraItemModuleController initWithModule:cameraPresentationStyle:]([HUDashboardCameraItemModuleController alloc], "initWithModule:cameraPresentationStyle:", v4, v16);
      -[HUDashboardViewController setCameraItemModuleController:](self, "setCameraItemModuleController:", v19);

      -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = HUServicePlaceholderItemModuleController;
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUDashboardViewController createDashboardTipModuleControllerWithModule:](self, "createDashboardTipModuleControllerWithModule:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = 0;
        goto LABEL_14;
      }
      -[HUDashboardViewController createEnergyDashboardModuleControllerWith:](self, "createEnergyDashboardModuleControllerWith:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_13:
  v17 = (void *)v13;
LABEL_14:

  return v17;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  -[HUDashboardViewController setViewIsFullyVisible:](self, "setViewIsFullyVisible:", 1);
  -[HUDashboardViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31130], "energyAccessoryTypeGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[HUDashboardViewController energyCategoryViewStartTime](self, "energyCategoryViewStartTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      HFLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[HUDashboardViewController energyCategoryViewStartTime](self, "energyCategoryViewStartTime");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Expected energyCategoryViewStartTime to be nil when displaying the view but found value: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController setEnergyCategoryViewStartTime:](self, "setEnergyCategoryViewStartTime:", v9);

  }
  -[HUDashboardViewController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "filterPresentationStyle");

  if (v11 == 2)
    -[HUDashboardViewController _clipToNavigationBar](self, "_clipToNavigationBar");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController viewWillAppear:](&v19, sel_viewWillAppear_, a3);
  -[HUDashboardViewController _requestLocationAuth](self, "_requestLocationAuth");
  -[HUDashboardViewController _setUpFilterBar](self, "_setUpFilterBar");
  -[HUDashboardViewController _updateFilterBarVisibility](self, "_updateFilterBarVisibility");
  -[HUDashboardViewController _updateTabBarVisibility](self, "_updateTabBarVisibility");
  -[HUDashboardViewController setupTipsObserver](self, "setupTipsObserver");
  -[HUDashboardViewController _updateAnnounceNotificationSettingsIfNeeded](self, "_updateAnnounceNotificationSettingsIfNeeded");
  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableCameraSnapshotsForCells:", v6);

  objc_initWeak(&location, self);
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__HUDashboardViewController_viewWillAppear___block_invoke;
  v16[3] = &unk_1E6F5CBD0;
  objc_copyWeak(&v17, &location);
  v10 = (id)-[HUDashboardViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v9, v16);

  -[HUDashboardViewController context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v12, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  if ((_DWORD)v8)
  {
    -[HUDashboardViewController createRestrictedGuestBlockedBackdropViewIfNeeded](self, "createRestrictedGuestBlockedBackdropViewIfNeeded");
    -[HUDashboardViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertSubview:above:", v14, v15);

  }
  else
  {
    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");
  }

  -[HUDashboardViewController _showNoHomeAccessViewsIfNeeded](self, "_showNoHomeAccessViewsIfNeeded");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardViewController;
  v8 = a4;
  -[HUControllableItemCollectionViewController collectionView:willDisplayCell:forItemAtIndexPath:](&v11, sel_collectionView_willDisplayCell_forItemAtIndexPath_, a3, v8, a5);
  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "enableCameraSnapshotsForCells:", v10);
}

- (HUDashboardCameraItemModuleController)cameraItemModuleController
{
  return self->_cameraItemModuleController;
}

- (void)_setUpFilterBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_bottomPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[HUDashboardViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bottomPalette");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[HUDashboardViewController _filterBarController](self, "_filterBarController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      objc_msgSend(v9, "hu_preloadContent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__HUDashboardViewController_NavigationBar___setUpFilterBar__block_invoke;
      v14[3] = &unk_1E6F52C20;
      objc_copyWeak(&v16, &location);
      v11 = v9;
      v15 = v11;
      v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
  }
}

- (void)_updatePaletteHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "filterPresentationStyle"))
  {
    -[HUDashboardViewController _filterBarController](self, "_filterBarController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intrinsicHeight");
    v6 = v5;

  }
  else
  {
    v6 = 0.0;
  }

  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bottomPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredHeight");
  v10 = v9;

  if (v10 != v6)
  {
    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_bottomPalette");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPreferredHeight:", v6);

    -[HUDashboardViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "filterPresentationStyle");

    if (v14 == 2)
      -[HUDashboardViewController _clipToNavigationBar](self, "_clipToNavigationBar");
  }
}

- (void)_setUpNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  _HULocalizedStringWithDefaultValue(CFSTR("HUDashboardNavigationBarBackButtonTitle"), CFSTR("HUDashboardNavigationBarBackButtonTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackButtonTitle:", v4);

  +[HUNavigationBarButton addButtonWithOwner:](HUNavigationBarButton, "addButtonWithOwner:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController setNavigationAddButton:](self, "setNavigationAddButton:", v6);

  +[HUNavigationBarButton announceButtonWithOwner:](HUNavigationBarButton, "announceButtonWithOwner:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController setNavigationAnnounceButton:](self, "setNavigationAnnounceButton:", v7);

  +[HUNavigationBarButton editDoneButtonWithOwner:](HUNavigationBarButton, "editDoneButtonWithOwner:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController setNavigationEditDoneButton:](self, "setNavigationEditDoneButton:", v8);

  +[HUNavigationBarButton homeButtonWithOwner:](HUNavigationBarButton, "homeButtonWithOwner:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController setNavigationHomeButton:](self, "setNavigationHomeButton:", v9);

  -[HUDashboardViewController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "filterPresentationStyle");

  if (v11 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA7B0], "hu_dashboardAppearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureWithTransparentBackground");
    objc_msgSend(v12, "configureWithDefaultShadow");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowColor:", v13);

    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStandardAppearance:", v12);

  }
  -[HUDashboardViewController _updateBadgeCountForHomeButton](self, "_updateBadgeCountForHomeButton");
  -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons");
}

- (void)dashboardItemManager:(id)a3 didUpdateHomeMenuStatusItems:(id)a4
{
  -[HUDashboardViewController _updateBadgeCountForHomeButton](self, "_updateBadgeCountForHomeButton", a3, a4);
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");
}

- (void)_updateBadgeCountForHomeButton
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController context](self, "context");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "allowsHomeNavigation") & 1) != 0)
  {
    -[HUDashboardViewController context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");

    if ((v5 & 1) == 0)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "getHomeButtonBadgeCount");

      -[HUDashboardViewController navigationHomeButton](self, "navigationHomeButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "badgeValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if (v10 != v7)
      {
        HFLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[HUDashboardViewController navigationHomeButton](self, "navigationHomeButton");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "badgeValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v18 = "-[HUDashboardViewController(NavigationBar) _updateBadgeCountForHomeButton]";
          v19 = 2048;
          v20 = objc_msgSend(v13, "unsignedIntegerValue");
          v21 = 2048;
          v22 = v7;
          _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%s Updating home button badge count from %lu to: %lu", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUDashboardViewController navigationHomeButton](self, "navigationHomeButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBadgeValue:", v14);

      }
    }
  }
  else
  {

  }
}

- (void)_updateAnnounceNotificationSettingsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getAuthorizationStatusAsync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__HUDashboardViewController_Announce___updateAnnounceNotificationSettingsIfNeeded__block_invoke;
  v6[3] = &unk_1E6F56420;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

}

- (void)setViewIsFullyVisible:(BOOL)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_viewIsFullyVisible != a3)
  {
    self->_viewIsFullyVisible = a3;
    if (a3)
    {
      -[HUDashboardViewController viewFirstTimeFullyVisibleFuture](self, "viewFirstTimeFullyVisibleFuture");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isFinished");

      if ((v5 & 1) == 0)
      {
        HFLogForCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        HFLogForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_signpost_id_make_with_pointer(v7, self);

        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_signpost_emit_with_name_impl(&dword_1B8E1E000, v6, OS_SIGNPOST_INTERVAL_END, v8, "HUViewFirstAppearance", "%@.viewFirstTimeFullyVisibleFuture ends", buf, 0xCu);

        }
      }
      -[HUDashboardViewController viewFirstTimeFullyVisibleFuture](self, "viewFirstTimeFullyVisibleFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finishWithNoResult");

      -[HUDashboardViewController viewFullyVisibleFuture](self, "viewFullyVisibleFuture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "finishWithNoResult");

    }
    else
    {
      -[HUDashboardViewController viewFullyVisibleFuture](self, "viewFullyVisibleFuture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cancel");

      v14 = objc_alloc_init(MEMORY[0x1E0D519C0]);
      -[HUDashboardViewController setViewFullyVisibleFuture:](self, "setViewFullyVisibleFuture:");

    }
  }
}

- (NAFuture)viewFirstTimeFullyVisibleFuture
{
  return self->_viewFirstTimeFullyVisibleFuture;
}

- (void)setNavigationHomeButton:(id)a3
{
  objc_storeStrong((id *)&self->_navigationHomeButton, a3);
}

- (void)setNavigationEditDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_navigationEditDoneButton, a3);
}

- (void)setNavigationAnnounceButton:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAnnounceButton, a3);
}

- (void)setNavigationAddButton:(id)a3
{
  objc_storeStrong((id *)&self->_navigationAddButton, a3);
}

- (void)setCameraItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraItemModuleController, a3);
}

- (void)setBannerItemModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_bannerItemModuleController, a3);
}

- (HUBannerItemModuleController)bannerItemModuleController
{
  return self->_bannerItemModuleController;
}

- (void)_requestLocationAuth
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D285B8], "sharedAuthorization");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestAuthorization:completionHandler:", 2, 0);

}

uint64_t __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (void)_updateBarButtons
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  -[HUDashboardViewController _allNavigationBarButtons](self, "_allNavigationBarButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke;
  v9[3] = &unk_1E6F5CED8;
  v9[4] = self;
  objc_msgSend(v3, "na_filter:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_2;
  v8[3] = &unk_1E6F5CF00;
  v8[4] = self;
  objc_msgSend(v5, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_3;
  v7[3] = &unk_1E6F5CF50;
  v7[4] = self;
  objc_msgSend(v6, "na_each:", v7);

}

- (id)_allNavigationBarButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[HUDashboardViewController navigationAddButton](self, "navigationAddButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HUDashboardViewController navigationHomeButton](self, "navigationHomeButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v5);

  -[HUDashboardViewController navigationEditDoneButton](self, "navigationEditDoneButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v6);

  -[HUDashboardViewController navigationAnnounceButton](self, "navigationAnnounceButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v7);

  return v3;
}

- (HUNavigationBarButton)navigationHomeButton
{
  return self->_navigationHomeButton;
}

- (HUNavigationBarButton)navigationEditDoneButton
{
  return self->_navigationEditDoneButton;
}

- (HUNavigationBarButton)navigationAnnounceButton
{
  return self->_navigationAnnounceButton;
}

- (HUNavigationBarButton)navigationAddButton
{
  return self->_navigationAddButton;
}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDashboardViewController;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons");
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");
}

- (void)_showRoarUpgradeViewIfNeeded
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HUROARUpgradeView *v8;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUDashboardViewController _shouldShowRoarUpgradeView](self, "_shouldShowRoarUpgradeView"))
  {
    v6 = objc_msgSend(v5, "hf_blockCurrentUserFromHomeReason");
    -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = -[HUROARUpgradeView initWithUpgradeViewReason:home:]([HUROARUpgradeView alloc], "initWithUpgradeViewReason:home:", v6, v5);
      -[HUDashboardViewController setHomeUpgradedToRoarView:](self, "setHomeUpgradedToRoarView:", v8);

      -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "leadingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController view](self, "view");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "layoutMarginsGuide");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "leadingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v68);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v67;
      -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController view](self, "view");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "layoutMarginsGuide");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "trailingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:", v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v61;
      -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "topAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController view](self, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "layoutMarginsGuide");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v74[2] = v12;
      -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bottomAnchor");
      v73 = v5;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutMarginsGuide");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v74[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v73;
      -[HUDashboardViewController setUpgradeViewConstraints:](self, "setUpgradeViewConstraints:", v59);

    }
    -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0CEABE8]);
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithEffect:", v21);
      -[HUDashboardViewController setRoarBackdropView:](self, "setRoarBackdropView:", v22);

      -[HUDashboardViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
      -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

      -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

      -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAutoresizingMask:", 18);

    }
    -[HUDashboardViewController view](self, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "insertSubview:above:", v36, v37);

    -[HUDashboardViewController view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v39);

    v40 = (void *)MEMORY[0x1E0CB3718];
    -[HUDashboardViewController upgradeViewConstraints](self, "upgradeViewConstraints");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v41);

  }
  else if (-[HUDashboardViewController _isShowingRoarUpgradeView](self, "_isShowingRoarUpgradeView"))
  {
    v42 = (void *)MEMORY[0x1E0CB3718];
    -[HUDashboardViewController upgradeViewConstraints](self, "upgradeViewConstraints");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "deactivateConstraints:", v43);

    -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "removeFromSuperview");

    -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "removeFromSuperview");

    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "itemProviders");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "hmf_isEmpty");

    if ((v48 & 1) == 0)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)MEMORY[0x1E0D314C0];
      v51 = (void *)MEMORY[0x1E0C99E60];
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "itemProviders");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setWithArray:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "requestToReloadItemProviders:senderSelector:", v54, a2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (id)objc_msgSend(v49, "performItemUpdateRequest:", v55);

    }
  }

}

- (id)_filterBarController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  -[HUDashboardViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "filterBarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)upgradeViewConstraints
{
  return self->_upgradeViewConstraints;
}

- (UIVisualEffectView)roarBackdropView
{
  return self->_roarBackdropView;
}

- (HUROARUpgradeView)homeUpgradedToRoarView
{
  return self->_homeUpgradedToRoarView;
}

- (void)changeHomeEnergyTipShouldDisplayTo:(BOOL)a3
{
  int v3;
  uint64_t v4;
  HUDashboardViewController *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = qword_1ED57E358;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E600);
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED580E40);
  swift_beginAccess();
  sub_1B93ED0F4();
  swift_endAccess();
  if (v7 != v3)
  {
    swift_beginAccess();
    sub_1B93ED100();
    swift_endAccess();
  }

}

void __82__HUDashboardViewController_Announce___updateAnnounceNotificationSettingsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "intValue");
  if ((_DWORD)v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "announceUserSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deviceNotificationMode");
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HFLocationServicesAvailableForAuthorizationStatus();
      v14 = CFSTR("NO");
      v17 = 138412802;
      v18 = v11;
      v19 = 2112;
      if (v13)
        v14 = CFSTR("YES");
      v20 = v12;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "currentNotificationMode = [%@] - CLAuthorizationStatus = [%@] - HFLocationServicesAvailableForAuthorizationStatus = [%@]", (uint8_t *)&v17, 0x20u);

    }
    if (v9 != 1 && (HFLocationServicesAvailableForAuthorizationStatus() & 1) == 0)
    {
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Setting Announce Notification mode to HMAnnounceDeviceNotificationModeNever", (uint8_t *)&v17, 2u);
      }

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA350]), "initWithDeviceNotificationMode:", 1);
      objc_msgSend(v7, "updateAnnounceUserSettings:forHome:completionHandler:", v16, v6, &__block_literal_global_1120);

    }
  }
}

id __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "navigationBarEdgeForButton:", a2);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (unint64_t)navigationBarEdgeForButton:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v13;
  int v14;

  v4 = a3;
  if (-[HUDashboardViewController shouldHideNavigationBarButton:](self, "shouldHideNavigationBarButton:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Add"));

    if ((v7 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HomesAndRooms"));

    if ((v9 & 1) != 0
      || (objc_msgSend(v4, "identifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Announce")),
          v10,
          (v11 & 1) != 0))
    {
LABEL_6:
      v5 = 8;
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Done"));

      if (v14)
        v5 = 8;
      else
        v5 = 0;
    }
  }

  return v5;
}

uint64_t __61__HUDashboardViewController_NavigationBar___updateBarButtons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldHideNavigationBarButton:", a2) ^ 1;
}

void __59__HUDashboardViewController_NavigationBar___setUpFilterBar__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_alloc(MEMORY[0x1E0CEAE08]);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentView:", v3);

  objc_msgSend(v4, "_setLayoutPriority:", 2);
  objc_msgSend(WeakRetained, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setBottomPalette:", v4);

  if (objc_msgSend(WeakRetained, "viewIsFullyVisible"))
    objc_msgSend(WeakRetained, "_updatePaletteHeight");

}

- (HUDashboardViewController)initWithContext:(id)a3 asOverlay:(BOOL)a4 delegate:(id)a5
{
  id v8;
  id v9;
  HUDashboardItemManager *v10;
  HUDashboardViewController *v11;
  HUDashboardLayoutManager *v12;
  HUDashboardLayoutManager *layoutManager;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  objc_class *v17;
  void *v18;
  NAFuture *v19;
  NAFuture *viewFullyVisibleFuture;
  NAFuture *v21;
  NAFuture *viewFirstTimeFullyVisibleFuture;
  void *v23;
  HUAccessoryControlAnimator *v24;
  HUAccessoryControlAnimator *accessoryControlAnimator;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[HUDashboardItemManager initWithContext:delegate:]([HUDashboardItemManager alloc], "initWithContext:delegate:", v8, 0);
  v27.receiver = self;
  v27.super_class = (Class)HUDashboardViewController;
  v11 = -[HUControllableItemCollectionViewController initUsingCompositionalLayoutWithItemManager:](&v27, sel_initUsingCompositionalLayoutWithItemManager_, v10);
  if (v11)
  {
    v12 = -[HUDashboardLayoutManager initWithDelegate:]([HUDashboardLayoutManager alloc], "initWithDelegate:", v11);
    layoutManager = v11->_layoutManager;
    v11->_layoutManager = v12;

    v11->_isOverlay = a4;
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_viewIsFullyVisible = 0;
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_make_with_pointer(v15, v11);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v18;
      _os_signpost_emit_with_name_impl(&dword_1B8E1E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "HUViewFirstAppearance", "%@.viewFirstTimeFullyVisibleFuture begins", buf, 0xCu);

    }
    v19 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    viewFullyVisibleFuture = v11->_viewFullyVisibleFuture;
    v11->_viewFullyVisibleFuture = v19;

    v21 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    viewFirstTimeFullyVisibleFuture = v11->_viewFirstTimeFullyVisibleFuture;
    v11->_viewFirstTimeFullyVisibleFuture = v21;

    -[HUControllableItemCollectionViewController setUseCustomDragAndDrop:](v11, "setUseCustomDragAndDrop:", 1);
    -[HUDashboardItemManager setDashboardDelegate:](v10, "setDashboardDelegate:", v11);
    if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
    {
      +[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setCurrentContext:", v8);

    }
    v24 = objc_alloc_init(HUAccessoryControlAnimator);
    accessoryControlAnimator = v11->_accessoryControlAnimator;
    v11->_accessoryControlAnimator = v24;

    -[HUDashboardViewController _registerObservers](v11, "_registerObservers");
  }

  return v11;
}

id __46__HUDashboardViewController_hu_preloadContent__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadViewIfNeeded");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_registerObservers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addHomeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addHomeManagerObserver:", self);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAccessoryObserver:", self);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addUserObserver:", self);

}

- (HUDashboardViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  HUDashboardViewController *v6;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUDashboardContext homeDashboardForHome:](HUDashboardContext, "homeDashboardForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HUDashboardViewController initWithContext:delegate:](self, "initWithContext:delegate:", v5, 0);
  return v6;
}

- (HUDashboardViewController)initWithContext:(id)a3 delegate:(id)a4
{
  return -[HUDashboardViewController initWithContext:asOverlay:delegate:](self, "initWithContext:asOverlay:delegate:", a3, 0, a4);
}

- (id)childViewControllersToPreload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUDashboardViewController;
  -[HUItemCollectionViewController childViewControllersToPreload](&v8, sel_childViewControllersToPreload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HUDashboardViewController _filterBarController](self, "_filterBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (void)_registerSectionDecorationViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_class();
  -[HUDashboardViewController collectionViewLayout](self, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v6 = v4;

  if (v6)
  {
    -[HUDashboardViewController layoutManager](self, "layoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerSectionDecorationViewsWithLayout:", v6);

  }
}

- (id)itemManager:(id)a3 futureToUpdateItems:(id)a4 itemUpdateOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[HUDashboardViewController context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "shouldDelayItemUpdatesForViewVisibility")
    || -[HUDashboardViewController viewIsFullyVisible](self, "viewIsFullyVisible"))
  {

LABEL_4:
    if (objc_msgSend((id)-[HUDashboardViewController superclass](self, "superclass"), "instancesRespondToSelector:", a2))
    {
      v21.receiver = self;
      v21.super_class = (Class)HUDashboardViewController;
      -[HUItemCollectionViewController itemManager:futureToUpdateItems:itemUpdateOptions:](&v21, sel_itemManager_futureToUpdateItems_itemUpdateOptions_, v9, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    goto LABEL_8;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if ((v17 & 1) != 0)
    goto LABEL_4;
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the view is fully visible", buf, 2u);
  }

  if (objc_msgSend(MEMORY[0x1E0D319D0], "hasInternalDiagnostics"))
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Not visible - delayed items: %@", buf, 0xCu);
    }

  }
  -[HUDashboardViewController viewFullyVisibleFuture](self, "viewFullyVisibleFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __79__HUDashboardViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke;
  v22[3] = &unk_1E6F4C610;
  v23 = v10;
  v20 = (id)objc_msgSend(v14, "addCompletionBlock:", v22);

LABEL_8:
  return v14;
}

- (BOOL)viewIsFullyVisible
{
  return self->_viewIsFullyVisible;
}

- (NAFuture)viewFullyVisibleFuture
{
  return self->_viewFullyVisibleFuture;
}

void __79__HUDashboardViewController_itemManager_futureToUpdateItems_itemUpdateOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Delaying full item update until the view is fully visible", (uint8_t *)&v5, 2u);
  }

  if (objc_msgSend(MEMORY[0x1E0D319D0], "hasInternalDiagnostics"))
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Visible - continuing item updates: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController viewDidLoad](&v30, sel_viewDidLoad);
  -[HUDashboardViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = *MEMORY[0x1E0CEB3B8];
  +[HUGridSectionHeaderView reuseIdentifier](HUGridSectionHeaderView, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, v5, v6);

  -[HUDashboardViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 1);

  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLargeTitleDisplayMode:", 1);

  -[HUDashboardViewController _setUpNavigationBar](self, "_setUpNavigationBar");
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad")
      && !objc_msgSend(MEMORY[0x1E0D319D0], "isAMac")
      || objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro"))
    {
      v9 = (void *)objc_opt_new();
      -[HUDashboardViewController context](self, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "room");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v9, "setHideStandardTitle:", 1);
      }
      else
      {
        -[HUDashboardViewController context](self, "context");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "accessoryTypeGroup");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHideStandardTitle:", v28 != 0);

      }
      -[HUDashboardViewController navigationItem](self, "navigationItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTitleView:", v9);

    }
  }
  else
  {
    -[HUDashboardViewController _setUpTabBar](self, "_setUpTabBar");
  }
  -[HUDashboardViewController _setupBackgroundView](self, "_setupBackgroundView");
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");
  -[HUDashboardViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[HUDashboardViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentInset:", v14 + 10.0, v16, v18 + 150.0, v20);

  -[HUDashboardViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIndicatorStyle:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_migrationUpdatedTileSize_, *MEMORY[0x1E0D30B08], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_bannerSizeUpdated_, CFSTR("HUBannerSizeHasUpdatedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObserver:selector:name:object:", self, sel_applicationWentIntoBackground_, *MEMORY[0x1E0CEB288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel_applicationWillEnterForeground_, *MEMORY[0x1E0CEB350], 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

void __46__HUDashboardViewController_hu_preloadContent__block_invoke_4()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "Completed extended launch", v3, 2u);
  }

  v1 = (void *)*MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_launchTestName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishedTest:waitForCommit:extraResults:", v2, 1, 0);

}

id __46__HUDashboardViewController_hu_preloadContent__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(*(id *)(a1 + 32), "itemManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstReadCompleteFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)homeDidUpdateHomeEnergyManagerEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  HUDashboardViewController *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = self;
    v9 = 2080;
    v10 = "-[HUDashboardViewController(Observer) homeDidUpdateHomeEnergyManagerEnabled:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%@ %s) HUDashboardViewController ~~> Dispatching home: %@ onto main.", (uint8_t *)&v7, 0x20u);

  }
  -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons");
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");

}

void __86__HUDashboardViewController_NavigationBar__navigationBarButtonIdentifierOrderForEdge___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HomesAndRooms");
  v2[1] = CFSTR("Add");
  v2[2] = CFSTR("Done");
  v2[3] = CFSTR("Announce");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580608;
  qword_1ED580608 = v0;

}

- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3
{
  id v4;
  HUDashboardViewController *v5;
  HUDashboardLayoutManager *v6;
  HUDashboardContext *v7;
  id v8;

  v4 = a3;
  v5 = self;
  v6 = -[HUDashboardViewController layoutManager](v5, sel_layoutManager);
  v7 = -[HUDashboardViewController context](v5, sel_context);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultConfiguration);
  objc_msgSend(v8, sel_setContentInsetsReference_, 3);
  objc_msgSend(v8, sel_setInterSectionSpacing_, 20.0);

  return v8;
}

- (void)setupTipsObserver
{
  HUDashboardViewController *v2;

  v2 = self;
  HUDashboardViewController.setupTipsObserver()();

}

- (void)refreshTileHelper
{
  HUDashboardViewController *v2;

  v2 = self;
  HUDashboardViewController.refreshTileHelper()();

}

- (void)dismissTip
{
  HUDashboardViewController *v2;

  v2 = self;
  HUDashboardViewController.dismissTip()();

}

- (id)createEnergyDashboardModuleControllerWith:(id)a3
{
  id v4;
  HUDashboardViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = HUDashboardViewController.createEnergyDashboardModuleController(with:)(v4);

  return v6;
}

- (id)createDashboardTipModuleControllerWithModule:(id)a3
{
  id v5;
  id v6;
  HUDashboardViewController *v7;
  id v8;
  id v9;

  v5 = objc_allocWithZone((Class)type metadata accessor for DashboardTipModuleController());
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_initWithModule_, v6);
  v9 = objc_msgSend(v8, sel_asGeneric);

  return v9;
}

- (void)energyFeatureDidHide
{
  HUDashboardViewController *v2;

  v2 = self;
  sub_1B8EF45EC();

}

- (void)tearDownTipsObserver
{
  HUDashboardViewController *v2;

  v2 = self;
  HUDashboardViewController.tearDownTipsObserver()();

}

- (void)presentTip
{
  HUDashboardViewController *v2;

  v2 = self;
  sub_1B8EF54AC();

}

- (id)homeKitObjectWithID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  HUDashboardViewController *v8;
  id v9;
  uint64_t v11;

  v4 = sub_1B93EB87C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB864();
  v8 = self;
  v9 = HUDashboardViewController.homeKitObject(with:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (BOOL)shouldShowAccessoryControlForHomeKitObject:(id)a3
{
  BOOL v3;

  if (!a3)
    return 0;
  v3 = 1;
  if (!swift_dynamicCastObjCProtocolConditional())
    return 0;
  return v3;
}

- (BOOL)hasCustomControlPresentationAnimations
{
  return 1;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HFAccessoryRepresentableItem *v17;
  HFItem *v18;
  HUDashboardViewController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF20E058;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF209370;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1B901BAB4((uint64_t)v11, (uint64_t)&unk_1EF20E5B0, (uint64_t)v16);
  swift_release();
}

- (void)configureWithAccessoryControlViewController:(id)a3
{
  id v4;
  HUDashboardViewController *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t ObjectType;
  void (*v10)(_QWORD, uint64_t, uint64_t);
  HUDashboardViewController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUDashboardViewController;
  v4 = a3;
  v5 = self;
  -[HUControllableItemCollectionViewController configureWithAccessoryControlViewController:](&v12, sel_configureWithAccessoryControlViewController_, v4);
  swift_getObjectType();
  v6 = swift_conformsToProtocol2();
  if (v6)
    v7 = v6;
  else
    v7 = 0;
  if (v6)
    v8 = v4;
  else
    v8 = 0;
  if (v8)
  {
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(_QWORD, uint64_t, uint64_t))(v7 + 120);
    v11 = (HUDashboardViewController *)v4;
    v10(0, ObjectType, v7);

    v5 = v11;
  }

}

- (void)disableRefresh
{
  HUDashboardViewController *v2;

  v2 = self;
  HUDashboardViewController.disableRefresh()();

}

- (void)enableRefresh
{
  HUDashboardViewController *v2;

  v2 = self;
  HUDashboardViewController.enableRefresh()();

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUDashboardViewController *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1B8F6C798();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  HUDashboardViewController *v5;
  HUAccessoryControlAnimator *v6;
  HUAccessoryControlAnimator *v7;

  v4 = a3;
  v5 = self;
  v6 = -[HUDashboardViewController accessoryControlAnimator](v5, sel_accessoryControlAnimator);
  *((_BYTE *)&v6->super.isa + OBJC_IVAR___HUAccessoryControlAnimator_currentTransitionType) = 1;

  v7 = -[HUDashboardViewController accessoryControlAnimator](v5, sel_accessoryControlAnimator);
  return v7;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4;
  HUDashboardViewController *v5;
  id v6;

  v4 = objc_allocWithZone(MEMORY[0x1E0CEA820]);
  swift_unknownObjectRetain();
  v5 = self;
  v6 = objc_msgSend(v4, sel_init);
  objc_msgSend(v6, sel_setWantsInteractiveStart_, 0);
  swift_unknownObjectRelease();

  return v6;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_1B8E23A60(0, &qword_1EF2106E8);
  return (id)sub_1B93EDF34();
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  HUDashboardViewController *v6;
  HFItemManager *v7;
  id v8;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  -[HUDashboardViewController setItemShowingSizeToggleButton:animated:](v6, sel_setItemShowingSizeToggleButton_animated_, 0, 1);
  v7 = -[HUItemCollectionViewController itemManager](v6, sel_itemManager);
  v8 = (id)sub_1B93EDD84();
  -[HFItemManager disableExternalUpdatesWithReason:](v7, sel_disableExternalUpdatesWithReason_, v8);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  HUDashboardViewController *v6;
  HFItemManager *v7;
  id v8;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = -[HUItemCollectionViewController itemManager](v6, sel_itemManager);
  v8 = (id)sub_1B93EDD84();
  -[HFItemManager endDisableExternalUpdatesWithReason:](v7, sel_endDisableExternalUpdatesWithReason_, v8);

  swift_unknownObjectRelease();
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  HUDashboardViewController *v7;
  id v8;
  uint64_t v9;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = objc_msgSend(a4, sel_localDragSession);
  swift_unknownObjectRelease();
  if (v8)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    sub_1B8E23A60(0, (unint64_t *)&unk_1EF2106D0);
    v9 = objc_msgSend(a4, sel_canLoadObjectsOfClass_, swift_getObjCClassFromMetadata());
  }

  swift_unknownObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  HUDashboardViewController *v15;
  id v16;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1B93EB8C4();
    v12 = sub_1B93EB900();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_1B93EB900();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  swift_unknownObjectRetain();
  v15 = self;
  v16 = HUDashboardViewController.collectionView(_:dropSessionDidUpdate:withDestinationIndexPath:)((uint64_t)v14, a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_1B8E26870((uint64_t)v11, &qword_1ED57E7B0);
  return v16;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  HUDashboardViewController *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  uint64_t v25;
  HUDashboardViewController *v26;

  v26 = self;
  v7 = sub_1B93EB900();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v25 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v25 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v25 - v18;
  sub_1B93EB8C4();
  sub_1B93EB8C4();
  sub_1B93EB8C4();
  v20 = a3;
  v21 = v26;
  HUDashboardViewController.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)((uint64_t)v20, (uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_1B93EB8B8();
  v22(v19, v7);
  return v23;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  HUDashboardViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  HUDashboardViewController.collectionView(_:performDropWith:)((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v6;
  HUDashboardViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1B9000F94(a4);

  swift_unknownObjectRelease();
}

- (id)contextTypeDescriptionForAnalytics
{
  HUDashboardViewController *v2;
  HUDashboardContext *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = -[HUDashboardViewController context](v2, sel_context);
  sub_1B8E724D8();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_1B93EDD84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)hu_performanceTestReadyFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  -[HUDashboardViewController hu_preloadContent](self, "hu_preloadContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstFullUpdateFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatMap:", &__block_literal_global_125);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __63__HUDashboardViewController_PPT__hu_performanceTestReadyFuture__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

void __44__HUDashboardViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v16, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  if (v8 == objc_msgSend(v5, "horizontalSizeClass"))
  {
    objc_msgSend(v16, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "verticalSizeClass");
    v11 = objc_msgSend(v5, "verticalSizeClass");

    if (v10 == v11)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, 0);

  }
LABEL_7:

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HUDashboardViewController;
  -[HUDashboardViewController viewIsAppearing:](&v10, sel_viewIsAppearing_, a3);
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[HUDashboardViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_handleTraitChanges);
  -[HUDashboardViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "filterPresentationStyle");

  if (v7 == 1)
  {
    -[HUDashboardViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_bottomPalette");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMinimumHeight:", 0.0);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  objc_super v18;
  uint8_t buf[4];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HUDashboardViewController;
  -[HUItemCollectionViewController viewWillDisappear:](&v18, sel_viewWillDisappear_, a3);
  -[HUDashboardViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31130], "energyAccessoryTypeGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {

LABEL_3:
    goto LABEL_4;
  }
  -[HUDashboardViewController energyCategoryViewStartTime](self, "energyCategoryViewStartTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController energyCategoryViewStartTime](self, "energyCategoryViewStartTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v14;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "Energy Category view duration:%f [s]", buf, 0xCu);
    }

    -[HUDashboardViewController setEnergyCategoryViewStartTime:](self, "setEnergyCategoryViewStartTime:", 0);
    if (v14 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "allHomesFuture");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__HUDashboardViewController_viewWillDisappear___block_invoke;
      v17[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
      *(double *)&v17[4] = v14;
      v16 = (id)objc_msgSend(v5, "addCompletionBlock:", v17);
      goto LABEL_3;
    }
  }
LABEL_4:
  -[HUDashboardViewController setViewIsFullyVisible:](self, "setViewIsFullyVisible:", 0);
  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleCells");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disableCameraSnapshotsForCells:", v9);

}

void __47__HUDashboardViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "accessories", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUEnergyAnalytics saveViewDurationEvent:withDuration:withUserHasAccessories:](HUEnergyAnalytics, "saveViewDurationEvent:withDuration:withUserHasAccessories:", 47, v9, v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[HUDashboardViewController tearDownTipsObserver](self, "tearDownTipsObserver");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUDashboardViewController;
  -[HUDashboardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[HUDashboardViewController setRestrictedGuestBlockedBackdropView:](self, "setRestrictedGuestBlockedBackdropView:", 0);
    -[HUDashboardViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_shouldBlockCurrentRestrictedGuestFromHome");

    if (v9)
    {
      -[HUDashboardViewController createRestrictedGuestBlockedBackdropViewIfNeeded](self, "createRestrictedGuestBlockedBackdropViewIfNeeded");
      -[HUDashboardViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController wallpaperView](self, "wallpaperView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:above:", v11, v12);

    }
  }
}

- (void)setItemShowingSizeToggleButton:(id)a3
{
  -[HUDashboardViewController setItemShowingSizeToggleButton:animated:](self, "setItemShowingSizeToggleButton:animated:", a3, 0);
}

- (void)setItemShowingSizeToggleButton:(id)a3 animated:(BOOL)a4
{
  char v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  BOOL v17;

  v15 = a3;
  v7 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  v8 = v15;
  if ((v7 & 1) == 0)
  {
    -[HUDashboardViewController itemShowingSizeToggleButton](self, "itemShowingSizeToggleButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if (v9)
      {
        v12 = objc_msgSend(v9, "isEqual:", v10);

        v8 = v15;
        if ((v12 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController itemShowingSizeToggleButton](self, "itemShowingSizeToggleButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "na_safeAddObject:", v14);

      objc_msgSend(v13, "na_safeAddObject:", v11);
      objc_storeStrong((id *)&self->_itemShowingSizeToggleButton, a3);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __69__HUDashboardViewController_setItemShowingSizeToggleButton_animated___block_invoke;
      v16[3] = &unk_1E6F5CC18;
      v16[4] = self;
      v17 = a4;
      objc_msgSend(v13, "na_each:", v16);
      v11 = v13;
    }

    v8 = v15;
  }
LABEL_10:

}

void __69__HUDashboardViewController_setItemShowingSizeToggleButton_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "itemShowingSizeToggleButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v5 == v4)
    v12 = 1.0;
  else
    v12 = 0.0;
  objc_msgSend(v11, "setShowsSizeChangeButton:animated:", v5 == v4, *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setZPosition:", v12);

}

- (void)reloadLayoutAnimated:(BOOL)a3 fastUpdate:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HUDashboardViewController_reloadLayoutAnimated_fastUpdate___block_invoke;
  aBlock[3] = &unk_1E6F4D988;
  aBlock[4] = self;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, 0.3);
  else
    (*((void (**)(void *))v7 + 2))(v7);
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allDisplayedItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v4)
    objc_msgSend(v12, "reconfigureUIRepresentationForItems:withAnimation:", v11, v5);
  else
    objc_msgSend(v12, "reloadUIRepresentationForItems:withAnimation:", v11, v5);

}

void __61__HUDashboardViewController_reloadLayoutAnimated_fastUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (HUCameraController)ppt_cameraController
{
  void *v2;
  void *v3;

  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HUCameraController *)v3;
}

- (void)_showNoHomeAccessViewsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  objc_opt_class();
  -[HUDashboardViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v15 = v4;

  -[HUDashboardViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "canShowNoHomeAccessView") & 1) != 0)
  {
    objc_msgSend(v15, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 == 1)
    {
      -[HUDashboardViewController _showRoarUpgradeViewIfNeeded](self, "_showRoarUpgradeViewIfNeeded");
      -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons");
      goto LABEL_10;
    }
  }
  else
  {

  }
  -[HUDashboardViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_shouldBlockCurrentUserFromHome");

  if (v10)
  {
    -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v11, "showHome:", v13);

  }
LABEL_10:

}

- (BOOL)_shouldShowRoarUpgradeView
{
  void *v2;
  void *v3;
  char v4;

  -[HUDashboardViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_shouldBlockCurrentUserFromHomeForRoarUpgrade");

  return v4;
}

- (BOOL)_isShowingRoarUpgradeView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[HUDashboardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController homeUpgradedToRoarView](self, "homeUpgradedToRoarView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "na_safeContainsObject:", v5))
  {
    -[HUDashboardViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController roarBackdropView](self, "roarBackdropView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "na_safeContainsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isShowingRestrictedGuestBlockedBackdropView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUDashboardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "na_safeContainsObject:", v5);

  return v6;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardViewController;
  v8 = a4;
  -[HUControllableItemCollectionViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:](&v11, sel_collectionView_didEndDisplayingCell_forItemAtIndexPath_, a3, v8, a5);
  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "disableCameraSnapshotsForCells:", v10);
}

void __90__HUDashboardViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(WeakRetained, "isEditing") & 1) == 0)
  {
    v3 = objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService");
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = *(_QWORD *)(a1 + 32);
        v16 = 138412546;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ User tapped section header disclosure button to launch Home app for section: %@", (uint8_t *)&v16, 0x16u);
      }

      v7 = *(void **)(a1 + 40);
      objc_msgSend(WeakRetained, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HURoomForDashboardSectionIdentifier(v7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0D31970], "roomURLForRoom:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "openSensitiveURL:", v11);

      }
      else
      {
        HFLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v15 = *(_QWORD *)(a1 + 40);
          v16 = 138412546;
          v17 = WeakRetained;
          v18 = 2112;
          v19 = v15;
          _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%@ Failed to identify room for section: %@", (uint8_t *)&v16, 0x16u);
        }
      }

    }
    else
    {
      if (v5)
      {
        v14 = *(_QWORD *)(a1 + 32);
        v16 = 138412546;
        v17 = WeakRetained;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ User tapped section header disclosure button to present details view controller for section: %@", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(WeakRetained, "_presentDetailsViewControllerForSectionWithIdentifier:animated:", *(_QWORD *)(a1 + 40), 1);
    }
  }

}

- (id)reorderableItemListForSection:(int64_t)a3
{
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
  uint64_t v15;

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayedSectionIdentifierForSectionIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HURoomForDashboardSectionIdentifier(v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HUAccessoryTypeGroupForDashboardSectionIdentifier(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemModuleForSectionIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "reorderableHomeKitItemList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reorderableServiceListForRoom:", v9);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (v10)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reorderableServiceListForType:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("favoritesSection")))
      {
        v13 = 0;
        goto LABEL_10;
      }
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reorderableFavoritesList");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v15;

  }
LABEL_10:

  return v13;
}

- (void)setReorderableItemList:(id)a3 forSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v6 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HURoomForDashboardSectionIdentifier(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HUAccessoryTypeGroupForDashboardSectionIdentifier(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "itemModuleForSectionIdentifier:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v18 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v18;
  else
    v15 = 0;
  v16 = v15;

  if (!v14)
  {
    if (v11)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setReorderableServiceList:forRoom:", v16, v11);
    }
    else if (v12)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setReorderableServiceList:forType:", v16, v12);
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("favoritesSection")))
        goto LABEL_13;
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setReorderableFavoritesList:", v16);
    }

    goto LABEL_13;
  }
  objc_msgSend(v14, "setReorderableHomeKitItemList:", v16);
LABEL_13:

}

- (void)didReorderItemWithSortedItemsBySectionID:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController didReorderItemWithSortedItemsBySectionID:](&v6, sel_didReorderItemWithSortedItemsBySectionID_, a3);
  -[HUDashboardViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateLayout");

}

- (BOOL)_hasTapActionForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (-[HUDashboardViewController bannerItemModuleController](self, "bannerItemModuleController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasTapActionForItem:", v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HUDashboardViewController;
    v7 = -[HUControllableItemCollectionViewController _hasTapActionForItem:](&v9, sel__hasTapActionForItem_, v4);
  }

  return v7;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (-[HUDashboardViewController bannerItemModuleController](self, "bannerItemModuleController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasTapActionForItem:", v6),
        v8,
        v9))
  {
    -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "didSelectItem:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)HUDashboardViewController;
  -[HUControllableItemCollectionViewController _performTapActionForItem:tappedArea:](&v14, sel__performTapActionForItem_tappedArea_, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v12;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    -[HUDashboardViewController itemShowingSizeToggleButton](self, "itemShowingSizeToggleButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[HUDashboardViewController setItemShowingSizeToggleButton:](self, "setItemShowingSizeToggleButton:", 0);
  }
  if (-[HUDashboardViewController isEditing](self, "isEditing") != v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)HUDashboardViewController;
    -[HUControllableItemCollectionViewController setEditing:animated:](&v8, sel_setEditing_animated_, v5, v4);
    -[HUDashboardViewController _updateAllHeaderViews](self, "_updateAllHeaderViews");
    -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons");
    -[HUDashboardViewController reloadLayoutAnimated:fastUpdate:](self, "reloadLayoutAnimated:fastUpdate:", v4, 1);
  }
}

- (id)tappableAreaForPoint:(CGPoint)a3 inItem:(id)a4 atIndexPath:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  -[HUDashboardViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cellForItemAtIndexPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;

  v14 = 0;
  if (!v13)
  {
    v16.receiver = self;
    v16.super_class = (Class)HUDashboardViewController;
    -[HUControllableItemCollectionViewController tappableAreaForPoint:inItem:atIndexPath:](&v16, sel_tappableAreaForPoint_inItem_atIndexPath_, v9, v10, x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)didSelectWelcomeBanner:(id)a3
{
  id v3;
  id v4;

  -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "showDiscoverTab");

}

- (void)didSelectUnreachableResidentsBanner:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "showBridgeSettingsForHome:", v5);

}

- (void)didSelectHomeHubMigrationBanner:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  SEL v25;

  v5 = a3;
  -[HUDashboardViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v7, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithHome:user:nameStyle:", v7, v9, 0);

  v11 = (id)objc_msgSend(v10, "setDismissedHomeHubMigrationBanner:", 1);
  objc_msgSend(v5, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bannerItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeHubMigrationBannerItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "devices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:](HUHomeFeatureOnboardingUtilities, "home:onboardHomeHub2FromPresentingViewController:devices:usageOptions:", v16, self, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __61__HUDashboardViewController_didSelectHomeHubMigrationBanner___block_invoke;
  v22[3] = &unk_1E6F50008;
  v24 = v5;
  v25 = a2;
  v23 = v14;
  v19 = v5;
  v20 = v14;
  v21 = (id)objc_msgSend(v18, "flatMap:", v22);

}

id __61__HUDashboardViewController_didSelectHomeHubMigrationBanner___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToUpdateItems:senderSelector:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v4);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)quickControlPresentationContextForItem:(id)a3 atIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  objc_super v17;

  y = a5.y;
  x = a5.x;
  v17.receiver = self;
  v17.super_class = (Class)HUDashboardViewController;
  v9 = a3;
  -[HUControllableItemCollectionViewController quickControlPresentationContextForItem:atIndexPath:point:](&v17, sel_quickControlPresentationContextForItem_atIndexPath_point_, v9, a4, x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context", v17.receiver, v17.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "setParentViewHomeKitObject:", v12);
  }
  else
  {
    -[HUDashboardViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParentViewHomeKitObject:", v14);

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v10, "setPrefersSystemTransitions:", 1);
  return v10;
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", a4);
}

- (BOOL)shouldOverrideTraitCollectionForPresentationCoordinator:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService", a3);
}

- (id)traitCollectionForPresentationCoordinator:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  id v52;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[5];
  _QWORD v62[5];
  objc_super v63;
  uint8_t v64[4];
  HUDashboardViewController *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  uint64_t v69;
  _BYTE buf[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v63.receiver = self;
  v63.super_class = (Class)HUDashboardViewController;
  if (-[HUControllableItemCollectionViewController presentationCoordinator:shouldBeginPresentationWithContext:](&v63, sel_presentationCoordinator_shouldBeginPresentationWithContext_, v6, v7))
  {
    objc_msgSend(v7, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItem:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v10, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("energySection")) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", CFSTR("tipsSection")) & 1) != 0)
    {
      v13 = 0;
LABEL_53:

      goto LABEL_54;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[HUDashboardViewController bannerItemModuleController](self, "bannerItemModuleController"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "hasTapActionForItem:", v8),
          v14,
          (v15 & 1) == 0))
    {
      objc_opt_class();
      objc_msgSend(v8, "sourceItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v57 = v19;

      objc_msgSend(v7, "setItem:", v57);
      v20 = (void *)MEMORY[0x1E0D31170];
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bannerItemModule");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hiddenBanners");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendBannerInteractionforItem:tappedBannerItemOverrideClassName:hiddenBannerEvents:", v8, 0, v22);

    }
    else
    {
      objc_opt_class();
      v16 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v57 = v17;
    }

    if (v57 && -[HUDashboardViewController _canSkipStatusDetailsForItem:](self, "_canSkipStatusDetailsForItem:", v57))
    {
      objc_msgSend(v57, "latestResults");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v54, "count") == 1)
      {
        objc_msgSend(v54, "anyObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v24, "hf_serviceGroup");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v25)
            v27 = (void *)v25;
          else
            v27 = v24;
          v28 = v27;

          v24 = v28;
        }
        v29 = -[HUDashboardViewController _shouldShowAccessoryControlsForHomeKitObject:fromStatusItem:](self, "_shouldShowAccessoryControlsForHomeKitObject:fromStatusItem:", v24, v57, v54);
        HFLogForCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if (v29)
        {
          if (v31)
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2112;
            v71 = (uint64_t (*)(uint64_t, uint64_t))v24;
            _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory controls for HomeKit object: %@", buf, 0x20u);
          }

          v32 = -[HUDashboardViewController _presentAccessoryControlsForHomeKitObject:fromStatusItem:animated:](self, "_presentAccessoryControlsForHomeKitObject:fromStatusItem:animated:", v24, v57, 1);
        }
        else
        {
          if (v31)
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v57;
            *(_WORD *)&buf[22] = 2112;
            v71 = (uint64_t (*)(uint64_t, uint64_t))v24;
            _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory settings for HomeKit object: %@", buf, 0x20u);
          }

          v37 = -[HUDashboardViewController _presentAccessorySettingsForHomeKitObject:fromStatusItem:animated:](self, "_presentAccessorySettingsForHomeKitObject:fromStatusItem:animated:", v24, v57, 1);
        }

LABEL_51:
        v13 = 0;
LABEL_52:

        goto LABEL_53;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v71 = __Block_byref_object_copy__29;
      v72 = __Block_byref_object_dispose__29;
      v73 = 0;
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke;
      v62[3] = &unk_1E6F5CC40;
      v62[4] = buf;
      objc_msgSend(v54, "enumerateObjectsUsingBlock:", v62);
      v33 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v33)
      {
        if (-[HUDashboardViewController _shouldShowAccessoryControlsForHomeKitObject:fromStatusItem:](self, "_shouldShowAccessoryControlsForHomeKitObject:fromStatusItem:", v33, v57))
        {
          HFLogForCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v64 = 138412802;
            v65 = self;
            v66 = 2112;
            v67 = v57;
            v68 = 2112;
            v69 = v35;
            _os_log_impl(&dword_1B8E1E000, v34, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory controls for HMServiceGroup: %@", v64, 0x20u);
          }

          v36 = -[HUDashboardViewController _presentAccessoryControlsForHomeKitObject:fromStatusItem:animated:](self, "_presentAccessoryControlsForHomeKitObject:fromStatusItem:animated:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v57, 1);
        }
        else
        {
          HFLogForCategory();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v64 = 138412802;
            v65 = self;
            v66 = 2112;
            v67 = v57;
            v68 = 2112;
            v69 = v51;
            _os_log_impl(&dword_1B8E1E000, v50, OS_LOG_TYPE_DEFAULT, "%@ Skipping status details for item: %@ and instead presenting accessory settings for HMServiceGroup: %@", v64, 0x20u);
          }

          v52 = -[HUDashboardViewController _presentAccessorySettingsForHomeKitObject:fromStatusItem:animated:](self, "_presentAccessorySettingsForHomeKitObject:fromStatusItem:animated:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v57, 1);
        }
        _Block_object_dispose(buf, 8);

        goto LABEL_51;
      }
      _Block_object_dispose(buf, 8);

    }
    if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService", v54)
      && (objc_msgSend(v7, "didAuthenticate") & 1) == 0)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "item");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "childItemsForItem:ofClass:", v40, objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_276;
      v61[3] = &unk_1E6F4DAD8;
      v61[4] = self;
      LODWORD(v56) = objc_msgSend(v41, "na_any:", v61);

      if ((_DWORD)v56)
      {
        v42 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(v7, "controlItems");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setControlItems:", v43);

        -[HUControllableItemCollectionViewController lockAuthorizationDelegate](self, "lockAuthorizationDelegate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "authorizeIfLockedForViewController:", self);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2;
        v58[3] = &unk_1E6F4D188;
        v59 = v42;
        v60 = v6;
        v46 = v42;
        v47 = (id)objc_msgSend(v45, "addSuccessBlock:", v58);

      }
      v38 = v56 ^ 1;
    }
    else
    {
      v38 = 1;
    }
    objc_msgSend(v8, "latestResults", v56);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C80]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
      v13 = 0;
    else
      v13 = v38;
    goto LABEL_52;
  }
  v13 = 0;
LABEL_54:

  return v13;
}

void __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  objc_opt_class();
  v13 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v13;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "hf_serviceGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  if (v10)
  {
    if (objc_msgSend(v10, "isEqual:", v8))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      goto LABEL_8;
    }
LABEL_9:
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    *a3 = 1;
    goto LABEL_10;
  }
LABEL_8:
  objc_storeStrong((id *)(v9 + 40), v8);
LABEL_10:

}

uint64_t __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_276(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "requiresUnlockToPerformActionForItem:", a2);
}

id __88__HUDashboardViewController_presentationCoordinator_shouldBeginPresentationWithContext___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDidAuthenticate:", 1);
  return (id)objc_msgSend(*(id *)(a1 + 40), "presentQuickControlWithContext:animated:", *(_QWORD *)(a1 + 32), 1);
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  void *v4;
  char v5;
  char v6;

  objc_msgSend(a4, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() | v5) ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginInteractivePresentationWithTouchLocation:(CGPoint)a4 view:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    -[HUDashboardViewController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathForItemAtPoint:", x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HUItemCollectionViewController itemManager](self, "itemManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayedItemAtIndexPath:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v14, "section"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = 0;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("tipsSection")) & 1) == 0)
        {
          if (!-[HUDashboardViewController isEditing](self, "isEditing")
            || (-[HUDashboardViewController layoutManager](self, "layoutManager"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                -[HUDashboardViewController context](self, "context"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                v21 = objc_msgSend(v19, "isAdaptiveTileStyleInSectionIdentifier:context:", v18, v20),
                v20,
                v19,
                v21))
          {
            v12 = 1;
          }
        }

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
  return v12;
}

- (void)presentationCoordinator:(id)a3 touchDidBeginForItem:(id)a4 tappedArea:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  if (CFSTR("HUTileCellTappableAreaStateToggleButton") == a5)
  {
    v6 = a4;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForItem:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[HUDashboardViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "animateIconTouchDown");
  }
}

- (void)presentationCoordinator:(id)a3 touchDidEndForItem:(id)a4 tappedArea:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  if (CFSTR("HUTileCellTappableAreaStateToggleButton") == a5)
  {
    v6 = a4;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathForItem:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[HUDashboardViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "animateIconTouchUp");
  }
}

- (BOOL)presentationCoordinator:(id)a3 shouldAllowTapticFeedbackForItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a4;
  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v8, "alwaysAllowedScheduleItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v13) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v8, "accessoryNoAccessItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqual:", v14);

    }
  }

  return v12 ^ 1;
}

- (void)presentationCoordinator:(id)a3 didRecognizeTapForItem:(id)a4 tappedArea:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t isKindOfClass;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  int v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  HUActivityLogViewController *v75;
  void *v76;
  void *v77;
  HUActivityLogViewController *v78;
  id v79;
  void *v80;
  void *v81;
  char **v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  objc_super v98;
  objc_super v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  id v104;
  id v105[2];
  uint8_t buf[4];
  HUDashboardViewController *v107;
  __int16 v108;
  NSObject *v109;
  __int16 v110;
  NSObject *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  void *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D90]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v9, "pressedTile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_17;
    objc_opt_class();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v97 = v21;

    objc_opt_class();
    v22 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (!v24)
    {
      objc_msgSend(v97, "alwaysAllowedScheduleItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v22, "isEqual:", v25))
      {

      }
      else
      {
        objc_msgSend(v97, "accessoryNoAccessItem");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[NSObject isEqual:](v22, "isEqual:", v27);

        if (v22 && !v28)
        {
          objc_msgSend(v97, "contactOwnerItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[NSObject isEqual:](v22, "isEqual:", v29);

          if (v30)
          {
            -[HUDashboardViewController context](self, "context");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "home");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "owner");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "userID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              v35 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms://%@"), v34);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "URLWithString:", v36);
              v37 = objc_claimAutoreleasedReturnValue();

              HFLogForCategory();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                NSStringFromSelector(a2);
                v39 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v107 = self;
                v108 = 2112;
                v109 = v39;
                v110 = 2112;
                v111 = v37;
                _os_log_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@, User requests to contact owner. Opening URL { %@ }", buf, 0x20u);

              }
              objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (id)objc_msgSend(v40, "openSensitiveURL:", v37);

            }
            else
            {
              HFLogForCategory();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                NSStringFromSelector(a2);
                v60 = objc_claimAutoreleasedReturnValue();
                -[HUDashboardViewController context](self, "context");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "home");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "owner");
                v90 = objc_claimAutoreleasedReturnValue();
                -[HUDashboardViewController context](self, "context");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "home");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v107 = self;
                v108 = 2112;
                v109 = v60;
                v110 = 2112;
                v111 = v90;
                v112 = 2112;
                v113 = 0;
                v114 = 2112;
                v115 = v62;
                _os_log_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEFAULT, "%@:%@, Unable to open URL to contact owner {%@} with email {%@} in home {%@}", buf, 0x34u);

              }
            }

          }
          else
          {
            objc_msgSend(v97, "pinCodeAccessItem");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[NSObject isEqual:](v22, "isEqual:", v42);

            if (v43)
            {
              -[HUDashboardViewController context](self, "context");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "home");
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v45, "currentUser");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "pinCodeManager");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "pinCodeManager");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "userPinCodes");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              objc_initWeak((id *)buf, self);
              v100[0] = MEMORY[0x1E0C809B0];
              v100[1] = 3221225472;
              v100[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke;
              v100[3] = &unk_1E6F55A50;
              objc_copyWeak(v105, (id *)buf);
              v49 = v46;
              v101 = v49;
              v105[1] = (id)a2;
              v50 = v45;
              v102 = v50;
              v103 = v97;
              v51 = v94;
              v104 = v51;
              v52 = (id)objc_msgSend(v48, "addSuccessBlock:", v100);

              objc_destroyWeak(v105);
              objc_destroyWeak((id *)buf);

            }
            else
            {
              objc_msgSend(v97, "homeKeyItem");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = -[NSObject isEqual:](v22, "isEqual:", v53);

              if (v54)
              {
                v55 = (void *)MEMORY[0x1E0D319E8];
                -[HUDashboardViewController context](self, "context");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "home");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "handleAddOrShowHomeKeyButtonTapForHome:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = (id)objc_msgSend(v58, "addCompletionBlock:", &__block_literal_global_241);

              }
              else
              {
                -[HUItemCollectionViewController itemManager](self, "itemManager");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "indexPathForItem:", v22);
                v96 = (void *)objc_claimAutoreleasedReturnValue();

                -[HUItemCollectionViewController itemManager](self, "itemManager");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v96, "section"));
                v93 = (void *)objc_claimAutoreleasedReturnValue();

                v65 = &unk_1EF2AC0A8;
                v66 = v22;
                if (-[NSObject conformsToProtocol:](v66, "conformsToProtocol:", v65))
                  v67 = v66;
                else
                  v67 = 0;
                v91 = v67;

                -[HUDashboardViewController layoutManager](self, "layoutManager");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                -[HUDashboardViewController context](self, "context");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = objc_msgSend(v68, "isAdaptiveTileStyleInSectionIdentifier:context:", v93, v69);

                if (-[HUDashboardViewController isEditing](self, "isEditing") && v91 && v70)
                {
                  -[HUDashboardViewController itemShowingSizeToggleButton](self, "itemShowingSizeToggleButton");
                  v71 = objc_claimAutoreleasedReturnValue();

                  v72 = v91;
                  if (v71 == v91)
                    v73 = 0;
                  else
                    v73 = v91;
                  -[HUDashboardViewController setItemShowingSizeToggleButton:animated:](self, "setItemShowingSizeToggleButton:animated:", v73, 1);
                }
                else
                {
                  -[HUDashboardViewController setItemShowingSizeToggleButton:animated:](self, "setItemShowingSizeToggleButton:animated:", 0, 1);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v74 = v66;
                    -[NSObject activityLogCoordinator](v74, "activityLogCoordinator");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = [HUActivityLogViewController alloc];
                    -[HUItemCollectionViewController itemManager](self, "itemManager");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "home");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    v78 = -[HUActivityLogViewController initWithHome:activityLogCoordinator:](v75, "initWithHome:activityLogCoordinator:", v77, v89);

                    v79 = objc_alloc(MEMORY[0x1E0CEA7B8]);
                    v80 = (void *)objc_msgSend(v79, "initWithRootViewController:", v78);
                    -[HUDashboardViewController navigationController](self, "navigationController");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "presentViewController:animated:completion:", v80, 1, 0);

                  }
                  else
                  {
                    v82 = &selRef_prepareUsingFeedback_;
                    if ((_os_feature_enabled_impl() & 1) != 0
                      || CFPreferencesGetAppBooleanValue(CFSTR("MatteriPhoneOnlyPairingEnabled"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
                    {
                      -[NSObject latestResults](v66, "latestResults");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v83, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
                      v84 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_opt_class();
                      v85 = v84;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v86 = v85;
                      else
                        v86 = 0;
                      v87 = v86;

                      if (v87 && objc_msgSend(v87, "isThreadNetworkError"))
                      {
                        HFLogForCategory();
                        v88 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 136315394;
                          v107 = (HUDashboardViewController *)"-[HUDashboardViewController presentationCoordinator:didRec"
                                                              "ognizeTapForItem:tappedArea:]";
                          v108 = 2112;
                          v109 = v66;
                          _os_log_impl(&dword_1B8E1E000, v88, OS_LOG_TYPE_DEFAULT, "%s Item: %@ tapped and is unreachable due to thread network", buf, 0x16u);
                        }

                        v99.receiver = self;
                        v99.super_class = (Class)HUDashboardViewController;
                        -[HUControllableItemCollectionViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:](&v99, sel_presentationCoordinator_didRecognizeTapForItem_tappedArea_, v9, v66, v11);
                      }

                      v82 = &selRef_prepareUsingFeedback_;
                    }
                    v98.receiver = self;
                    v98.super_class = (Class)HUDashboardViewController;
                    objc_msgSendSuper2(&v98, v82[70], v9, v66, v11);
                  }
                  v72 = v91;
                }

              }
            }
          }
          goto LABEL_16;
        }
      }
    }
    HFLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v107 = (HUDashboardViewController *)"-[HUDashboardViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:]";
      v108 = 2112;
      v109 = v24;
      v110 = 2112;
      v111 = v22;
      _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "(%s) Skipping action because ruleItem = %@ | item = %@", buf, 0x20u);
    }

LABEL_16:
    goto LABEL_17;
  }
  v14 = (void *)MEMORY[0x1E0D31160];
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v14, "addAndSetupNewAccessoriesForHome:room:", v16, 0);

LABEL_17:
}

void __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *WeakRetained;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD);
  id v10;
  int v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HUPersonalPINCodeViewController *v16;
  void *v17;
  id v18;
  void *v19;
  _BOOL4 v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(_QWORD);
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2;
  v31[3] = &unk_1E6F531C0;
  v32 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = WeakRetained;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@: %@ Found matching PIN code for user.", buf, 0x16u);

    }
    objc_initWeak(&location, WeakRetained);
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_289;
    aBlock[3] = &unk_1E6F53590;
    objc_copyWeak(&v29, &location);
    v26 = v6;
    v27 = *(id *)(a1 + 40);
    v28 = *(id *)(a1 + 48);
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v10 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v24 = 0;
    v11 = objc_msgSend(v10, "canEvaluatePolicy:error:", 2, &v24);
    v12 = v24;
    v13 = v12;
    if (v11)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodePassCodeAuthString"), CFSTR("HUPinCodePassCodeAuthString"), 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2_296;
      v21[3] = &unk_1E6F5C7F8;
      v23 = v9;
      v22 = v10;
      objc_msgSend(v22, "evaluatePolicy:localizedReason:reply:", 2, v14, v21);

    }
    else
    {
      objc_msgSend(v12, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CC1280]))
      {
        v20 = objc_msgSend(v13, "code") == -5;

        if (v20)
        {
          v9[2](v9);
LABEL_14:

          objc_destroyWeak(&v29);
          objc_destroyWeak(&location);
          goto LABEL_15;
        }
      }
      else
      {

      }
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[HUDashboardViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:]_block_invoke";
        v35 = 2112;
        v36 = v13;
        _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "(%s) cannot local authenticate. error = %@", buf, 0x16u);
      }
    }

    goto LABEL_14;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31988]), "initWithHome:user:nameStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  v16 = -[HUPersonalPINCodeViewController initWithItem:pinCodeManager:home:]([HUPersonalPINCodeViewController alloc], "initWithItem:pinCodeManager:home:", v15, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  -[HUPersonalPINCodeViewController setShowDoneButtonInNavBar:](v16, "setShowDoneButtonInNavBar:", 1);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v16);
  objc_msgSend(v17, "setModalPresentationStyle:", 2);
  v18 = (id)objc_msgSend(WeakRetained, "hu_presentPreloadableViewController:animated:", v17, 1);

LABEL_15:
}

uint64_t __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_289(uint64_t a1)
{
  void *v2;
  HUPersonalPINCodeViewController *v3;
  void *v4;
  HUPersonalPINCodeViewController *v5;
  void *v6;
  id v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  v3 = [HUPersonalPINCodeViewController alloc];
  objc_msgSend(*(id *)(a1 + 48), "pinCodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUPersonalPINCodeViewController initWithItem:pinCodeManager:home:](v3, "initWithItem:pinCodeManager:home:", v2, v4, *(_QWORD *)(a1 + 40));

  -[HUPersonalPINCodeViewController setShowDoneButtonInNavBar:](v5, "setShowDoneButtonInNavBar:", 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  v7 = (id)objc_msgSend(WeakRetained, "hu_presentPreloadableViewController:animated:", v6, 1);

}

void __87__HUDashboardViewController_presentationCoordinator_didRecognizeTapForItem_tappedArea___block_invoke_2_296(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[HUDashboardViewController presentationCoordinator:didRecognizeTapForItem:tappedArea:]_block_invoke_2";
      v9 = 2112;
      v10 = v5;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(%s) When evaluating authentication policy, authError = %@", (uint8_t *)&v7, 0x16u);
    }

  }
  else
  {
    if (a2)
      dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") & 1) == 0
    && -[HUDashboardViewController _hasDetailViewControllerForItem:](self, "_hasDetailViewControllerForItem:", v5);

  return v6;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[HUDashboardViewController _quickControlDetailViewControllerForItem:](self, "_quickControlDetailViewControllerForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    NSLog(CFSTR("No details view controller for item: %@"), v5);

  return v6;
}

- (BOOL)_hasDetailViewControllerForItem:(id)a3
{
  id v3;
  char isKindOfClass;
  char v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC470);
  objc_opt_class();
  v6 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EF2AC470);

  return (isKindOfClass | v5 | v10) & 1;
}

- (id)_quickControlDetailViewControllerForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  HUSceneActionEditorViewController *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2AC470))
    {
      v15 = v4;
      if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF2AC470))
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      objc_opt_class();
      v7 = v17;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v7;
      else
        v18 = 0;
      v13 = v18;

      if (v13)
      {
        objc_msgSend(v13, "accessory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hf_isSingleServiceLikeAccessory");

        if (v20)
        {
          objc_msgSend(v13, "accessory");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "hf_primaryService");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "serviceItemForService:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v23;
        }
      }
      objc_initWeak(&location, self);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke;
      v36[3] = &unk_1E6F4DD08;
      v24 = &v37;
      objc_copyWeak(&v37, &location);
      +[HUAccessoryDetailsRouter detailsViewFor:navigationController:dismiss:](HUAccessoryDetailsRouter, "detailsViewFor:navigationController:dismiss:", v7, 0, v36);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_30:
        NSLog(CFSTR("No details view controller for item: %@"), v4, v31, v32, v33, v34);
        v14 = 0;
        goto LABEL_31;
      }
      objc_opt_class();
      v26 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
      v7 = v27;

      objc_msgSend(v7, "sourceItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "conformsToProtocol:", &unk_1EF2AC470))
        v29 = v28;
      else
        v29 = 0;
      v13 = v29;

      objc_initWeak(&location, self);
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke_2;
      v34 = &unk_1E6F4DD08;
      v24 = &v35;
      objc_copyWeak(&v35, &location);
      +[HUAccessoryDetailsRouter detailsViewFor:navigationController:dismiss:](HUAccessoryDetailsRouter, "detailsViewFor:navigationController:dismiss:", v13, 0, &v31);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (HUSceneActionEditorViewController *)v25;
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_27;
  }
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "actionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D31140]);
    objc_msgSend(v7, "actionSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "initWithExistingObject:inHome:", v10, v12);

    v14 = -[HUSceneActionEditorViewController initWithActionSetBuilder:mode:]([HUSceneActionEditorViewController alloc], "initWithActionSetBuilder:mode:", v13, 0);
LABEL_27:

    goto LABEL_29;
  }
  NSLog(CFSTR("actionSet must not be nil to show the editor"));
  v14 = 0;
LABEL_29:

  if (!v14)
    goto LABEL_30;
LABEL_31:

  return v14;
}

void __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "_dismissPresentedViewControllersAnimated:", 1);

}

void __70__HUDashboardViewController__quickControlDetailViewControllerForItem___block_invoke_2(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (id)objc_msgSend(WeakRetained, "_dismissPresentedViewControllersAnimated:", 1);

}

- (void)_updateTabBarVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[HUDashboardViewController _shouldHideTabBar](self, "_shouldHideTabBar");
  -[HUDashboardViewController tabBarController](self, "tabBarController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)_shouldHideTabBar
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  char v9;

  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome");

  if ((v5 & 1) != 0)
    return 1;
  -[HUDashboardViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_currentUserIsRestrictedGuest");

  return v9;
}

- (void)dashboardItemManager:(id)a3 didUpdateContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v5 = a4;
  -[HUDashboardViewController _updateBadgeCountForHomeButton](self, "_updateBadgeCountForHomeButton");
  -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons");
  -[HUDashboardViewController _updateTabBarVisibility](self, "_updateTabBarVisibility");
  -[HUDashboardViewController _updateFilterBarVisibility](self, "_updateFilterBarVisibility");
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");
  -[HUDashboardViewController wallpaperView](self, "wallpaperView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)objc_msgSend(v6, "refreshWallpaperForHomeKitObject:withAnimation:", v8, 1);
  }
  else
  {
    -[HUDashboardViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v6, "refreshWallpaperForHomeKitObject:withAnimation:", v11, 1);

  }
  -[HUDashboardViewController _showNoHomeAccessViewsIfNeeded](self, "_showNoHomeAccessViewsIfNeeded");
  -[HUDashboardViewController navigationHomeButton](self, "navigationHomeButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNavigationMenuFactory homeMenuForButton:](HUNavigationMenuFactory, "homeMenuForButton:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController navigationHomeButton](self, "navigationHomeButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMenu:", v14);

  objc_msgSend(v5, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "hf_shouldBlockCurrentRestrictedGuestFromHome");
  v18 = -[HUDashboardViewController _isShowingRestrictedGuestBlockedBackdropView](self, "_isShowingRestrictedGuestBlockedBackdropView");
  if (v17)
  {
    if (!v18)
    {
      -[HUDashboardViewController createRestrictedGuestBlockedBackdropViewIfNeeded](self, "createRestrictedGuestBlockedBackdropViewIfNeeded");
      -[HUDashboardViewController view](self, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController wallpaperView](self, "wallpaperView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertSubview:above:", v20, v21);

LABEL_9:
    }
  }
  else if (v18)
  {
    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFromSuperview");
    goto LABEL_9;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    -[HUDashboardViewController context](self, "context");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    +[HUSideBarSelectionManager sharedManager](HUSideBarSelectionManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCurrentContext:", v23);

  }
}

uint64_t __46__HUDashboardViewController_hu_preloadContent__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[HUDashboardViewController setItemShowingSizeToggleButton:animated:](self, "setItemShowingSizeToggleButton:animated:", 0, 1);
}

- (void)accessoryTileSizeButtonTappedFor:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  HUDashboardViewController *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138413058;
    v14 = self;
    v15 = 2080;
    v16 = "-[HUDashboardViewController accessoryTileSizeButtonTappedFor:withItem:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped tile size button for cell %@ with item %@", (uint8_t *)&v13, 0x2Au);
  }

  v9 = v7;
  v10 = &unk_1EF2AC0A8;
  if (objc_msgSend(v9, "conformsToProtocol:", v10))
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    -[HUDashboardViewController _toggleSizeForCell:withItem:](self, "_toggleSizeForCell:withItem:", v6, v12);

}

- (id)_titleForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionIndexForDisplayedSectionIdentifier:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleForSection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_presentDetailsViewControllerForSectionWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v4 = a4;
  v27 = a3;
  objc_opt_class();
  -[HUDashboardViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "subviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_363);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setDisableWallpaperUpdate:", 1);
  if (objc_msgSend(v27, "isEqualToString:", CFSTR("camerasSection")))
  {
    -[HUDashboardViewController _titleForSectionIdentifier:](self, "_titleForSectionIdentifier:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v15, "showCamerasSectionWithTitle:forHome:animated:", v14, v17, v4);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v27, "isEqualToString:", CFSTR("SpeakersAndTVsSection")))
  {
    -[HUDashboardViewController _titleForSectionIdentifier:](self, "_titleForSectionIdentifier:", v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v15, "showSpeakersAndTVsSectionWithTitle:forHome:animated:", v14, v17, v4);
    goto LABEL_8;
  }
  -[HUDashboardViewController context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HURoomForDashboardSectionIdentifier(v27, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v15, "showRoom:animated:", v14, v4);
  }
  else
  {
    if (objc_msgSend(v27, "isEqualToString:", CFSTR("scenesSection")))
    {
      -[HUDashboardViewController _titleForSectionIdentifier:](self, "_titleForSectionIdentifier:", v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (id)objc_msgSend(v23, "showScenesSectionWithDashboardTitle:forHome:animated:", v15, v25, v4);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDashboardViewController.m"), 1703, CFSTR("%@ Unhandled presentation for section with identifier: %@"), self, v27);
    }
    v14 = 0;
  }
LABEL_9:

}

uint64_t __92__HUDashboardViewController__presentDetailsViewControllerForSectionWithIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_itemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  HUDashboardViewController *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingItemForHomeKitObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildItemForHomeKitObject:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = v8;
  v11 = &unk_1EF2544A8;
  if (objc_msgSend(v10, "conformsToProtocol:", v11))
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  v14 = v13;
  v15 = &unk_1EF254560;
  if (objc_msgSend(v14, "conformsToProtocol:", v15))
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    -[HUDashboardViewController context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_characteristicValueManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v17;
    v22 = &unk_1EF2AC470;
    if (objc_msgSend(v21, "conformsToProtocol:", v22))
      v23 = v21;
    else
      v23 = 0;
    v24 = v23;

    if (v24)
    {
      objc_msgSend(v24, "valueSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v24, "valueSource");
        v26 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v26;
      }
    }
    objc_msgSend(MEMORY[0x1E0D31858], "policyWithDecision:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HUDashboardViewControllerTransactionReasonDisableReads"), v27, 0);

    v36 = *MEMORY[0x1E0D30910];
    v37 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateWithOptions:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "commitTransactionWithReason:", CFSTR("HUDashboardViewControllerTransactionReasonDisableReads"));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __51__HUDashboardViewController__itemForHomeKitObject___block_invoke;
    v34[3] = &unk_1E6F514A0;
    v35 = v21;
    objc_msgSend(v29, "flatMap:", v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v39 = self;
      v40 = 2112;
      v41 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_ERROR, "%@ Failed to find item for HomeKit object: %@", buf, 0x16u);
    }

    v32 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "futureWithError:", v20);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

uint64_t __51__HUDashboardViewController__itemForHomeKitObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)_presentAccessorySettingsForHomeKitObject:(id)a3 fromStatusItem:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  -[HUDashboardViewController _itemForHomeKitObject:](self, "_itemForHomeKitObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke;
  v14[3] = &unk_1E6F5CD08;
  objc_copyWeak(&v16, &location);
  v17 = a5;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v10, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

id __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissPresentedViewControllersAnimated:", *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke_2;
  v9[3] = &unk_1E6F56C28;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v6 = v3;
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v7;
}

id __95__HUDashboardViewController__presentAccessorySettingsForHomeKitObject_fromStatusItem_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = WeakRetained;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Presenting accessory settings for item: %@ from status item: %@", (uint8_t *)&v8, 0x20u);
  }

  objc_msgSend(WeakRetained, "presentAccessorySettingsForItem:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_presentAccessoryControlsForHomeKitObject:(id)a3 fromStatusItem:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  BOOL v28;
  id location;

  v8 = a3;
  v9 = a4;
  -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF2544A8))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v14)
    goto LABEL_7;
  objc_msgSend(v14, "homeKitObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0D519C0];
    -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cardViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithResult:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    objc_initWeak(&location, self);
    -[HUDashboardViewController _itemForHomeKitObject:](self, "_itemForHomeKitObject:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke;
    v25[3] = &unk_1E6F5CD08;
    objc_copyWeak(&v27, &location);
    v28 = a5;
    v26 = v9;
    objc_msgSend(v23, "flatMap:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v22;
}

id __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissPresentedViewControllersAnimated:", *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke_2;
  v9[3] = &unk_1E6F5CD30;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v6 = v3;
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v13 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  return v7;
}

id __95__HUDashboardViewController__presentAccessoryControlsForHomeKitObject_fromStatusItem_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setItem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHome:", v5);

  objc_msgSend(WeakRetained, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childItemsForItem:ofClass:", *(_QWORD *)(a1 + 32), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setControlItems:", v7);

  objc_msgSend(v3, "setPrefersSystemTransitions:", 1);
  objc_msgSend(WeakRetained, "navigationController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (id)v8;
  else
    v10 = WeakRetained;
  objc_msgSend(v3, "setSourceViewController:", v10);

  objc_msgSend(WeakRetained, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldIncludeRoomNameInHeaderTitle:", v12 == 0);

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v19 = 138412802;
    v20 = WeakRetained;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@ Presenting quick controls for item: %@ from status item: %@", (uint8_t *)&v19, 0x20u);
  }

  objc_msgSend(WeakRetained, "quickControlPresentationCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentQuickControlWithContext:animated:", v3, *(unsigned __int8 *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_dismissPresentedViewControllersAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissQuickControlAnimated:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__HUDashboardViewController__dismissPresentedViewControllersAnimated___block_invoke;
  v9[3] = &unk_1E6F5CD58;
  objc_copyWeak(&v10, &location);
  v11 = v3;
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

id __70__HUDashboardViewController__dismissPresentedViewControllersAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hu_dismissViewControllerAnimated:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldShowAccessoryControlsForHomeKitObject:(id)a3 fromStatusItem:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  LOBYTE(v6) = objc_msgSend(v5, "containsObject:", v6, v8, v9);
  return v6 ^ 1;
}

- (BOOL)_canSkipStatusDetailsForItem:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", objc_opt_class()) & 1) != 0)
    LOBYTE(v6) = 0;
  else
    v6 = !-[HUDashboardViewController _statusItemRepresentsOnlyResidentIPads:](self, "_statusItemRepresentsOnlyResidentIPads:", v4);

  return v6;
}

- (BOOL)_statusItemRepresentsOnlyResidentIPads:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "na_all:", &__block_literal_global_380);
  return (char)v3;
}

BOOL __68__HUDashboardViewController__statusItemRepresentsOnlyResidentIPads___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "hf_linkedAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)createRestrictedGuestBlockedBackdropViewIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);
    -[HUDashboardViewController setRestrictedGuestBlockedBackdropView:](self, "setRestrictedGuestBlockedBackdropView:", v6);

    -[HUDashboardViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

    -[HUDashboardViewController restrictedGuestBlockedBackdropView](self, "restrictedGuestBlockedBackdropView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

  }
}

- (void)_handleBackgroundTap:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  HUDashboardViewController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ User tapped background", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService"))
  {
    -[HUDashboardViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_7:

    return;
  }
  if (-[HUDashboardViewController isOverlay](self, "isOverlay"))
  {
    -[HUDashboardViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "popToRootViewControllerAnimated:", 1);
    goto LABEL_7;
  }
  -[HUDashboardViewController itemShowingSizeToggleButton](self, "itemShowingSizeToggleButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[HUDashboardViewController setItemShowingSizeToggleButton:animated:](self, "setItemShowingSizeToggleButton:animated:", 0, 1);
}

- (void)_toggleSizeForCell:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  HUDashboardViewController *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accessoryRepresentableObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController layoutManager](self, "layoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "gridSizeForItem:", v7);
  v12 = v11;

  v13 = v12 <= 1 || v10 <= 1;
  v14 = (_QWORD *)MEMORY[0x1E0D30FE0];
  if (v13)
    v14 = (_QWORD *)MEMORY[0x1E0D30FD8];
  v15 = (id)objc_msgSend(v8, "hf_setTileSize:", *v14);
  v16 = (void *)MEMORY[0x1E0CEABB0];
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __57__HUDashboardViewController__toggleSizeForCell_withItem___block_invoke;
  v23 = &unk_1E6F4C638;
  v24 = v6;
  v25 = self;
  v17 = v6;
  objc_msgSend(v16, "animateWithDuration:animations:", &v20, 0.3);
  -[HUItemCollectionViewController itemManager](self, "itemManager", v20, v21, v22, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reconfigureUIRepresentationForItems:withAnimation:", v19, 1);

}

void __57__HUDashboardViewController__toggleSizeForCell_withItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "updateSizeChangeButton");
  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)_updateAllHeaderViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CEB3B8];
  objc_msgSend(v3, "indexPathsForVisibleSupplementaryElementsOfKind:", *MEMORY[0x1E0CEB3B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        -[HUDashboardViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "supplementaryViewForElementKind:atIndexPath:", v4, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
          -[HUDashboardViewController _updateHeaderView:atIndexPath:](self, "_updateHeaderView:atIndexPath:", v15, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (void)migrationUpdatedTileSize:(id)a3
{
  -[HUDashboardViewController reloadLayoutAnimated:fastUpdate:](self, "reloadLayoutAnimated:fastUpdate:", 1, 1);
}

- (void)bannerSizeUpdated:(id)a3
{
  -[HUDashboardViewController reloadLayoutAnimated:fastUpdate:](self, "reloadLayoutAnimated:fastUpdate:", 1, 0);
}

- (void)applicationWentIntoBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController context](self, "context", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessoryTypeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31130], "energyAccessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    -[HUDashboardViewController energyCategoryViewStartTime](self, "energyCategoryViewStartTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController energyCategoryViewStartTime](self, "energyCategoryViewStartTime");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;

      HFLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = v10;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "Energy Category view duration:%f [s]", buf, 0xCu);
      }

      -[HUDashboardViewController setEnergyCategoryViewStartTime:](self, "setEnergyCategoryViewStartTime:", 0);
      if (v10 > 1.0)
      {
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allHomesFuture");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __59__HUDashboardViewController_applicationWentIntoBackground___block_invoke;
        v16[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
        *(double *)&v16[4] = v10;
        v14 = (id)objc_msgSend(v13, "addCompletionBlock:", v16);

      }
    }
  }
  else
  {

  }
}

void __59__HUDashboardViewController_applicationWentIntoBackground___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "accessories", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUEnergyAnalytics saveViewDurationEvent:withDuration:withUserHasAccessories:](HUEnergyAnalytics, "saveViewDurationEvent:withDuration:withUserHasAccessories:", 47, v9, v4);

}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUHomeEnergyManagerHelper *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  HUDashboardViewController *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryTypeGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31130], "energyAccessoryTypeGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDashboardViewController setEnergyCategoryViewStartTime:](self, "setEnergyCategoryViewStartTime:", v7);

  }
  -[HUDashboardViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [HUHomeEnergyManagerHelper alloc];
    -[HUDashboardViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUHomeEnergyManagerHelper initWithHome:](v10, "initWithHome:", v12);

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2080;
      v19 = "-[HUDashboardViewController applicationWillEnterForeground:]";
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@ %s Updating Home Location", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__HUDashboardViewController_applicationWillEnterForeground___block_invoke;
    v15[3] = &unk_1E6F4D988;
    v15[4] = self;
    -[NSObject updateHomeLocationWithCompletionHandler:](v13, "updateHomeLocationWithCompletionHandler:", v15);
  }
  else
  {
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2080;
      v19 = "-[HUDashboardViewController applicationWillEnterForeground:]";
      _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@ %s home is nil.", buf, 0x16u);
    }
  }

}

void __60__HUDashboardViewController_applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412546;
    v5 = v3;
    v6 = 2080;
    v7 = "-[HUDashboardViewController applicationWillEnterForeground:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@ %s Updated Home Location", (uint8_t *)&v4, 0x16u);
  }

}

- (HUDashboardViewControllerDelegate)delegate
{
  return (HUDashboardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HUAccessoryControlAnimator)accessoryControlAnimator
{
  return self->_accessoryControlAnimator;
}

- (void)setAccessoryControlAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryControlAnimator, a3);
}

- (void)setTipPopoverController:(id)a3
{
  objc_storeWeak((id *)&self->_tipPopoverController, a3);
}

- (void)setViewFullyVisibleFuture:(id)a3
{
  objc_storeStrong((id *)&self->_viewFullyVisibleFuture, a3);
}

- (HFAccessoryRepresentableItem)itemShowingSizeToggleButton
{
  return self->_itemShowingSizeToggleButton;
}

- (void)setWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperView, a3);
}

- (void)setHomeUpgradedToRoarView:(id)a3
{
  objc_storeStrong((id *)&self->_homeUpgradedToRoarView, a3);
}

- (void)setRoarBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_roarBackdropView, a3);
}

- (void)setUpgradeViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeViewConstraints, a3);
}

- (UIVisualEffectView)restrictedGuestBlockedBackdropView
{
  return self->_restrictedGuestBlockedBackdropView;
}

- (void)setRestrictedGuestBlockedBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedGuestBlockedBackdropView, a3);
}

- (NSDate)energyCategoryViewStartTime
{
  return self->_energyCategoryViewStartTime;
}

- (void)setEnergyCategoryViewStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_energyCategoryViewStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyCategoryViewStartTime, 0);
  objc_storeStrong((id *)&self->_cameraItemModuleController, 0);
  objc_storeStrong((id *)&self->_bannerItemModuleController, 0);
  objc_storeStrong((id *)&self->_restrictedGuestBlockedBackdropView, 0);
  objc_storeStrong((id *)&self->_upgradeViewConstraints, 0);
  objc_storeStrong((id *)&self->_roarBackdropView, 0);
  objc_storeStrong((id *)&self->_homeUpgradedToRoarView, 0);
  objc_storeStrong((id *)&self->_blurGroupingEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
  objc_storeStrong((id *)&self->_itemShowingSizeToggleButton, 0);
  objc_storeStrong((id *)&self->_navigationEditDoneButton, 0);
  objc_storeStrong((id *)&self->_navigationHomeButton, 0);
  objc_storeStrong((id *)&self->_navigationAnnounceButton, 0);
  objc_storeStrong((id *)&self->_navigationAddButton, 0);
  objc_storeStrong((id *)&self->_viewFullyVisibleFuture, 0);
  objc_storeStrong((id *)&self->_energyIndicatorViewController, 0);
  objc_storeStrong(&self->_tipsObserver, 0);
  objc_destroyWeak((id *)&self->_tipPopoverController);
  objc_storeStrong((id *)&self->_viewFirstTimeFullyVisibleFuture, 0);
  objc_storeStrong((id *)&self->_accessoryControlAnimator, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingItemForHomeKitObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v7 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      objc_msgSend(v9, "hf_primaryService");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_13:
        -[HUItemCollectionViewController itemManager](self, "itemManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "buildItemForHomeKitObject:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      objc_opt_class();
      v11 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v9 = v12;

      objc_msgSend(v9, "accessory");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v10;
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "matchingItemForHomeKitObject:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_13;
  }
LABEL_14:

  return v6;
}

- (id)presentHomeKitObject:(id)a3 destination:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v5 = a5;
  -[HUDashboardViewController matchingItemForHomeKitObject:](self, "matchingItemForHomeKitObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_22:
    -[HUDashboardViewController hu_preloadContent](self, "hu_preloadContent");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "flatMap:", &__block_literal_global_669);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  -[HUItemCollectionViewController moduleControllerForItem:](self, "moduleControllerForItem:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "presentItem:destination:animated:", v8, a4, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }

  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF2AC470))
  {
    v11 = v8;
    v12 = v11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_17;
    }
    objc_opt_class();
    v13 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_msgSend(v15, "sourceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v12;
  }
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EF2AC470))
    v16 = v12;
  else
    v16 = 0;
  v9 = v16;

LABEL_17:
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_20;
    case 1uLL:
    case 3uLL:
      if (v9)
      {
        -[HUDashboardViewController presentDetailsForItem:animated:secondaryDestination:](self, "presentDetailsForItem:animated:secondaryDestination:", v9, 1, a4);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_20:
        -[HUDashboardViewController presentItem:animated:](self, "presentItem:animated:", v8, 1);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      break;
    default:

      goto LABEL_22;
  }
LABEL_23:
  v17 = (void *)v10;

  return v17;
}

id __96__HUDashboardViewController_HomeKitObjectPresenting__presentHomeKitObject_destination_animated___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithError:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)presentItemWithUUID:(id)a3 destination:(unint64_t)a4 secondaryDestination:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;

  v6 = a6;
  v10 = a3;
  v11 = 1;
  if ((uint64_t)a4 <= 6)
  {
    if (a4 == 4)
      goto LABEL_9;
    if (a4 == 6)
    {
      v11 = 3;
      goto LABEL_9;
    }
LABEL_11:
    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (a4 == 29 || a4 == 21)
    goto LABEL_9;
  if (a4 != 7)
    goto LABEL_11;
  v11 = 2;
LABEL_9:
  -[HUDashboardViewController _dismissPresentedViewControllersAnimated:](self, "_dismissPresentedViewControllersAnimated:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke;
  v17[3] = &unk_1E6F5CE28;
  v17[4] = self;
  v21 = (a5 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  v18 = v10;
  v19 = a5;
  v22 = v6;
  v20 = v11;
  objc_msgSend(v12, "flatMap:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

id __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  __int16 v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[HUDashboardViewController(HomeKitObjectPresenting) presentItemWithUUID:destination:secondaryDestination:anim"
          "ated:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%s dismissPresentedViewControllersAnimated future completed", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "homeKitObjectWithID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowAccessoryControlForHomeKitObject:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "matchingItemForHomeKitObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_BYTE *)(a1 + 64) && v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "presentAccessorySettingsForItem:secondaryDestination:", v4, *(_QWORD *)(a1 + 48));
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v9 = (void *)v6;
      goto LABEL_12;
    }
    if (!*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "presentHomeKitObject:destination:animated:", v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 65));
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationContextForUUID:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentQuickControlWithContext:animated:", v5, *(unsigned __int8 *)(a1 + 65));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_670;
  v11[3] = &__block_descriptor_42_e18___NAFuture_16__0_8l;
  v12 = *(_WORD *)(a1 + 64);
  v11[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v9;
}

id __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_670(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[HUDashboardViewController(HomeKitObjectPresenting) presentItemWithUUID:destination:secondaryDestination:anim"
          "ated:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s presentQuickControlWithContext future completed", buf, 0xCu);
  }

  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v10, "viewControllerReadyFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_672;
    v17[3] = &unk_1E6F5CDE0;
    v13 = v10;
    v20 = *(_BYTE *)(a1 + 41);
    v14 = *(_QWORD *)(a1 + 32);
    v18 = v13;
    v19 = v14;
    objc_msgSend(v12, "flatMap:", v17);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }

  return v11;
}

id __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_672(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[HUDashboardViewController(HomeKitObjectPresenting) presentItemWithUUID:destination:secondaryDestination:anima"
         "ted:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%s viewControllerReady future completed", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "scrollToDetailsViewAnimated:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)MEMORY[0x1E0D519C0];
  if (*(_QWORD *)(a1 + 40) == 3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_673;
    v6[3] = &unk_1E6F4C660;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v3, "futureWithBlock:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_673(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 500000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_2;
  v6[3] = &unk_1E6F4C638;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], v6);

}

void __116__HUDashboardViewController_HomeKitObjectPresenting__presentItemWithUUID_destination_secondaryDestination_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "settingsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v5 = v3;

  v4 = (id)objc_msgSend(v5, "showConnectedEcosystems");
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", *(_QWORD *)(a1 + 32));

}

- (id)presentCameraProfile:(id)a3 startDate:(id)a4 endDate:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentCameraPlayerViewControllerForHomeKitObject:startDate:endDate:animated:", v12, v11, v10, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)presentCameraProfile:(id)a3 forCameraClip:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentCameraPlayerViewControllerForHomeKitObject:cameraClip:animated:", v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)presentFeedbackFlowForCameraClip:(id)a3 fromProfile:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3, a4);
}

- (id)presentStatusDetailsForStatusItemClass:(Class)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HUDashboardViewController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  HUDashboardViewController *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    NSStringFromClass(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Invalid status item class: %@"), v7);

  }
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __102__HUDashboardViewController_HomeKitObjectPresenting__presentStatusDetailsForStatusItemClass_animated___block_invoke;
  v24[3] = &__block_descriptor_40_e16_B16__0__HFItem_8lu32l8;
  v24[4] = a3;
  objc_msgSend(v9, "na_firstObjectPassingTest:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setItem:", v10);
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHome:", v13);

    objc_msgSend(v11, "setPrefersSystemTransitions:", 1);
    -[HUDashboardViewController navigationController](self, "navigationController");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (HUDashboardViewController *)v14;
    else
      v16 = self;
    objc_msgSend(v11, "setSourceViewController:", v16);

    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@ Presenting status details for status item: %@", buf, 0x16u);
    }

    -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentQuickControlWithContext:animated:", v11, v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v23;
      _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "%@ Failed to find status item of class: %@", buf, 0x16u);

    }
    v21 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

uint64_t __102__HUDashboardViewController_HomeKitObjectPresenting__presentStatusDetailsForStatusItemClass_animated___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)presentItem:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if (-[HUControllableItemCollectionViewController shouldShowAccessoryControlForItem:](self, "shouldShowAccessoryControlForItem:", v6))
  {
    v7 = -[HUControllableItemCollectionViewController presentAccessoryControlsForItem:](self, "presentAccessoryControlsForItem:", v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EF2544A8))
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = v11;
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF254560))
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
      -[HUDashboardViewController _presentQuickControlsForHomeKitItem:animated:](self, "_presentQuickControlsForHomeKitItem:animated:", v14, v4);
    else
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)presentDetailsForItem:(id)a3 animated:(BOOL)a4
{
  return -[HUDashboardViewController presentDetailsForItem:animated:secondaryDestination:](self, "presentDetailsForItem:animated:secondaryDestination:", a3, a4, 0);
}

- (id)presentDetailsForItem:(id)a3 animated:(BOOL)a4 secondaryDestination:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[4];
  BOOL v14;

  v8 = a3;
  if (-[HUControllableItemCollectionViewController shouldShowAccessoryControlForItem:](self, "shouldShowAccessoryControlForItem:", v8))
  {
    -[HUControllableItemCollectionViewController presentAccessorySettingsForItem:secondaryDestination:](self, "presentAccessorySettingsForItem:secondaryDestination:", v8, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    -[HUDashboardViewController _presentQuickControlsForHomeKitItem:animated:](self, "_presentQuickControlsForHomeKitItem:animated:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke;
    v13[3] = &__block_descriptor_33_e42___NAFuture_16__0__UINavigationController_8l;
    v14 = a4;
    objc_msgSend(v11, "flatMap:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
}

id __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  char v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke_2;
  v8[3] = &unk_1E6F51990;
  v9 = v3;
  v10 = *(_BYTE *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __106__HUDashboardViewController_HomeKitObjectPresenting__presentDetailsForItem_animated_secondaryDestination___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v7 = v5;

  objc_msgSend(v7, "scrollToDetailsViewAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v7, "settingsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v6);

}

- (id)_presentQuickControlsForHomeKitItem:(id)a3 animated:(BOOL)a4
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
  id v14;
  int v15;
  void *v16;
  char v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  BOOL v35;
  _QWORD v36[4];
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id location[2];

  v4 = a4;
  v6 = a3;
  objc_initWeak(location, self);
  if (!-[HUControllableItemCollectionViewController shouldShowAccessoryControlForItem:](self, "shouldShowAccessoryControlForItem:", v6))
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v6, "homeKitObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUDashboardViewController _presentAccessoryControlsForHomeKitObject:fromStatusItem:animated:](self, "_presentAccessoryControlsForHomeKitObject:fromStatusItem:animated:", v27, 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_2;
      v36[3] = &unk_1E6F4D1B0;
      v37 = 0;
      v38 = v6;
      v28 = (id)objc_msgSend(v8, "addFailureBlock:", v36);

      v12 = v37;
LABEL_18:

      goto LABEL_19;
    }
    -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = &unk_1EF2544A8;
      v14 = v12;
      v15 = objc_msgSend(v14, "conformsToProtocol:", v13);
      if (v15)
        v16 = v14;
      else
        v16 = 0;
      v17 = v15 ^ 1;
      v18 = v16;

      if (v6)
        v19 = v17;
      else
        v19 = 1;
      if ((v19 & 1) == 0)
      {
        objc_msgSend(v18, "homeKitObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "uniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "homeKitObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uniqueIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqual:", v22);

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0D519C0];
          -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "cardViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "futureWithResult:", v26);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
      }

    }
    -[HUDashboardViewController _dismissPresentedViewControllersAnimated:](self, "_dismissPresentedViewControllersAnimated:", v4);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_3;
    v31[3] = &unk_1E6F5CD30;
    objc_copyWeak(&v34, location);
    v32 = v7;
    v33 = v6;
    v35 = v4;
    objc_msgSend(v18, "flatMap:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v34);
    goto LABEL_17;
  }
  -[HUDashboardViewController _dismissPresentedViewControllersAnimated:](self, "_dismissPresentedViewControllersAnimated:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke;
  v39[3] = &unk_1E6F54D78;
  objc_copyWeak(&v41, location);
  v40 = v6;
  objc_msgSend(v7, "flatMap:", v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v41);
LABEL_19:

  objc_destroyWeak(location);
  return v8;
}

id __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentAccessoryControlsForItem:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_2(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32))
    NSLog(CFSTR("Presenting a non-existent item: %@"), *(_QWORD *)(a1 + 40));
}

id __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  char v17;
  _QWORD v18[5];
  id v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_4;
  v18[3] = &unk_1E6F4E020;
  v18[4] = WeakRetained;
  v19 = v4;
  v20 = *(id *)(a1 + 32);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_5;
  v13[3] = &unk_1E6F5CE90;
  v13[4] = WeakRetained;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v17 = *(_BYTE *)(a1 + 56);
  v8 = v5;
  v16 = v8;
  v9 = v4;
  objc_msgSend(v6, "animateWithDuration:animations:completion:", v18, v13, 0.0);
  v10 = v16;
  v11 = v8;

  return v11;
}

void __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 48), 2, 0);

  }
}

void __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationContextForItem:atIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF253B20))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPressedTile:", v6);

  objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentQuickControlWithContext:animated:", v2, *(unsigned __int8 *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_6;
  v11[3] = &unk_1E6F4C610;
  v12 = *(id *)(a1 + 56);
  v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v11);

}

uint64_t __99__HUDashboardViewController_HomeKitObjectPresenting___presentQuickControlsForHomeKitItem_animated___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  void *v4;
  void *v5;
  HUHomeEnergyManagerHelper *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  HUHomeEnergyManagerHelper *v10;
  uint8_t buf[4];
  HUDashboardViewController *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HUDashboardViewController context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [HUHomeEnergyManagerHelper alloc];
    -[HUDashboardViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HUHomeEnergyManagerHelper initWithHome:](v6, "initWithHome:", v8);

    -[HUHomeEnergyManagerHelper updateHomeEnergyAvailableFeaturesWithCompletionHandler:](v10, "updateHomeEnergyAvailableFeaturesWithCompletionHandler:", &__block_literal_global_747);
  }
  else
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = self;
      v13 = 2080;
      v14 = "-[HUDashboardViewController(Observer) homeManagerDidUpdateHomes:]";
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "%@ %s home is nil.", buf, 0x16u);
    }

  }
}

void __65__HUDashboardViewController_Observer__homeManagerDidUpdateHomes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a3;
  objc_msgSend(v3, "sharedHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:", v4);

}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons", a3, a4);
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  -[HUDashboardViewController _updateBarButtons](self, "_updateBarButtons", a3, a4);
  -[HUDashboardViewController _updateHomeEnergyIndicatorVisibility](self, "_updateHomeEnergyIndicatorVisibility");
}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  HUDashboardViewController *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138413058;
    v13 = self;
    v14 = 2080;
    v15 = "-[HUDashboardViewController(Observer) home:didUpdateNameForRoom:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@ %s home %@ room %@", (uint8_t *)&v12, 0x2Au);
  }

  objc_opt_class();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "updateItemSectionHeaderTitleForRoom:", v7);
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[HUDashboardViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "hmf_isEqualToUUID:", v10))
  {

    goto LABEL_5;
  }
  v11 = -[HUDashboardViewController viewIsFullyVisible](self, "viewIsFullyVisible");

  if (v11)
  {
    -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v7, "showHome:", v13);
LABEL_5:

  }
}

- (void)homeDidUpdateWallpaper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;

  v10 = a3;
  -[HUDashboardViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    goto LABEL_6;
  }
  -[HUDashboardViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v10);

  if (v8)
  {
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v4, "refreshWallpaperForHomeKitObject:withAnimation:", v10, 1);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)home:(id)a3 didUpdateWallpaperForRoom:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  -[HUDashboardViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v10);

  if (v7)
  {
    -[HUDashboardViewController wallpaperView](self, "wallpaperView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "refreshWallpaperForHomeKitObject:withAnimation:", v10, 1);

  }
}

- (void)home:(id)a3 didUpdateLocation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  HUHomeEnergyManagerHelper *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  HUDashboardViewController *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUDashboardViewController wallpaperView](self, "wallpaperView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)objc_msgSend(v6, "refreshWallpaperForHomeKitObject:withAnimation:", v8, 1);
  }
  else
  {
    -[HUDashboardViewController context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v6, "refreshWallpaperForHomeKitObject:withAnimation:", v11, 1);

  }
  -[HUDashboardViewController context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[HUDashboardViewController context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "home");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 == v5)
    {
      v18 = [HUHomeEnergyManagerHelper alloc];
      -[HUDashboardViewController context](self, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "home");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HUHomeEnergyManagerHelper initWithHome:](v18, "initWithHome:", v20);

      HFLogForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        v26 = 2080;
        v27 = "-[HUDashboardViewController(Observer) home:didUpdateLocation:]";
        _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@ %s Updating Home Location", buf, 0x16u);
      }

      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __62__HUDashboardViewController_Observer__home_didUpdateLocation___block_invoke;
      v23[3] = &unk_1E6F4D988;
      v23[4] = self;
      -[NSObject updateHomeLocationWithCompletionHandler:](v21, "updateHomeLocationWithCompletionHandler:", v23);
      goto LABEL_12;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v25 = self;
    v26 = 2080;
    v27 = "-[HUDashboardViewController(Observer) home:didUpdateLocation:]";
    _os_log_error_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_ERROR, "%@ %s home is nil.", buf, 0x16u);
  }
LABEL_12:

}

void __62__HUDashboardViewController_Observer__home_didUpdateLocation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412546;
    v5 = v3;
    v6 = 2080;
    v7 = "-[HUDashboardViewController(Observer) home:didUpdateLocation:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s Updated Home Location", (uint8_t *)&v4, 0x16u);
  }

}

- (void)home:(id)a3 didUpdateApplicationDataForServiceGroup:(id)a4
{
  -[HUDashboardViewController reloadLayoutAnimated:fastUpdate:](self, "reloadLayoutAnimated:fastUpdate:", 1, 1);
}

- (void)accessory:(id)a3 didUpdateApplicationDataForService:(id)a4
{
  -[HUDashboardViewController reloadLayoutAnimated:fastUpdate:](self, "reloadLayoutAnimated:fastUpdate:", 1, 1);
}

- (void)accessoryDidUpdateApplicationData:(id)a3
{
  -[HUDashboardViewController reloadLayoutAnimated:fastUpdate:](self, "reloadLayoutAnimated:fastUpdate:", 1, 1);
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "warmup");

  -[HUDashboardViewController cameraItemModuleController](self, "cameraItemModuleController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cameraController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12)
  {
    objc_msgSend(v12, "playerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "hu_dismissViewControllerAnimated:", 0);

    v8 = v12;
  }

}

- (id)presentRoomSettingsForRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  if (v4
    || (-[HUDashboardViewController context](self, "context"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "room"),
        v4 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    -[HUDashboardViewController _presentRoomEditorForRoom:](self, "_presentRoomEditorForRoom:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "HUDashboardViewController: room not provided for settings presentation", v9, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_presentRoomEditorForRoom:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HUEditRoomViewController *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0D31700];
  v5 = a3;
  v6 = [v4 alloc];
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithExistingObject:inHome:", v5, v8);

  v10 = -[HUEditRoomViewController initWithRoomBuilder:presentationDelegate:addRoomDelegate:]([HUEditRoomViewController alloc], "initWithRoomBuilder:presentationDelegate:addRoomDelegate:", v9, self, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v10);
  objc_msgSend(v11, "setModalPresentationStyle:", 2);
  -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)editRoomViewControllerDidFinish:(id)a3 withNewRoom:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  if (v8)
  {
    -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "showRoom:", v8);

  }
  -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewController");

}

- (void)homeEnergyNavigationBarIndicatorTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  +[HUEnergyAnalytics saveTapEvent:withInteractionType:](HUEnergyAnalytics, "saveTapEvent:withInteractionType:", 55, 1);
  -[HUDashboardViewController _dashboardNavigator](self, "_dashboardNavigator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31130], "energyAccessoryTypeGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "showAccessoryTypeGroup:forHome:animated:", v4, v6, 1);

}

- (void)_clipToNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "_restingHeights");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend(v21, "frame");
    v9 = v7 + v8;
    -[HUDashboardViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;

    -[HUDashboardViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17 - v9;

    -[HUDashboardViewController collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v12, v9, v14, v18);

    -[HUDashboardViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClipsToBounds:", 1);

  }
}

void __86__HUDashboardViewController_NavigationBar__navigationBarButtonIdentifierOrderForEdge___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580618;
  qword_1ED580618 = v0;

}

- (id)_dashboardNavigator
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HUDashboardViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2E7E60))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "dashboardNavigator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateFilterBarVisibility
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;

  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "filterPresentationStyle") == 0;

  -[HUDashboardViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bottomPalette");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v4);

  -[HUDashboardViewController _updatePaletteHeight](self, "_updatePaletteHeight");
}

- (id)homeForNavigationBarButton:(id)a3
{
  void *v3;
  void *v4;

  -[HUDashboardViewController context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldIncludeRoomsInHomeMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    -[HUDashboardViewController context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome") & 1) == 0)
    {
      -[HUDashboardViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "horizontalSizeClass") == 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    -[HUDashboardViewController context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hf_shouldBlockCurrentUserFromHome") & 1) == 0)
    {
      -[HUDashboardViewController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "splitViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[HUDashboardViewController navigationController](self, "navigationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "splitViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "isCollapsed");

      }
      else
      {
        v7 = 1;
      }
      goto LABEL_10;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)statusItemsForNavigationBarButton:(id)a3 inHome:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a4;
  -[HUDashboardViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (!v8)
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
LABEL_6:

    return v12;
  }
  -[HUDashboardViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_shouldBlockCurrentUserFromHome");

  if ((v11 & 1) == 0)
  {
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeMenuStatusItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemCollectionViewController itemManager](self, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusItemModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_itemComparator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v12 = (void *)MEMORY[0x1E0C9AA60];
  return v12;
}

- (id)editActionDelegate
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUDashboardViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)supportsEditing
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  -[HUDashboardViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsEditing");

  if (!v4)
    return 0;
  -[HUDashboardViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_shouldBlockCurrentUserFromHome");

  if ((v7 & 1) != 0)
    return 0;
  -[HUDashboardViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");

  if (!v10)
    return 0;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEmptyDashboard");

  return v12 ^ 1;
}

- (NSString)editActionTitle
{
  void *v2;
  void *v3;

  -[HUDashboardViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuEditActionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)editActionTitleLocalizationKey
{
  void *v2;
  void *v3;

  -[HUDashboardViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuEditActionTitleLocalizationKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)startEditing
{
  -[HUDashboardViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)endEditing
{
  -[HUDashboardViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)sendContextMenuMetricsWithTitleLocalizationKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_safeSetObject:forKey:", self, *MEMORY[0x1E0D30358]);
  -[HUDashboardViewController contextTypeDescriptionForAnalytics](self, "contextTypeDescriptionForAnalytics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v11, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30360]);
  objc_msgSend(v11, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E0D302E0]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 36, v11);
}

void __82__HUDashboardViewController_Announce___updateAnnounceNotificationSettingsIfNeeded__block_invoke_1119(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Error updating Announce notification setting - [%@]", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  char v36;
  char v37;
  int v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  int v51;
  char v52;
  void *v53;
  SEL v55;
  int v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  char v60;
  char v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  BOOL v66;
  char v67;
  _QWORD v68[5];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  SEL v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  BOOL v82;
  BOOL v83;
  char v84;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  if ((-[HUDashboardViewController isEditing](self, "isEditing") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D313C8], "isHomeControlService") & 1) != 0)
  {
    v10 = 0;
    goto LABEL_54;
  }
  v55 = a2;
  -[HUControllableItemCollectionViewController quickControlPresentationCoordinator](self, "quickControlPresentationCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUControllableItemCollectionViewController presentationCoordinator:contextForPresentationAtPoint:](self, "presentationCoordinator:contextForPresentationAtPoint:", v11, x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v12;
  objc_msgSend(v12, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v57 = -[HUDashboardViewController _hasDetailViewControllerForItem:](self, "_hasDetailViewControllerForItem:", v13);
  objc_opt_class();
  v15 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v18 = objc_msgSend(v17, "actionSetItemStyle");
  v66 = v18 == 2;

  -[HUDashboardViewController context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");

  v22 = v15;
  v23 = &unk_1EF2544A8;
  if (objc_msgSend(v22, "conformsToProtocol:", v23))
    v24 = v22;
  else
    v24 = 0;
  v25 = v24;

  objc_msgSend(v25, "homeKitObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = &unk_1EF329D10;
  if (objc_msgSend(v26, "conformsToProtocol:", v27))
    v28 = v26;
  else
    v28 = 0;
  v29 = v28;

  v58 = v25;
  objc_msgSend(v25, "homeKitObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = &unk_1EF329C38;
  if (objc_msgSend(v30, "conformsToProtocol:", v31))
    v32 = v30;
  else
    v32 = 0;
  v33 = v32;

  v34 = 0;
  if (v21)
  {
    v67 = 0;
    if (v29)
    {
      v35 = objc_msgSend(v29, "hf_effectiveShowInHomeDashboard");
      v36 = objc_msgSend(v29, "hf_effectiveShowInHomeDashboard");
      v34 = (v18 != 2) & ~v35;
      if (v18 == 2)
        v37 = 0;
      else
        v37 = v36;
      v67 = v37;
    }
  }
  else
  {
    v67 = 0;
  }
  v63 = v34;
  if (v33)
    v38 = v21;
  else
    v38 = 0;
  if (v38 != 1)
  {
    v61 = 0;
LABEL_33:
    v60 = 0;
    goto LABEL_34;
  }
  if (objc_msgSend(v33, "hf_supportsHomeStatus"))
    v61 = objc_msgSend(v33, "hf_isVisibleInHomeStatus") ^ 1;
  else
    v61 = 0;
  if (!objc_msgSend(v33, "hf_supportsHomeStatus"))
    goto LABEL_33;
  v60 = objc_msgSend(v33, "hf_isVisibleInHomeStatus");
LABEL_34:
  v62 = isKindOfClass & 1;
  v64 = v33;
  v65 = v29;
  v56 = v21;
  if (v21)
  {
    -[HUDashboardViewController context](self, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "allowsEditing"))
      LOBYTE(v21) = -[HUDashboardViewController canReorderItemAtIndexPath:](self, "canReorderItemAtIndexPath:", v9);
    else
      LOBYTE(v21) = 0;
    v40 = v57;

  }
  else
  {
    v40 = v57;
    v66 = 0;
  }
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v9, "section"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v22;
  v44 = &unk_1EF2AC0A8;
  if (objc_msgSend(v43, "conformsToProtocol:", v44))
    v45 = v43;
  else
    v45 = 0;
  v46 = v45;

  -[HUDashboardViewController layoutManager](self, "layoutManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDashboardViewController context](self, "context");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v47, "isAdaptiveTileStyleInSectionIdentifier:context:", v42, v48);

  v50 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & v56;
  if (!v46)
    v50 = 0;
  v51 = v50 & v49;
  v52 = v21;
  if (((v62 | v40 | v63) & 1) != 0
    || (v67 & 1) != 0
    || (v61 & 1) != 0
    || (v60 & 1) != 0
    || (v21 & 1) != 0
    || v66
    || (v10 = 0, v51))
  {
    v53 = (void *)MEMORY[0x1E0CEA4B0];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
    v68[3] = &unk_1E6F5D0E8;
    v76 = v52;
    v68[4] = self;
    v69 = v59;
    v77 = v63;
    v70 = v65;
    v75 = v55;
    v78 = v67;
    v79 = v61;
    v71 = v64;
    v80 = v60;
    v81 = v62;
    v72 = v43;
    v82 = v40;
    v73 = v9;
    v83 = v66;
    v84 = v51;
    v74 = v46;
    objc_msgSend(v53, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v68);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferredMenuElementOrder:", 1);

  }
LABEL_54:

  return v10;
}

id __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  __CFString *v62;
  __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v86[5];
  id v87;
  id v88;
  id v89;
  __CFString *v90;
  _QWORD v91[5];
  id v92;
  __CFString *v93;
  _QWORD v94[4];
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  char v100;
  _QWORD v101[4];
  id v102;
  char v103;
  _QWORD v104[5];
  id v105;
  id v106;
  __CFString *v107;
  _QWORD v108[4];
  id v109;
  uint64_t v110;
  id v111;
  __CFString *v112;
  uint64_t v113;
  _QWORD v114[4];
  id v115;
  uint64_t v116;
  id v117;
  __CFString *v118;
  uint64_t v119;
  _QWORD v120[4];
  id v121;
  uint64_t v122;
  id v123;
  __CFString *v124;
  uint64_t v125;
  _QWORD v126[4];
  id v127;
  uint64_t v128;
  id v129;
  __CFString *v130;
  uint64_t v131;
  _QWORD v132[5];
  id v133;
  _QWORD v134[3];

  v134[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_BYTE *)(a1 + 96) && objc_msgSend(MEMORY[0x1E0D319D0], "supportsEditView"))
  {
    v4 = (void *)MEMORY[0x1E0CEA2A8];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "menuEditActionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("rectangle.grid.2x2"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = MEMORY[0x1E0C809B0];
    v132[1] = 3221225472;
    v132[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
    v132[3] = &unk_1E6F50FB0;
    v8 = *(void **)(a1 + 40);
    v132[4] = *(_QWORD *)(a1 + 32);
    v133 = v8;
    objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v132);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addObject:", v9);
  }
  if (*(_BYTE *)(a1 + 97))
  {
    v10 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUShowInHomeDashboardTitle"), CFSTR("HUShowInHomeDashboardTitle"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("plus.circle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
    v126[3] = &unk_1E6F5CFD8;
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v127 = v13;
    v128 = v14;
    v131 = *(_QWORD *)(a1 + 88);
    v129 = v15;
    v130 = CFSTR("HUShowInHomeDashboardTitle");
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v126);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v16);
  }
  if (*(_BYTE *)(a1 + 98))
  {
    v17 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUHideFromHomeDashboardTitle"), CFSTR("HUHideFromHomeDashboardTitle"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("minus.circle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4;
    v120[3] = &unk_1E6F5CFD8;
    v20 = *(id *)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    v121 = v20;
    v122 = v21;
    v125 = *(_QWORD *)(a1 + 88);
    v123 = v22;
    v124 = CFSTR("HUHideFromHomeDashboardTitle");
    objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v18, v19, 0, v120);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v23);
  }
  if (*(_BYTE *)(a1 + 99))
  {
    v24 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUIncludeInHomeStatusTitle"), CFSTR("HUIncludeInHomeStatusTitle"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("house"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5;
    v114[3] = &unk_1E6F5CFD8;
    v27 = *(id *)(a1 + 56);
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(a1 + 40);
    v115 = v27;
    v116 = v28;
    v119 = *(_QWORD *)(a1 + 88);
    v117 = v29;
    v118 = CFSTR("HUIncludeInHomeStatusTitle");
    objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v25, v26, 0, v114);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v30);
  }
  if (*(_BYTE *)(a1 + 100))
  {
    v31 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUExcludeFromHomeStatusTitle"), CFSTR("HUExcludeFromHomeStatusTitle"), 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("house"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_6;
    v108[3] = &unk_1E6F5CFD8;
    v34 = *(id *)(a1 + 56);
    v35 = *(_QWORD *)(a1 + 32);
    v36 = *(void **)(a1 + 40);
    v109 = v34;
    v110 = v35;
    v113 = *(_QWORD *)(a1 + 88);
    v111 = v36;
    v112 = CFSTR("HUExcludeFromHomeStatusTitle");
    objc_msgSend(v31, "actionWithTitle:image:identifier:handler:", v32, v33, 0, v108);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v37);
  }
  if (*(_BYTE *)(a1 + 101))
  {
    v38 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUContextMenuCameraViewLiveStreamTitle"), CFSTR("HUContextMenuCameraViewLiveStreamTitle"), 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("video"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = MEMORY[0x1E0C809B0];
    v104[1] = 3221225472;
    v104[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7;
    v104[3] = &unk_1E6F5D000;
    v104[4] = *(_QWORD *)(a1 + 32);
    v105 = *(id *)(a1 + 64);
    v106 = *(id *)(a1 + 40);
    v107 = CFSTR("HUContextMenuCameraViewLiveStreamTitle");
    objc_msgSend(v38, "actionWithTitle:image:identifier:handler:", v39, v40, 0, v104);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v41);
  }
  if (*(_BYTE *)(a1 + 102))
  {
    v42 = objc_msgSend(*(id *)(a1 + 32), "shouldShowAccessoryControlForItem:", *(_QWORD *)(a1 + 64));
    v43 = MEMORY[0x1E0C809B0];
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8;
    v101[3] = &unk_1E6F5D028;
    v102 = *(id *)(a1 + 64);
    v103 = v42;
    __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8((uint64_t)v101);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(v44, v44, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("gearshape"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v43;
    v94[1] = 3221225472;
    v94[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9;
    v94[3] = &unk_1E6F5D050;
    v100 = v42;
    v48 = *(id *)(a1 + 64);
    v49 = *(_QWORD *)(a1 + 32);
    v95 = v48;
    v96 = v49;
    v97 = *(id *)(a1 + 72);
    v98 = *(id *)(a1 + 40);
    v99 = v44;
    v50 = v44;
    objc_msgSend(v45, "actionWithTitle:image:identifier:handler:", v46, v47, 0, v94);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v51);
  }
  if (*(_BYTE *)(a1 + 103))
  {
    v52 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(CFSTR("HUHideSuggestedScenesTitle"), CFSTR("HUHideSuggestedScenesTitle"), 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("minus.circle"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10;
    v91[3] = &unk_1E6F5D098;
    v55 = *(void **)(a1 + 40);
    v91[4] = *(_QWORD *)(a1 + 32);
    v92 = v55;
    v93 = CFSTR("HUHideSuggestedScenesTitle");
    objc_msgSend(v52, "actionWithTitle:image:identifier:handler:", v53, v54, 0, v91);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v56);
  }
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "layoutManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "gridSizeForItem:", *(_QWORD *)(a1 + 80));
    v60 = v59;

    v61 = v60 <= 1 || v58 <= 1;
    v62 = CFSTR("HUContextMenuShowAsLargeTileTitle");
    if (!v61)
      v62 = CFSTR("HUContextMenuShowAsSmallTileTitle");
    v63 = v62;
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 72));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v66 = v65;
    else
      v66 = 0;
    v67 = v66;

    v68 = (void *)MEMORY[0x1E0CEA2A8];
    _HULocalizedStringWithDefaultValue(v63, v63, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_1183;
    v86[3] = &unk_1E6F5D0C0;
    v86[4] = *(_QWORD *)(a1 + 32);
    v87 = v67;
    v88 = *(id *)(a1 + 80);
    v89 = *(id *)(a1 + 40);
    v90 = v63;
    v70 = v67;
    v71 = v63;
    objc_msgSend(v68, "actionWithTitle:image:identifier:handler:", v69, 0, 0, v86);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v72);
  }
  if (objc_msgSend(v2, "count") || objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(*(id *)(a1 + 64), "conformsToProtocol:", &unk_1EF254560))
    {
      objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationContextForItem:atIndexPath:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x1E0D31170];
      objc_msgSend(*(id *)(a1 + 32), "quickControlPresentationCoordinator");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "logAndSendTileInteractionEventOfType:withPresentationContext:presentationCoordinator:", 3, v73, v75);

    }
  }
  v76 = (void *)MEMORY[0x1E0CEA740];
  v77 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v76, "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, 0, 1, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = (void *)MEMORY[0x1E0CEA740];
  v80 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v79, "menuWithTitle:image:identifier:options:children:", &stru_1E6F60E80, 0, 0, 1, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = (void *)MEMORY[0x1E0CEA740];
  v134[0] = v78;
  v134[1] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "menuWithTitle:children:", &stru_1E6F60E80, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  return v84;
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "editActionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startEditing");

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuEditActionTitleLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sendContextMenuMetricsWithContext:title:", v3, v5);

}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "hf_updateShowInHomeDashboard:", 1);
  objc_msgSend(*(id *)(a1 + 40), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 64));

  return objc_msgSend(*(id *)(a1 + 40), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "hf_updateShowInHomeDashboard:", 0);
  objc_msgSend(*(id *)(a1 + 40), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 64));

  return objc_msgSend(*(id *)(a1 + 40), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "hf_updateIsVisibleInHomeStatus:", 1);
  objc_msgSend(*(id *)(a1 + 40), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 64));

  return objc_msgSend(*(id *)(a1 + 40), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "hf_updateIsVisibleInHomeStatus:", 0);
  objc_msgSend(*(id *)(a1 + 40), "itemManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "reloadAndUpdateAllItemsFromSenderSelector:", *(_QWORD *)(a1 + 64));

  return objc_msgSend(*(id *)(a1 + 40), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "moduleControllerForItem:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "didSelectItem:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

const __CFString *__106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return CFSTR("HUContextMenuSceneDetailsTitle");
  if (*(_BYTE *)(a1 + 40))
    return CFSTR("HUContextMenuAccessorySettingsTitle");
  return CFSTR("HUContextMenuAccessoryDetailsTitle");
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_opt_class();
    v2 = *(id *)(a1 + 32);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
    v4 = v3;

    objc_msgSend(v4, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2AC470))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (!v7)
      v5 = *(void **)(a1 + 32);
    v8 = (id)objc_msgSend(*(id *)(a1 + 40), "presentAccessorySettingsForItem:", v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF253B20))
      v11 = v10;
    else
      v11 = 0;
    v12 = *(void **)(a1 + 40);
    v13 = v11;
    objc_msgSend(v12, "quickControlPresentationCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPressedTile:", v13);

    objc_msgSend(*(id *)(a1 + 40), "quickControlPresentationCoordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v4, "presentQuickControlWithContext:animated:", *(_QWORD *)(a1 + 56), 1);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_setShowPredictedScenesOnDashboard:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", &__block_literal_global_1178);

  return objc_msgSend(*(id *)(a1 + 32), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = v3 == 0;
    v6 = 2112;
    v7 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Updating showPredictedScenesOnDashboard to (NO) succeeded: %{BOOL}d  %@", (uint8_t *)v5, 0x12u);
  }

}

uint64_t __106__HUDashboardViewController_ContextMenu__collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_1183(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_toggleSizeForCell:withItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_sendContextMenuMetricsWithContext:title:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_sendContextMenuMetricsWithContext:(id)a3 title:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E0D30328]);

  objc_msgSend(v8, "sourceViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "topViewController");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v10;
    v14 = v13;

    v10 = v14;
  }
  objc_msgSend(v17, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E0D30358]);
  objc_msgSend(v17, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E0D302E0]);

  -[HUDashboardViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "typeDescriptionForAnalytics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E0D302E8]);

  objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 36, v17);
}

@end
