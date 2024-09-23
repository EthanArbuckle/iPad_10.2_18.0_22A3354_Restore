@implementation MRUActivityNowPlayingViewController

- (MRUActivityNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  MRUActivityNowPlayingViewController *v4;
  MRUActivityNowPlayingViewController *v5;
  void *v6;
  MRUNowPlayingController *v7;
  MRUNowPlayingController *controller;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MRUActivityNowPlayingViewController;
  v4 = -[MRUActivityNowPlayingViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_wasPlayingDuringLastPreferredLayoutUpdate = 0;
    v4->_preferredLayoutMode = 1;
    v4->_maximumLayoutMode = 1;
    +[MRUEndpointController proactiveUserSelectedEndpointController](MRUEndpointController, "proactiveUserSelectedEndpointController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v6);
    controller = v5->_controller;
    v5->_controller = v7;

    -[MRUNowPlayingController tvRemoteController](v5->_controller, "tvRemoteController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContext:", 7);

    -[MRUNowPlayingController addObserver:](v5->_controller, "addObserver:", v5);
  }
  return v5;
}

- (void)loadView
{
  MRUActivityNowPlayingView *v3;

  v3 = objc_alloc_init(MRUActivityNowPlayingView);
  -[MRUActivityNowPlayingViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  MRUVisualStylingProvider *v3;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MRUActivityNowPlayingViewController;
  -[MRUActivityNowPlayingViewController viewDidLoad](&v22, sel_viewDidLoad);
  v3 = objc_alloc_init(MRUVisualStylingProvider);
  -[MRUActivityNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStylingProvider:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stylingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrimaryColor:", v5);

  -[MRUActivityNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_didSelectArtworkView_, 64);

  -[MRUActivityNowPlayingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "labelView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_didSelectLabelView_, 64);

  -[MRUActivityNowPlayingViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transportControlsView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didSelectLaunchNowPlaying_);
  -[MRUActivityNowPlayingViewController setLaunchNowPlayingGestureRecognizer:](self, "setLaunchNowPlayingGestureRecognizer:", v16);

  -[MRUActivityNowPlayingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityNowPlayingViewController launchNowPlayingGestureRecognizer](self, "launchNowPlayingGestureRecognizer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addGestureRecognizer:", v18);

  -[MRUActivityNowPlayingViewController createWaveformViewController](self, "createWaveformViewController");
  -[MRUActivityNowPlayingViewController createHapticViewController](self, "createHapticViewController");
  -[MRUActivityNowPlayingViewController updateEverything](self, "updateEverything");
  -[MRUActivityNowPlayingViewController registerHapticObserver](self, "registerHapticObserver");
  -[MRUActivityNowPlayingViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transportControlsView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_didTapTransportButton_, 64);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MRUActivityNowPlayingViewController;
  v7 = a4;
  -[MRUActivityNowPlayingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__MRUActivityNowPlayingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5819C40;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_37);

}

void __90__MRUActivityNowPlayingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didSelectArtworkView:(id)a3
{
  id v3;

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchNowPlayingApp");

}

- (void)didSelectLabelView:(id)a3
{
  id v3;

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchNowPlayingApp");

}

- (void)didSelectLaunchNowPlaying:(id)a3
{
  id v3;

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchNowPlayingApp");

}

- (void)didTapTransportButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[MRUActivityNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transportControlsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUActivityNowPlayingViewController setLastLeftButtonTapDate:](self, "setLastLeftButtonTapDate:", v8);

  }
}

- (NSURL)launchURL
{
  const __CFString *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB34D0], "mru_isMusicBundleIdentifier:", self->_associatedAppBundleIdentifier) & 1) != 0)
  {
    v3 = CFSTR("music://show-now-playing");
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x1E0CB34D0], "mru_isPodcastsBundleIdentifier:", self->_associatedAppBundleIdentifier))
    {
      v4 = 0;
      return (NSURL *)v4;
    }
    v3 = CFSTR("podcasts://nowPlaying");
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSURL *)v4;
}

