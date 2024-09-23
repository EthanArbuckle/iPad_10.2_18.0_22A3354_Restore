@implementation MRPlatterViewController

- (MRPlatterViewController)initWithStyle:(int64_t)a3
{
  MRPlatterViewController *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *contentView;
  MediaControlsRoutingCornerView *v12;
  MediaControlsRoutingCornerView *routingCornerView;
  MediaControlsParentContainerView *v14;
  MediaControlsParentContainerView *parentContainerView;
  NSMutableArray *v16;
  NSMutableArray *secondaryStringComponents;
  MediaControlsTransitioningDelegate *v18;
  MediaControlsTransitioningDelegate *transitioningDelegate;
  NSString *explicitString;
  MediaControlsMasterVolumeSlider *v21;
  uint64_t v22;
  MPVolumeGroupSliderCoordinator *groupSliderCoordinator;
  unint64_t style;
  MediaControlsHeaderView *v25;
  MediaControlsHeaderView *nowPlayingHeaderView;
  MRMediaControlsVideoPickerHeaderView *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  FBSDisplayLayoutMonitor *displayMonitor;
  void *v42;
  MRMediaControlsVideoPickerFooterView *v44;
  MRMediaControlsVideoPickerFooterView *videoPickerFooterView;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)MRPlatterViewController;
  v4 = -[MRPlatterViewController initWithNibName:bundle:](&v51, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v9, v8);
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v10;

    v12 = -[MediaControlsRoutingCornerView initWithFrame:]([MediaControlsRoutingCornerView alloc], "initWithFrame:", v7, v6, v9, v8);
    routingCornerView = v4->_routingCornerView;
    v4->_routingCornerView = v12;

    v14 = -[MediaControlsParentContainerView initWithFrame:]([MediaControlsParentContainerView alloc], "initWithFrame:", v7, v6, v9, v8);
    parentContainerView = v4->_parentContainerView;
    v4->_parentContainerView = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    secondaryStringComponents = v4->_secondaryStringComponents;
    v4->_secondaryStringComponents = v16;

    v18 = objc_alloc_init(MediaControlsTransitioningDelegate);
    transitioningDelegate = v4->_transitioningDelegate;
    v4->_transitioningDelegate = v18;

    v4->_style = a3;
    explicitString = v4->_explicitString;
    v4->_explicitString = (NSString *)&stru_1E581FBA8;

    if (a3 == 3)
    {
      v21 = -[MediaControlsVolumeSlider initWithFrame:style:]([MediaControlsVolumeSlider alloc], "initWithFrame:style:", 0, v7, v6, v9, v8);
    }
    else
    {
      v21 = -[MediaControlsMasterVolumeSlider initWithFrame:]([MediaControlsMasterVolumeSlider alloc], "initWithFrame:", v7, v6, v9, v8);
      -[MediaControlsMasterVolumeSlider setDelegate:](v21, "setDelegate:", v4);
    }
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2548]), "initWithMasterVolumeSlider:individualVolumeSliders:", v21, 0);
    groupSliderCoordinator = v4->_groupSliderCoordinator;
    v4->_groupSliderCoordinator = (MPVolumeGroupSliderCoordinator *)v22;

    style = v4->_style;
    if (style >= 5)
    {
      if (style != 5)
        goto LABEL_8;
      v44 = -[MRMediaControlsVideoPickerFooterView initWithFrame:]([MRMediaControlsVideoPickerFooterView alloc], "initWithFrame:", v7, v6, v9, v8);
      videoPickerFooterView = v4->_videoPickerFooterView;
      v4->_videoPickerFooterView = v44;

      v27 = -[MRMediaControlsVideoPickerHeaderView initWithFrame:]([MRMediaControlsVideoPickerHeaderView alloc], "initWithFrame:", v7, v6, v9, v8);
      v28 = 1072;
    }
    else
    {
      v25 = -[MediaControlsHeaderView initWithFrame:]([MediaControlsHeaderView alloc], "initWithFrame:", v7, v6, v9, v8);
      nowPlayingHeaderView = v4->_nowPlayingHeaderView;
      v4->_nowPlayingHeaderView = v25;

      v27 = -[MediaControlsVolumeContainerView initWithFrame:slider:]([MediaControlsVolumeContainerView alloc], "initWithFrame:slider:", v21, v7, v6, v9, v8);
      v28 = 1096;
    }
    v29 = *(Class *)((char *)&v4->super.super.super.isa + v28);
    *(Class *)((char *)&v4->super.super.super.isa + v28) = (Class)v27;

LABEL_8:
    -[MediaControlsHeaderView routingButton](v4->_nowPlayingHeaderView, "routingButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addTarget:action:forControlEvents:", v4, sel_headerViewButtonPressed_, 64);

    -[MediaControlsHeaderView launchNowPlayingAppButton](v4->_nowPlayingHeaderView, "launchNowPlayingAppButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addTarget:action:forControlEvents:", v4, sel_headerViewLaunchNowPlayingAppButtonPressed_, 64);

    -[MRMediaControlsVideoPickerFooterView addTarget:action:forControlEvents:](v4->_videoPickerFooterView, "addTarget:action:forControlEvents:", v4, sel_footerViewButtonPressed_, 64);
    v32 = v4->_style == 3;
    -[MediaControlsHeaderView routingButton](v4->_nowPlayingHeaderView, "routingButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setUserInterfaceStyleSwitchingEnabled:", v32);

    -[MRPlatterViewController parentContainerView](v4, "parentContainerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "transportStackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActionsDelegate:", v4);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("MEDIA_CONTROLS_PLATTER_PLACEHOLDER"), &stru_1E581FBA8, CFSTR("MediaControls"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlatterViewController setPlaceholderString:](v4, "setPlaceholderString:", v37);

    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v4);
    v39 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __41__MRPlatterViewController_initWithStyle___block_invoke;
    v48[3] = &unk_1E581B6B0;
    objc_copyWeak(&v49, &location);
    objc_msgSend(v38, "setTransitionHandler:", v48);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v38);
    v40 = objc_claimAutoreleasedReturnValue();
    displayMonitor = v4->_displayMonitor;
    v4->_displayMonitor = (FBSDisplayLayoutMonitor *)v40;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v39;
    v46[1] = 3221225472;
    v46[2] = __41__MRPlatterViewController_initWithStyle___block_invoke_2;
    v46[3] = &unk_1E58193B0;
    objc_copyWeak(&v47, &location);
    v4->_stateHandle = MCLogAddStateHandlerWithName(v42, v46);

    objc_destroyWeak(&v47);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
  return v4;
}

void __41__MRPlatterViewController_initWithStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "layoutMonitor:didUpdateDisplayLayout:withContext:", v6, v5, 0);

}

