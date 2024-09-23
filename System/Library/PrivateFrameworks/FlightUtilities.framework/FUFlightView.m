@implementation FUFlightView

- (BOOL)mapOnly
{
  void *v2;
  BOOL v3;

  -[FUFlightView borderLineViewPortrait](self, "borderLineViewPortrait");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)awakeFromNib
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
  int v12;
  void *v13;
  FULockSafePageViewController *v14;
  UIPageViewController *pageViewController;
  void *v16;
  UIScrollView *v17;
  UIScrollView *pageViewContainer;
  UIScrollView *v19;
  id WeakRetained;
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
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)FUFlightView;
  -[FUFlightView awakeFromNib](&v49, sel_awakeFromNib);
  self->_selectedFlight = 0x7FFFFFFFFFFFFFFFLL;
  self->_selectedLeg = 0x7FFFFFFFFFFFFFFFLL;
  -[FUFlightView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPitchEnabled:", 0);

  -[FUFlightView mapView](self, "mapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsAttribution:", 1);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_updateMapAppearance, *MEMORY[0x24BDF8198], 0);

  -[FUFlightView updateMapAppearance](self, "updateMapAppearance");
  -[FUFlightView mapView](self, "mapView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  if (-[FUFlightView mapOnly](self, "mapOnly"))
  {
    -[FUFlightView backBlurView](self, "backBlurView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

  }
  -[FUFlightView pageControl](self, "pageControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 0.0);

  -[FUFlightView mapView](self, "mapView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setShowsAppleLogo:", 0);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.datadetectors.DDActionsService"));

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", *MEMORY[0x24BDDAF10], 0);

  }
  -[FUFlightView setupStyles](self, "setupStyles");
  self->_landscapeMode = -[FUFlightView landscapeMode](self, "landscapeMode");
  if (!-[FUFlightView mapOnly](self, "mapOnly"))
  {
    v14 = -[FULockSafePageViewController initWithTransitionStyle:navigationOrientation:options:]([FULockSafePageViewController alloc], "initWithTransitionStyle:navigationOrientation:options:", 1, 0, 0);
    pageViewController = self->_pageViewController;
    self->_pageViewController = &v14->super;

    -[UIPageViewController setDelegate:](self->_pageViewController, "setDelegate:", self);
    -[UIPageViewController setDataSource:](self->_pageViewController, "setDataSource:", self);
    -[UIPageViewController view](self->_pageViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BDF6D50]);
    pageViewContainer = self->_pageViewContainer;
    self->_pageViewContainer = v17;
    v19 = v17;

    -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIScrollView setScrollEnabled:](v19, "setScrollEnabled:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v19, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v19, "setShowsHorizontalScrollIndicator:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setEffect:", v21);

    objc_msgSend(WeakRetained, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safeAreaLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v19);
    -[UIScrollView leadingAnchor](v19, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UIScrollView trailingAnchor](v19, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[UIScrollView topAnchor](v19, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[UIScrollView bottomAnchor](v19, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UIPageViewController view](self->_pageViewController, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addSubview:](v19, "addSubview:", v36);
    objc_msgSend(v36, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView safeAreaLayoutGuide](v19, "safeAreaLayoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    objc_msgSend(v36, "widthAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView widthAnchor](v19, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    objc_msgSend(v36, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView topAnchor](v19, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setActive:", 1);

    -[FUFlightView borderLineViewLandscape](self, "borderLineViewLandscape");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setProminence:", 3);

    -[FUFlightView borderLineViewPortrait](self, "borderLineViewPortrait");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setProminence:", 3);

  }
}

- (void)setDisplayStyle:(unint64_t)a3
{
  if (self->_displayStyle != a3)
  {
    self->_displayStyle = a3;
    -[FUFlightView setupStyles](self, "setupStyles");
  }
}

- (void)updateMapAppearance
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BEB4B88], "bestAppearanceForSystem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FUFlightView mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideAppearanceForView:", v3);

}

- (void)removeMapBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!self->_spotlightMode)
  {
    self->_spotlightMode = 1;
    -[FUFlightView updatePageControllerScrolling](self, "updatePageControllerScrolling");
    -[FUFlightView backBlurView](self, "backBlurView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEffect:", 0);

    -[FUFlightView mapView](self, "mapView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScrollEnabled:", 0);

    -[FUFlightView mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRotateEnabled:", 0);

    -[FUFlightView mapView](self, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPitchEnabled:", 0);

    -[FUFlightView mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setZoomEnabled:", 0);

    -[FUFlightView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[FUFlightView setNeedsLayout](self, "setNeedsLayout");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = self->_controllers;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "flightInfoView", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "updateForFollowupContent:", self->_spotlightMode);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FUFlightView;
  v4 = a3;
  -[FUFlightView tlk_updateForAppearance:](&v11, sel_tlk_updateForAppearance_, v4);
  objc_msgSend(v4, "secondaryColor", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightView pageControl](self, "pageControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPageIndicatorTintColor:", v5);

  objc_msgSend(v4, "primaryColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightView pageControl](self, "pageControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentPageIndicatorTintColor:", v7);

  -[FUFlightView pageControl](self, "pageControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForView:", v9);

  -[FUFlightView updateOrientationConstraints](self, "updateOrientationConstraints");
  v10 = -[FUFlightView landscapeMode](self, "landscapeMode");
  if (self->_landscapeMode != v10)
  {
    self->_landscapeMode = v10;
    -[FUFlightView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[FUFlightView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)landscapeModeForTraits:(id)a3
{
  return !self->_spotlightMode && objc_msgSend(a3, "verticalSizeClass") == 1;
}

- (BOOL)landscapeMode
{
  FUFlightView *v2;
  void *v3;

  v2 = self;
  -[FUFlightView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[FUFlightView landscapeModeForTraits:](v2, "landscapeModeForTraits:", v3);

  return (char)v2;
}

- (void)updateBorderLines
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  if (self->_spotlightMode)
  {
    -[FUFlightView borderLineViewLandscape](self, "borderLineViewLandscape");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    -[FUFlightView borderLineViewPortrait](self, "borderLineViewPortrait");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v5 = 1;
  }
  else
  {
    v6 = -[FUFlightView landscapeMode](self, "landscapeMode");
    -[FUFlightView borderLineViewLandscape](self, "borderLineViewLandscape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6 ^ 1);

    -[FUFlightView borderLineViewPortrait](self, "borderLineViewPortrait");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    v5 = v6;
  }
  objc_msgSend(v4, "setHidden:", v5);

}

- (void)showLoading
{
  void *v3;
  void *v4;
  id WeakRetained;
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
  _QWORD v20[4];
  id v21;
  id location;

  -[FUFlightView loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[FUFlightView setLoadingView:](self, "setLoadingView:", v4);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);
    objc_msgSend(WeakRetained, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v4);

    objc_msgSend(v4, "leftAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    objc_msgSend(v4, "rightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(v4, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v4, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v4, "setAlpha:", 0.0);
    -[FUFlightView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
  objc_initWeak(&location, self);
  v19 = (void *)MEMORY[0x24BDF6F90];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __27__FUFlightView_showLoading__block_invoke;
  v20[3] = &unk_24ED16180;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v19, "animateWithDuration:animations:", v20, 0.2);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __27__FUFlightView_showLoading__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained[56], "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(v9, "pageControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    objc_msgSend(v9, "errorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    objc_msgSend(v9, "loadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    v7 = objc_msgSend(v9, "mapOnly");
    v2 = v9;
    if (v7)
    {
      objc_msgSend(v9, "backBlurView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

      v2 = v9;
    }
  }

}

- (void)showError
{
  void *v3;
  void *v4;
  id WeakRetained;
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
  _QWORD v20[4];
  id v21;
  id location;

  -[FUFlightView errorView](self, "errorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    -[FUFlightView setErrorView:](self, "setErrorView:", v4);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_backBlurView);
    objc_msgSend(WeakRetained, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v4);

    objc_msgSend(v4, "leftAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    objc_msgSend(v4, "rightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(v4, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v4, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v4, "setAlpha:", 0.0);
    -[FUFlightView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

  }
  objc_initWeak(&location, self);
  v19 = (void *)MEMORY[0x24BDF6F90];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __25__FUFlightView_showError__block_invoke;
  v20[3] = &unk_24ED16180;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v19, "animateWithDuration:animations:", v20, 0.2);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __25__FUFlightView_showError__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id *v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained[56], "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(v9, "pageControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    objc_msgSend(v9, "errorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    objc_msgSend(v9, "loadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

    v7 = objc_msgSend(v9, "mapOnly");
    v2 = v9;
    if (v7)
    {
      objc_msgSend(v9, "backBlurView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

      v2 = v9;
    }
  }

}

- (void)showInfo
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__FUFlightView_showInfo__block_invoke;
  v3[3] = &unk_24ED16180;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.2);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __24__FUFlightView_showInfo__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[56], "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

    objc_msgSend(v8, "errorView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    objc_msgSend(v8, "loadingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

    if (objc_msgSend(v8, "mapOnly"))
    {
      objc_msgSend(v8, "backBlurView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 0.0;
    }
    else
    {
      objc_msgSend(v8, "pageControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 1.0;
    }
    objc_msgSend(v5, "setAlpha:", v7);

    WeakRetained = v8;
  }

}

- (void)layoutMarginsDidChange
{
  if (!self->_spotlightMode)
    -[FUFlightView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)preservesSuperviewLayoutMargins
{
  return !self->_spotlightMode;
}

- (void)layoutSubviews
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
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FUFlightView;
  -[FUFlightView layoutSubviews](&v22, sel_layoutSubviews);
  if (self->_spotlightMode)
  {
    v3 = 20.0;
    v4 = 20.0;
    v5 = 20.0;
    v6 = 20.0;
  }
  else
  {
    -[FUFlightView layoutMargins](self, "layoutMargins");
    v3 = v7;
    v4 = v8;
    v5 = v9;
    v6 = v10;
  }
  -[FUFlightView mapView](self, "mapView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setAttributionInsets:", 0.0, -v4, -v5, 0.0);

  if (-[FUFlightView landscapeMode](self, "landscapeMode"))
  {
    if (!self->_spotlightMode && !-[FUFlightView mapOnly](self, "mapOnly"))
    {
      -[FUFlightView backBlurView](self, "backBlurView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v14 = v13;

      v15 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
      v16 = -0.0;
      if (v15 == 1)
        v17 = v14;
      else
        v17 = -0.0;
      v6 = v6 + v17;
      if (v15 != 1)
        v16 = v14;
      v4 = v4 + v16;
    }
  }
  else if (!self->_spotlightMode && !-[FUFlightView mapOnly](self, "mapOnly"))
  {
    -[FUFlightView backBlurView](self, "backBlurView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;

    v5 = v5 + v20;
  }
  -[FUFlightView mapView](self, "mapView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setEdgeInsets:", v3, v4, v5, v6);

  -[FUFlightView fitMap:](self, "fitMap:", 0);
  -[FUFlightView updateBorderLines](self, "updateBorderLines");
}

- (void)updateConstraints
{
  _BOOL4 v3;
  _BOOL4 spotlightMode;
  BOOL v5;
  int v6;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FUFlightView;
  -[FUFlightView updateConstraints](&v19, sel_updateConstraints);
  -[FUFlightView updateOrientationConstraints](self, "updateOrientationConstraints");
  v3 = -[FUFlightView landscapeMode](self, "landscapeMode");
  spotlightMode = self->_spotlightMode;
  v5 = !v3;
  v6 = self->_spotlightMode && !v3;
  -[FUFlightView leadingMapConstraint](self, "leadingMapConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 0);

  v8 = (void *)MEMORY[0x24BDD1628];
  if (v5 || !spotlightMode)
  {
    -[FUFlightView mapView](self, "mapView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 5, 0, v9, 5, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightView setLeadingMapConstraint:](self, "setLeadingMapConstraint:", v10);
  }
  else
  {
    -[FUFlightView backBlurView](self, "backBlurView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightView mapView](self, "mapView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 6, 0, v10, 5, 1.0, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightView setLeadingMapConstraint:](self, "setLeadingMapConstraint:", v11);

  }
  -[FUFlightView leadingMapConstraint](self, "leadingMapConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[FUFlightView bottomMapConstraint](self, "bottomMapConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 0);

  v14 = (void *)MEMORY[0x24BDD1628];
  if (v6)
  {
    -[FUFlightView backBlurView](self, "backBlurView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightView mapView](self, "mapView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v16, 4, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightView setBottomMapConstraint:](self, "setBottomMapConstraint:", v17);

  }
  else
  {
    -[FUFlightView mapView](self, "mapView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 0, v15, 4, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightView setBottomMapConstraint:](self, "setBottomMapConstraint:", v16);
  }

  -[FUFlightView bottomMapConstraint](self, "bottomMapConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

}

- (void)updateOrientationConstraints
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[FUFlightView landscapeMode](self, "landscapeMode");
  -[FUFlightView lanscapeConstraint1](self, "lanscapeConstraint1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", v3);

  -[FUFlightView lanscapeConstraint2](self, "lanscapeConstraint2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", v3);

  -[FUFlightView lanscapeConstraint3](self, "lanscapeConstraint3");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", v3);

  -[FUFlightView portraitConstraint1](self, "portraitConstraint1");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v3 ^ 1);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FUFlightView;
  -[FUFlightView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[FUFlightView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FUFlightView;
  -[FUFlightView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[FUFlightView updateOrientationConstraints](self, "updateOrientationConstraints");
  -[FUFlightView updateBorderLines](self, "updateBorderLines");
  v5 = -[FUFlightView landscapeMode](self, "landscapeMode");
  if (v5 != -[FUFlightView landscapeModeForTraits:](self, "landscapeModeForTraits:", v4))
  {
    -[FUFlightView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[FUFlightView setNeedsLayout](self, "setNeedsLayout");
  }
  -[FUFlightView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_6:
    -[FUFlightView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_7;
  }
  -[FUFlightView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_vibrancy");
  v9 = objc_msgSend(v4, "_vibrancy");

  if (v8 != v9)
    goto LABEL_6;
LABEL_7:

}

- (id)currentFlight
{
  unint64_t selectedFlight;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  selectedFlight = self->_selectedFlight;
  if (selectedFlight == 0x7FFFFFFFFFFFFFFFLL
    || (-[FUFlightView flights](self, "flights"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        selectedFlight >= v5))
  {
    v7 = 0;
  }
  else
  {
    -[FUFlightView flights](self, "flights");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", self->_selectedFlight);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)currentLeg
{
  void *v3;
  void *v4;
  unint64_t selectedLeg;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[FUFlightView currentFlight](self, "currentFlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  selectedLeg = self->_selectedLeg;
  if (selectedLeg == 0x7FFFFFFFFFFFFFFFLL
    || (objc_msgSend(v3, "legs"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        selectedLeg >= v7))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "legs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", self->_selectedLeg);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)setHighlightCurrentFlightLeg:(BOOL)a3
{
  self->_highlightCurrentFlightLeg = a3;
  -[FUFlightView updateMapArcs](self, "updateMapArcs");
}

- (void)setShowInfoPanel:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  self->_showInfoPanel = a3;
  v4 = !a3;
  -[FUFlightView backBlurView](self, "backBlurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  -[FUFlightView updateBorderLines](self, "updateBorderLines");
  -[FUFlightView setNeedsLayout](self, "setNeedsLayout");
}

- (id)flightForLeg:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_flights;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "legs", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if (*(id *)(*((_QWORD *)&v18 + 1) + 8 * j) == v4)
              {
                v16 = v10;

                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
    }
    while (v7);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (unint64_t)absoluteLegIndex
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[FUFlightView currentLeg](self, "currentLeg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = self->_flights;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v25;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v10, "legs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            v15 = v7;
            while (2)
            {
              v16 = 0;
              v7 = v15 + v13;
              do
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                if (v3 == *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16))
                {

                  v17 = v15 + v16;
                  goto LABEL_21;
                }
                ++v16;
              }
              while (v13 != v16);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              v15 = v7;
              if (v13)
                continue;
              break;
            }
          }

          v8 = v19;
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      while (v6);
    }
    else
    {
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_21:

  }
  else
  {
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

- (id)allLegs
{
  return self->_allLegs;
}

- (void)setFlights:(id)a3
{
  -[FUFlightView setFlights:selectedFlight:selectedLeg:](self, "setFlights:selectedFlight:selectedLeg:", a3, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (BOOL)setFlights:(id)a3 selectedFlight:(int64_t)a4 selectedLeg:(int64_t)a5
{
  id v9;
  void *v10;
  NSArray **p_flights;
  BOOL v12;
  NSMutableArray *v13;
  uint64_t v14;
  NSMutableArray *controllers;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  uint64_t k;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unint64_t v57;
  UIPageViewController *pageViewController;
  void *v59;
  void *v60;
  void *v61;
  NSLayoutConstraint *pageControllerHeightConstraint;
  double v63;
  void *v64;
  void *v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *v67;
  void *v68;
  void *v69;
  id WeakRetained;
  id v71;
  double v72;
  double v73;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  int64_t v80;
  unint64_t v81;
  unint64_t v82;
  void *v83;
  NSArray *obj;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = v9;
  p_flights = &self->_flights;
  if (*(_OWORD *)&self->_flights != __PAIR128__(a4, (unint64_t)v9) || self->_selectedLeg != a5)
  {
    v80 = a5;
    v82 = a4;
    v83 = v9;
    objc_storeStrong((id *)&self->_flights, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 440;
    controllers = self->_controllers;
    self->_controllers = v13;

    v85 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    obj = *p_flights;
    v87 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
    if (v87)
    {
      v86 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v87; ++i)
        {
          if (*(_QWORD *)v95 != v86)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v17, "legs", v80);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v88, "count");
          if (v18)
          {
            v19 = v18;
            objc_msgSend(v85, "addObjectsFromArray:", v88);
            if (v19 >= 1)
            {
              for (j = 0; j != v19; ++j)
              {
                -[FUFlightView infoViewControllerCreate](self, "infoViewControllerCreate");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "flightInfoView");
                v22 = v14;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setFlight:legIndex:multiFlights:spotlightMode:", v17, j, -[NSArray count](*p_flights, "count") > 1, self->_spotlightMode);

                objc_msgSend(v21, "flightInfoView");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setDelegate:", self);

                v14 = v22;
                objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v22), "addObject:", v21);

              }
            }
          }

        }
        v87 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
      }
      while (v87);
    }

    objc_storeStrong((id *)&self->_allLegs, v85);
    v25 = -[NSArray count](self->_allLegs, "count");
    v26 = 0.0;
    if (v25 >= 2)
    {
      if (-[FUFlightView mapOnly](self, "mapOnly"))
        v26 = 0.0;
      else
        v26 = 1.0;
    }
    -[FUFlightView pageControl](self, "pageControl", v80);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAlpha:", v26);

    v10 = v83;
    if (!v83)
      goto LABEL_26;
    if (!objc_msgSend(v83, "count"))
      goto LABEL_26;
    objc_msgSend(v83, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "legs");
    v89 = v14;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    v31 = v89;
    if (!v30)
    {
LABEL_26:
      -[FUFlightView cleanupView](self, "cleanupView");
LABEL_60:

      v12 = 1;
      goto LABEL_61;
    }
    self->_highlightCurrentFlightLeg = 1;
    if (v82 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v83, "count") <= v82)
    {
      if (objc_msgSend(v83, "count") == 1)
      {
        v32 = 0;
      }
      else
      {
        v32 = 0;
        while (1)
        {
          objc_msgSend(v83, "objectAtIndexedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v32 + 1;
          objc_msgSend(v83, "objectAtIndexedSubscript:", v32 + 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "arrival");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "time");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "timeIntervalSinceNow");
          v39 = v38;

          objc_msgSend(v35, "departure");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "time");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "timeIntervalSinceNow");
          v43 = v42;

          if (v39 > 0.0)
            break;
          if (v39 < 0.0)
            v39 = -v39;
          if (v43 < 0.0)
            v43 = -v43;

          if (v39 >= v43)
          {
            ++v32;
            if (v34 < objc_msgSend(v83, "count") - 1)
              continue;
          }
          goto LABEL_39;
        }

      }
LABEL_39:
      self->_selectedFlight = v32;
      self->_selectedLeg = 0;
    }
    else
    {
      self->_selectedFlight = v82;
      if (v81 == 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_selectedLeg = 0;
LABEL_41:
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v44 = *(id *)((char *)&self->super.super.super.isa + v31);
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v91;
          v48 = *MEMORY[0x24BDF7B88];
          v49 = *(double *)(MEMORY[0x24BDF7B88] + 8);
          v50 = 0.0;
          do
          {
            for (k = 0; k != v46; ++k)
            {
              if (*(_QWORD *)v91 != v47)
                objc_enumerationMutation(v44);
              objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * k), "view");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v53) = 1132068864;
              LODWORD(v54) = 1144750080;
              objc_msgSend(v52, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v48, v49, v54, v53);
              v56 = v55;

              if (v50 < v56)
                v50 = v56;
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
          }
          while (v46);
        }
        else
        {
          v50 = 0.0;
        }

        v57 = -[FUFlightView absoluteLegIndex](self, "absoluteLegIndex");
        pageViewController = self->_pageViewController;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v89), "objectAtIndexedSubscript:", v57);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v59;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v98, 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPageViewController setViewControllers:direction:animated:completion:](pageViewController, "setViewControllers:direction:animated:completion:", v60, 0, 0, 0);

        -[FUFlightView pageControl](self, "pageControl");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setNumberOfPages:", v25);

        -[FUFlightView updatePageControllerScrolling](self, "updatePageControllerScrolling");
        pageControllerHeightConstraint = self->_pageControllerHeightConstraint;
        if (pageControllerHeightConstraint || !self->_pageViewController)
        {
          -[NSLayoutConstraint constant](pageControllerHeightConstraint, "constant");
          if (v63 != v50)
            -[NSLayoutConstraint setConstant:](self->_pageControllerHeightConstraint, "setConstant:", v50);
        }
        else
        {
          v64 = (void *)MEMORY[0x24BDD1628];
          -[UIPageViewController view](self->_pageViewController, "view");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v65, 8, 0, 0, 0, 1.0, v50);
          v66 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
          v67 = self->_pageControllerHeightConstraint;
          self->_pageControllerHeightConstraint = v66;

          -[UIPageViewController view](self->_pageViewController, "view");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "superview");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "addConstraint:", self->_pageControllerHeightConstraint);

        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_pageContainerHeightConstraint);
        v71 = objc_loadWeakRetained((id *)&self->_backBlurView);
        objc_msgSend(v71, "safeAreaInsets");
        objc_msgSend(WeakRetained, "setConstant:", ceil(v50 + v72));

        LODWORD(v73) = 1148846080;
        if (!self->_spotlightMode)
          *(float *)&v73 = 999.0;
        objc_msgSend(WeakRetained, "setPriority:", v73);
        -[UIScrollView setContentSize:](self->_pageViewContainer, "setContentSize:", -1.0, v50);
        -[UIScrollView scrollRectToVisible:animated:](self->_pageViewContainer, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
        -[FUFlightView setAbsoluteIndex:animated:](self, "setAbsoluteIndex:animated:", v57, 0);

        goto LABEL_60;
      }
      objc_msgSend(v83, "objectAtIndexedSubscript:", v82);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "legs");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "count");

      if (v77 <= v81)
      {
        objc_msgSend(v83, "objectAtIndexedSubscript:", v82);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "legs");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        self->_selectedLeg = objc_msgSend(v79, "count") - 1;

      }
      else
      {
        self->_selectedLeg = v81;
        self->_highlightCurrentFlightLeg = 0;
      }
    }
    v31 = v89;
    goto LABEL_41;
  }
  v12 = 0;
LABEL_61:

  return v12;
}

- (void)updatePageControllerScrolling
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[FUFlightView pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfPages");

  -[UIPageViewController view](self->_pageViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEnabled:", v4 > 1);

  -[UIScrollView setScrollEnabled:](self->_pageViewContainer, "setScrollEnabled:", !self->_spotlightMode);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_pageViewContainer, "setShowsVerticalScrollIndicator:", !self->_spotlightMode);
}

- (void)setSelectedLeg:(int64_t)a3
{
  unint64_t selectedFlight;
  void *v6;
  NSArray *allLegs;
  void *v8;
  id v9;

  selectedFlight = self->_selectedFlight;
  if (selectedFlight != 0x7FFFFFFFFFFFFFFFLL && selectedFlight < -[NSArray count](self->_flights, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_flights, "objectAtIndexedSubscript:", self->_selectedFlight);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "legs");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a3 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "count") > (unint64_t)a3)
    {
      allLegs = self->_allLegs;
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightView setAbsoluteIndex:animated:](self, "setAbsoluteIndex:animated:", -[NSArray indexOfObject:](allLegs, "indexOfObject:", v8), 1);

    }
  }
}

- (void)updateMapArcs
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *tracks;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  double v23;
  CLLocationDegrees v24;
  CLLocationDegrees v25;
  double v26;
  CLLocationDegrees v27;
  CLLocationDegrees v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  MKMapPoint v40[2];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;
  CLLocationCoordinate2D v44;
  CLLocationCoordinate2D v45;

  v43 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = self->_tracks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[FUFlightView mapView](self, "mapView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "polyline");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeOverlay:", v10);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v5);
  }

  tracks = self->_tracks;
  self->_tracks = 0;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = self->_allLegs;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v17, "departure", (_QWORD)v32);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "airport");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "arrival");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "airport");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          v22 = v21 == 0;
        else
          v22 = 1;
        if (!v22)
        {
          objc_msgSend(v19, "location");
          v24 = v23;
          objc_msgSend(v19, "location");
          v44 = CLLocationCoordinate2DMake(v24, v25);
          v40[0] = MKMapPointForCoordinate(v44);
          objc_msgSend(v21, "location");
          v27 = v26;
          objc_msgSend(v21, "location");
          v45 = CLLocationCoordinate2DMake(v27, v28);
          v40[1] = MKMapPointForCoordinate(v45);
          v29 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x24BDDB078], "polylineWithPoints:count:", v40, 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setPolyline:", v30);

          objc_msgSend(v29, "setLeg:", v17);
          -[FUFlightView currentLeg](self, "currentLeg");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17 == v31)
            objc_storeStrong((id *)&self->_currentTrack, v29);
          -[FUFlightView addTrack:](self, "addTrack:", v29);

        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v14);
  }

}