- (void)updateLayoutModesPreferringImmediateTransition:(BOOL)a3 deferInCustomLayout:(BOOL)a4 reason:(id)a5
{
  _BOOL4 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  int64_t preferredLayoutMode;
  int v17;
  int64_t v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int64_t v28;
  NSObject *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v43 = a4;
  v5 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v44 = a5;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v44;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] updateLayoutModes for %@", buf, 0xCu);
  }

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nowPlayingInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPlaying");

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nowPlayingInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != 0;

  }
  else
  {
    v15 = 0;
  }
  preferredLayoutMode = self->_preferredLayoutMode;
  v17 = v10 & v15;
  if ((v10 & v15) != 0)
    v18 = 3;
  else
    v18 = 1;
  -[MRUActivityNowPlayingViewController inactiveTransitionTimer](self, "inactiveTransitionTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = self->_activeLayoutMode == 4;

    if (((v20 | v17) & 1) != 0)
    {
      MCLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AA991000, v21, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] Cancel transition timer.", buf, 2u);
      }

      -[MRUActivityNowPlayingViewController inactiveTransitionTimer](self, "inactiveTransitionTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "invalidate");

      -[MRUActivityNowPlayingViewController setInactiveTransitionTimer:](self, "setInactiveTransitionTimer:", 0);
    }
  }
  v23 = 0;
  if (self->_wasPlayingDuringLastPreferredLayoutUpdate && (v10 & 1) == 0)
    v23 = self->_activeLayoutMode == 1;
  self->_wasPlayingDuringLastPreferredLayoutUpdate = v10;
  if (preferredLayoutMode != v18 || v5)
  {
    if (((!v15 || v5 || v23) | v10) == 1)
    {
      -[MRUActivityNowPlayingViewController inactiveTransitionTimer](self, "inactiveTransitionTimer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "invalidate");

      -[MRUActivityNowPlayingViewController setInactiveTransitionTimer:](self, "setInactiveTransitionTimer:", 0);
      MCLogCategoryDefault();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        SBUISystemApertureLayoutModeDescription();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        SBUISystemApertureLayoutModeDescription();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v26;
        v50 = 2112;
        v51 = v27;
        _os_log_impl(&dword_1AA991000, v25, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] Updating preferred layout from %@ to %@.", buf, 0x16u);

      }
      self->_preferredLayoutMode = v18;
      v28 = 4;
      if ((v17 & 1) == 0)
        v28 = 1;
      self->_maximumLayoutMode = v28;
      if (v5)
      {
        if (v43 && self->_activeLayoutMode == 4)
        {
          MCLogCategoryDefault();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AA991000, v29, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] Defer immediate transition for custom layout.", buf, 2u);
          }
          goto LABEL_30;
        }
        MCLogCategoryDefault();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          SBUISystemApertureLayoutModeDescription();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v42;
          _os_log_impl(&dword_1AA991000, v39, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] requestTransitionToPreferredLayoutMode %@", buf, 0xCu);

        }
      }
      else
      {
        if (self->_activeLayoutMode == 4)
          goto LABEL_19;
        MCLogCategoryDefault();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          SBUISystemApertureLayoutModeDescription();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v40;
          _os_log_impl(&dword_1AA991000, v39, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] requestTransitionToPreferredLayoutMode %@", buf, 0xCu);

        }
      }

      -[MRUActivityNowPlayingViewController systemApertureElementContext](self, "systemApertureElementContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "requestTransitionToPreferredLayoutMode");

      goto LABEL_19;
    }
    if (!v43 || self->_activeLayoutMode != 4)
    {
      -[MRUActivityNowPlayingViewController inactiveTransitionTimer](self, "inactiveTransitionTimer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (v31)
      {
        MCLogCategoryDefault();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AA991000, v32, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] Defer update layouts.", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v33 = (void *)MEMORY[0x1E0D4D110];
        objc_msgSend(MEMORY[0x1E0D4C638], "currentSettings");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "quickControlsInactiveTimeout");
        v36 = v35;
        v37 = MEMORY[0x1E0C80D38];
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __113__MRUActivityNowPlayingViewController_updateLayoutModesPreferringImmediateTransition_deferInCustomLayout_reason___block_invoke;
        v46[3] = &unk_1E5818E18;
        objc_copyWeak(&v47, (id *)buf);
        objc_msgSend(v33, "timerWithInterval:repeats:queue:block:", 0, MEMORY[0x1E0C80D38], v46, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRUActivityNowPlayingViewController setInactiveTransitionTimer:](self, "setInactiveTransitionTimer:", v38);

        objc_destroyWeak(&v47);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_19;
    }
    MCLogCategoryDefault();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AA991000, v29, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] Skip update for custom layout.", buf, 2u);
    }