id __41__MRPlatterViewController_initWithStyle___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v3;
  void *v4;

  if (*(_DWORD *)(a2 + 16) == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_stateDumpObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (MRPlatterViewController)coverSheetPlatterViewController
{
  return (MRPlatterViewController *)objc_alloc_init(MRUCoverSheetViewController);
}

- (MRPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MRPlatterViewController *v4;
  MRPlatterViewController *v5;

  v4 = -[MRPlatterViewController initWithStyle:](self, "initWithStyle:", 0, a4);
  v5 = v4;
  if (v4)
  {
    -[MRPlatterViewController setAllowsNowPlayingAppLaunch:](v4, "setAllowsNowPlayingAppLaunch:", 1);
    CCUIExpandedModuleContinuousCornerRadius();
    -[MRPlatterViewController _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
  }
  return v5;
}

- (MRPlatterViewController)initWithRouteUID:(id)a3
{
  id v4;
  MRPlatterViewController *v5;
  MediaControlsStandaloneEndpointController *v6;
  void *v7;

  v4 = a3;
  v5 = -[MRPlatterViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = -[MediaControlsStandaloneEndpointController initWithRouteUID:]([MediaControlsStandaloneEndpointController alloc], "initWithRouteUID:", v4);
    -[MRPlatterViewController setEndpointController:](v5, "setEndpointController:", v6);

    -[MRPlatterViewController endpointController](v5, "endpointController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsAutomaticResponseLoading:", 1);

  }
  return v5;
}

- (MRPlatterViewController)initWithActiveRouteType:(int64_t)a3
{
  MRPlatterViewController *v4;
  MediaControlsActiveEndpointController *v5;
  void *v6;

  v4 = -[MRPlatterViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = -[MediaControlsActiveEndpointController initWithActiveEndpointType:]([MediaControlsActiveEndpointController alloc], "initWithActiveEndpointType:", a3 == 1);
    -[MRPlatterViewController setEndpointController:](v4, "setEndpointController:", v5);

    -[MRPlatterViewController endpointController](v4, "endpointController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsAutomaticResponseLoading:", 1);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[MRPlatterViewController endpointController](self, "endpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxyDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endObserving");

  -[MRPlatterViewController displayMonitor](self, "displayMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRPlatterViewController endpointController](self, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p route: %@"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)routeName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "routeLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setAllowsNowPlayingAppLaunch:(BOOL)a3
{
  if (self->_allowsNowPlayingAppLaunch != a3)
  {
    self->_allowsNowPlayingAppLaunch = a3;
    -[MRPlatterViewController _updateStyle](self, "_updateStyle");
  }
}

- (BOOL)shouldDisplayPlatter
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MRPlatterViewController endpointController](self, "endpointController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeviceUnlocked
{
  return !-[NSArray containsObject:](self->_displayElements, "containsObject:", *MEMORY[0x1E0D22C78]);
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[MRPlatterViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *contentView;
  void *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  MediaControlsInteractionRecognizer *v15;
  void *v16;
  MPAVRoutingViewController *routingViewController;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[MRPlatterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  -[MRPlatterViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 0);

  -[MRPlatterViewController backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MRPlatterViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_backgroundView);

  }
  -[MRPlatterViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_contentView);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_parentContainerView);
  contentView = self->_contentView;
  -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](contentView, "addSubview:", v10);

  v11 = self->_contentView;
  -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v11, "addSubview:", v12);

  -[UIView addSubview:](self->_contentView, "addSubview:", self->_routingCornerView);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__routingCornerViewReceivedTap_);
  objc_msgSend(v13, "setCancelsTouchesInView:", 0);
  -[MRPlatterViewController routingCornerView](self, "routingCornerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addGestureRecognizer:", v13);

  if (-[MRPlatterViewController style](self, "style") == 3)
  {
    v15 = -[MediaControlsInteractionRecognizer initWithTarget:action:]([MediaControlsInteractionRecognizer alloc], "initWithTarget:action:", self, sel__platterViewControllerReceivedInteraction_);
    -[MediaControlsInteractionRecognizer setCancelsTouchesInView:](v15, "setCancelsTouchesInView:", 0);
    -[MRPlatterViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addGestureRecognizer:", v15);

    -[MediaControlsInteractionRecognizer setDelegate:](v15, "setDelegate:", self);
  }
  -[MRPlatterViewController _updateStyle](self, "_updateStyle");
  routingViewController = self->_routingViewController;
  if (routingViewController)
  {
    -[MPAVRoutingViewController view](routingViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlatterViewController parentContainerView](self, "parentContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRoutingView:", v18);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
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
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CGAffineTransform *v29;
  __int128 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  int64_t style;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
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
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double MidY;
  void *v91;
  CGFloat MaxY;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  double width;
  double height;
  void *v106;
  double v107;
  double v108;
  CGFloat v109;
  void *v110;
  double v111;
  _OWORD v112[3];
  CGAffineTransform v113;
  CGAffineTransform v114;
  objc_super v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  v115.receiver = self;
  v115.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewDidLayoutSubviews](&v115, sel_viewDidLayoutSubviews);
  -[MRPlatterViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");

  -[MRPlatterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UIView setFrame:](self->_backgroundView, "setFrame:", v6, v8, v10, v12);
  -[UIView setFrame:](self->_contentView, "setFrame:", v6, v8, v10, v12);
  -[SFShareAudioViewController view](self->_shareAudioViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  UIRoundToScale();
  UIRoundToScale();
  v111 = v14;
  UIRectInset();
  UIRectInset();
  UIRectIntegralWithScale();
  -[MRPlatterViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[MRPlatterViewController routingCornerView](self, "routingCornerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "userInterfaceLayoutDirection");

  if (v26 == 1)
  {
    CGAffineTransformMakeScale(&v114, -1.0, 1.0);
    -[MRPlatterViewController routingCornerView](self, "routingCornerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v113 = v114;
    v29 = &v113;
  }
  else
  {
    -[MRPlatterViewController routingCornerView](self, "routingCornerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v112[0] = *MEMORY[0x1E0C9BAA8];
    v112[1] = v30;
    v112[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v29 = (CGAffineTransform *)v112;
  }
  objc_msgSend(v27, "setTransform:", v29);

  switch(self->_style)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      UIRectInset();
      v32 = v31;
      v34 = v33;
      if (self->_style == 3)
      {
        UIRectInset();
        v32 = v35;
        v34 = v36;
      }
      -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sizeThatFits:", v32, v34);

      UIRectIntegralWithScale();
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

      style = self->_style;
      if (style != 3 && style != 5)
        -[MRPlatterViewController supportedModes](self, "supportedModes");
      UIRectInset();
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v55 = v54;
      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "sizeThatFits:", v53, v55);

      v116.origin.x = v49;
      v116.origin.y = v51;
      v116.size.width = v53;
      v116.size.height = v55;
      CGRectGetMinX(v116);
      v117.origin.x = v49;
      v117.origin.y = v51;
      v117.size.width = v53;
      v117.size.height = v55;
      CGRectGetMaxY(v117);
      v118.origin.x = v49;
      v118.origin.y = v51;
      v118.size.width = v53;
      v118.size.height = v55;
      CGRectGetWidth(v118);
      UIRectInset();
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;
      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

      UIRectInset();
      UIRectIntegralWithScale();
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;
      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      v76 = v67;
      v77 = v69;
      v78 = v71;
      v79 = v73;
      goto LABEL_12;
    case 1:
      v94 = (v12 + v111 * -2.0) / 3.0;
      objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlatterViewController traitCollection](self, "traitCollection");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "scaledValueForValue:compatibleWithTraitCollection:", v96, 20.0);
      v98 = v97 * -0.5;

      -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "sizeThatFits:", v10, v12);
      v101 = v100;

      -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setFrame:", 0.0, v94 + 25.0 + v98, v10, v101);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "setFrame:", 0.0, v111 + v94 * 2.0, v10, 50.0);

      v121.origin.x = v6;
      v121.origin.y = v8;
      v121.size.width = v10;
      v121.size.height = v12;
      v122 = CGRectInset(v121, 13.0, 0.0);
      width = v122.size.width;
      height = v122.size.height;
      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView", v122.origin.x, v122.origin.y);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "sizeThatFits:", width, height);
      v108 = v107;

      -[MRPlatterViewController view](self, "view");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "bounds");
      v109 = CGRectGetMaxY(v123) - v108;
      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "setFrame:", 0.0, v109, width, v108);

      goto LABEL_13;
    case 2:
      -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "sizeThatFits:", v10, v12);

      UIRectCenteredIntegralRect();
      v82 = v81;
      v84 = v83;
      v86 = v85;
      v88 = v87;
      -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setFrame:", v82, v84, v86, v88);

      v119.origin.x = v6;
      v119.origin.y = v8;
      v119.size.width = v10;
      v119.size.height = v12;
      MidY = CGRectGetMidY(v119);
      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setFrame:", v6, MidY, v10, 50.0);

      v120.origin.y = v8 + 0.0;
      v120.origin.x = v6 + 24.0;
      v120.size.width = v10 - (24.0 + 24.0);
      v120.size.height = v12;
      MaxY = CGRectGetMaxY(v120);
      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      v76 = v6 + 24.0;
      v77 = MaxY;
      v78 = v10 - (24.0 + 24.0);
      v79 = 50.0;
LABEL_12:
      objc_msgSend(v74, "setFrame:", v76, v77, v78, v79);
LABEL_13:

      break;
    default:
      break;
  }
  -[MRPlatterViewController view](self, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "sendSubviewToBack:", self->_backgroundView);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[MRPlatterViewController setOnScreen:](self, "setOnScreen:", 1);
  -[MPAVRoutingViewController beginAppearanceTransition:animated:](self->_routingViewController, "beginAppearanceTransition:animated:", 1, v3);
  -[MRPlatterViewController _updateHeaderUI](self, "_updateHeaderUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MPAVRoutingViewController endAppearanceTransition](self->_routingViewController, "endAppearanceTransition");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  -[MRPlatterViewController _updateHeaderUI](self, "_updateHeaderUI");
  if (!a3)
    -[MRPlatterViewController setOnScreen:](self, "setOnScreen:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[MPAVRoutingViewController beginAppearanceTransition:animated:](self->_routingViewController, "beginAppearanceTransition:animated:", 0, v3);
  -[MRPlatterViewController languageOptionsViewController](self, "languageOptionsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRPlatterViewController;
  -[MRPlatterViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[MRPlatterViewController setOnScreen:](self, "setOnScreen:", 0);
  -[MPAVRoutingViewController endAppearanceTransition](self->_routingViewController, "endAppearanceTransition");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  UIView *backgroundView;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v14 = v5;
    v8 = backgroundView;
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[UIView _setContinuousCornerRadius:](*p_backgroundView, "_setContinuousCornerRadius:", self->__continuousCornerRadius);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIView visualStylingProviderForCategory:](*p_backgroundView, "visualStylingProviderForCategory:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlatterViewController setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v9, 1);

    }
    if (-[MRPlatterViewController isViewLoaded](self, "isViewLoaded"))
    {
      if (v14)
      {
        -[MRPlatterViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "insertSubview:atIndex:", v14, 0);

        -[MRPlatterViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setNeedsLayout");

      }
      else
      {
        -[UIView superview](v8, "superview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlatterViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v13)
          -[UIView removeFromSuperview](v8, "removeFromSuperview");
      }
    }

    v5 = v14;
  }

}

- (void)_setContinuousCornerRadius:(double)a3
{
  id v4;

  if (self->__continuousCornerRadius != a3)
  {
    self->__continuousCornerRadius = a3;
    -[MRPlatterViewController backgroundView](self, "backgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setContinuousCornerRadius:", self->__continuousCornerRadius);

  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[MRPlatterViewController _updateSecondaryStringFormat](self, "_updateSecondaryStringFormat");
    -[MRPlatterViewController _updateStyle](self, "_updateStyle");
    if (self->_style)
    {
      if ((-[MRPlatterViewController supportedModes](self, "supportedModes") & 2) != 0
        && (-[MRPlatterViewController supportedModes](self, "supportedModes") & 1) != 0)
      {
        -[MRPlatterViewController _setRoutingPickerVisible:animated:](self, "_setRoutingPickerVisible:animated:", 0, 0);
      }
    }
  }
}

- (void)setEndpointController:(id)a3
{
  MediaControlsEndpointController *v5;
  MediaControlsEndpointController **p_endpointController;
  MRPlatterViewController *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  MRPlatterViewController *v17;
  __int16 v18;
  MediaControlsEndpointController *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (MediaControlsEndpointController *)a3;
  p_endpointController = &self->_endpointController;
  -[MediaControlsEndpointController delegate](self->_endpointController, "delegate");
  v7 = (MRPlatterViewController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    -[MediaControlsEndpointController setDelegate:](*p_endpointController, "setDelegate:", 0);
  -[MediaControlsEndpointController setDelegate:](v5, "setDelegate:", self);
  -[MRPlatterViewController label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsEndpointController setLabel:](v5, "setLabel:", v8);

  MCLogCategoryRouting();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = self;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ changing to endpoint controller: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  if (*p_endpointController != v5)
  {
    objc_storeStrong((id *)&self->_endpointController, a3);
    -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "volumeSlider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MediaControlsEndpointController route](v5, "route");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[MediaControlsEndpointController route](v5, "route");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "volumeSlider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setGroupRoute:", v13);
      }
      else
      {
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", 0, 0);
        -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "volumeSlider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setVolumeDataSource:", v13);
      }

    }
    -[MRPlatterViewController _updateHeaderUI](self, "_updateHeaderUI");
  }

}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_label, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    label = self->_label;
    self->_label = v4;

    -[MediaControlsEndpointController setLabel:](self->_endpointController, "setLabel:", v6);
  }

}

- (void)setPlaceholderString:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_placeholderString != v6)
  {
    objc_storeStrong((id *)&self->_placeholderString, a3);
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholderString:", v6);

  }
}