- (void)setAbsoluteIndex:(unint64_t)a3 animated:(BOOL)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  FUPlaneTrackerAnnotationView *v15;
  FUPlaneTrackerAnnotationView *planeTracker;
  void *v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v28;
  FUPlaneTrackerAnnotationView *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _BOOL4 v43;

  v43 = a4;
  if (-[NSArray count](self->_allLegs, "count") > a3)
  {
    self->_selectedFlight = 0x7FFFFFFFFFFFFFFFLL;
    self->_selectedLeg = 0x7FFFFFFFFFFFFFFFLL;
    if (-[NSArray count](self->_flights, "count"))
    {
      v6 = 0;
      v7 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_flights, "objectAtIndexedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "legs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
          break;
        v12 = v7;
LABEL_10:

        ++v6;
        v7 = v12;
        if (v6 >= -[NSArray count](self->_flights, "count"))
          return;
      }
      v11 = 0;
      v12 = v7;
      while (a3 != v12)
      {
        ++v12;
        ++v11;
        objc_msgSend(v8, "legs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v11 >= v14)
          goto LABEL_10;
      }
      self->_selectedFlight = v6;
      self->_selectedLeg = a3 - v7;

      if (!self->_planeTracker)
      {
        +[FUPlaneTrackerAnnotationView defaultAnotation](FUPlaneTrackerAnnotationView, "defaultAnotation");
        v15 = (FUPlaneTrackerAnnotationView *)objc_claimAutoreleasedReturnValue();
        planeTracker = self->_planeTracker;
        self->_planeTracker = v15;

        -[FUFlightView mapView](self, "mapView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAnnotation:", self->_planeTracker);

      }
      -[FUFlightView currentLeg](self, "currentLeg");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v42, "status");
      if (v18 >= 4)
      {
        v21 = 0.0;
        if (v18 != 6)
          v21 = -1.0;
        if (v18 - 4 >= 2)
          v20 = v21;
        else
          v20 = 1.0;
      }
      else
      {
        objc_msgSend(v42, "currentProgress");
        v20 = v19;
      }
      objc_msgSend(v42, "departure");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "airport");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "arrival");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "airport");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v20 >= 0.0 && v23 != 0 && v25 != 0;
      -[FUPlaneTrackerAnnotationView setShowsPlane:](self->_planeTracker, "setShowsPlane:", v28);
      if (v28)
      {
        v29 = self->_planeTracker;
        objc_msgSend(v23, "location");
        v31 = v30;
        objc_msgSend(v23, "location");
        v33 = v32;
        objc_msgSend(v25, "location");
        v35 = v34;
        objc_msgSend(v25, "location");
        -[FUPlaneTrackerAnnotationView setStartLatitude:startLongitude:endLatitude:endLongitude:](v29, "setStartLatitude:startLongitude:endLatitude:endLongitude:", v31, v33, v35, v36);
        -[FUPlaneTrackerAnnotationView setCurrentProgress:](self->_planeTracker, "setCurrentProgress:", v20);
      }
      -[FUFlightView updateMapArcs](self, "updateMapArcs");
      -[FUFlightView fitMap:](self, "fitMap:", v43);
      -[UIPageViewController viewControllers](self->_pageViewController, "viewControllers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "flightInfoView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setCurrentFocus:", 2);

      -[FUFlightView pageControl](self, "pageControl");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCurrentPage:", a3);

      -[FUFlightView delegate](self, "delegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v41, "flightView:didSelectLeg:ofFlight:", self, self->_selectedLeg, self->_selectedFlight);
      }

    }
  }
}