LABEL_30:

  }
LABEL_19:

}

void __113__MRUActivityNowPlayingViewController_updateLayoutModesPreferringImmediateTransition_deferInCustomLayout_reason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:", 1, 1, CFSTR("inactiveTransitionTimer"));

}

- (void)setActiveLayoutMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_activeLayoutMode != a3)
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      SBUISystemApertureLayoutModeDescription();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SBUISystemApertureLayoutModeDescription();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] setActiveLayoutMode from %@ to %@", (uint8_t *)&v9, 0x16u);

    }
    self->_activeLayoutMode = a3;
    -[MRUActivityNowPlayingViewController updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:](self, "updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:", 0, 1, CFSTR("setActiveLayoutMode"));
    -[MRUActivityNowPlayingViewController controller](self, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateAutomaticResponseLoading");

    -[MRUActivityNowPlayingViewController updateEverything](self, "updateEverything");
  }
}

- (int64_t)contentRole
{
  return 2;
}

- (NSString)elementIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E0DAC970];
}

- (double)preferredHeightForBottomSafeArea
{
  void *v2;
  double v3;
  double v4;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHeightForBottomSafeArea");
  v4 = v3;

  return v4;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  void *v2;
  void *v3;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  void *v2;
  void *v3;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trailingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  void *v2;
  void *v3;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  void *v2;
  void *v3;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detachedMinimalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (unint64_t)presentationBehaviors
{
  if (MRUseInternalUI())
    return 24;
  else
    return 9;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0AE0], 0);
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_activeLayoutMode < 5uLL;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  -[MRUActivityNowPlayingViewController updateBundleID](self, "updateBundleID", a3, a4, a5);
  -[MRUActivityNowPlayingViewController updateRouteLabel](self, "updateRouteLabel");
  -[MRUActivityNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRUActivityNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUActivityNowPlayingViewController updateWaveformVisibility](self, "updateWaveformVisibility");
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeBundleID:(id)a5
{
  -[MRUActivityNowPlayingViewController updateBundleID](self, "updateBundleID", a3, a4, a5);
  -[MRUActivityNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  void *v5;

  -[MRUNowPlayingController tvRemoteController](self->_controller, "tvRemoteController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentTVRemoteUsingApp:", 1);

  -[MRUActivityNowPlayingViewController updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:](self, "updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:", 1, 0, CFSTR("didSelectTVRemoteButton"));
}

- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MPMediaControls *v12;
  MPMediaControls *mediaControls;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CC23D8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentingAppBundleID:", v10);

  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    v11 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    objc_msgSend(v8, "setRoutingContextUID:", v11);

  }
  objc_initWeak(&location, self);
  v12 = (MPMediaControls *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23D0]), "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", v8, 0);
  mediaControls = self->_mediaControls;
  self->_mediaControls = v12;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__MRUActivityNowPlayingViewController_transportControlsView_didSelectRoutingButton___block_invoke;
  v16[3] = &unk_1E5818E18;
  objc_copyWeak(&v17, &location);
  -[MPMediaControls setDismissHandler:](self->_mediaControls, "setDismissHandler:", v16);
  MCLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] will present RoutePicker", v15, 2u);
  }

  -[MPMediaControls present](self->_mediaControls, "present");
  -[MRUActivityNowPlayingViewController updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:](self, "updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:", 1, 0, CFSTR("didSelectRoutingButton"));
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __84__MRUActivityNowPlayingViewController_transportControlsView_didSelectRoutingButton___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  MCLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] will dismiss RoutePicker", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMediaControls:", 0);

}

- (void)registerHapticObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleHapticEnabledStatusChangedNotification_, *MEMORY[0x1E0CC1C88], 0);

}