- (UIView)effectiveFooterView
{
  unint64_t style;
  void *v3;

  style = self->_style;
  if (style >= 5)
  {
    if (style != 5)
      return (UIView *)0;
    -[MRPlatterViewController videoPickerFooterView](self, "videoPickerFooterView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIView *)v3;
}

- (UIView)effectiveHeaderView
{
  unint64_t style;
  void *v3;

  style = self->_style;
  if (style >= 5)
  {
    if (style != 5)
      return (UIView *)0;
    -[MRPlatterViewController videoPickerHeaderView](self, "videoPickerHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIView *)v3;
}

- (id)_route
{
  void *v2;
  void *v3;

  -[MRPlatterViewController endpointController](self, "endpointController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updateStyle
{
  int64_t style;
  void *v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  style = self->_style;
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStyle:", style);

  v5 = self->_style;
  -[MRPlatterViewController parentContainerView](self, "parentContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", v5);

  v7 = self->_style;
  -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStyle:", v7);

  if ((unint64_t)(self->_style - 1) > 1)
  {
    v13 = -[MRPlatterViewController allowsNowPlayingAppLaunch](self, "allowsNowPlayingAppLaunch") ^ 1;
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "launchNowPlayingAppButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = v13;
  }
  else
  {
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "launchNowPlayingAppButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
  }
  objc_msgSend(v10, "setHidden:", v12);

  switch(self->_style)
  {
    case 0:
    case 3:
    case 4:
      -[MRPlatterViewController routingCornerView](self, "routingCornerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0.0;
      objc_msgSend(v14, "setAlpha:", 0.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAlpha:", 1.0);

      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAlpha:", 1.0);

      v18 = -[MRPlatterViewController _canToggleRoutingPicker](self, "_canToggleRoutingPicker");
      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topDividerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (!v18)
        goto LABEL_14;
      objc_msgSend(v20, "setAlpha:", 1.0);

      if (-[MRPlatterViewController selectedMode](self, "selectedMode") == 1)
        v15 = 1.0;
      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bottomDividerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = v15;
      goto LABEL_15;
    case 1:
      -[MRPlatterViewController routingCornerView](self, "routingCornerView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAlpha:", 1.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = 1.0;
      goto LABEL_13;
    case 2:
      -[MRPlatterViewController routingCornerView](self, "routingCornerView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setAlpha:", 0.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = 0.0;
LABEL_13:
      objc_msgSend(v27, "setAlpha:", v29);

      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAlpha:", 0.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topDividerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
LABEL_14:
      objc_msgSend(v20, "setAlpha:", 0.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bottomDividerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 0.0;
      goto LABEL_15;
    case 5:
      -[MRPlatterViewController routingCornerView](self, "routingCornerView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAlpha:", 0.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAlpha:", 1.0);

      -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAlpha:", 1.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "topDividerView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAlpha:", 1.0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bottomDividerView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 1.0;
LABEL_15:
      objc_msgSend(v23, "setAlpha:", v25);

      break;
    default:
      break;
  }
  -[MRPlatterViewController _updateOnScreenForStyle:](self, "_updateOnScreenForStyle:", self->_style);
  if ((unint64_t)(self->_style - 1) <= 1)
    -[MRPlatterViewController _dismissShareAudioViewController](self, "_dismissShareAudioViewController");
  -[MRPlatterViewController view](self, "view");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNeedsLayout");

}

- (id)_tvMediaRemoteIdentifier
{
  void *v2;
  void *v3;

  -[MRPlatterViewController _route](self, "_route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v2, "isAppleTVRoute") & 1) != 0
     || objc_msgSend(v2, "containsDeviceWithSubtype:", 18))
    && (objc_msgSend(v2, "endpoint"), MRAVEndpointGetExternalDevice()))
  {
    v3 = (void *)MRExternalDeviceCopyUniqueIdentifier();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_tvAirplayIdentifier
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  int IsAddedToHomeKit;

  -[MRPlatterViewController _route](self, "_route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointWrapper");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "unwrappedValue");
  v4 = (void *)MRAVEndpointCopyOutputDevices();

  objc_msgSend(v4, "firstObject");
  if ((objc_msgSend(v2, "isAppleTVRoute") & 1) != 0
    || objc_msgSend(v2, "isTVRoute") && MRAVOutputDeviceIsAddedToHomeKit())
  {
    objc_msgSend(v2, "groupLeaderAirplayIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = (void *)v5;
    goto LABEL_11;
  }
  if (!objc_msgSend(v2, "isDeviceRoute") || !objc_msgSend(v2, "isAirPlayingToDevice"))
  {
    v6 = 0;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v4, "count");
  if (MRAVOutputDeviceGetSubtype() == 13)
    v8 = MRAVOutputDeviceSupportsRapport();
  else
    v8 = 0;
  if (MRAVOutputDeviceGetSubtype() == 11)
    IsAddedToHomeKit = MRAVOutputDeviceIsAddedToHomeKit();
  else
    IsAddedToHomeKit = 0;
  v6 = 0;
  if (v7 == 1 && v8 | IsAddedToHomeKit)
  {
    v5 = MRAVOutputDeviceCopyUniqueIdentifier();
    goto LABEL_3;
  }
LABEL_11:

  return v6;
}

- (void)_prewarmTVRemoteIfNeeded
{
  id v3;

  if (-[MRPlatterViewController shouldShowTVRemoteButton](self, "shouldShowTVRemoteButton"))
  {
    if (-[MRPlatterViewController _shouldUseViewServiceToPresentTVRemote](self, "_shouldUseViewServiceToPresentTVRemote"))
    {
      objc_msgSend(MEMORY[0x1E0DB1FD0], "sharedInstance");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "prewarm");

    }
  }
}

- (BOOL)_shouldUseViewServiceToPresentTVRemote
{
  void *v3;
  int v4;
  void *v5;

  -[MRPlatterViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "shouldPresentUsingViewServicePlatterViewController:", self) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
      LOBYTE(v4) = 0;
    else
      v4 = CCUIIsPortrait() ^ 1;

  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (BOOL)_isExpanded
{
  return !-[MRPlatterViewController style](self, "style")
      || -[MRPlatterViewController style](self, "style") == 3
      || -[MRPlatterViewController style](self, "style") == 4;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return 0;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1E5878528;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider **p_visualStylingProvider;
  MTVisualStylingProvider *v8;
  void *v9;
  MTVisualStylingProvider *v10;
  void *v11;
  MTVisualStylingProvider *v12;
  void *v13;
  MTVisualStylingProvider *v14;
  void *v15;
  void *v16;
  void *v17;
  MTVisualStylingProvider *v18;

  v6 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  if (self->_visualStylingProvider != v6)
  {
    v18 = v6;
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    -[MediaControlsHeaderView setVisualStylingProvider:](self->_nowPlayingHeaderView, "setVisualStylingProvider:", *p_visualStylingProvider);
    v8 = *p_visualStylingProvider;
    -[MediaControlsParentContainerView timeControl](self->_parentContainerView, "timeControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVisualStylingProvider:", v8);

    v10 = *p_visualStylingProvider;
    -[MediaControlsParentContainerView transportStackView](self->_parentContainerView, "transportStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVisualStylingProvider:", v10);

    v12 = *p_visualStylingProvider;
    -[MediaControlsParentContainerView topDividerView](self->_parentContainerView, "topDividerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVisualStylingProvider:", v12);

    v14 = *p_visualStylingProvider;
    -[MediaControlsParentContainerView bottomDividerView](self->_parentContainerView, "bottomDividerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setVisualStylingProvider:", v14);

    -[MediaControlsVolumeContainerView setVisualStylingProvider:](self->_volumeContainerView, "setVisualStylingProvider:", *p_visualStylingProvider);
    -[MRMediaControlsVideoPickerHeaderView setVisualStylingProvider:](self->_videoPickerHeaderView, "setVisualStylingProvider:", *p_visualStylingProvider);
    -[MRMediaControlsVideoPickerFooterView setVisualStylingProvider:](self->_videoPickerFooterView, "setVisualStylingProvider:", *p_visualStylingProvider);
    -[MRPlatterViewController routingViewController](self, "routingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadData");

    v6 = v18;
  }

}

- (SFShareAudioViewController)shareAudioViewController
{
  SFShareAudioViewController *shareAudioViewController;
  void *v4;
  SFShareAudioViewController *v5;
  id v6;
  _QWORD v8[5];

  shareAudioViewController = self->_shareAudioViewController;
  if (!shareAudioViewController)
  {
    objc_msgSend(MEMORY[0x1E0D975F8], "instantiateViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFlags:", 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__MRPlatterViewController_shareAudioViewController__block_invoke;
    v8[3] = &unk_1E58191D8;
    v8[4] = self;
    objc_msgSend(v4, "setCompletion:", v8);
    v5 = self->_shareAudioViewController;
    self->_shareAudioViewController = (SFShareAudioViewController *)v4;
    v6 = v4;

    shareAudioViewController = self->_shareAudioViewController;
  }
  return shareAudioViewController;
}

void __51__MRPlatterViewController_shareAudioViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "mediaRouteIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEBUG, "ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_dismissShareAudioViewController");

}

- (void)_showShareAudioViewController
{
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(_QWORD *);
  _Unwind_Exception *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__MRPlatterViewController__showShareAudioViewController__block_invoke;
  v6[3] = &unk_1E581B700;
  v6[4] = self;
  v3 = v6;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (void (*)(_QWORD *))getSBSRequestPasscodeUnlockAlertUISymbolLoc_ptr;
  v11 = getSBSRequestPasscodeUnlockAlertUISymbolLoc_ptr;
  if (!getSBSRequestPasscodeUnlockAlertUISymbolLoc_ptr)
  {
    v7[0] = v2;
    v7[1] = 3221225472;
    v7[2] = __getSBSRequestPasscodeUnlockAlertUISymbolLoc_block_invoke;
    v7[3] = &unk_1E581B888;
    v7[4] = &v8;
    __getSBSRequestPasscodeUnlockAlertUISymbolLoc_block_invoke((uint64_t)v7);
    v4 = (void (*)(_QWORD *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v5 = (_Unwind_Exception *)-[MRPlatterViewController _showShareAudioViewController].cold.1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v5);
  }
  v4(v3);

}

void __56__MRPlatterViewController__showShareAudioViewController__block_invoke(uint64_t a1, int a2)
{
  void *v3;
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
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "shareAudioViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v3, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    objc_msgSend(v3, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.0);

    v15 = *(double *)(*(_QWORD *)(a1 + 32) + 1040);
    objc_msgSend(v3, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setContinuousCornerRadius:", v15);

    objc_msgSend(v3, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClipsToBounds:", 1);

    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v3);
    objc_msgSend(*(id *)(a1 + 32), "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    objc_msgSend(v3, "beginAppearanceTransition:animated:", 1, 1);
    v20 = (void *)MEMORY[0x1E0DC3F10];
    v21 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__MRPlatterViewController__showShareAudioViewController__block_invoke_2;
    v28[3] = &unk_1E5818CB0;
    v22 = v3;
    v23 = *(_QWORD *)(a1 + 32);
    v29 = v22;
    v30 = v23;
    v25[0] = v21;
    v25[1] = 3221225472;
    v25[2] = __56__MRPlatterViewController__showShareAudioViewController__block_invoke_3;
    v25[3] = &unk_1E581B6D8;
    v26 = v22;
    v27 = v23;
    v24 = v22;
    objc_msgSend(v20, "animateWithDuration:animations:completion:", v28, v25, 0.25);

  }
}

uint64_t __56__MRPlatterViewController__showShareAudioViewController__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "setAlpha:", 0.0);
}

uint64_t __56__MRPlatterViewController__showShareAudioViewController__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  return objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_dismissShareAudioViewController
{
  SFShareAudioViewController *shareAudioViewController;
  SFShareAudioViewController *v4;
  SFShareAudioViewController *v5;
  void *v6;
  uint64_t v7;
  SFShareAudioViewController *v8;
  _QWORD v9[4];
  SFShareAudioViewController *v10;
  _QWORD v11[4];
  SFShareAudioViewController *v12;
  MRPlatterViewController *v13;

  shareAudioViewController = self->_shareAudioViewController;
  if (shareAudioViewController)
  {
    v4 = shareAudioViewController;
    v5 = self->_shareAudioViewController;
    self->_shareAudioViewController = 0;

    -[SFShareAudioViewController willMoveToParentViewController:](v4, "willMoveToParentViewController:", 0);
    -[SFShareAudioViewController beginAppearanceTransition:animated:](v4, "beginAppearanceTransition:animated:", 0, 1);
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke;
    v11[3] = &unk_1E5818CB0;
    v12 = v4;
    v13 = self;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke_2;
    v9[3] = &unk_1E581AA88;
    v10 = v12;
    v8 = v12;
    objc_msgSend(v6, "animateWithDuration:animations:completion:", v11, v9, 0.25);

  }
}

uint64_t __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 992), "setAlpha:", 1.0);
}

uint64_t __59__MRPlatterViewController__dismissShareAudioViewController__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
}

- (void)setTransitioning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int64_t style;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id v19;

  if (self->_transitioning != a3)
  {
    v3 = a3;
    self->_transitioning = a3;
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTransitioning:", v3);

    style = self->_style;
    if (style == 2)
    {
      v9 = !self->_transitioning;
      -[MRPlatterViewController routingCornerView](self, "routingCornerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", v9);

      v11 = !self->_transitioning;
      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", v11);

    }
    else
    {
      if (style != 1)
      {
        v16 = !self->_transitioning;
        -[MRPlatterViewController routingCornerView](self, "routingCornerView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setHidden:", v16);

        -[MRPlatterViewController parentContainerView](self, "parentContainerView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setHidden:", 0);

        -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v14;
        v15 = 0;
        goto LABEL_8;
      }
      -[MRPlatterViewController routingCornerView](self, "routingCornerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 0);

      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 0);

    }
    v13 = !self->_transitioning;
    -[MRPlatterViewController effectiveFooterView](self, "effectiveFooterView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v14;
    v15 = v13;
LABEL_8:
    objc_msgSend(v14, "setHidden:", v15);

  }
}

- (void)setDisplayElements:(id)a3
{
  NSArray *v4;
  NSArray *displayElements;
  _BOOL8 v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_displayElements, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v8, "copy");
    displayElements = self->_displayElements;
    self->_displayElements = v4;

    v6 = -[MRPlatterViewController isDeviceUnlocked](self, "isDeviceUnlocked");
    -[MRPlatterViewController endpointController](self, "endpointController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeviceUnlocked:", v6);

  }
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    -[MRPlatterViewController endpointController](self, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOnScreen:", v3);

    -[MRPlatterViewController endpointController](self, "endpointController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proxyDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(v7, "beginObserving");
    else
      objc_msgSend(v7, "endObserving");
    -[MRPlatterViewController _updateOnScreenForStyle:](self, "_updateOnScreenForStyle:", self->_style);

  }
}

- (void)_updateOnScreenForStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v4 = ((unint64_t)a3 < 5) & (0x19u >> a3) & -[MRPlatterViewController isOnScreen](self, "isOnScreen");
  -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOnScreen:", v4);

  v6 = -[MRPlatterViewController isOnScreen](self, "isOnScreen");
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMarqueeEnabled:", v6);

}

- (void)setSupportedModes:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  if (self->_supportedModes != a3)
  {
    self->_supportedModes = a3;
    v4 = -[MRPlatterViewController supportedModes](self, "supportedModes");
    v5 = v4 & (1 << -[MRPlatterViewController selectedMode](self, "selectedMode"));
    if (v5 != 1 << -[MRPlatterViewController selectedMode](self, "selectedMode"))
    {
      v6 = 0;
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if ((-[MRPlatterViewController supportedModes](self, "supportedModes") & (1 << v6)) != 0)
          break;
        v7 = 0;
        v6 = 1;
        if ((v8 & 1) == 0)
          goto LABEL_8;
      }
      -[MRPlatterViewController setSelectedMode:](self, "setSelectedMode:", v6);
    }
LABEL_8:
    -[MRPlatterViewController _updateConfiguration](self, "_updateConfiguration");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
    self->_selected = a3;
}

- (void)setSelectedMode:(int64_t)a3
{
  -[MRPlatterViewController setSelectedMode:animated:](self, "setSelectedMode:animated:", a3, 0);
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  if (((1 << a3) & ~-[MRPlatterViewController supportedModes](self, "supportedModes")) == 0)
  {
    -[MRPlatterViewController parentContainerView](self, "parentContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedMode:animated:", (int)a3, v4);

    if (self->_selectedMode != a3)
    {
      self->_selectedMode = a3;
      -[MRPlatterViewController _updateConfiguration](self, "_updateConfiguration");
      -[MRPlatterViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setNeedsLayout");

    }
  }
}

- (void)_updateConfiguration
{
  uint64_t v3;
  int64_t selectedMode;
  id v5;

  if ((-[MRPlatterViewController supportedModes](self, "supportedModes") & 2) != 0
    && (-[MRPlatterViewController supportedModes](self, "supportedModes") & 1) != 0)
  {
    selectedMode = self->_selectedMode;
    if (selectedMode == 1)
      v3 = 1;
    else
      v3 = 2 * (selectedMode == 0);
  }
  else
  {
    v3 = 0;
  }
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButtonType:", v3);

}

- (void)endpointController:(id)a3 didLoadNewResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  MCLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "tracklist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playingItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[MRPlatterViewController] didLoadNewResponse %@. PlayingItem: %@.", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v7, "representedBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAVRoutingViewController _routingController](self->_routingViewController, "_routingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRepresentedBundleID:", v11);

  -[MRPlatterViewController endpointController](self, "endpointController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tracklist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playingItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "languageOptionGroups");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_languageOptionsViewController);
    objc_msgSend(WeakRetained, "setLanguageOptionGroups:", v17);

  }
  -[MRPlatterViewController _updateHeaderUI](self, "_updateHeaderUI");

}

- (void)endpointControllerDidUpdateRoutingAvailability:(id)a3
{
  -[MRPlatterViewController _updateRoutingCornerView](self, "_updateRoutingCornerView", a3);
  -[MRPlatterViewController _updateRoutingIndicators](self, "_updateRoutingIndicators");
  -[MRPlatterViewController _updateRouteNameLabel](self, "_updateRouteNameLabel");
}

- (void)endpointControllerRouteDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeSlider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlatterViewController volumeContainerView](self, "volumeContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "volumeSlider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGroupRoute:", v6);

  }
  -[MRPlatterViewController _updateRouteNameLabel](self, "_updateRouteNameLabel");
  -[MRPlatterViewController parentContainerView](self, "parentContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transportStackView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateOnRouteChange");

  -[MRPlatterViewController _prewarmTVRemoteIfNeeded](self, "_prewarmTVRemoteIfNeeded");
  -[MRPlatterViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "platterViewController:shouldDisplayPlatterDidChange:", self, -[MRPlatterViewController shouldDisplayPlatter](self, "shouldDisplayPlatter"));

}

- (void)_updateHeaderUI
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char isKindOfClass;
  void *v44;
  int v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  if (-[MRPlatterViewController isOnScreen](self, "isOnScreen"))
  {
    -[MRPlatterViewController endpointController](self, "endpointController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "response");
    v52 = (id)objc_claimAutoreleasedReturnValue();

    -[MRPlatterViewController parentContainerView](self, "parentContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResponse:", v52);

    if (v52)
    {
      v6 = -[MediaControlsEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute");
      objc_msgSend(v52, "tracklist");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playingItemIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 && v8 == 0)
      {
        -[MRPlatterViewController endpointController](self, "endpointController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "representedBundleID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
          v31 = v29;
        else
          v31 = (__CFString *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
        v13 = v31;

        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v13);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedName");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v36)
          v38 = (const __CFString *)v36;
        else
          v38 = &stru_1E581FBA8;
        -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setPrimaryString:", v38);

        -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
LABEL_39:
        objc_msgSend(v40, "setSecondaryString:", &stru_1E581FBA8);

        -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "removeAllObjects");

        -[MRPlatterViewController _updateSecondaryStringFormat](self, "_updateSecondaryStringFormat");
        -[MRPlatterViewController setArtworkCatalog:](self, "setArtworkCatalog:", 0);
        -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "artworkView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "clearArtworkCatalogs");

        -[MRPlatterViewController _updatePlaceholderArtwork](self, "_updatePlaceholderArtwork");
LABEL_40:

        -[MRPlatterViewController _updateRouteNameLabel](self, "_updateRouteNameLabel");
        -[MRPlatterViewController _updateRoutingCornerView](self, "_updateRoutingCornerView");
        -[MRPlatterViewController _updateRoutingIndicators](self, "_updateRoutingIndicators");

        return;
      }
      if (v8)
      {
        objc_msgSend(v52, "tracklist");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstSection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metadataObject");
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v52, "tracklist");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "tracklist");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "playingItemIndexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "itemAtIndexPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "explicitBadge");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (const __CFString *)v19;
        else
          v21 = CFSTR("🅴");
        objc_msgSend(CFSTR(" "), "stringByAppendingString:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlatterViewController setExplicitString:](self, "setExplicitString:", v22);

        objc_msgSend(v18, "metadataObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlatterViewController _updateControlCenterMetadata:sectionMetadata:](self, "_updateControlCenterMetadata:sectionMetadata:", v23, v13);

        goto LABEL_40;
      }
    }
    -[MRPlatterViewController endpointController](self, "endpointController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRPlatterViewController endpointController](self, "endpointController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "state");

    if (v27 == 2 || v27 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("ROUTE_CONNECTING_TITLE");
    }
    else if (v27 == -1)
    {
      if (!v25 || self->_style == 3)
      {
        v13 = &stru_1E581FBA8;
LABEL_30:
        -[MRPlatterViewController endpointController](self, "endpointController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[MRPlatterViewController endpointController](self, "endpointController");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isEndpointDiscovered") ^ 1;

        }
        else
        {
          v45 = 0;
        }
        -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setPrimaryString:", v13);

        if (v45)
        {
          -[MRPlatterViewController placeholderString](self, "placeholderString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46 != 0;
        }
        else
        {
          v47 = 0;
        }
        -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setShowPlaceholderString:", v47);

        if (v45)
        -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("ROUTE_NOT_CONNECTED_TITLE");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = CFSTR("MEDIA_CONTROLS_EMPTY_STATE_TITLE");
    }
    objc_msgSend(v32, "localizedStringForKey:value:table:", v34, &stru_1E581FBA8, CFSTR("MediaControls"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
}

- (void)_updateControlCenterMetadata:(id)a3 sectionMetadata:(id)a4
{
  void *v4;
  void *v5;
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
  id v18;
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
  id v36;

  v36 = a4;
  objc_msgSend(a3, "song");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "type") == 13)
  {
    objc_msgSend(v36, "radioStation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(v8, "isExplicitSong");
  objc_msgSend(v8, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v10)
  {
    -[MRPlatterViewController explicitString](self, "explicitString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v4;
  }
  v12 = v11;
  if (!v11)
  {
    v13 = (void *)MEMORY[0x1E0CA5860];
    -[MRPlatterViewController endpointController](self, "endpointController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationProxyForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPrimaryString:", v12);

  if (!v11)
  {

  }
  -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  if (objc_msgSend(v8, "shouldShowComposer"))
  {
    objc_msgSend(v8, "composer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("COMPOSED_BY_TITLE_%@"), &stru_1E581FBA8, CFSTR("MediaControls"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithFormat:", v20, v17);

      -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v21);

    }
  }
  objc_msgSend(v8, "artist");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
  {
    -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v24);

  }
  objc_msgSend(v8, "album");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "length"))
  {
    -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v27);

  }
  objc_msgSend(v9, "attributionLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length"))
  {
    -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v29);

  }
  -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "componentsJoinedByString:", CFSTR(" — "));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSecondaryString:", v32);

  objc_msgSend(v8, "artworkCatalog");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlatterViewController setArtworkCatalog:](self, "setArtworkCatalog:", v34);

  -[MRPlatterViewController _updateSecondaryStringFormat](self, "_updateSecondaryStringFormat");
  -[MRPlatterViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setNeedsLayout");

}