- (void)setMapInsets:(UIEdgeInsets)a3
{
  self->_mapInsets = a3;
  -[FUFlightView fitMap:](self, "fitMap:", 0);
}

- (void)addTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *tracks;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_tracks)
  {
    v7 = (NSMutableArray *)objc_opt_new();
    tracks = self->_tracks;
    self->_tracks = v7;

    v4 = v9;
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[FUFlightView mapView](self, "mapView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "polyline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addOverlay:", v6);

    -[NSMutableArray addObject:](self->_tracks, "addObject:", v9);
    v4 = v9;
  }
LABEL_4:

}

- (void)cleanupView
{
  void *v3;
  FUPlaneTrackerAnnotationView *planeTracker;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  FUFLightTrack *currentTrack;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_planeTracker)
  {
    -[FUFlightView mapView](self, "mapView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAnnotation:", self->_planeTracker);

    planeTracker = self->_planeTracker;
    self->_planeTracker = 0;

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_tracks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[FUFlightView mapView](self, "mapView", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "polyline");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeOverlay:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_tracks, "removeAllObjects");
  currentTrack = self->_currentTrack;
  self->_currentTrack = 0;

}

- (id)arrivalCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDDB0D0];
  -[FUFlightView currentLeg](self, "currentLeg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrival");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v8 = v7;
  v10 = v9;
  -[FUFlightView currentLeg](self, "currentLeg");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrival");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "airport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  objc_msgSend(v3, "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", v8, v10, v14, v15, 300000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPitch:", 0.0);
  return v16;
}

