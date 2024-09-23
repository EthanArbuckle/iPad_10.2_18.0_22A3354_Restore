@implementation HUCardViewController

- (HUCardViewController)init
{
  HUCardViewController *v2;
  HUCardViewController *v3;
  NAPromise *v4;
  NAPromise *viewControllerReadyPromise;
  UILayoutGuide *v6;
  UILayoutGuide *quickControlLayoutGuide;
  uint64_t v8;
  NSMutableArray *contentSizeKeyPathObservees;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUCardViewController;
  v2 = -[HUCardViewController init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reachable = 1;
    v2->_hideControls = 0;
    v2->_hideSettings = 0;
    v2->_disablePullToUnlockSettings = 0;
    v2->_settingsUnlocked = 0;
    v2->_isUnavailableHub = 0;
    v4 = (NAPromise *)objc_alloc_init(MEMORY[0x1E0D519D8]);
    viewControllerReadyPromise = v3->_viewControllerReadyPromise;
    v3->_viewControllerReadyPromise = v4;

    v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    quickControlLayoutGuide = v3->_quickControlLayoutGuide;
    v3->_quickControlLayoutGuide = v6;

    -[UILayoutGuide setIdentifier:](v3->_quickControlLayoutGuide, "setIdentifier:", CFSTR("HUCardViewControllerQuickControlLayoutGuide"));
    v8 = objc_opt_new();
    contentSizeKeyPathObservees = v3->_contentSizeKeyPathObservees;
    v3->_contentSizeKeyPathObservees = (NSMutableArray *)v8;

    -[HUCardViewController view](v3, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addLayoutGuide:", v3->_quickControlLayoutGuide);

  }
  return v3;
}

- (HUCardViewController)initWithControlItems:(id)a3
{
  id v5;
  HUCardViewController *v6;
  HUCardViewController *v7;

  v5 = a3;
  v6 = -[HUCardViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controlItems, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController sourceItem](self, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, sourceItem: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NAFuture)viewControllerReadyFuture
{
  void *v2;
  void *v3;

  -[HUCardViewController viewControllerReadyPromise](self, "viewControllerReadyPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAFuture *)v3;
}

- (void)updateWithQuickControlViewController:(id)a3 settingsViewController:(id)a4 presentationContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HUQuickControlViewControllerCoordinator *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HUQuickControlViewControllerCoordinator *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = a5;
  v9 = a4;
  -[HUCardViewController setQuickControlViewController:](self, "setQuickControlViewController:", a3);
  -[HUCardViewController setSettingsViewController:](self, "setSettingsViewController:", v9);

  objc_msgSend(v8, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[HUCardViewController setSourceItem:](self, "setSourceItem:", v11);

  objc_msgSend(v8, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController setHome:](self, "setHome:", v12);

  v13 = [HUQuickControlViewControllerCoordinator alloc];
  objc_msgSend(v8, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v8, "controlItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HUQuickControlViewControllerCoordinator initWithItem:controlItems:home:delegate:](v13, "initWithItem:controlItems:home:delegate:", v15, v16, v17, self);
  -[HUCardViewController setViewControllerCoordinator:](self, "setViewControllerCoordinator:", v18);

  v19 = objc_msgSend(v8, "shouldIncludeRoomNameInHeaderTitle");
  -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShouldIncludeRoomNameInHeaderTitle:", v19);

  -[HUCardViewController quickControlLayoutGuide](self, "quickControlLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAvailableContentLayoutGuide:", v21);

  if (-[HUCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[HUCardViewController _updateScrollViewAndSpinnerView](self, "_updateScrollViewAndSpinnerView");
    -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "primaryStatusText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "secondaryStatusText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController _updateControlStatusTextWithPrimaryText:secondaryText:](self, "_updateControlStatusTextWithPrimaryText:secondaryText:", v24, v26);

    -[HUCardViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUCardViewController;
  -[HUCardViewController traitCollectionDidChange:](&v17, sel_traitCollectionDidChange_, a3);
  -[HUCardViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials");
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) != 0 || v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v12);

LABEL_12:
    goto LABEL_13;
  }
  v8 = -[HUCardViewController hideControls](self, "hideControls");
  v9 = v6;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUCardViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  if (v8)
  v11 = -[HUCardViewController hideControls](self, "hideControls");
  v12 = v6;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUCardViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  if (v11)
    goto LABEL_12;
LABEL_13:
  -[HUCardViewController _updateMaterials](self, "_updateMaterials");
  -[HUCardViewController _updateCloseButtonVibrancyEffect](self, "_updateCloseButtonVibrancyEffect");

}

- (void)_updateScrollViewAndSpinnerView
{
  void *v3;
  void *v4;
  char v5;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
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
  id v48;

  -[HUCardViewController viewControllerReadyPromise](self, "viewControllerReadyPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if ((v5 & 1) == 0)
  {
    -[HUCardViewController quickControlViewController](self, "quickControlViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[HUCardViewController settingsViewController](self, "settingsViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[HUCardViewController spinnerView](self, "spinnerView");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "startAnimating");
LABEL_29:

        return;
      }
    }
    -[HUCardViewController spinnerView](self, "spinnerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAnimating");

    -[HUCardViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[HUCardViewController quickControlViewController](self, "quickControlViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HUCardViewController quickControlViewController](self, "quickControlViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController scrollView](self, "scrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController naui_addChildViewWithViewController:toView:](self, "naui_addChildViewWithViewController:toView:", v11, v12);

      -[HUCardViewController quickControlViewController](self, "quickControlViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "childViewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (objc_msgSend(v14, "count") == 1 && v17)
      {
        objc_msgSend(v17, "childViewControllers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "na_firstObjectPassingTest:", &__block_literal_global_242);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUCardViewController contentSizeKeyPathObservees](self, "contentSizeKeyPathObservees");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "collectionView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "containsObject:", v21);

        if (v22)
        {
          objc_msgSend(v19, "collectionView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));

        }
        objc_msgSend(v19, "collectionView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, 0);

        -[HUCardViewController contentSizeKeyPathObservees](self, "contentSizeKeyPathObservees");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "collectionView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v26);

      }
    }
    -[HUCardViewController settingsViewController](self, "settingsViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[HUCardViewController settingsViewController](self, "settingsViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController scrollView](self, "scrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController naui_addChildViewWithViewController:toView:](self, "naui_addChildViewWithViewController:toView:", v28, v29);

      objc_opt_class();
      -[HUCardViewController settingsViewController](self, "settingsViewController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
      v32 = v31;

      if (v32)
      {
        objc_msgSend(v32, "tableView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_setFirstResponderKeyboardAvoidanceEnabled:", 0);

        objc_msgSend(v32, "tableView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setScrollEnabled:", 0);

        -[HUCardViewController contentSizeKeyPathObservees](self, "contentSizeKeyPathObservees");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "tableView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "containsObject:", v36);

        if (v37)
        {
          objc_msgSend(v32, "tableView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));

        }
        objc_msgSend(v32, "tableView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 0, 0);

        -[HUCardViewController contentSizeKeyPathObservees](self, "contentSizeKeyPathObservees");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "tableView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v41);

      }
    }
    -[HUCardViewController scrollView](self, "scrollView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeGestureRecognizer:", v43);

    if (!-[HUCardViewController hideControls](self, "hideControls")
      && !-[HUCardViewController hideSettings](self, "hideSettings")
      && (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0)
    {
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__handlePanGesture_);
      -[HUCardViewController setPanGestureRecognizer:](self, "setPanGestureRecognizer:", v44);

      -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setDelegate:", self);

      -[HUCardViewController scrollView](self, "scrollView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addGestureRecognizer:", v47);

    }
    -[HUCardViewController view](self, "view");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setNeedsLayout");
    goto LABEL_29;
  }
}

uint64_t __55__HUCardViewController__updateScrollViewAndSpinnerView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewDidLoad
{
  HUQuickControlSummaryNavigationBarTitleView *v3;
  HUQuickControlProxHandOffSummaryViewUpdater *v4;
  void *v5;
  HUQuickControlProxHandOffSummaryViewUpdater *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  HUVisualEffectContainerView *v28;
  void *v29;
  HUVisualEffectContainerView *v30;
  void *v31;
  void *v32;
  void *v33;
  HUHubUnavailableView *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HUCardViewController;
  -[HUCardViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[HUCardViewController _updateMaterials](self, "_updateMaterials");
  v3 = objc_alloc_init(HUQuickControlSummaryNavigationBarTitleView);
  -[HUCardViewController setNavigationBarTitleView:](self, "setNavigationBarTitleView:", v3);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    v4 = [HUQuickControlProxHandOffSummaryViewUpdater alloc];
    -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUQuickControlProxHandOffSummaryViewUpdater initWithNavigationBarTitleView:](v4, "initWithNavigationBarTitleView:", v5);
    -[HUCardViewController setProxHandOffSummaryViewUpdater:](self, "setProxHandOffSummaryViewUpdater:", v6);

  }
  v7 = objc_alloc(MEMORY[0x1E0CEA970]);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v12 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  -[HUCardViewController setScrollView:](self, "setScrollView:", v12);

  -[HUCardViewController scrollView](self, "scrollView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUCardViewController scrollView](self, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowsHorizontalScrollIndicator:", 0);

  -[HUCardViewController scrollView](self, "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShowsVerticalScrollIndicator:", 1);

  -[HUCardViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelaysContentTouches:", 1);

  -[HUCardViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTracksImmediatelyWhileDecelerating:", 0);

  -[HUCardViewController scrollView](self, "scrollView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);

  -[HUCardViewController scrollView](self, "scrollView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlwaysBounceVertical:", 1);

  -[HUCardViewController scrollView](self, "scrollView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentInsetAdjustmentBehavior:", 2);

  -[HUCardViewController scrollView](self, "scrollView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setIndicatorInsetAdjustmentBehavior:", 2);

  -[HUCardViewController scrollView](self, "scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHidden:", 1);

  -[HUCardViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController scrollView](self, "scrollView");
  v24 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v24);

  objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = objc_msgSend(v25, "useSAConfig");

  if ((v24 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController setCloseButton:](self, "setCloseButton:", v26);

    -[HUCardViewController closeButton](self, "closeButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addTarget:action:forControlEvents:", self, sel__closeButtonPressed_, 64);

    v28 = [HUVisualEffectContainerView alloc];
    -[HUCardViewController closeButton](self, "closeButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HUVisualEffectContainerView initWithInnerContentView:](v28, "initWithInnerContentView:", v29);
    -[HUCardViewController setCloseButtonEffectView:](self, "setCloseButtonEffectView:", v30);

    -[HUCardViewController _updateCloseButtonVibrancyEffect](self, "_updateCloseButtonVibrancyEffect");
  }
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v31, "setHidesWhenStopped:", 1);
  -[HUCardViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v31);

  -[HUCardViewController setSpinnerView:](self, "setSpinnerView:", v31);
  -[HUCardViewController spinnerView](self, "spinnerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v34 = -[HUHubUnavailableView initWithFrame:]([HUHubUnavailableView alloc], "initWithFrame:", v8, v9, v10, v11);
  -[HUCardViewController setHubUnavailableView:](self, "setHubUnavailableView:", v34);

  -[HUCardViewController _updateScrollViewAndSpinnerView](self, "_updateScrollViewAndSpinnerView");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setUpConstraints
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;

  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUCardViewController constraints](self, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  v92 = (id)objc_opt_new();
  -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObject:", v10);

    -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObject:", v15);

    -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObject:", v20);

    -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "addObject:", v25);

  }
  -[HUCardViewController scrollView](self, "scrollView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v31);

  -[HUCardViewController scrollView](self, "scrollView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v36);

  -[HUCardViewController scrollView](self, "scrollView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v41);

  -[HUCardViewController scrollView](self, "scrollView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v46);

  -[HUCardViewController quickControlLayoutGuide](self, "quickControlLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "layoutMarginsGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v52);

  -[HUCardViewController quickControlLayoutGuide](self, "quickControlLayoutGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v57);

  -[HUCardViewController quickControlLayoutGuide](self, "quickControlLayoutGuide");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layoutMarginsGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v63);

  -[HUCardViewController quickControlLayoutGuide](self, "quickControlLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layoutMarginsGuide");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v69);

  -[HUCardViewController spinnerView](self, "spinnerView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "centerXAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "centerXAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v74);

  -[HUCardViewController spinnerView](self, "spinnerView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerYAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "centerYAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v79);

  -[HUCardViewController spinnerView](self, "spinnerView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "topAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintGreaterThanOrEqualToAnchor:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v84);

  -[HUCardViewController spinnerView](self, "spinnerView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bottomAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "bottomAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintLessThanOrEqualToAnchor:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObject:", v89);

  -[HUCardViewController setConstraints:](self, "setConstraints:", v92);
  v90 = (void *)MEMORY[0x1E0CB3718];
  -[HUCardViewController constraints](self, "constraints");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "activateConstraints:", v91);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  BOOL v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)HUCardViewController;
  -[HUCardViewController viewWillAppear:](&v38, sel_viewWillAppear_, a3);
  -[HUCardViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBeingPresented"))
  {

  }
  else
  {
    -[HUCardViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 != 1)
      goto LABEL_12;
  }
  -[HUCardViewController closeButtonEffectView](self, "closeButtonEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0CEA380]);
    -[HUCardViewController closeButtonEffectView](self, "closeButtonEffectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCustomView:", v10);
    -[HUCardViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

  }
  -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleView:", v13);

  -[HUCardViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setHidesShadow:", 1);

  v17 = objc_alloc_init(MEMORY[0x1E0CEA378]);
  objc_msgSend(v17, "configureWithTransparentBackground");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B0]), "initWithBarAppearance:", v17);
  -[HUCardViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "navigationBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setScrollEdgeAppearance:", v18);

  if (-[HUCardViewController hideControls](self, "hideControls"))
    v21 = 1.0;
  else
    v21 = 0.0;
  -[HUCardViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setManualScrollEdgeAppearanceProgress:", v21);

  -[HUCardViewController navigationItem](self, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setManualScrollEdgeAppearanceEnabled:", 1);

  -[HUCardViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1);
  -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "primaryStatusText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "secondaryStatusText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController _updateControlStatusTextWithPrimaryText:secondaryText:](self, "_updateControlStatusTextWithPrimaryText:secondaryText:", v26, v27);

  }
LABEL_12:
  v28 = (void *)0x1E0D31000;
  v29 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    v30 = (void *)MEMORY[0x1E0CEA478];
LABEL_16:
    objc_msgSend(v30, "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController scrollView](self, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBackgroundColor:", v33);
LABEL_17:

    goto LABEL_18;
  }
  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v31);

    v30 = (void *)MEMORY[0x1E0CEA478];
    goto LABEL_16;
  }
  v34 = -[HUCardViewController hideControls](self, "hideControls");
  v35 = v34;
  if (v34)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v36;
  }
  else
  {
    -[HUCardViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", objc_msgSend(v28, "userInterfaceStyle"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HUCardViewController scrollView](self, "scrollView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v36);

  if (!v35)
  {

    goto LABEL_17;
  }
LABEL_18:

  -[HUCardViewController setUpConstraints](self, "setUpConstraints");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUCardViewController;
  -[HUCardViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[HUCardViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", self))
  {
    v6 = -[HUCardViewController hasRequestedDismissal](self, "hasRequestedDismissal");

    if (!v6)
      v7 = -[HUCardViewController requestDismissal](self, "requestDismissal");
  }
  else
  {

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
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
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  objc_super v64;

  v64.receiver = self;
  v64.super_class = (Class)HUCardViewController;
  -[HUCardViewController viewDidLayoutSubviews](&v64, sel_viewDidLayoutSubviews);
  -[HUCardViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if ((v4 & 1) == 0)
  {
    -[HUCardViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

    -[HUCardViewController _hostViewHeight](self, "_hostViewHeight");
    v9 = v8;
    v10 = 0.0;
    v11 = 0.0;
    if (!-[HUCardViewController hideControls](self, "hideControls"))
    {
      -[HUCardViewController _quickControlSectionHeight](self, "_quickControlSectionHeight");
      v11 = v12;
    }
    if (!-[HUCardViewController hideSettings](self, "hideSettings"))
    {
      -[HUCardViewController settingsViewController](self, "settingsViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_opt_class();
        -[HUCardViewController settingsViewController](self, "settingsViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !-[HUCardViewController hideControls](self, "hideControls"))
        {
          objc_msgSend(v17, "tableView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "sizeToFit");

        }
        objc_msgSend(v17, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "contentSize");
        v21 = v20;
        -[HUCardViewController view](self, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "safeAreaInsets");
        v10 = v21 + v23;

        if (v10 < v9)
          v10 = v9;

      }
      else
      {
        -[HUCardViewController settingsViewController](self, "settingsViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "preferredContentSize");
        v26 = v25;
        -[HUCardViewController view](self, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "safeAreaInsets");
        v10 = v26 + v28;

        if (v10 < v9)
          v10 = v9;
      }
    }
    -[HUCardViewController quickControlViewController](self, "quickControlViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", 0.0, 0.0, v7, v11);

    -[HUCardViewController settingsViewController](self, "settingsViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", 0.0, v11, v7, v10);

    -[HUCardViewController hubUnavailableView](self, "hubUnavailableView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", 0.0, 0.0, v7, v9);

    LODWORD(v32) = -[HUCardViewController isUnavailableHub](self, "isUnavailableHub");
    -[HUCardViewController hubUnavailableView](self, "hubUnavailableView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if ((_DWORD)v32)
    {
      -[HUCardViewController sourceItem](self, "sourceItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "latestResults");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAccessoryName:", v38);

      -[HUCardViewController scrollView](self, "scrollView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController hubUnavailableView](self, "hubUnavailableView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addSubview:", v39);

    }
    else
    {
      objc_msgSend(v34, "removeFromSuperview");
    }

    -[HUCardViewController scrollView](self, "scrollView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setContentSize:", v7, v11 + v10);

    -[HUCardViewController view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "safeAreaInsets");
    v43 = v42;
    -[HUCardViewController scrollView](self, "scrollView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setScrollIndicatorInsets:", 0.0, 0.0, v43, 0.0);

    -[HUCardViewController scrollView](self, "scrollView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "contentSize");
    v47 = v46 > v9;
    -[HUCardViewController scrollView](self, "scrollView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setScrollEnabled:", v47);

    -[HUCardViewController transitionBlurView](self, "transitionBlurView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      -[HUCardViewController view](self, "view");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "bounds");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v58 = v57;
      -[HUCardViewController transitionBlurView](self, "transitionBlurView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setFrame:", v52, v54, v56, v58);

    }
    -[HUCardViewController viewControllerReadyPromise](self, "viewControllerReadyPromise");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "future");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "isFinished");

    if ((v62 & 1) == 0)
    {
      -[HUCardViewController viewControllerReadyPromise](self, "viewControllerReadyPromise");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "finishWithNoResult");

    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("contentSize"), a4, a5, a6))
  {
    -[HUCardViewController _checkHubAvailability](self, "_checkHubAvailability");
    -[HUCardViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNeedsLayout");

  }
}

- (void)forceUnlockSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HUCardViewController setSettingsUnlocked:](self, "setSettingsUnlocked:", 1);
  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowDetailsButton:", 0);

  -[HUCardViewController scrollView](self, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeGestureRecognizer:", v5);

}

- (void)setHideControls:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_hideControls != a3)
  {
    self->_hideControls = a3;
    if (-[HUCardViewController hideControls](self, "hideControls"))
    {
      -[HUCardViewController _unlockSettings](self, "_unlockSettings");
      -[HUCardViewController _endUsingTapticFeedback](self, "_endUsingTapticFeedback");
    }
    if (!-[HUCardViewController hideSettings](self, "hideSettings"))
    {
      -[HUCardViewController settingsViewController](self, "settingsViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutIfNeeded");

    }
    -[HUCardViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HUCardViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutIfNeeded");

    }
  }
}

- (void)setHideSettings:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_hideSettings != a3)
  {
    self->_hideSettings = a3;
    if (-[HUCardViewController hideSettings](self, "hideSettings"))
    {
      -[HUCardViewController _unlockSettings](self, "_unlockSettings");
      -[HUCardViewController _endUsingTapticFeedback](self, "_endUsingTapticFeedback");
    }
    else
    {
      -[HUCardViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[HUCardViewController settingsViewController](self, "settingsViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layoutIfNeeded");

        -[HUCardViewController view](self, "view");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layoutIfNeeded");

      }
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUCardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[HUCardViewController scrollView](self, "scrollView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (void)setIsUnavailableHub:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_isUnavailableHub != a3)
  {
    self->_isUnavailableHub = a3;
    if (-[HUCardViewController isUnavailableHub](self, "isUnavailableHub"))
    {
      -[HUCardViewController setHideControls:](self, "setHideControls:", 1);
      -[HUCardViewController setHideSettings:](self, "setHideSettings:", 1);
      -[HUCardViewController quickControlViewController](self, "quickControlViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 1;
    }
    else
    {
      -[HUCardViewController setHideControls:](self, "setHideControls:", 0);
      -[HUCardViewController setHideSettings:](self, "setHideSettings:", 0);
      -[HUCardViewController quickControlViewController](self, "quickControlViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 0;
    }
    objc_msgSend(v5, "setHidden:", v7);

    -[HUCardViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

  }
}

- (void)externalAnimationsBegan
{
  id v2;

  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalAnimationsBegan");

}

- (void)externalAnimationsEnded
{
  id v2;

  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalAnimationsEnded");

}

- (void)dismissCardAnimated:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__HUCardViewController_dismissCardAnimated___block_invoke;
  v3[3] = &unk_1E6F4D988;
  v3[4] = self;
  -[HUCardViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, v3);
}

void __44__HUCardViewController_dismissCardAnimated___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "quickControlViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "dismissControlAnimated:", 0);

}

- (void)scrollToDetailsViewAnimated:(BOOL)a3
{
  -[HUCardViewController _prepareForTapticFeedback](self, "_prepareForTapticFeedback", a3);
  -[HUCardViewController _actuateTapticFeedback](self, "_actuateTapticFeedback");
  -[HUCardViewController _unlockSettings](self, "_unlockSettings");
  -[HUCardViewController _endUsingTapticFeedback](self, "_endUsingTapticFeedback");
}

- (id)blurEffectForProxHandOff
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  -[HUCardViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    v4 = 19;
  else
    v4 = 14;
  return (id)objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", v4);
}

- (id)backgroundVisualEffectViewForProxHandOff
{
  void *v2;
  void *v3;

  -[HUCardViewController blurEffectForProxHandOff](self, "blurEffectForProxHandOff");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v2);

  return v3;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSMutableArray *contentSizeKeyPathObservees;
  void *v13;
  __int128 v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  HUCardViewController *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HUCardViewController contentSizeKeyPathObservees](self, "contentSizeKeyPathObservees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412546;
    v14 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        HFLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          v21 = self;
          v22 = 2112;
          v23 = v9;
          _os_log_debug_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEBUG, "Removing self [%@] as observer for HUContentSizeKeyPath: receiverObject = [%@]", buf, 0x16u);
        }

        objc_msgSend(v9, "removeObserver:forKeyPath:", self, CFSTR("contentSize"));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

  -[HUCardViewController contentSizeKeyPathObservees](self, "contentSizeKeyPathObservees");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  contentSizeKeyPathObservees = self->_contentSizeKeyPathObservees;
  self->_contentSizeKeyPathObservees = 0;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateProxClient");

  }
  v15.receiver = self;
  v15.super_class = (Class)HUCardViewController;
  -[HUCardViewController dealloc](&v15, sel_dealloc, v14);
}

- (void)_handlePanGesture:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  void *v23;
  id v24;

  v4 = a3;
  -[HUCardViewController _hostViewHeight](self, "_hostViewHeight");
  v6 = v5;
  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = -v12 / v6;
  v14 = fminf(fmaxf(v13, 0.0), 1.0);
  -[HUCardViewController _quickControlScrollOffsetBoundary](self, "_quickControlScrollOffsetBoundary");
  v16 = v15;
  v17 = objc_msgSend(v4, "state");

  if ((unint64_t)(v17 - 3) >= 3)
  {
    if (v17 == 2)
    {
      if (v14 >= 0.25)
      {
        -[HUCardViewController scrollView](self, "scrollView");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "contentOffset");
        if (v21 >= v16)
        {
          v22 = -[HUCardViewController disablePullToUnlockSettings](self, "disablePullToUnlockSettings");

          if (!v22)
          {
            -[HUCardViewController _actuateTapticFeedback](self, "_actuateTapticFeedback");
            -[HUCardViewController scrollView](self, "scrollView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setScrollEnabled:", 0);

            -[HUCardViewController _unlockSettings](self, "_unlockSettings");
            -[HUCardViewController _endUsingTapticFeedback](self, "_endUsingTapticFeedback");
          }
        }
        else
        {

        }
      }
    }
    else if (v17 == 1)
    {
      -[HUCardViewController _prepareForTapticFeedback](self, "_prepareForTapticFeedback");
    }
  }
  else if (v14 < 0.25)
  {
    -[HUCardViewController scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentOffset");
    v20 = v19;

    if (v20 >= v16)
      -[HUCardViewController _nudgeScrollViewToPoint:](self, "_nudgeScrollViewToPoint:", v10, v16);
  }
}

- (void)_prepareForTapticFeedback
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[HUCardViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceTouchCapability");

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_tapticEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareUsingFeedback:", 1);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 1);
    -[HUCardViewController setImpactFeedbackGenerator:](self, "setImpactFeedbackGenerator:", v6);

    -[HUCardViewController impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepare");
  }

}

- (void)_actuateTapticFeedback
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[HUCardViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceTouchCapability");

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_tapticEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actuateFeedback:", 1);

  }
  else
  {
    -[HUCardViewController impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "impactOccurred");

    -[HUCardViewController impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepare");
  }

}

- (void)_endUsingTapticFeedback
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[HUCardViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceTouchCapability");

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_tapticEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endUsingFeedback:", 1);

  }
  else
  {
    -[HUCardViewController setImpactFeedbackGenerator:](self, "setImpactFeedbackGenerator:", 0);
  }
}

- (void)_updateMaterials
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  -[HUCardViewController transitionBlurView](self, "transitionBlurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0D14788], "controlCenterModuleBackgroundMaterial");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController setTransitionBlurView:](self, "setTransitionBlurView:", v8);

    -[HUCardViewController transitionBlurView](self, "transitionBlurView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 18);

    -[HUCardViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController transitionBlurView](self, "transitionBlurView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:atIndex:", v11, 0);

    goto LABEL_10;
  }
  -[HUCardViewController transitionBlurView](self, "transitionBlurView");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials");

    if ((v14 & 1) == 0)
    {
      -[HUCardViewController transitionBlurView](self, "transitionBlurView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

      -[HUCardViewController setTransitionBlurView:](self, "setTransitionBlurView:", 0);
    }
  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials"))
  {
    -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController blurEffectForProxHandOff](self, "blurEffectForProxHandOff");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEffect:", v18);
    }
    else
    {
      -[HUCardViewController backgroundVisualEffectViewForProxHandOff](self, "backgroundVisualEffectViewForProxHandOff");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController setBackgroundVisualEffectView:](self, "setBackgroundVisualEffectView:", v19);

      -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[HUCardViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCardViewController backgroundVisualEffectView](self, "backgroundVisualEffectView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertSubview:atIndex:", v18, 0);
    }

    -[HUCardViewController transitionBlurView](self, "transitionBlurView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeFromSuperview");

    -[HUCardViewController setTransitionBlurView:](self, "setTransitionBlurView:", 0);
  }
}

- (double)_hostViewHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[HUCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "height");
  v8 = v5 - v7;

  return v8;
}

- (double)_quickControlSectionHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;

  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  -[HUCardViewController _hostViewHeight](self, "_hostViewHeight");
  if (v6 >= result)
    return v6;
  return result;
}

- (double)_quickControlScrollOffsetBoundary
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[HUCardViewController _quickControlSectionHeight](self, "_quickControlSectionHeight");
  v4 = v3;
  -[HUCardViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v4 - v6;

  return v7;
}

- (void)_updateReachabilityState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController setReachable:](self, "setReachable:", objc_msgSend(v3, "isReachable"));

  -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryStatusText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secondaryStatusText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController _updateControlStatusTextWithPrimaryText:secondaryText:](self, "_updateControlStatusTextWithPrimaryText:secondaryText:", v5, v7);

  -[HUCardViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1);
  -[HUCardViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HUCardViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutIfNeeded");

  }
}

- (void)_updateControlStatusTextWithPrimaryText:(id)a3 secondaryText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "summaryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    if (-[HUCardViewController isConfiguredForNonHomeUser](self, "isConfiguredForNonHomeUser"))
    {
      -[HUCardViewController controlItems](self, "controlItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_113_3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "deviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPrimaryText:", v11);

    }
  }
  else
  {
    objc_msgSend(v8, "setPrimaryText:", v12);
    objc_msgSend(v8, "setSecondaryText:", v6);
  }

}

uint64_t __78__HUCardViewController__updateControlStatusTextWithPrimaryText_secondaryText___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateIconDescriptorAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  int v7;
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
  void *v18;
  id v19;

  v3 = a3;
  -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDescriptor");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseLegacyQuickControlPresentation") & 1) != 0)
  {
    -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "showIconOffState");

    if (v7)
    {
      if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") & 1) != 0)
        v8 = 2;
      else
        v8 = 3;
    }
    else
    {
      v8 = 1;
    }
    -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "summaryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "updateWithIconDescriptor:displayStyle:animated:", v19, v8, v3);
  }
  else
  {
    -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summaryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "baseIconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(v12, "copyWithIconDescriptor:", v19);
      -[HUCardViewController navigationBarTitleView](self, "navigationBarTitleView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "summaryView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "baseIconView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConfiguration:", v13);

    }
  }

}