- (void)_updateRouteNameLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MediaControlsEndpointController route](self->_endpointController, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoute:", v3);

  -[MRPlatterViewController endpointController](self, "endpointController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.duetexpertd")) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[MRPlatterViewController endpointController](self, "endpointController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "playerPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v14, "isEqualToString:", CFSTR("duetexpertd"));

  }
  -[MRPlatterViewController endpointController](self, "endpointController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "response");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playerPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("MagicalMomentsPlayer"));

  if (v19)
  {
    MCLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[MRPlatterViewController endpointController](self, "endpointController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "response");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "playerPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = v24;
      _os_log_impl(&dword_1AA991000, v20, OS_LOG_TYPE_DEFAULT, "MRPlatterViewController displaying MagicalMomentsPlayer suggestion for bundleID=%@", (uint8_t *)&v29, 0xCu);

    }
  }
  v25 = v10 & v19;
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "routeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDisplayAsSiriSuggestion:", v25);

  -[MRPlatterViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNeedsLayout");

}

- (void)setArtworkCatalog:(id)a3
{
  id v5;
  id *p_artworkCatalog;
  MPArtworkCatalog *artworkCatalog;
  int64_t failedArtworkRetryCount;
  NSObject *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MSVTimer *v19;
  MSVTimer *artworkTimer;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_artworkCatalog = (id *)&self->_artworkCatalog;
  artworkCatalog = self->_artworkCatalog;
  if (!v5)
  {
    *p_artworkCatalog = 0;

    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "artworkView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", 0);

    -[MRPlatterViewController _updatePlaceholderArtwork](self, "_updatePlaceholderArtwork");
    -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

    goto LABEL_14;
  }
  if (!-[MPArtworkCatalog isArtworkVisuallyIdenticalToCatalog:](artworkCatalog, "isArtworkVisuallyIdenticalToCatalog:", v5))
  {
    self->_failedArtworkRetryCount = 0;
LABEL_13:
    self->_failedToLoadArtwork = 0;
    objc_storeStrong((id *)&self->_artworkCatalog, a3);
    objc_msgSend(*p_artworkCatalog, "setFittingSize:", 60.0, 60.0);
    -[MRPlatterViewController traitCollection](self, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayScale");
    objc_msgSend(*p_artworkCatalog, "setDestinationScale:");

    objc_initWeak((id *)buf, self);
    v17 = (void *)MEMORY[0x1E0D4D110];
    v18 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __45__MRPlatterViewController_setArtworkCatalog___block_invoke;
    v26[3] = &unk_1E5818E18;
    objc_copyWeak(&v27, (id *)buf);
    objc_msgSend(v17, "timerWithInterval:repeats:block:", 0, v26, 1.0);
    v19 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
    artworkTimer = self->_artworkTimer;
    self->_artworkTimer = v19;

    objc_msgSend(*p_artworkCatalog, "setCacheIdentifier:forRequestingContext:", CFSTR("MediaControlsHeaderView"), self);
    v21 = *p_artworkCatalog;
    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "artworkView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __45__MRPlatterViewController_setArtworkCatalog___block_invoke_113;
    v24[3] = &unk_1E581B728;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v21, "setDestination:configurationBlock:", v23, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  if (!self->_failedToLoadArtwork)
    goto LABEL_14;
  failedArtworkRetryCount = self->_failedArtworkRetryCount;
  if (failedArtworkRetryCount < 3)
  {
    self->_failedArtworkRetryCount = failedArtworkRetryCount + 1;
    MCLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_failedArtworkRetryCount;
      *(_DWORD *)buf = 134217984;
      v29 = v15;
      _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_ERROR, "MRPlatterViewController _failedToLoadArtwork=YES retryAttempt=%ld, retrying", buf, 0xCu);
    }

    goto LABEL_13;
  }
  MCLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = self->_failedArtworkRetryCount;
    *(_DWORD *)buf = 134217984;
    v29 = v10;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_ERROR, "MRPlatterViewController _failedToLoadArtwork=YES retryAttemptsExhausted=%ld, leaving failed", buf, 0xCu);
  }