- (id)departureCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDDB0D0];
  -[FUFlightView currentLeg](self, "currentLeg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "departure");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v8 = v7;
  v10 = v9;
  -[FUFlightView currentLeg](self, "currentLeg");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "departure");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "airport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "location");
  objc_msgSend(v3, "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", v8, v10, v14, v15, 300000.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPitch:", 0.0);
  return v16;
}

- (id)flightCamera
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDDB0D0];
  -[FUPlaneTrackerAnnotationView currentLocation](self->_planeTracker, "currentLocation");
  v5 = v4;
  v7 = v6;
  -[FUPlaneTrackerAnnotationView currentLocation](self->_planeTracker, "currentLocation");
  objc_msgSend(v3, "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", v5, v7, v8, v9, 30000000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPitch:", 0.0);
  return v10;
}

- (void)fitMap:(BOOL)a3
{
  NSMutableArray *tracks;
  _BOOL8 v5;
  double x;
  double y;
  double v8;
  double height;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double width;
  double rect1;
  double rect1_8;
  double rect1_16;
  double rect1_16a;
  double rect1_24;
  double rect1_24a;
  double v74;
  double v75;
  double v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;
  MKMapRect v83;
  MKMapRect v84;
  MKMapRect v85;
  MKMapRect v86;
  MKMapRect v87;
  MKMapRect v88;
  MKCoordinateRegion v89;
  MKMapRect v90;
  MKMapRect v91;
  MKMapRect v92;

  v82 = *MEMORY[0x24BDAC8D0];
  self->_currentFocus = 2;
  if (!self->_ignoreMapUpdate)
  {
    tracks = self->_tracks;
    if (tracks)
    {
      v5 = a3;
      if (-[NSMutableArray count](tracks, "count"))
      {
        if (self->_currentTrack && !-[FUFlightView mapOnly](self, "mapOnly"))
        {
          -[FUFLightTrack polyline](self->_currentTrack, "polyline");
          v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray boundingMapRect](v10, "boundingMapRect");
          x = v29;
          y = v30;
          v8 = v31;
          height = v32;
        }
        else
        {
          x = *MEMORY[0x24BDDAFE0];
          y = *(double *)(MEMORY[0x24BDDAFE0] + 8);
          v8 = *(double *)(MEMORY[0x24BDDAFE0] + 16);
          height = *(double *)(MEMORY[0x24BDDAFE0] + 24);
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v10 = self->_tracks;
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v78;
            v74 = *MEMORY[0x24BDDAFF0] + *(double *)(MEMORY[0x24BDDAFF0] + 16);
            v75 = y;
            v76 = x;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v78 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * i), "polyline", *(_QWORD *)&v66);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "boundingMapRect");
                v17 = v16;
                v19 = v18;
                v21 = v20;
                v23 = v22;

                if (x == v76 && y == v75)
                {
                  height = v23;
                  v8 = v21;
                  y = v19;
                  x = v17;
                }
                else if (v17 != v76 || v19 != v75)
                {
                  v83.origin.x = x;
                  v83.origin.y = y;
                  v83.size.width = v8;
                  v83.size.height = height;
                  v90.origin.x = v17;
                  v90.origin.y = v19;
                  v90.size.width = v21;
                  v90.size.height = v23;
                  v84 = MKMapRectUnion(v83, v90);
                  rect1_8 = v84.origin.x;
                  rect1_16 = v84.origin.y;
                  width = v84.size.width;
                  rect1 = x;
                  rect1_24 = v84.size.height;
                  x = x + v74;
                  v84.origin.x = x;
                  v84.origin.y = y;
                  v84.size.width = v8;
                  v84.size.height = height;
                  v91.origin.x = v17;
                  v91.origin.y = v19;
                  v91.size.width = v21;
                  v91.size.height = v23;
                  v85 = MKMapRectUnion(v84, v91);
                  v25 = v85.size.width < width;
                  if (v85.size.width < width)
                    v26 = height;
                  else
                    v26 = rect1_24;
                  if (v25)
                    v27 = v8;
                  else
                    v27 = width;
                  v66 = v27;
                  v28 = rect1_16;
                  if (v25)
                    v28 = y;
                  rect1_16a = v28;
                  rect1_24a = v26;
                  if (!v25)
                    x = rect1_8;
                  v92.origin.x = v17 + v74;
                  v86.origin.x = rect1;
                  v86.origin.y = y;
                  v86.size.width = v8;
                  v86.size.height = height;
                  v92.origin.y = v19;
                  v92.size.width = v21;
                  v92.size.height = v23;
                  v87 = MKMapRectUnion(v86, v92);
                  v8 = v66;
                  y = rect1_16a;
                  height = rect1_24a;
                  if (v87.size.width < v66)
                  {
                    height = v87.size.height;
                    v8 = v87.size.width;
                    y = v87.origin.y;
                    x = v87.origin.x;
                  }
                }
              }
              v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v77, v81, 16);
            }
            while (v12);
          }
        }

        -[FUFlightView mapView](self, "mapView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = x;
        v35 = y;
        objc_msgSend(v33, "mapRectThatFits:edgePadding:", x, y, v8, height, 25.0, 20.0, 20.0, 20.0);
        v89 = MKCoordinateRegionForMapRect(v88);
        latitude = v89.center.latitude;
        longitude = v89.center.longitude;
        latitudeDelta = v89.span.latitudeDelta;
        longitudeDelta = v89.span.longitudeDelta;

        -[FUFlightView mapView](self, "mapView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_zoomLevelForRegion:includeAccessoryPadding:", 0, latitude, longitude, latitudeDelta, longitudeDelta);
        v42 = v41;
        -[FUFlightView mapView](self, "mapView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "_minimumZoomLevel");
        v45 = v44;

        if (v42 <= v45)
        {
          -[FUPlaneTrackerAnnotationView currentLocation](self->_planeTracker, "currentLocation");
          v50 = v49;
          v51 = -84.0;
          if (v48 >= -84.0)
            v51 = v48;
          if (v48 <= 84.0)
            v52 = v51;
          else
            v52 = 84.0;
          if (!self->_spotlightMode)
          {
            latitudeDelta = latitudeDelta / 2.5;
            longitudeDelta = longitudeDelta / 2.5;
          }
          -[FUFlightView mapView](self, "mapView", *(_QWORD *)&v66);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "regionThatFits:", v52, v50, latitudeDelta, longitudeDelta);
          v55 = v54;
          v57 = v56;
          v59 = v58;
          v61 = v60;

          v47 = MEMORY[0x22768FBA0](v55, v57, v59, v61);
          v46 = v62;
          v8 = v63;
          height = v64;
        }
        else
        {
          v46 = v35;
          v47 = v34;
        }
        -[FUFlightView mapView](self, "mapView", *(_QWORD *)&v66);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setVisibleMapRect:edgePadding:animated:", v5, v47, v46, v8, height, 25.0, 20.0, 20.0, 20.0);

      }
    }
  }
}