- (void)createWaveformViewController
{
  MRUWaveformController *v3;
  MRUWaveformController *waveformController;
  MRUWaveformViewController *v5;
  MRUWaveformViewController *waveformViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MRUWaveformController);
  waveformController = self->_waveformController;
  self->_waveformController = v3;

  v5 = -[MRUWaveformViewController initWithContext:waveformController:]([MRUWaveformViewController alloc], "initWithContext:waveformController:", 0, self->_waveformController);
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  -[MRUWaveformController setNowPlayingController:](self->_waveformController, "setNowPlayingController:", self->_controller);
  -[MRUActivityNowPlayingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artworkViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self->_waveformController);

  -[MRUActivityNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_waveformViewController);
  -[MRUWaveformViewController view](self->_waveformViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityNowPlayingViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWaveformView:", v10);

  -[MRUWaveformViewController didMoveToParentViewController:](self->_waveformViewController, "didMoveToParentViewController:", self);
}

- (void)createHapticViewController
{
  MRUHapticViewController *v3;
  MRUHapticViewController *hapticViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[MRUHapticViewController initWithContext:nowPlayingController:]([MRUHapticViewController alloc], "initWithContext:nowPlayingController:", 0, self->_controller);
  hapticViewController = self->_hapticViewController;
  self->_hapticViewController = v3;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self->_hapticViewController);

  -[MRUActivityNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_hapticViewController);
  -[MRUHapticViewController view](self->_hapticViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityNowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHapticView:", v8);

  -[MRUWaveformViewController didMoveToParentViewController:](self->_waveformViewController, "didMoveToParentViewController:", self);
}

- (void)updateEverything
{
  -[MRUActivityNowPlayingViewController updateBundleID](self, "updateBundleID");
  -[MRUActivityNowPlayingViewController updateArtwork](self, "updateArtwork");
  -[MRUActivityNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRUActivityNowPlayingViewController updateTimeControls](self, "updateTimeControls");
  -[MRUActivityNowPlayingViewController updateTransportControls](self, "updateTransportControls");
  -[MRUActivityNowPlayingViewController updateRouteLabel](self, "updateRouteLabel");
  -[MRUActivityNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRUActivityNowPlayingViewController updateLayout](self, "updateLayout");
  -[MRUActivityNowPlayingViewController updateWaveformVisibility](self, "updateWaveformVisibility");
  -[MRUActivityNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
}

- (void)updateBundleID
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  __CFString *obj;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  obj = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (MRMediaRemoteApplicationIsSystemMediaApplication())
  {
    v4 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
LABEL_5:
    v5 = obj;
    obj = (__CFString *)v4;
LABEL_6:

    goto LABEL_7;
  }
  if (MRMediaRemoteApplicationIsSystemPodcastApplication())
  {
    v4 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    goto LABEL_5;
  }
  if (obj)
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isDeviceSystemRoute") & 1) != 0)
      goto LABEL_6;
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAirPlaying");

    if ((v11 & 1) == 0)
    {
      v5 = obj;
      obj = &stru_1E581FBA8;
      goto LABEL_6;
    }
  }
  else
  {
    obj = 0;
  }
LABEL_7:
  v6 = self->_associatedAppBundleIdentifier;
  if (v6 == (NSString *)obj)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSString isEqual:](v6, "isEqual:", obj);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, obj);
      -[MRUActivityNowPlayingViewController systemApertureElementContext](self, "systemApertureElementContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setElementNeedsUpdate");

      -[MRUActivityNowPlayingViewController updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:](self, "updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:", 1, 1, CFSTR("updateBundleID"));
    }
  }

}

- (int64_t)artworkTransitionDirection
{
  void *v3;
  double v4;
  int64_t v5;

  if (!self->_lastLeftButtonTapDate)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastLeftButtonTapDate);
  v5 = v4 < 3.0;

  return v5;
}

- (void)updateArtwork
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[MRUActivityNowPlayingViewController artworkTransitionDirection](self, "artworkTransitionDirection");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[MRUActivityNowPlayingViewController view](self, "view", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setArtwork:transitionDirection:", v4, v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[MRUActivityNowPlayingViewController setLastLeftButtonTapDate:](self, "setLastLeftButtonTapDate:", 0);
}