LABEL_14:
}

void __45__MRPlatterViewController_setArtworkCatalog___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MCLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(WeakRetained, "artworkCatalog");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 134218240;
    v5 = WeakRetained;
    v6 = 2048;
    v7 = v3;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEBUG, "MRPlatterViewController: %p timeout while waiting for artworkCatalog=%p", (uint8_t *)&v4, 0x16u);

  }
  objc_msgSend(WeakRetained, "_showPlaceholderArtwork");

}

void __45__MRPlatterViewController_setArtworkCatalog___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setArtworkTimer:", 0);
  if (v6
    && (objc_msgSend(WeakRetained, "artworkCatalog"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(WeakRetained, "nowPlayingHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeholderArtworkView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", 0);

    objc_msgSend(v5, "setImage:", v6);
    objc_msgSend(WeakRetained, "effectiveHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

  }
  else
  {
    MCLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "artworkCatalog");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134218240;
      v15 = v6;
      v16 = 2048;
      v17 = v13;
      _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_ERROR, "MRPlatterViewController _failedToLoadArtwork image=%p artworkCatalog=%p", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(WeakRetained, "setFailedToLoadArtwork:", 1);
    objc_msgSend(WeakRetained, "_showPlaceholderArtwork");
  }
  objc_msgSend(WeakRetained, "_updateStyle");

}

- (void)_showPlaceholderArtwork
{
  void *v3;
  void *v4;

  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", 0);

  -[MRPlatterViewController _updatePlaceholderArtwork](self, "_updatePlaceholderArtwork");
}

- (void)_updatePlaceholderArtwork
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MRPlatterViewController endpointController](self, "endpointController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    v35 = v9;

    -[MRPlatterViewController endpointController](self, "endpointController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "playerPath");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[MRPlatterViewController _route](self, "_route");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = -[MediaControlsEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute");

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v35);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            -[MRPlatterViewController traitCollection](self, "traitCollection");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "displayScale");
            if (v19 == 0.0)
            {
              objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "scale");
              v22 = v21;

            }
            else
            {
              v22 = v19;
            }

            objc_msgSend(MEMORY[0x1E0DC3870], "_applicationIconImageForBundleIdentifier:format:scale:", v35, 0, v22);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            goto LABEL_19;
          }
          objc_msgSend(MEMORY[0x1E0CC2318], "_currentDeviceRoutingIconImage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
          v29 = 1;
LABEL_19:
          -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "placeholderArtworkView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setImage:", v28);

          -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setScalePlaceholderImage:", v29);

          -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "updateArtworkStyle");

          -[MRPlatterViewController effectiveHeaderView](self, "effectiveHeaderView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setNeedsLayout");

          return;
        }