- (void)_closeButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  HUCardViewController *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@: User pressed close button: %@", (uint8_t *)&v8, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isProxHandOffV2Config"))
  {
    objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userTappedCloseButton");

  }
  v7 = -[HUCardViewController requestDismissal](self, "requestDismissal");

}

- (id)requestDismissal
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  HUCardViewController *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing card view controller: %@", (uint8_t *)&v17, 0xCu);
  }

  -[HUCardViewController setHasRequestedDismissal:](self, "setHasRequestedDismissal:", 1);
  objc_opt_class();
  -[HUCardViewController settingsViewController](self, "settingsViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "viewWillDismiss");
  -[HUCardViewController quickControlViewController](self, "quickControlViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (objc_msgSend(v8, "count") == 1 && v11)
  {
    objc_msgSend(v11, "childViewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_115_3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "viewWillDismiss");
  }
  -[HUCardViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cardViewControllerRequestingDismissal:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __40__HUCardViewController_requestDismissal__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_unlockSettings
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[HUCardViewController settingsUnlocked](self, "settingsUnlocked"))
  {
    -[HUCardViewController setSettingsUnlocked:](self, "setSettingsUnlocked:", 1);
    -[HUCardViewController quickControlViewController](self, "quickControlViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "controlContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldShowDetailsButton:", 0);

    -[HUCardViewController _scrollToSettings](self, "_scrollToSettings");
    -[HUCardViewController scrollView](self, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v5);

  }
}

- (void)_scrollToSettings
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[HUCardViewController hideControls](self, "hideControls"))
  {
    -[HUCardViewController settingsViewController](self, "settingsViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;

    -[HUCardViewController setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0, v6);
  }
}

- (void)_nudgeScrollViewToPoint:(CGPoint)a3
{
  double y;
  void *v5;

  y = a3.y;
  -[HUCardViewController scrollView](self, "scrollView", a3.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEnabled:", 0);

  -[HUCardViewController setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0, y);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15[3];
  id location;

  y = a3.y;
  x = a3.x;
  -[HUCardViewController _springAnimationSettings](self, "_springAnimationSettings", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAnimationApplier staticApplierWithAnimationSettings:](HUAnimationApplier, "staticApplierWithAnimationSettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController setAnimationApplier:](self, "setAnimationApplier:", v8);

  objc_initWeak(&location, self);
  -[HUCardViewController animationApplier](self, "animationApplier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __50__HUCardViewController_setContentOffset_animated___block_invoke;
  v14 = &unk_1E6F5D170;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&x;
  v15[2] = *(id *)&y;
  objc_msgSend(v9, "addApplierBlock:", &v11);

  -[HUCardViewController animationApplier](self, "animationApplier", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __50__HUCardViewController_setContentOffset_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));

  objc_msgSend(WeakRetained, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flashScrollIndicatorsPersistingPreviousFlashes");

  objc_msgSend(WeakRetained, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", 1);

}

- (id)_springAnimationSettings
{
  HUSpringAnimationSettings *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  v2 = objc_alloc_init(HUSpringAnimationSettings);
  -[HUSpringAnimationSettings setMass:](v2, "setMass:", 5.0);
  -[HUSpringAnimationSettings setStiffness:](v2, "setStiffness:", 500.0);
  -[HUSpringAnimationSettings setDamping:](v2, "setDamping:", 1000.0);
  -[HUSpringAnimationSettings setInitialVelocity:](v2, "setInitialVelocity:", 0.0);
  LODWORD(v3) = 1044401829;
  LODWORD(v4) = 991345561;
  LODWORD(v5) = 1057634019;
  LODWORD(v6) = 1064730781;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpringAnimationSettings setTimingFunction:](v2, "setTimingFunction:", v7);

  return v2;
}

- (void)_updateCloseButtonVibrancyEffect
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEABA8], "controlCenterSecondaryVibrancyEffect");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v12 = (id)v4;
  if (v3)
  {
    -[HUCardViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v6 == 2)
      v7 = 19;
    else
      v7 = 14;
    v8 = (void *)MEMORY[0x1E0CEABA8];
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectForBlurEffect:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v10;
  }
  -[HUCardViewController closeButtonEffectView](self, "closeButtonEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEffect:", v12);

}

- (void)_checkHubAvailability
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  -[HUCardViewController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_shouldBlockCurrentUserFromHome");

  if (v4)
  {
    objc_opt_class();
    -[HUCardViewController sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v13 = v6;

    if (v13)
    {
      objc_msgSend(v13, "accessories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "na_all:", &__block_literal_global_123);

      objc_msgSend(v13, "accessories");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_124);

      -[HUCardViewController setIsUnavailableHub:](self, "setIsUnavailableHub:", v12 & v9);
    }

  }
}

uint64_t __45__HUCardViewController__checkHubAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isHomePod") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hf_isAppleTV");

  return v3;
}

uint64_t __45__HUCardViewController__checkHubAvailability__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isControllable") ^ 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel__escapeKeyPressed);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_escapeKeyPressed
{
  NSObject *v3;
  id v4;
  int v5;
  HUCardViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@: User pressed Esc key", (uint8_t *)&v5, 0xCu);
  }

  v4 = -[HUCardViewController requestDismissal](self, "requestDismissal");
}