- (void)updateMapCamera
{
  if (self->_currentFocus == 2)
    -[FUFlightView fitMap:](self, "fitMap:", 0);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB190]), "initWithPolyline:", v6);
    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillColor:", v8);
    objc_msgSend(v7, "setStrokeColor:", v8);
    -[FUFLightTrack polyline](self->_currentTrack, "polyline");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((id)v9 == v6)
    {

    }
    else
    {
      v10 = (void *)v9;
      v11 = -[FUFlightView highlightCurrentFlightLeg](self, "highlightCurrentFlightLeg");

      if (v11)
      {
        objc_msgSend(v7, "setLineWidth:", 1.0);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24ED1A5F8, &unk_24ED1A608, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLineDashPattern:", v12);

LABEL_8:
        goto LABEL_9;
      }
    }
    objc_msgSend(v7, "setLineWidth:", 2.0);
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB148]), "initWithOverlay:", v5);
LABEL_9:

  return v7;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a4;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  _QWORD block[5];

  -[FUFlightView currentLeg](self, "currentLeg", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[FUFlightView mapView](self, "mapView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    v9 = v8;

    if (v9 < 1.0)
    {
      v10 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke;
      block[3] = &unk_24ED16058;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
    }
  }
}

uint64_t __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke_2;
  v2[3] = &unk_24ED16058;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v2, 0.4);
}