LABEL_13:
        -[MRPlatterViewController _route](self, "_route");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[MRPlatterViewController placeholderDeviceIdentifier](self, "placeholderDeviceIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)MEMORY[0x1E0CC2318];
        if (!v24 || v23)
        {
          -[MRPlatterViewController _route](self, "_route");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_iconImageForRoute:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[MRPlatterViewController placeholderDeviceIdentifier](self, "placeholderDeviceIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_iconImageForIdentifier:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
        }
        v28 = (void *)v27;

        goto LABEL_18;
      }

    }
    goto LABEL_13;
  }
}

- (void)_updateSecondaryStringFormat
{
  int64_t style;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  style = self->_style;
  -[MRPlatterViewController secondaryStringComponents](self, "secondaryStringComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (style == 1)
    objc_msgSend(v4, "firstObject");
  else
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" — "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryString:", v5);

}

- (void)footerViewButtonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[MRPlatterViewController delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_style == 5)
  {
    v8 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v8;
    if ((v6 & 1) != 0)
    {
      -[MPAVRoutingViewController _routingController](self->_routingViewController, "_routingController", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unpickTVRoutes");

      objc_msgSend(v8, "dismissPlatterViewController:completion:", self, 0);
      v5 = v8;
    }
  }

}

- (void)headerViewButtonPressed:(id)a3
{
  id v4;

  if (-[MRPlatterViewController selectedMode](self, "selectedMode", a3) != 1
    || (-[MRPlatterViewController supportedModes](self, "supportedModes") & 1) != 0)
  {
    if (-[MRPlatterViewController style](self, "style") == 3)
    {
      -[MRPlatterViewController _presentRoutingViewControllerFromCoverSheet](self, "_presentRoutingViewControllerFromCoverSheet");
    }
    else if (-[MRPlatterViewController _canToggleRoutingPicker](self, "_canToggleRoutingPicker"))
    {
      -[MRPlatterViewController _setRoutingPickerVisible:animated:](self, "_setRoutingPickerVisible:animated:", -[MRPlatterViewController selectedMode](self, "selectedMode") == 0, 1);
    }
  }
  else
  {
    -[MRPlatterViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "dismissPlatterViewController:completion:", self, 0);

  }
}

- (BOOL)_canToggleRoutingPicker
{
  if (self->_style != 3 && (-[MRPlatterViewController supportedModes](self, "supportedModes") & 2) != 0)
    return -[MRPlatterViewController supportedModes](self, "supportedModes") & 1;
  else
    return 0;
}

- (void)_setRoutingPickerVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;

  v4 = a4;
  -[MRPlatterViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (v4)
  {
    v8 = 0.25;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "platterViewController:willToggleRoutingPicker:", self, -[MRPlatterViewController selectedMode](self, "selectedMode") != 1);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__MRPlatterViewController__setRoutingPickerVisible_animated___block_invoke;
  v9[3] = &unk_1E581B2B0;
  v10 = a3;
  v9[4] = self;
  v11 = v4;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v9, v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "platterViewController:didToggleRoutingPicker:", self, -[MRPlatterViewController selectedMode](self, "selectedMode") == 1);

}

uint64_t __61__MRPlatterViewController__setRoutingPickerVisible_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 41) != 0;
  if (v2)
  {
    objc_msgSend(v3, "setSelectedMode:animated:", 1, v4);
    +[MediaControlsAnalytics postAnalyticKind:](MediaControlsAnalytics, "postAnalyticKind:", 5);
  }
  else
  {
    objc_msgSend(v3, "setSelectedMode:animated:", 0, v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyle");
}

- (void)_presentRoutingViewControllerFromCoverSheet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  MPMediaControls *v8;
  MPMediaControls *mediaControls;
  _QWORD v10[5];

  v3 = objc_alloc_init(MEMORY[0x1E0CC23D8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingAppBundleID:", v5);

  if (MRAVOutputContextGetSharedAudioPresentationContext())
    v6 = (void *)MRAVOutputContextCopyUniqueIdentifier();
  else
    v6 = 0;
  objc_msgSend(v3, "setRoutingContextUID:", v6);
  if (MSVDeviceOSIsInternalInstall()
    && -[MRPlatterViewController lockScreenPresentsOverrideRoutePicker](self, "lockScreenPresentsOverrideRoutePicker"))
  {
    v7 = -[MRPlatterViewController lockScreenInternalRoutePickerOverrideWithDefaultStyle:](self, "lockScreenInternalRoutePickerOverrideWithDefaultStyle:", 2);
  }
  else
  {
    v7 = 2;
  }
  objc_msgSend(v3, "setStyle:", v7);
  objc_msgSend(v3, "setShouldPreventAutorotation:", 1);
  objc_msgSend(v3, "setAllowsNowPlayingApplicationLaunch:", 1);
  v8 = (MPMediaControls *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23D0]), "initWithConfiguration:", v3);
  mediaControls = self->_mediaControls;
  self->_mediaControls = v8;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__MRPlatterViewController__presentRoutingViewControllerFromCoverSheet__block_invoke;
  v10[3] = &unk_1E5818C88;
  v10[4] = self;
  -[MPMediaControls setDismissHandler:](self->_mediaControls, "setDismissHandler:", v10);
  -[MPMediaControls present](self->_mediaControls, "present");

}

void __70__MRPlatterViewController__presentRoutingViewControllerFromCoverSheet__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1152);
  *(_QWORD *)(v1 + 1152) = 0;

}

- (void)headerViewLaunchNowPlayingAppButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD *v8;
  void *v9;
  MRPlatterViewController *v10;
  _QWORD v11[5];

  -[MRPlatterViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlatterViewController endpointController](self, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "allowsNowPlayingApplicationLaunch") & 1) != 0)
  {

LABEL_4:
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __70__MRPlatterViewController_headerViewLaunchNowPlayingAppButtonPressed___block_invoke;
      v11[3] = &unk_1E5818C88;
      v11[4] = self;
      v8 = v11;
      v9 = v4;
      v10 = self;
LABEL_9:
      objc_msgSend(v9, "dismissPlatterViewController:completion:", v10, v8);
      goto LABEL_10;
    }
    -[MediaControlsEndpointController launchNowPlayingApp](self->_endpointController, "launchNowPlayingApp");
    goto LABEL_10;
  }
  v7 = -[MRPlatterViewController allowsNowPlayingAppLaunch](self, "allowsNowPlayingAppLaunch");

  if (v7)
    goto LABEL_4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = v4;
    v10 = self;
    v8 = 0;
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __70__MRPlatterViewController_headerViewLaunchNowPlayingAppButtonPressed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "launchNowPlayingApp");
}

- (void)willTransitionToSize:(CGSize)a3 withCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  unint64_t style;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[7];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  style = self->_style;
  if (style <= 4 && style != 3 && (self->_lastKnownSize.width != width || self->_lastKnownSize.height != height))
  {
    self->_lastKnownSize.width = width;
    self->_lastKnownSize.height = height;
    -[MRPlatterViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClipsToBounds:", 1);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke;
    v13[3] = &unk_1E581B750;
    *(double *)&v13[5] = width;
    *(double *)&v13[6] = height;
    v13[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke_2;
    v12[3] = &unk_1E5818C88;
    v12[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);
  }

}

void __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(double *)(a1 + 40) <= 200.0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = 1;
  }
  else
  {
    v2 = *(double *)(a1 + 48);
    v3 = *(void **)(a1 + 32);
    if (v2 <= 108.0)
      v4 = 2;
    else
      v4 = 0;
  }
  objc_msgSend(v3, "setStyle:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 1);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

void __64__MRPlatterViewController_willTransitionToSize_withCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 0);
  objc_msgSend(*(id *)(a1 + 32), "nowPlayingHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearOverrideSize");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);

}

- (void)presentRatingActionSheet:(id)a3 sourceView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
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
  id v31;
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
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  unsigned int v73;
  unsigned int v74;
  _QWORD v76[4];
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  char v84;
  _QWORD v85[4];
  id v86;
  char v87;
  _QWORD v88[4];
  id v89;
  char v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "likeCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "value");

  objc_msgSend(v5, "dislikeCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "value");

  objc_msgSend(v5, "wishlistCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v11, "value");

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v13);

  objc_msgSend(v5, "likeCommand");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v73 = v10;
    v16 = v6;
    objc_msgSend(v5, "likeCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("LIKE_TRACK_DEFAULT_TITLE"), &stru_1E581FBA8, CFSTR("MediaControls"));
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageNamed:inBundle:", CFSTR("CC-Action-Star"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0DC3448];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_2;
    v88[3] = &unk_1E581B7B8;
    v89 = v5;
    v90 = v8;
    objc_msgSend(v25, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v20, v24, 0, v88, &__block_literal_global_137);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_setChecked:", v8);
    objc_msgSend(v12, "addAction:", v26);

    v6 = v16;
    v10 = v73;
  }
  objc_msgSend(v5, "dislikeCommand");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v5, "dislikeCommand");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("DISLIKE_TRACK_DEFAULT_TITLE"), &stru_1E581FBA8, CFSTR("MediaControls"));
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    v33 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageNamed:inBundle:", CFSTR("CC-Action-X"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0DC3448];
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_4;
    v85[3] = &unk_1E581B7B8;
    v86 = v5;
    v87 = v10;
    objc_msgSend(v36, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v31, v35, 0, v85, &__block_literal_global_142);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_setChecked:", v10);
    objc_msgSend(v12, "addAction:", v37);

  }
  objc_msgSend(v5, "wishlistCommand");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v5, "likeCommand");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {

    }
    else
    {
      objc_msgSend(v5, "dislikeCommand");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
LABEL_16:
        objc_msgSend(v5, "wishlistCommand");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedTitle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v42)
        {
          v44 = v42;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("BOOKMARK_TRACK_DEFAULT_TITLE"), &stru_1E581FBA8, CFSTR("MediaControls"));
          v44 = (id)objc_claimAutoreleasedReturnValue();

        }
        v46 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "imageNamed:inBundle:", CFSTR("CC-Action-Plus"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x1E0DC3448];
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_6;
        v82[3] = &unk_1E581B7B8;
        v83 = v5;
        v84 = v74;
        objc_msgSend(v49, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v44, v48, 0, v82, &__block_literal_global_147);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "_setChecked:", v74);
        objc_msgSend(v12, "addAction:", v50);

        goto LABEL_20;
      }
    }
    objc_msgSend(v12, "_addSectionDelimiter");
    goto LABEL_16;
  }
