@implementation ABActionSelectorViewController

+ (id)assistantSelectorWithActionItems:(id)a3 selectedIndex:(int64_t)a4 welcomeView:(id)a5 detailsView:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithActionItems:selectedIndex:welcomeView:detailsView:", v12, a4, v11, v10);

  return v13;
}

+ (id)settingsSelectorWithActionItems:(id)a3 selectedIndex:(int64_t)a4 detailsView:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithActionItems:selectedIndex:welcomeView:detailsView:", v9, a4, 0, v8);

  return v10;
}

- (ABActionSelectorViewController)initWithActionItems:(id)a3 selectedIndex:(int64_t)a4 welcomeView:(id)a5 detailsView:(id)a6
{
  id v10;
  id v11;
  id v12;
  ABActionSelectorViewController *v13;
  ABActionSelectorViewController *v14;
  ABActionSelectorDriver *v15;
  id *v16;
  ABActionSelectorDriver *driver;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ABActionSelectorViewController;
  v13 = -[ABActionSelectorViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_welcomeView, a5);
    objc_storeStrong((id *)&v14->_detailsView, a6);
    objc_initWeak(&location, v14);
    v15 = [ABActionSelectorDriver alloc];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __92__ABActionSelectorViewController_initWithActionItems_selectedIndex_welcomeView_detailsView___block_invoke;
    v19[3] = &unk_25073ECE8;
    objc_copyWeak(&v20, &location);
    v16 = -[ABActionSelectorDriver initWithItems:selectedIndex:isInWelcomeMode:renderBlock:]((id *)&v15->super.isa, v10, (void *)a4, v11 != 0, v19);
    driver = v14->_driver;
    v14->_driver = (ABActionSelectorDriver *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __92__ABActionSelectorViewController_initWithActionItems_selectedIndex_welcomeView_detailsView___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renderWithTargetTimestamp:duration:", a2, a3);

}

- (void)dealloc
{
  objc_super v3;

  -[ABActionSelectorDriver pause]((uint64_t)self->_driver);
  v3.receiver = self;
  v3.super_class = (Class)ABActionSelectorViewController;
  -[ABActionSelectorViewController dealloc](&v3, sel_dealloc);
}

- (void)resumeSceneUpdates
{
  -[ABActionSelectorDriver resume]((uint64_t)self->_driver);
}

- (void)pauseSceneUpdates
{
  -[ABActionSelectorDriver pause]((uint64_t)self->_driver);
}

- (void)zoomIn
{
  -[ABActionSelectorDriver zoomIn](self->_driver, a2);
}

- (void)zoomOut
{
  -[ABActionSelectorDriver zoomOut](self->_driver, a2);
}

- (int64_t)selectedIndex
{
  return -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
}

- (void)selectActionItemWithIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v4 = a4;
  if (!-[ABCarouselView isDragging]((_BOOL8)self->_carouselView))
  {
    v7 = -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
    if ((a3 & 0x8000000000000000) == 0 && v7 != a3)
    {
      -[ABActionSelectorDriver items]((uint64_t)self->_driver);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 > a3)
      {
        -[ABActionSelectorDriver updateSelectedIndex:animateButtonColor:]((uint64_t)self->_driver, a3, v4);
        -[ABCarouselView scrollToItemAtIndex:animated:]((id *)&self->_carouselView->super.super.super.super.super.isa, a3, v4);
      }
    }
  }
}

- (void)updateActionItems:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  ABActionSelectorDriver *driver;
  id v7;
  ABCarouselView *carouselView;
  id v9;

  v4 = a4;
  driver = self->_driver;
  v7 = a3;
  -[ABActionSelectorDriver updateItems:animateButtonColor:]((uint64_t)driver, v7, v4);
  carouselView = self->_carouselView;
  carouselItems(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[ABCarouselView reloadWithItems:animated:]((uint64_t)carouselView, v9, v4);
}