- (void)updateNowPlayingInfo
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
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUActivityNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUActivityNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUActivityNowPlayingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "route");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRoute:", v13);

  objc_msgSend(v4, "stringForComponents:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v14);

  objc_msgSend(v4, "stringForComponents:", 122);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v15);

  objc_msgSend(v4, "placeholder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholder:", v16);

  objc_msgSend(v7, "setShowPlaceholder:", objc_msgSend(v4, "showPlaceholder"));
  objc_msgSend(v4, "stringForComponents:", 59);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v17);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v22);
        objc_msgSend(v23, "setPlaying:", objc_msgSend(v4, "isPlaying", (_QWORD)v25));
        objc_msgSend(v4, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setItemIdentifier:", v24);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  -[MRUActivityNowPlayingViewController updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:](self, "updateLayoutModesPreferringImmediateTransition:deferInCustomLayout:reason:", 0, 1, CFSTR("updateNowPlayingInfo"));
}

- (void)updateTimeControls
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeControls");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUActivityNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTimeControls:", v6);
}

- (void)updateTransportControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControls");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUActivityNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransportControls:", v7);
  -[MRUNowPlayingController tvRemoteController](self->_controller, "tvRemoteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));

}

- (void)updateRouteLabel
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
  id v14;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityNowPlayingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRoute:", v6);

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isDeviceSystemRoute"))
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAirPlaying");

  }
  else
  {
    v12 = 1;
  }

  if ((_DWORD)v12 != objc_msgSend(v14, "showRoute"))
  {
    objc_msgSend(v14, "setShowRoute:", v12);
    -[MRUActivityNowPlayingViewController systemApertureElementContext](self, "systemApertureElementContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setElementNeedsUpdate");

  }
}

- (void)updateRoutingButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  MRUNowPlayingController *controller;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MRUActivityNowPlayingViewController *v16;

  -[MRUActivityNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transportControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUActivityNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canModifyGroupMembership");

  objc_msgSend(v4, "setShowRoutingButton:", v9);
  controller = self->_controller;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__MRUActivityNowPlayingViewController_updateRoutingButton__block_invoke;
  v13[3] = &unk_1E5819D30;
  v14 = v6;
  v15 = v4;
  v16 = self;
  v11 = v4;
  v12 = v6;
  -[MRUNowPlayingController routingDeviceImage:](controller, "routingDeviceImage:", v13);

}

void __58__MRUActivityNowPlayingViewController_updateRoutingButton__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setRouteImage:", v4);
  +[MRUAsset image:](MRUAsset, "image:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "routingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsset:animated:", v6, objc_msgSend(*(id *)(a1 + 48), "isOnScreen"));

}

- (void)updateVolumeControls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  MPVolumeController *v10;
  MPVolumeController *volumeController;
  char v12;
  NSObject *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  BSInvalidatable *v20;
  BSInvalidatable *hardwareVolumeControlAssertion;
  NSObject *v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _WORD v33[17];

  *(_QWORD *)&v33[13] = *MEMORY[0x1E0C80C00];
  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPVolumeController dataSource](self->_volumeController, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_volumeController)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v4, 0);

    v10 = (MPVolumeController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2530]), "initWithDataSource:", v9);
    volumeController = self->_volumeController;
    self->_volumeController = v10;

    -[MPVolumeController setDelegate:](self->_volumeController, "setDelegate:", self);
    goto LABEL_5;
  }
  objc_msgSend(v5, "groupRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v4);

  if ((v8 & 1) == 0)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v4, 0);

    -[MPVolumeController setDataSource:](self->_volumeController, "setDataSource:", v9);