LABEL_20:
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v12, "actions");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v79 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "_setTitleTextColor:", v57);

        objc_msgSend(v56, "_setTitleTextAlignment:", 4);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    }
    while (v53);
  }

  v58 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E581FBA8, CFSTR("MediaControls"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_8;
  v76[3] = &unk_1E581B860;
  v77 = v12;
  v61 = v12;
  objc_msgSend(v58, "actionWithTitle:style:handler:", v60, 1, v76);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "addAction:", v62);
  objc_msgSend(v61, "popoverPresentationController");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setSourceView:", v6);

  objc_msgSend(v6, "bounds");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  objc_msgSend(v61, "popoverPresentationController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setSourceRect:", v65, v67, v69, v71);

  -[MRPlatterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v61, 1, 0);
}

id __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v2 = a2;
  v3 = objc_msgSend(v2, "userInterfaceStyle");
  v4 = objc_msgSend(v2, "accessibilityContrast");

  if (v3 == 2)
  {
    v5 = 0.980392157;
    if (v4 == 1)
    {
      v6 = 0.345098039;
      v7 = 0.415686275;
    }
    else
    {
      v6 = 0.176470588;
      v7 = 0.282352941;
    }
  }
  else if (v4 == 1)
  {
    v5 = 0.839215686;
    v7 = 0.0901960784;
    v6 = 0.0;
  }
  else
  {
    v5 = 0.980392157;
    v6 = 0.137254902;
    v7 = 0.231372549;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v5, v6, v7, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(*(id *)(a1 + 32), "likeCommand");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeValue:", *(_BYTE *)(a1 + 40) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRequest:completion:", v3, 0);

}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_3()
{
  return 1;
}

void __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(*(id *)(a1 + 32), "dislikeCommand");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeValue:", *(_BYTE *)(a1 + 40) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRequest:completion:", v3, 0);

}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_5()
{
  return 1;
}

void __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D4B358];
  objc_msgSend(*(id *)(a1 + 32), "wishlistCommand");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeValue:", *(_BYTE *)(a1 + 40) == 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performRequest:completion:", v3, 0);

}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_7()
{
  return 1;
}

uint64_t __63__MRPlatterViewController_presentRatingActionSheet_sourceView___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)shouldShowTVRemoteButton
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MRPlatterViewController _tvMediaRemoteIdentifier](self, "_tvMediaRemoteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[MRPlatterViewController _tvAirplayIdentifier](self, "_tvAirplayIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)presentTVRemote
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id WeakRetained;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  void *v34;
  id v35;

  -[MRPlatterViewController _tvMediaRemoteIdentifier](self, "_tvMediaRemoteIdentifier");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v3 = 0;
  }
  else
  {
    -[MRPlatterViewController _tvAirplayIdentifier](self, "_tvAirplayIdentifier");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v3 = 1;
  }
  -[MRPlatterViewController _route](self, "_route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTVRoute");

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  if (-[MRPlatterViewController style](self, "style") == 3)
  {
    v7 = 6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.siri"));

    if ((v11 & 1) != 0)
    {
      v7 = 7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.home"));

      if (v15)
        v7 = 3;
      else
        v7 = 8;
    }
  }
  if (v35)
  {
    if (-[MRPlatterViewController _shouldUseViewServiceToPresentTVRemote](self, "_shouldUseViewServiceToPresentTVRemote"))
    {
      WeakRetained = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1FC8]), "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:", v35, v3, v6, v7, 0);
      objc_msgSend(MEMORY[0x1E0DB1FD0], "sharedInstance");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "presentWithContext:", WeakRetained);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = objc_alloc_init(MEMORY[0x1E0DB1FC0]);
      objc_msgSend(v17, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:", v35, v3, v6, 5);
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setClipsToBounds:", 1);

      objc_msgSend(v17, "setModalPresentationStyle:", 4);
      objc_msgSend(v17, "setTransitioningDelegate:", self->_transitioningDelegate);
      objc_msgSend(v17, "presentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "platterViewController:presentingViewForPresentedViewController:", self, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPresentingView:", v20);

      }
      -[MRPlatterViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlatterViewController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "center");
      v25 = v24;
      v27 = v26;
      -[MRPlatterViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "window");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "convertPoint:toView:", v29, v25, v27);
      objc_msgSend(v19, "setSourcePoint:");

      -[MRPlatterViewController traitCollection](self, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "userInterfaceIdiom");

      if (v31 == 1)
      {
        CCUIExpandedModuleEdgeInsets();
        objc_msgSend(v19, "setEdgeInsets:");
        CCUIExpandedModuleContinuousCornerRadius();
        v33 = v32;
        objc_msgSend(v17, "view");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "_setContinuousCornerRadius:", v33);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "platterViewController:homeGestureDismisalAllowedDidChange:", self, 1);
      -[MRPlatterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

    }
  }

}

- (void)_platterViewControllerReceivedInteraction:(id)a3
{
  void *v4;
  MRPlatterViewController *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MRPlatterViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "platterViewController:didReceiveInteractionEvent:", self, v7);
  v5 = self;
  -[MRPlatterViewController delegate](v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "mediaControlsPanelViewController:didReceiveInteractionEvent:", v5, v7);

}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  void *v5;
  int v6;

  objc_msgSend(a4, "actionIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CC1D18]);

  if (v6)
    -[MRPlatterViewController _showShareAudioViewController](self, "_showShareAudioViewController");
}

- (void)routingViewController:(id)a3 didPickRoute:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "platterViewController:didPickRoute:", self, v6);

}