- (void)scrollViewDidScroll:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  id v14;
  void *v15;
  double v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  double v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  id v38;

  v38 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseProxHandOffMaterials");
  if (-[HUCardViewController hideControls](self, "hideControls")
    || -[HUCardViewController hideSettings](self, "hideSettings"))
  {
    goto LABEL_19;
  }
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials") | v4) != 1)
  {
    -[HUCardViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUQuickControlUtilities backgroundColorForUserInterfaceStyle:](HUQuickControlUtilities, "backgroundColorForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "frame");
    v9 = v8;
    objc_msgSend(v38, "contentSize");
    v11 = v10;
    objc_msgSend(v38, "contentOffset");
    v13 = v12;
    if (v13 <= 0.0 || -[HUCardViewController disablePullToUnlockSettings](self, "disablePullToUnlockSettings"))
    {
      v14 = v5;
    }
    else
    {
      v36 = v9;
      v37 = v11;
      if ((float)(v36 + v13) < v37)
      {
        v6 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v14;
LABEL_9:
    -[HUCardViewController scrollView](self, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v6);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCardViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);
LABEL_10:

  objc_msgSend(v38, "contentOffset");
  v17 = v16 / 25.0;
  v18 = fmax(fmin(v17, 1.0), 0.0);
  v19 = v18;
  -[HUCardViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setManualScrollEdgeAppearanceProgress:", v19);

  -[HUCardViewController _quickControlScrollOffsetBoundary](self, "_quickControlScrollOffsetBoundary");
  v22 = v21 + 80.0;
  -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "state") == 1)
  {
    v24 = 1;
  }
  else
  {
    -[HUCardViewController panGestureRecognizer](self, "panGestureRecognizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "state") == 2;

  }
  v26 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  objc_msgSend(v38, "contentOffset");
  if (v27 < v22
    || (-[HUCardViewController quickControlViewController](self, "quickControlViewController"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v28, "controlContainerView"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = objc_msgSend(v29, "shouldShowDetailsButton"),
        v29,
        v28,
        ((v30 ^ 1 | v24 | v26) & 1) != 0))
  {
    if (v26)
    {
      objc_msgSend(v38, "contentOffset");
      v32 = v31;
      -[HUCardViewController _quickControlScrollOffsetBoundary](self, "_quickControlScrollOffsetBoundary");
      if (v32 > v33)
      {
        -[HUCardViewController quickControlViewController](self, "quickControlViewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "controlContainerView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setShouldShowDetailsButton:", 0);

      }
    }
  }
  else
  {
    objc_msgSend(v38, "contentOffset");
    -[HUCardViewController _nudgeScrollViewToPoint:](self, "_nudgeScrollViewToPoint:");
  }
LABEL_19:

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  -[HUCardViewController _quickControlScrollOffsetBoundary](self, "_quickControlScrollOffsetBoundary");
  v5 = v4;
  objc_msgSend(v10, "contentOffset");
  if (v6 >= v5)
  {
    -[HUCardViewController quickControlViewController](self, "quickControlViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "controlContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "shouldShowDetailsButton") & 1) != 0)
    {
      v9 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v10, "contentOffset");
        -[HUCardViewController _nudgeScrollViewToPoint:](self, "_nudgeScrollViewToPoint:");
      }
    }
    else
    {

    }
  }

}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_opt_class();
  -[HUCardViewController settingsViewController](self, "settingsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
    objc_msgSend(v5, "hu_preloadContent");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  BOOL v8;
  void *v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[HUCardViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "panGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v10 == v5;

  }
  return v8;
}