LABEL_5:
    v6 = (void *)v9;
  }
  v12 = objc_msgSend(v6, "volumeControlCapabilities");
  if (-[MRUActivityNowPlayingViewController isExpanded](self, "isExpanded")
    && (objc_msgSend(v4, "isDeviceRoute") & 1) == 0
    && (v12 & 3) != 0)
  {
    MCLogCategoryVolume();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      v15 = -[MRUActivityNowPlayingViewController isOnScreen](self, "isOnScreen");
      MRUNowPlayingContextDescription(7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544386;
      v27 = v14;
      v28 = 1024;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      v32 = 1024;
      *(_DWORD *)v33 = 1;
      v33[2] = 2114;
      *(_QWORD *)&v33[3] = v4;
      _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | context: %{public}@ | control: %{BOOL}u  | route: %{public}@", (uint8_t *)&v26, 0x2Cu);

    }
    +[MRUHardwareVolumeController sharedInstance](MRUHardwareVolumeController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestControlsForVolumeDataSource:reason:", v6, v19);
    v20 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = v20;

LABEL_16:
    goto LABEL_17;
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    MCLogCategoryVolume();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_opt_class();
      v24 = -[MRUActivityNowPlayingViewController isOnScreen](self, "isOnScreen");
      MRUNowPlayingContextDescription(7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = v23;
      v28 = 1024;
      v29 = v24;
      v30 = 2114;
      v31 = v25;
      v32 = 2114;
      *(_QWORD *)v33 = v4;
      _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | context: %{public}@ | route: %{public}@", (uint8_t *)&v26, 0x26u);

    }
    v17 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)updateLayout
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  if (self->_activeLayoutMode == 4)
    v3 = 8;
  else
    v3 = 7;
  -[MRUActivityNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStyle:", v3);

  v7 = self->_activeLayoutMode == 4;
  -[MRUActivityNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMarqueeEnabled:", v7);

  v11 = self->_activeLayoutMode == 4;
  -[MRUActivityNowPlayingViewController view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeControlsView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOnScreen:", v11);

}

- (void)updateWaveformVisibility
{
  _BOOL8 v3;
  int64_t activeLayoutMode;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = -[MRUWaveformController routeSupportsWaveform](self->_waveformController, "routeSupportsWaveform");
  activeLayoutMode = self->_activeLayoutMode;
  objc_msgSend(MEMORY[0x1E0CC1C90], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "musicHapticsEnabled"))
  {
    -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "appSupportsHaptics");

  }
  else
  {
    v7 = 0;
  }

  if (v3)
  {
    if (activeLayoutMode > 2)
      v8 = v7 ^ 1;
    else
      v8 = 0;
    if (activeLayoutMode > 2)
      v9 = v7;
    else
      v9 = 0;
    -[MRUWaveformViewController setOnScreen:](self->_waveformViewController, "setOnScreen:", v8);
  }
  else
  {
    -[MRUWaveformViewController setOnScreen:](self->_waveformViewController, "setOnScreen:", 0);
    v7 = 0;
    v9 = 0;
  }
  -[MRUHapticViewController setOnScreen:](self->_hapticViewController, "setOnScreen:", v9);
  -[MRUActivityNowPlayingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowWaveform:", v3);

  -[MRUActivityNowPlayingViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowHaptic:", v7);

  -[MRUActivityNowPlayingViewController view](self, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShowTrailingAccessoryWhenExpanded:", v3);

}

- (BOOL)isExpanded
{
  return self->_activeLayoutMode == 4;
}

- (BOOL)isOnScreen
{
  return (unint64_t)(self->_activeLayoutMode - 2) < 3;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (int64_t)maximumLayoutMode
{
  return self->_maximumLayoutMode;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControls, a3);
}

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, a3);
}

- (MRUWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformViewController, a3);
}

- (MRUHapticViewController)hapticViewController
{
  return self->_hapticViewController;
}

- (void)setHapticViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hapticViewController, a3);
}

- (MRUWaveformController)waveformController
{
  return self->_waveformController;
}

- (void)setWaveformController:(id)a3
{
  objc_storeStrong((id *)&self->_waveformController, a3);
}

- (UITapGestureRecognizer)launchNowPlayingGestureRecognizer
{
  return self->_launchNowPlayingGestureRecognizer;
}

- (void)setLaunchNowPlayingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_launchNowPlayingGestureRecognizer, a3);
}

- (MSVTimer)inactiveTransitionTimer
{
  return self->_inactiveTransitionTimer;
}

- (void)setInactiveTransitionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveTransitionTimer, a3);
}

- (BOOL)wasPlayingDuringLastPreferredLayoutUpdate
{
  return self->_wasPlayingDuringLastPreferredLayoutUpdate;
}

- (void)setWasPlayingDuringLastPreferredLayoutUpdate:(BOOL)a3
{
  self->_wasPlayingDuringLastPreferredLayoutUpdate = a3;
}

- (NSDate)lastLeftButtonTapDate
{
  return self->_lastLeftButtonTapDate;
}

- (void)setLastLeftButtonTapDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLeftButtonTapDate, a3);
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_lastLeftButtonTapDate, 0);
  objc_storeStrong((id *)&self->_inactiveTransitionTimer, 0);
  objc_storeStrong((id *)&self->_launchNowPlayingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_hapticViewController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
}

@end