- (UIEdgeInsets)contentInsetsForRoutingViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 10.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)routingViewController:(id)a3 willDisplayCell:(id)a4
{
  MTVisualStylingProvider *visualStylingProvider;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  visualStylingProvider = self->_visualStylingProvider;
  v6 = a4;
  -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTVisualStylingProvider _visualStylingForStyle:](self->_visualStylingProvider, "_visualStylingForStyle:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEnabled");
  objc_msgSend(v6, "titleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 == 0;
  if (v10)
    v13 = v19;
  else
    v13 = v8;
  if (v12)
    v14 = v8;
  else
    v14 = v7;
  objc_msgSend(v11, "mt_replaceVisualStyling:", v13);

  objc_msgSend(v6, "subtitleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mt_replaceVisualStyling:", v14);

  objc_msgSend(v6, "iconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mt_replaceVisualStyling:", v13);

  objc_msgSend(v6, "separatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "mt_replaceVisualStyling:", v9);

  objc_msgSend(v6, "volumeSlider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "setMinimumTrackVisualProvider:", self->_visualStylingProvider);
    objc_msgSend(v18, "setMaximumTrackVisualProvider:", self->_visualStylingProvider);
  }

}

- (void)routingViewController:(id)a3 willDisplayHeaderView:(id)a4
{
  MTVisualStylingProvider *visualStylingProvider;
  id v5;
  void *v6;
  id v7;

  visualStylingProvider = self->_visualStylingProvider;
  v5 = a4;
  -[MTVisualStylingProvider _visualStylingForStyle:](visualStylingProvider, "_visualStylingForStyle:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mt_replaceVisualStyling:", v7);
}

- (void)setRoutingViewController:(id)a3
{
  MPAVRoutingViewController *v5;
  MPAVRoutingViewController **p_routingViewController;
  MPAVRoutingViewController *routingViewController;
  MPAVRoutingViewController *v8;
  void *v9;
  void *v10;
  MPAVRoutingViewController *v11;

  v5 = (MPAVRoutingViewController *)a3;
  p_routingViewController = &self->_routingViewController;
  routingViewController = self->_routingViewController;
  if (routingViewController != v5)
  {
    v11 = v5;
    v8 = routingViewController;
    objc_storeStrong((id *)&self->_routingViewController, a3);
    -[MPAVRoutingViewController setDelegate:](*p_routingViewController, "setDelegate:", self);
    -[MPAVRoutingViewController setThemeDelegate:](*p_routingViewController, "setThemeDelegate:", self);
    -[MPAVRoutingViewController setGroupSliderCoordinator:](*p_routingViewController, "setGroupSliderCoordinator:", self->_groupSliderCoordinator);
    if (-[MRPlatterViewController isViewLoaded](self, "isViewLoaded"))
    {
      if (-[MRPlatterViewController isOnScreen](self, "isOnScreen"))
        -[MPAVRoutingViewController beginAppearanceTransition:animated:](*p_routingViewController, "beginAppearanceTransition:animated:", 1, 0);
      -[MPAVRoutingViewController beginAppearanceTransition:animated:](v8, "beginAppearanceTransition:animated:", 0, 0);
      -[MPAVRoutingViewController view](*p_routingViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlatterViewController parentContainerView](self, "parentContainerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRoutingView:", v9);

      if (-[MRPlatterViewController isOnScreen](self, "isOnScreen"))
        -[MPAVRoutingViewController endAppearanceTransition](*p_routingViewController, "endAppearanceTransition");
      -[MPAVRoutingViewController endAppearanceTransition](v8, "endAppearanceTransition");
    }

    v5 = v11;
  }

}

- (BOOL)shouldEnableSyncingForSlider:(id)a3
{
  void *v4;
  BOOL v5;

  -[MPVolumeGroupSliderCoordinator individualVolumeSliders](self->_groupSliderCoordinator, "individualVolumeSliders", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") >= 2
    && -[MRPlatterViewController selectedMode](self, "selectedMode") == 1;

  return v5;
}

- (BOOL)slider:(id)a3 syncStateWillChangeFromState:(int64_t)a4 toState:(int64_t)a5
{
  id v8;
  MPVolumeGroupSliderCoordinator *groupSliderCoordinator;

  v8 = a3;
  if (a5 == 4)
  {
    if (a4 == 2)
    {
      groupSliderCoordinator = self->_groupSliderCoordinator;
      LOBYTE(self) = 1;
      -[MPVolumeGroupSliderCoordinator syncSliders:](groupSliderCoordinator, "syncSliders:", 1);
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(self) = 1;
    goto LABEL_7;
  }
  if (a5 != 1)
    goto LABEL_6;
  LODWORD(self) = -[MPVolumeGroupSliderCoordinator synced](self->_groupSliderCoordinator, "synced") ^ 1;
LABEL_7:

  return (char)self;
}

- (BOOL)slider:(id)a3 shouldCancelSnapWithTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v5 = a4;
  -[MRPlatterViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[MRPlatterViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v11, "pointInside:withEvent:", 0, v8, v10) ^ 1;

  return (char)v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_updateRoutingCornerView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (-[MediaControlsEndpointController isRoutingToWireless](self->_endpointController, "isRoutingToWireless"))
    v3 = 1;
  else
    v3 = -[MediaControlsEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute") ^ 1;
  -[MRPlatterViewController routingCornerView](self, "routingCornerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRouting:", v3);

  if (-[MediaControlsEndpointController isRoutingToWireless](self->_endpointController, "isRoutingToWireless"))
    v5 = 1;
  else
    v5 = -[MediaControlsEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute") ^ 1;
  -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRouting:", v5);

  if (-[MediaControlsEndpointController hasAvailableRoutes](self->_endpointController, "hasAvailableRoutes"))
    v7 = 1;
  else
    v7 = -[MediaControlsEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute") ^ 1;
  -[MRPlatterViewController routingCornerView](self, "routingCornerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRoutesAvailable:", v7);

}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
  void *v4;
  id routingCornerViewTappedBlock;

  if (self->_routingCornerViewTappedBlock != a3)
  {
    v4 = _Block_copy(a3);
    routingCornerViewTappedBlock = self->_routingCornerViewTappedBlock;
    self->_routingCornerViewTappedBlock = v4;

  }
}

- (void)_updateRoutingIndicators
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
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
  _QWORD v17[5];

  -[MRPlatterViewController endpointController](self, "endpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[MRPlatterViewController endpointController](self, "endpointController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  -[MRPlatterViewController endpointController](self, "endpointController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isAppleTVRoute") & 1) != 0
    || (objc_msgSend(v9, "isTVRoute") & 1) != 0
    || objc_msgSend(v9, "containsDeviceWithSubtype:", 18))
  {
    -[MRPlatterViewController routingCornerView](self, "routingCornerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceType:", 2);

    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "routingButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 2;
  }
  else
  {
    if (v5)
    {
      -[MRPlatterViewController endpointController](self, "endpointController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51__MRPlatterViewController__updateRoutingIndicators__block_invoke;
      v17[3] = &unk_1E581AA88;
      v17[4] = self;
      objc_msgSend(v15, "representsLongFormVideoContentWithCompletion:", v17);

      goto LABEL_9;
    }
    -[MRPlatterViewController routingCornerView](self, "routingCornerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDeviceType:", 1);

    -[MRPlatterViewController nowPlayingHeaderView](self, "nowPlayingHeaderView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "routingButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  objc_msgSend(v12, "setDeviceType:", v14);

LABEL_9:
}

void __51__MRPlatterViewController__updateRoutingIndicators__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "routingCornerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    objc_msgSend(v4, "setDeviceType:", 2);

    objc_msgSend(*(id *)(a1 + 32), "nowPlayingHeaderView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 2;
  }
  else
  {
    objc_msgSend(v4, "setDeviceType:", 1);

    objc_msgSend(*(id *)(a1 + 32), "nowPlayingHeaderView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "routingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  objc_msgSend(v6, "setDeviceType:", v8);

}

- (void)_routingCornerViewReceivedTap:(id)a3
{
  void (**routingCornerViewTappedBlock)(id, SEL, id);
  dispatch_time_t v5;
  _QWORD block[5];

  routingCornerViewTappedBlock = (void (**)(id, SEL, id))self->_routingCornerViewTappedBlock;
  if (routingCornerViewTappedBlock)
  {
    routingCornerViewTappedBlock[2](routingCornerViewTappedBlock, a2, a3);
    v5 = dispatch_time(0, 480000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MRPlatterViewController__routingCornerViewReceivedTap___block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __57__MRPlatterViewController__routingCornerViewReceivedTap___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "style");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_setRoutingPickerVisible:animated:", 1, 1);
  return result;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  MRPlatterViewController *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__MRPlatterViewController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  v8[3] = &unk_1E5818CB0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __76__MRPlatterViewController_layoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "elements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "elements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "setDisplayElements:", v4);
}

- (BOOL)lockScreenPresentsOverrideRoutePicker
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Music"));
  objc_msgSend(v2, "stringForKey:", CFSTR("LockScreenRoutingStyleOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) ^ 1;

  return v4;
}

- (int64_t)lockScreenInternalRoutePickerOverrideWithDefaultStyle:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Music"));
  objc_msgSend(v4, "stringForKey:", CFSTR("LockScreenRoutingStyleOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Default")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ControlCenter")) & 1) != 0)
    {
      a3 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SingleSelect")) & 1) != 0)
    {
      a3 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MultiSelect")) & 1) != 0)
    {
      a3 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SharedQueue")) & 1) != 0)
    {
      a3 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("VideoPicker")) & 1) != 0)
    {
      a3 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LocalTransportControls")) & 1) != 0)
    {
      a3 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("AirPlayBluePill")) & 1) != 0)
    {
      a3 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MediumConfidenceVideoPicker")) & 1) != 0)
    {
      a3 = 7;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("UpNextControls")))
    {
      a3 = 8;
    }
  }

  return a3;
}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("_obj");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v19[1] = CFSTR("onScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRPlatterViewController isOnScreen](self, "isOnScreen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  v19[2] = CFSTR("route");
  -[MRPlatterViewController route](self, "route");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("<NONE>");
  v20[2] = v7;
  v19[3] = CFSTR("name");
  -[MRPlatterViewController routeName](self, "routeName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("<NONE>");
  v20[3] = v10;
  v19[4] = CFSTR("routingViewController");
  -[MRPlatterViewController routingViewController](self, "routingViewController");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("<NONE>");
  v20[4] = v13;
  v19[5] = CFSTR("endpointController");
  -[MRPlatterViewController endpointController](self, "endpointController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("<NONE>");
  v20[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (MPAVRoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (MRPlatterViewControllerDelegate)delegate
{
  return (MRPlatterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)allowsNowPlayingAppLaunch
{
  return self->_allowsNowPlayingAppLaunch;
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (int64_t)style
{
  return self->_style;
}

- (double)_continuousCornerRadius
{
  return self->__continuousCornerRadius;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (NSString)placeholderDeviceIdentifier
{
  return self->_placeholderDeviceIdentifier;
}

- (void)setPlaceholderDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderDeviceIdentifier, a3);
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (MRMediaControlsVideoPickerFooterView)videoPickerFooterView
{
  return self->_videoPickerFooterView;
}

- (void)setVideoPickerFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_videoPickerFooterView, a3);
}

- (MRMediaControlsVideoPickerHeaderView)videoPickerHeaderView
{
  return self->_videoPickerHeaderView;
}

- (void)setVideoPickerHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_videoPickerHeaderView, a3);
}

- (MediaControlsRoutingCornerView)routingCornerView
{
  return self->_routingCornerView;
}

- (void)setRoutingCornerView:(id)a3
{
  objc_storeStrong((id *)&self->_routingCornerView, a3);
}

- (MediaControlsParentContainerView)parentContainerView
{
  return self->_parentContainerView;
}

- (void)setParentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_parentContainerView, a3);
}

- (MediaControlsVolumeContainerView)volumeContainerView
{
  return self->_volumeContainerView;
}

- (void)setVolumeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_volumeContainerView, a3);
}

- (NSMutableArray)secondaryStringComponents
{
  return self->_secondaryStringComponents;
}

- (void)setSecondaryStringComponents:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStringComponents, a3);
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isListeningForResponse
{
  return self->_isListeningForResponse;
}

- (void)setIsListeningForResponse:(BOOL)a3
{
  self->_isListeningForResponse = a3;
}

- (MPVolumeGroupSliderCoordinator)groupSliderCoordinator
{
  return self->_groupSliderCoordinator;
}

- (void)setGroupSliderCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_groupSliderCoordinator, a3);
}

- (MPAVEndpointRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (CGSize)lastKnownSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastKnownSize.width;
  height = self->_lastKnownSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastKnownSize:(CGSize)a3
{
  self->_lastKnownSize = a3;
}

- (MediaControlsTransitioningDelegate)transitioningDelegate
{
  return self->_transitioningDelegate;
}

- (void)setTransitioningDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningDelegate, a3);
}

- (MediaControlsLanguageOptionsViewController)languageOptionsViewController
{
  return (MediaControlsLanguageOptionsViewController *)objc_loadWeakRetained((id *)&self->_languageOptionsViewController);
}

- (void)setLanguageOptionsViewController:(id)a3
{
  objc_storeWeak((id *)&self->_languageOptionsViewController, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControls, a3);
}

- (void)setShareAudioViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shareAudioViewController, a3);
}

- (FBSDisplayLayoutMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (NSArray)displayElements
{
  return self->_displayElements;
}

- (NSString)explicitString
{
  return self->_explicitString;
}

- (void)setExplicitString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (BOOL)failedToLoadArtwork
{
  return self->_failedToLoadArtwork;
}

- (void)setFailedToLoadArtwork:(BOOL)a3
{
  self->_failedToLoadArtwork = a3;
}

- (int64_t)failedArtworkRetryCount
{
  return self->_failedArtworkRetryCount;
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTimer, a3);
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)supportedModes
{
  return self->_supportedModes;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (MediaControlsEndpointController)endpointController
{
  return self->_endpointController;
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (MediaControlsHeaderView)nowPlayingHeaderView
{
  return self->_nowPlayingHeaderView;
}

- (void)setNowPlayingHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingHeaderView, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_explicitString, 0);
  objc_storeStrong((id *)&self->_displayElements, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_shareAudioViewController, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_destroyWeak((id *)&self->_languageOptionsViewController);
  objc_storeStrong((id *)&self->_transitioningDelegate, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_groupSliderCoordinator, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_secondaryStringComponents, 0);
  objc_storeStrong((id *)&self->_volumeContainerView, 0);
  objc_storeStrong((id *)&self->_parentContainerView, 0);
  objc_storeStrong((id *)&self->_routingCornerView, 0);
  objc_storeStrong((id *)&self->_videoPickerHeaderView, 0);
  objc_storeStrong((id *)&self->_videoPickerFooterView, 0);
  objc_storeStrong((id *)&self->_placeholderDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_routeUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

- (uint64_t)_showShareAudioViewController
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[MediaControlsEndpointsManager getOutputDeviceIsPlaying:completion:].cold.1(v0);
}

@end