void __48__FUFlightView_mapView_regionDidChangeAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mapView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  if (objc_msgSend(*(id *)(a1 + 32), "mapOnly"))
  {
    objc_msgSend(*(id *)(a1 + 32), "backBlurView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  void *v7;
  NSArray *allLegs;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  if (a6)
  {
    objc_msgSend(a3, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    allLegs = self->_allLegs;
    objc_msgSend(v12, "flightInfoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leg");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray indexOfObject:](allLegs, "indexOfObject:", v10);

    -[FUFlightView setAbsoluteIndex:animated:](self, "setAbsoluteIndex:animated:", v11, 1);
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  uint64_t v5;
  BOOL v6;
  void *v7;

  v5 = -[NSMutableArray indexOfObject:](self->_controllers, "indexOfObject:", a4);
  if (v5)
    v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 1;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_controllers, "objectAtIndexedSubscript:", v5 - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = -[NSMutableArray indexOfObject:](self->_controllers, "indexOfObject:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (v6 = v5 + 1, v5 + 1 >= (unint64_t)-[NSMutableArray count](self->_controllers, "count")))
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_controllers, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)changeCurrentPage:(id)a3
{
  void *v4;
  uint64_t v5;
  NSArray *allLegs;
  void *v7;
  uint64_t v8;
  UIPageViewController *pageViewController;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[FUFlightView pageControl](self, "pageControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentPage");

  allLegs = self->_allLegs;
  -[FUFlightView currentLeg](self, "currentLeg");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSArray indexOfObject:](allLegs, "indexOfObject:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 != v5)
  {
    pageViewController = self->_pageViewController;
    -[NSMutableArray objectAtIndexedSubscript:](self->_controllers, "objectAtIndexedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPageViewController setViewControllers:direction:animated:completion:](pageViewController, "setViewControllers:direction:animated:completion:", v12, v5 <= v8, 1, 0);

    -[FUFlightView setAbsoluteIndex:animated:](self, "setAbsoluteIndex:animated:", v5, 1);
  }
}

- (BOOL)hasFollowupContent:(id)a3
{
  return self->_spotlightMode;
}

- (void)flightInfoView:(id)a3 didUpdateFocus:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  switch(a4)
  {
    case 0:
      v10 = v6;
      -[FUFlightView mapView](self, "mapView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightView departureCamera](self, "departureCamera");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      objc_msgSend(v7, "setCamera:animated:", v8, 1);

      goto LABEL_8;
    case 1:
      v10 = v6;
      -[FUFlightView mapView](self, "mapView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightView arrivalCamera](self, "arrivalCamera");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v10 = v6;
      -[FUFlightView fitMap:](self, "fitMap:", 1);
LABEL_8:
      v6 = v10;
      break;
  }

}

- (id)infoViewControllerCreate
{
  return -[FUFlightInfoViewController initWithStyle:]([FUFlightInfoViewController alloc], "initWithStyle:", self->_displayStyle);
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (UIEdgeInsets)mapInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_mapInsets.top;
  left = self->_mapInsets.left;
  bottom = self->_mapInsets.bottom;
  right = self->_mapInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)ignoreMapUpdate
{
  return self->_ignoreMapUpdate;
}

- (void)setIgnoreMapUpdate:(BOOL)a3
{
  self->_ignoreMapUpdate = a3;
}

- (int64_t)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(int64_t)a3
{
  self->_currentFocus = a3;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (UIVisualEffectView)backBlurView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_backBlurView);
}

- (void)setBackBlurView:(id)a3
{
  objc_storeWeak((id *)&self->_backBlurView, a3);
}

- (TLKProminenceView)borderLineViewLandscape
{
  return (TLKProminenceView *)objc_loadWeakRetained((id *)&self->_borderLineViewLandscape);
}

- (void)setBorderLineViewLandscape:(id)a3
{
  objc_storeWeak((id *)&self->_borderLineViewLandscape, a3);
}

- (TLKProminenceView)borderLineViewPortrait
{
  return (TLKProminenceView *)objc_loadWeakRetained((id *)&self->_borderLineViewPortrait);
}

- (void)setBorderLineViewPortrait:(id)a3
{
  objc_storeWeak((id *)&self->_borderLineViewPortrait, a3);
}

- (UIPageControl)pageControl
{
  return (UIPageControl *)objc_loadWeakRetained((id *)&self->_pageControl);
}

- (void)setPageControl:(id)a3
{
  objc_storeWeak((id *)&self->_pageControl, a3);
}

- (NSLayoutConstraint)pageContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_pageContainerHeightConstraint);
}

- (void)setPageContainerHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_pageContainerHeightConstraint, a3);
}