- (void)controllerCoordinator:(id)a3 didUpdateIconDescriptor:(id)a4 showOffState:(BOOL)a5
{
  -[HUCardViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1, a4, a5);
}

- (void)controllerCoordinator:(id)a3 didUpdateStatusWithPrimaryText:(id)a4 secondaryText:(id)a5
{
  -[HUCardViewController _updateControlStatusTextWithPrimaryText:secondaryText:](self, "_updateControlStatusTextWithPrimaryText:secondaryText:", a4, a5);
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[HUCardViewController sourceItem](self, "sourceItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v11)
  {
    -[HUCardViewController _updateIconDescriptorAnimated:](self, "_updateIconDescriptorAnimated:", 1);
    -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryStatusText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController viewControllerCoordinator](self, "viewControllerCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryStatusText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCardViewController _updateControlStatusTextWithPrimaryText:secondaryText:](self, "_updateControlStatusTextWithPrimaryText:secondaryText:", v8, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCardViewController.m"), 1117, CFSTR("Unknown source item %@"), v11);
  }

}

- (id)hu_prepareForDismissalAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HUCardViewController requestDismissal](self, "requestDismissal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke;
  v16[3] = &unk_1E6F502A0;
  v7 = v4;
  v17 = v7;
  v8 = (id)objc_msgSend(v5, "addSuccessBlock:", v16);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke_139;
  v14[3] = &unk_1E6F4E2D8;
  v9 = v7;
  v15 = v9;
  v10 = (id)objc_msgSend(v5, "addFailureBlock:", v14);
  v11 = v15;
  v12 = v9;

  return v12;
}