- (void)overrideSceneParamsWithZoomedOutParams:(id)a3 zoomedInParams:(id)a4
{
  -[ABActionSelectorDriver updateWithZoomedOutSceneParamsOverride:zoomedInSceneParamsOverride:](&self->_driver->super.isa, a3, a4);
}

- (void)viewDidLoad
{
  ABDeviceSceneViewController *v3;
  ABDeviceSceneViewController *sceneViewController;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ABShadowView *v23;
  void *v24;
  ABShadowView *v25;
  ABShadowView *shadowView;
  void *v27;
  ABHitTestPassthroughView *v28;
  ABHitTestPassthroughView *overlayContainerView;
  void *v30;
  void *v31;
  void *v32;
  ABTransformView *v33;
  ABTransformView *overlayView;
  void *v35;
  ABCarouselView *v36;
  void *v37;
  void *v38;
  void *v39;
  ABCarouselView *v40;
  ABCarouselView *carouselView;
  void *v42;
  void *v43;
  ABDeviceButtonHighlightView *v44;
  ABDeviceButtonHighlightView *buttonHighlightView;
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
  UITapGestureRecognizer *v65;
  UITapGestureRecognizer *tapToZoomInRecognizer;
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
  objc_super v92;
  _QWORD v93[4];
  _QWORD v94[7];

  v94[5] = *MEMORY[0x24BDAC8D0];
  v92.receiver = self;
  v92.super_class = (Class)ABActionSelectorViewController;
  -[ABActionSelectorViewController viewDidLoad](&v92, sel_viewDidLoad);
  v3 = (ABDeviceSceneViewController *)objc_opt_new();
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v3;

  -[ABActionSelectorViewController addChildViewController:](self, "addChildViewController:", self->_sceneViewController);
  -[ABActionSelectorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABDeviceSceneViewController view](self->_sceneViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[ABActionSelectorViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[ABDeviceSceneViewController view](self->_sceneViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[ABDeviceSceneViewController view](self->_sceneViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAutoresizingMask:", 18);

  -[ABDeviceSceneViewController view](self->_sceneViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInteractionEnabled:", 0);

  -[ABDeviceSceneViewController view](self->_sceneViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOpaque:", 1);

  -[ABDeviceSceneViewController setDelegate:]((id *)&self->_sceneViewController->super.super.super.isa, self);
  -[ABDeviceSceneViewController didMoveToParentViewController:](self->_sceneViewController, "didMoveToParentViewController:", self);
  if (-[ABActionSelectorDriver isInWelcomeMode]((_BOOL8)self->_driver))
    +[ABLoadingSplashView assistantSplashView]();
  else
    +[ABLoadingSplashView settingsSplashView]();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_splashView, v20);

  -[ABActionSelectorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_splashView);

  -[ABActionSelectorViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  -[UIView setFrame:](self->_splashView, "setFrame:");

  -[UIView setAutoresizingMask:](self->_splashView, "setAutoresizingMask:", 18);
  v23 = [ABShadowView alloc];
  -[ABActionSelectorViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v25 = -[ABShadowView initWithFrame:](v23, "initWithFrame:");
  shadowView = self->_shadowView;
  self->_shadowView = v25;

  -[ABActionSelectorViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_shadowView);

  -[ABShadowView setUserInteractionEnabled:](self->_shadowView, "setUserInteractionEnabled:", 0);
  -[ABShadowView setAutoresizingMask:](self->_shadowView, "setAutoresizingMask:", 18);
  v28 = (ABHitTestPassthroughView *)objc_opt_new();
  overlayContainerView = self->_overlayContainerView;
  self->_overlayContainerView = v28;

  -[ABActionSelectorViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", self->_overlayContainerView);

  -[ABHitTestPassthroughView layer](self->_overlayContainerView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAllowsGroupOpacity:", 0);

  -[ABHitTestPassthroughView layer](self->_overlayContainerView, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAllowsGroupBlending:", 0);

  -[ABHitTestPassthroughView setAlpha:](self->_overlayContainerView, "setAlpha:", 0.0);
  v33 = (ABTransformView *)objc_opt_new();
  overlayView = self->_overlayView;
  self->_overlayView = v33;

  -[ABTransformView layer](self->_overlayView, "layer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setGeometryFlipped:", 1);

  -[ABHitTestPassthroughView addSubview:](self->_overlayContainerView, "addSubview:", self->_overlayView);
  v36 = [ABCarouselView alloc];
  -[ABActionSelectorDriver items]((uint64_t)self->_driver);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  carouselItems(v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)-[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
  v40 = (ABCarouselView *)-[ABCarouselView initWithItems:selectedIndex:]((id *)&v36->super.super.super.super.super.isa, v38, v39);
  carouselView = self->_carouselView;
  self->_carouselView = v40;

  -[ABTransformView addSubview:](self->_overlayView, "addSubview:", self->_carouselView);
  -[ABActionSelectorViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCarouselView scrollGestureRecognizer]((uint64_t)self->_carouselView);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addGestureRecognizer:", v43);

  -[ABCarouselView setDelegate:]((id *)&self->_carouselView->super.super.super.super.super.isa, self);
  v44 = (ABDeviceButtonHighlightView *)objc_opt_new();
  buttonHighlightView = self->_buttonHighlightView;
  self->_buttonHighlightView = v44;

  -[ABTransformView addSubview:](self->_overlayView, "addSubview:", self->_buttonHighlightView);
  -[ABActionSelectorViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addSubview:", self->_detailsView);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_detailsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v74 = (void *)MEMORY[0x24BDD1628];
  -[UIView centerXAnchor](self->_detailsView, "centerXAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABActionSelectorViewController view](self, "view");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "centerXAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v85);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v83;
  -[UIView leadingAnchor](self->_detailsView, "leadingAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABActionSelectorViewController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v75;
  -[UIView trailingAnchor](self->_detailsView, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABActionSelectorViewController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v70;
  -[UIView bottomAnchor](self->_detailsView, "bottomAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABActionSelectorViewController view](self, "view");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "safeAreaLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v49;
  -[UIView heightAnchor](self->_detailsView, "heightAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABActionSelectorViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "heightAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:multiplier:", v52, 0.375);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "activateConstraints:", v54);

  -[UIView setAlpha:](self->_detailsView, "setAlpha:", (double)!-[ABActionSelectorDriver isInWelcomeMode]((_BOOL8)self->_driver));
  if (self->_welcomeView)
  {
    -[ABActionSelectorViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addSubview:", self->_welcomeView);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_welcomeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v78 = (void *)MEMORY[0x24BDD1628];
    -[UIView leadingAnchor](self->_welcomeView, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABActionSelectorViewController view](self, "view");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v88);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v86;
    -[UIView trailingAnchor](self->_welcomeView, "trailingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABActionSelectorViewController view](self, "view");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v80);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v76;
    -[UIView bottomAnchor](self->_welcomeView, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABActionSelectorViewController view](self, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v93[2] = v59;
    -[UIView heightAnchor](self->_welcomeView, "heightAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABActionSelectorViewController view](self, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "heightAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:multiplier:", v62, 0.45);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v93[3] = v63;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 4);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "activateConstraints:", v64);

  }
  v65 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__didTapToZoomIn);
  tapToZoomInRecognizer = self->_tapToZoomInRecognizer;
  self->_tapToZoomInRecognizer = v65;

  -[ABActionSelectorViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addGestureRecognizer:", self->_tapToZoomInRecognizer);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABActionSelectorViewController;
  -[ABActionSelectorViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ABActionSelectorViewController _clipDuringNavigationTransiton](self, "_clipDuringNavigationTransiton");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABActionSelectorViewController;
  -[ABActionSelectorViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[ABActionSelectorViewController _clipDuringNavigationTransiton](self, "_clipDuringNavigationTransiton");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABActionSelectorViewController;
  -[ABActionSelectorViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  -[ABActionSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4 * 0.5;
  -[ABActionSelectorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[ABHitTestPassthroughView setCenter:](self->_overlayContainerView, "setCenter:", v5, v7 * 0.5);

}

- (void)carouselViewWillStartDragging:(id)a3
{
  -[ABActionSelectorDriver startDragging](&self->_driver->super.isa);
}

- (void)carouselView:(id)a3 didDragToOffset:(double)a4 initialOffset:(double)a5
{
  ABActionSelectorDriver *driver;
  double v6;
  double v7;
  id v8;

  driver = self->_driver;
  v6 = a4 - a5;
  -[ABActionSelectorViewController view](self, "view", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[ABActionSelectorDriver updateDragProgress:](driver, v6 / v7);

}

- (void)carouselViewWillEndDragging:(id)a3
{
  -[ABActionSelectorDriver endDragging](&self->_driver->super.isa);
}

- (void)carouselView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;
  id v10;

  if ((a4 & 0x8000000000000000) == 0)
  {
    -[ABActionSelectorDriver items]((uint64_t)self->_driver);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 > a4)
    {
      -[ABActionSelectorDriver updateSelectedIndex:animateButtonColor:]((uint64_t)self->_driver, a4, 1);
      -[ABActionSelectorViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        -[ABActionSelectorViewController delegate](self, "delegate");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "actionSelectorViewController:didSelectItemAtIndex:", self, a4);

      }
    }
  }
}

- (void)deviceSceneViewControllerWillRenderScene:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v12;
  CATransform3D v13;

  memset(&v13, 0, sizeof(v13));
  -[ABDeviceSceneViewController actionButtonPerspectiveTransform]((CATransform3D *)self->_sceneViewController, (uint64_t)&v13);
  v4 = -[ABDeviceSceneViewController actionButtonScreenScale]((uint64_t)self->_sceneViewController);
  CATransform3DMakeScale(&a, v4, v4, 1.0);
  b = v13;
  CATransform3DConcat(&v12, &a, &b);
  -[ABCarouselView layer](self->_carouselView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  objc_msgSend(v5, "setTransform:", &v9);

  v8 = v13;
  -[ABDeviceButtonHighlightView layer](self->_buttonHighlightView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  objc_msgSend(v6, "setTransform:", &v7);

}

- (void)_renderWithTargetTimestamp:(double)a3 duration:(double)a4
{
  ABDeviceSceneViewController *sceneViewController;
  uint64_t v8;
  const char *v9;
  void *v10;
  _BOOL4 v11;
  _BYTE v12[24];
  id v13;
  unsigned __int8 v14;
  _BYTE v15[24];
  id v16;
  double v17;
  _BYTE v18[168];
  id v19;

  if (-[ABDeviceSceneViewController isScenePresented]((_BOOL8)self->_sceneViewController))
    -[ABActionSelectorViewController _revealSceneIfNeeded](self, "_revealSceneIfNeeded");
  sceneViewController = self->_sceneViewController;
  -[ABActionSelectorDriver sceneRenderInputs]((uint64_t)self->_driver, (uint64_t)v18);
  if (sceneViewController)
    -[ABDeviceSceneViewController renderWithTargetTimestamp:duration:renderInputs:](sceneViewController, (uint64_t)v18, a3, a4);
  else

  v8 = objc_msgSend(MEMORY[0x24BDE57D8], "disableActions");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[ABActionSelectorViewController _updateSubviews](self, "_updateSubviews");
  -[ABActionSelectorDriver overlayRenderInputs]((uint64_t)self->_driver, (uint64_t)v15);
  -[ABShadowView setTopShadowRatio:](self->_shadowView, v9, v17);

  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", v8);
  -[ABActionSelectorDriver overlayRenderInputs]((uint64_t)self->_driver, (uint64_t)v12);
  -[ABDeviceButtonHighlightView setHighlightRingVisible:]((uint64_t)self->_buttonHighlightView, v14);

  -[ABActionSelectorViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

  if (self->_hasPresentedViewController != v11)
  {
    self->_hasPresentedViewController = v11;
    -[ABActionSelectorDriver occlusionDidChange:](self->_driver, (const char *)(v10 != 0));
  }
}

- (void)_updateSubviews
{
  void *v3;
  double v4;
  ABCarouselView *carouselView;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[8];
  _OWORD v18[8];

  -[ABDeviceSceneViewController devicePerspectiveTransform]((id *)&self->_sceneViewController->super.super.super.isa, (uint64_t)v18);
  -[ABTransformView transformLayer](self->_overlayView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v18[4];
  v17[5] = v18[5];
  v17[6] = v18[6];
  v17[7] = v18[7];
  v17[0] = v18[0];
  v17[1] = v18[1];
  v17[2] = v18[2];
  v17[3] = v18[3];
  objc_msgSend(v3, "setSublayerTransform:", v17);

  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ABActionSelectorDriver overlayRenderInputs]((uint64_t)self->_driver, (uint64_t)&v12);
  -[UIView setAlpha:](self->_detailsView, "setAlpha:", *((double *)&v14 + 1));
  -[UIView setAlpha:](self->_welcomeView, "setAlpha:", *(double *)&v15);
  -[UITapGestureRecognizer setEnabled:](self->_tapToZoomInRecognizer, "setEnabled:", v16);
  v4 = -[ABDeviceSceneViewController actionButtonTranslationWithPressProgress:]((uint64_t)self->_sceneViewController, *(double *)&v12);
  carouselView = self->_carouselView;
  v6 = -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
  -[ABCarouselView setZPosition:forItemAtIndex:]((uint64_t)carouselView, v6, v4);
  -[ABDeviceButtonHighlightView setColor:]((uint64_t)self->_buttonHighlightView, *((void **)&v13 + 1));
  v7 = (void *)MEMORY[0x24BDD1698];
  -[ABCarouselView items]((id *)&self->_carouselView->super.super.super.super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v13)
    objc_msgSend(v9, "removeIndex:", -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver));
  -[ABCarouselView applyAlphaBlend:toItemsAtIndexes:]((void **)&self->_carouselView->super.super.super.super.super.isa, v9, *((double *)&v12 + 1));
  v10 = BYTE1(v13);
  -[ABCarouselView scrollGestureRecognizer]((uint64_t)self->_carouselView);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v10 != 0);

}

- (void)_revealSceneIfNeeded
{
  NSObject *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  uint8_t buf[4];
  ABActionSelectorViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!self->_didRevealScene)
  {
    ABLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl(&dword_235E72000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) reveal the scene", buf, 0xCu);
    }

    v4[4] = self;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke;
    v5[3] = &unk_25073ED10;
    v5[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke_2;
    v4[3] = &unk_25073ED38;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v5, v4, 0.25);
    self->_didRevealScene = 1;
  }
}

uint64_t __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "setAlpha:", 0.0);
}

uint64_t __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doRevealScene");
}

- (void)_doRevealScene
{
  -[ABHitTestPassthroughView setAlpha:](self->_overlayContainerView, "setAlpha:", 1.0);
  -[UIView setHidden:](self->_splashView, "setHidden:", 1);
  -[ABActionSelectorDriver didRevealScene](self->_driver);
}

- (void)_clipDuringNavigationTransiton
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;

  -[ABActionSelectorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "clipsToBounds");

  -[ABActionSelectorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", 1);

  -[ABActionSelectorViewController transitionCoordinator](self, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__ABActionSelectorViewController__clipDuringNavigationTransiton__block_invoke;
  v7[3] = &unk_25073ED60;
  v7[4] = self;
  v8 = v4;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v7);

}

void __64__ABActionSelectorViewController__clipDuringNavigationTransiton__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClipsToBounds:", v1);

}

- (void)_didTapToZoomIn
{
  -[ABActionSelectorDriver zoomIn](self->_driver, a2);
}

- (ABActionSelectorViewControllerDelegate)delegate
{
  return (ABActionSelectorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapToZoomInRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonHighlightView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_overlayContainerView, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_splashView, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);
  objc_storeStrong((id *)&self->_welcomeView, 0);
  objc_storeStrong((id *)&self->_driver, 0);
}

@end