- (NSLayoutConstraint)lanscapeConstraint1
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_lanscapeConstraint1);
}

- (void)setLanscapeConstraint1:(id)a3
{
  objc_storeWeak((id *)&self->_lanscapeConstraint1, a3);
}

- (NSLayoutConstraint)lanscapeConstraint2
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_lanscapeConstraint2);
}

- (void)setLanscapeConstraint2:(id)a3
{
  objc_storeWeak((id *)&self->_lanscapeConstraint2, a3);
}

- (NSLayoutConstraint)lanscapeConstraint3
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_lanscapeConstraint3);
}

- (void)setLanscapeConstraint3:(id)a3
{
  objc_storeWeak((id *)&self->_lanscapeConstraint3, a3);
}

- (NSLayoutConstraint)portraitConstraint1
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_portraitConstraint1);
}

- (void)setPortraitConstraint1:(id)a3
{
  objc_storeWeak((id *)&self->_portraitConstraint1, a3);
}

- (UIView)errorView
{
  return (UIView *)objc_getProperty(self, a2, 592, 1);
}

- (void)setErrorView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (UIView)loadingView
{
  return (UIView *)objc_getProperty(self, a2, 600, 1);
}

- (void)setLoadingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (NSArray)flights
{
  return self->_flights;
}

- (int64_t)selectedFlight
{
  return self->_selectedFlight;
}