uint64_t __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &unk_1E7041980);
}

uint64_t __55__HUCardViewController_hu_prepareForDismissalAnimated___block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &unk_1E7041998);
}

- (HUQuickControlContainerViewController)quickControlViewController
{
  return self->_quickControlViewController;
}

- (void)setQuickControlViewController:(id)a3
{
  objc_storeStrong((id *)&self->_quickControlViewController, a3);
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsViewController, a3);
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (HUCardViewControllerDelegate)delegate
{
  return (HUCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hideControls
{
  return self->_hideControls;
}

- (BOOL)hideSettings
{
  return self->_hideSettings;
}

- (BOOL)disablePullToUnlockSettings
{
  return self->_disablePullToUnlockSettings;
}

- (void)setDisablePullToUnlockSettings:(BOOL)a3
{
  self->_disablePullToUnlockSettings = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (void)setNavigationBarTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarTitleView, a3);
}

- (HUQuickControlViewControllerCoordinator)viewControllerCoordinator
{
  return self->_viewControllerCoordinator;
}

- (void)setViewControllerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerCoordinator, a3);
}

- (BOOL)settingsUnlocked
{
  return self->_settingsUnlocked;
}

- (void)setSettingsUnlocked:(BOOL)a3
{
  self->_settingsUnlocked = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (BOOL)isConfiguredForNonHomeUser
{
  return self->_isConfiguredForNonHomeUser;
}

- (void)setIsConfiguredForNonHomeUser:(BOOL)a3
{
  self->_isConfiguredForNonHomeUser = a3;
}

- (NAPromise)viewControllerReadyPromise
{
  return self->_viewControllerReadyPromise;
}

- (void)setViewControllerReadyPromise:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerReadyPromise, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (HUQuickControlProxHandOffSummaryViewUpdater)proxHandOffSummaryViewUpdater
{
  return self->_proxHandOffSummaryViewUpdater;
}

- (void)setProxHandOffSummaryViewUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_proxHandOffSummaryViewUpdater, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (UILayoutGuide)quickControlLayoutGuide
{
  return self->_quickControlLayoutGuide;
}

- (void)setQuickControlLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_quickControlLayoutGuide, a3);
}