- (void)setSelectedFlight:(int64_t)a3
{
  self->_selectedFlight = a3;
}

- (int64_t)selectedLeg
{
  return self->_selectedLeg;
}

- (BOOL)highlightCurrentFlightLeg
{
  return self->_highlightCurrentFlightLeg;
}

- (BOOL)showInfoPanel
{
  return self->_showInfoPanel;
}

- (FUFlightViewDelegate)delegate
{
  return (FUFlightViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSLayoutConstraint)bottomMapConstraint
{
  return self->_bottomMapConstraint;
}

- (void)setBottomMapConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMapConstraint, a3);
}

- (NSLayoutConstraint)leadingMapConstraint
{
  return self->_leadingMapConstraint;
}

- (void)setLeadingMapConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingMapConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingMapConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMapConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flights, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_destroyWeak((id *)&self->_portraitConstraint1);
  objc_destroyWeak((id *)&self->_lanscapeConstraint3);
  objc_destroyWeak((id *)&self->_lanscapeConstraint2);
  objc_destroyWeak((id *)&self->_lanscapeConstraint1);
  objc_destroyWeak((id *)&self->_pageContainerHeightConstraint);
  objc_destroyWeak((id *)&self->_pageControl);
  objc_destroyWeak((id *)&self->_borderLineViewPortrait);
  objc_destroyWeak((id *)&self->_borderLineViewLandscape);
  objc_destroyWeak((id *)&self->_backBlurView);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_allLegs, 0);
  objc_storeStrong((id *)&self->_pageControllerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pageViewContainer, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_currentTrack, 0);
  objc_storeStrong((id *)&self->_tracks, 0);
  objc_storeStrong((id *)&self->_planeTracker, 0);
}

@end