- (HUVisualEffectContainerView)closeButtonEffectView
{
  return self->_closeButtonEffectView;
}

- (void)setCloseButtonEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonEffectView, a3);
}

- (UIView)transitionBlurView
{
  return self->_transitionBlurView;
}

- (void)setTransitionBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionBlurView, a3);
}

- (HUHubUnavailableView)hubUnavailableView
{
  return self->_hubUnavailableView;
}

- (void)setHubUnavailableView:(id)a3
{
  objc_storeStrong((id *)&self->_hubUnavailableView, a3);
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (HUAnimationApplier)animationApplier
{
  return self->_animationApplier;
}

- (void)setAnimationApplier:(id)a3
{
  objc_storeStrong((id *)&self->_animationApplier, a3);
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (void)setControlItems:(id)a3
{
  objc_storeStrong((id *)&self->_controlItems, a3);
}

- (NSMutableArray)contentSizeKeyPathObservees
{
  return self->_contentSizeKeyPathObservees;
}

- (void)setContentSizeKeyPathObservees:(id)a3
{
  objc_storeStrong((id *)&self->_contentSizeKeyPathObservees, a3);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, a3);
}

- (UIActivityIndicatorView)spinnerView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_spinnerView);
}

- (void)setSpinnerView:(id)a3
{
  objc_storeWeak((id *)&self->_spinnerView, a3);
}

- (BOOL)hasRequestedDismissal
{
  return self->_hasRequestedDismissal;
}

- (void)setHasRequestedDismissal:(BOOL)a3
{
  self->_hasRequestedDismissal = a3;
}

- (BOOL)isUnavailableHub
{
  return self->_isUnavailableHub;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_contentSizeKeyPathObservees, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_animationApplier, 0);
  objc_storeStrong((id *)&self->_hubUnavailableView, 0);
  objc_storeStrong((id *)&self->_transitionBlurView, 0);
  objc_storeStrong((id *)&self->_closeButtonEffectView, 0);
  objc_storeStrong((id *)&self->_quickControlLayoutGuide, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_proxHandOffSummaryViewUpdater, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_viewControllerReadyPromise, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_viewControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_quickControlViewController, 0);
}

@end
