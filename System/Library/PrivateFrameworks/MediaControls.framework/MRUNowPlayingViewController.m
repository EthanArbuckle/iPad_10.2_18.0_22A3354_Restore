@implementation MRUNowPlayingViewController

- (void)trackSuggestionsDisplayed:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  MRUNowPlayingViewController *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "bundleID");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (__CFString *)v11;
        else
          v13 = CFSTR("unspecified");
        v14 = v13;

        objc_msgSend(v5, "addObject:", v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke;
  v30[3] = &unk_1E5818B10;
  v30[4] = self;
  v22 = v6;
  v31 = v22;
  +[MRUAnalytics sendEvent:withError:payload:](MRUAnalytics, "sendEvent:withError:payload:", CFSTR("com.apple.mediaremote.suggestions-displayed"), 0, v30);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke_2;
        v23[3] = &unk_1E5818B38;
        v23[4] = v20;
        v21 = v15;
        v24 = v21;
        v25 = self;
        +[MRUAnalytics sendEvent:withError:payload:](MRUAnalytics, "sendEvent:withError:payload:", CFSTR("com.apple.mediaremote.suggestion-provider-displayed"), 0, v23);

      }
      v17 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v17);
  }

}

id __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "designatedGroupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceSubtype");
  v4 = (void *)MRAVOutputDeviceSubtypeCopyDescription();

  v12[0] = CFSTR("populatedItemsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("context");
  objc_msgSend(*(id *)(a1 + 32), "contextString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v13[2] = v4;
  v12[2] = 0x1E5821028;
  v12[3] = CFSTR("isRemoteDestination");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "isLocalEndpoint") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v9[0] = v3;
  v8[0] = 0x1E5821008;
  v8[1] = CFSTR("suggestionsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "countForObject:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("context");
  objc_msgSend(*(id *)(a1 + 48), "contextString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)trackSuggestionSelected:(id)a3 atIndex:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__MRUNowPlayingViewController_Analytics__trackSuggestionSelected_atIndex_error___block_invoke;
  v10[3] = &unk_1E5818B60;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  +[MRUAnalytics sendEvent:withError:payload:](MRUAnalytics, "sendEvent:withError:payload:", CFSTR("com.apple.mediaremote.suggestion-selected"), a5, v10);

}

id __80__MRUNowPlayingViewController_Analytics__trackSuggestionSelected_atIndex_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "designatedGroupLeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceSubtype");
  v4 = (void *)MRAVOutputDeviceSubtypeCopyDescription();

  v13[0] = 0x1E5821008;
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("selectedIndex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v14[2] = v4;
  v13[2] = 0x1E5821028;
  v13[3] = CFSTR("isRemoteDestination");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "isLocalEndpoint") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  v13[4] = CFSTR("context");
  objc_msgSend(*(id *)(a1 + 32), "contextString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)contextString
{
  return (id)MRUNowPlayingContextDescription(-[MRUNowPlayingViewController context](self, "context"));
}

- (id)destination
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MRUNowPlayingViewController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MRUNowPlayingViewController)initWithController:(id)a3 routeControlsPresentation:(int64_t)a4
{
  id v7;
  MRUNowPlayingViewController *v8;
  MRUNowPlayingViewController *v9;
  MRUVisualStylingProvider *v10;
  MRUVisualStylingProvider *stylingProvider;
  MRUNowPlayingViewController *v12;
  _QWORD v14[4];
  MRUNowPlayingViewController *v15;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUNowPlayingViewController;
  v8 = -[MRUNowPlayingViewController init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_routeControlsPresentation = a4;
    objc_storeStrong((id *)&v8->_controller, a3);
    v10 = objc_alloc_init(MRUVisualStylingProvider);
    stylingProvider = v9->_stylingProvider;
    v9->_stylingProvider = v10;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke;
    v14[3] = &unk_1E58193D8;
    v12 = v9;
    v15 = v12;
    v12->_stateHandle = __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke((uint64_t)v14);
    *(_OWORD *)&v12->_contentEdgeInsets.top = MRUNowPlayingContentEdgeInsetsDefault;
    *(_OWORD *)&v12->_contentEdgeInsets.bottom = *(_OWORD *)&qword_1AAAD5BC0;
    v12->_showArtworkView = 1;

  }
  return v9;
}

uint64_t __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke_2;
  v5[3] = &unk_1E58193B0;
  objc_copyWeak(&v6, &location);
  v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke_2(uint64_t a1, uint64_t a2)
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

- (MRUNowPlayingViewController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  id v10;
  MRUEndpointController *v11;
  MRUNowPlayingController *v12;
  MRUNowPlayingViewController *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[MRUEndpointController initWithRouteUID:client:player:]([MRUEndpointController alloc], "initWithRouteUID:client:player:", v10, v9, v8);

  v12 = -[MRUNowPlayingController initWithEndpointController:]([MRUNowPlayingController alloc], "initWithEndpointController:", v11);
  v13 = -[MRUNowPlayingViewController initWithController:routeControlsPresentation:](self, "initWithController:routeControlsPresentation:", v12, 2);

  return v13;
}

- (MRUNowPlayingViewController)initWithRouteUID:(id)a3
{
  return -[MRUNowPlayingViewController initWithRouteUID:client:player:](self, "initWithRouteUID:client:player:", a3, 0, 0);
}

- (void)loadView
{
  MRUNowPlayingView *v3;

  v3 = objc_alloc_init(MRUNowPlayingView);
  -[MRUNowPlayingViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  int64_t layout;
  void *v4;
  int64_t context;
  void *v6;
  _BOOL8 supportsHorizontalLayout;
  void *v8;
  double top;
  double left;
  double bottom;
  double right;
  void *v13;
  MRUVisualStylingProvider *stylingProvider;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewDidLoad](&v31, sel_viewDidLoad);
  layout = self->_layout;
  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayout:", layout);

  context = self->_context;
  -[MRUNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContext:", context);

  supportsHorizontalLayout = self->_supportsHorizontalLayout;
  -[MRUNowPlayingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSupportsHorizontalLayout:", supportsHorizontalLayout);

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  -[MRUNowPlayingViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentEdgeInsets:", top, left, bottom, right);

  stylingProvider = self->_stylingProvider;
  -[MRUNowPlayingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStylingProvider:", stylingProvider);

  -[MRUNowPlayingViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "artworkView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_didSelectArtworkView_, 64);

  -[MRUNowPlayingViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "headerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "labelView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel_didSelectLabelView_, 64);

  -[MRUNowPlayingViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "headerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "routingButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_didSelectRoutingButton_, 64);

  -[MRUNowPlayingViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "transportControlsView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDelegate:", self);

  -[MRUNowPlayingViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "volumeControlsView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDelegate:", self);

  -[MRUNowPlayingViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "artworkView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:", self);

  -[MRUNowPlayingController addObserver:](self->_controller, "addObserver:", self);
  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:", self);

  -[MRUNowPlayingViewController createRoutingViewController](self, "createRoutingViewController");
  -[MRUNowPlayingViewController updateDimmed](self, "updateDimmed");
  -[MRUNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRUNowPlayingViewController updateRouteLabel](self, "updateRouteLabel");
  -[MRUNowPlayingViewController updateArtwork](self, "updateArtwork");
  -[MRUNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRUNowPlayingViewController updateTimeControls](self, "updateTimeControls");
  -[MRUNowPlayingViewController updateTransportControls](self, "updateTransportControls");
  -[MRUNowPlayingViewController updateQuickControl](self, "updateQuickControl");
  -[MRUNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUNowPlayingViewController updateVisibility](self, "updateVisibility");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  -[MRUNowPlayingViewController setOnScreen:](self, "setOnScreen:", 1);
  -[MRUNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showSuggestionsView");

  if (v6)
    -[MRUMediaSuggestionsViewController beginAppearanceTransition:animated:](self->_suggestionsViewController, "beginAppearanceTransition:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showSuggestionsView");

  if (v5)
    -[MRUMediaSuggestionsViewController endAppearanceTransition](self->_suggestionsViewController, "endAppearanceTransition");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  -[MRUNowPlayingViewController setOnScreen:](self, "setOnScreen:", 0);
  -[MRUNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showSuggestionsView");

  if (v6)
    -[MRUMediaSuggestionsViewController beginAppearanceTransition:animated:](self->_suggestionsViewController, "beginAppearanceTransition:animated:", 0, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showSuggestionsView");

  if (v5)
    -[MRUMediaSuggestionsViewController endAppearanceTransition](self->_suggestionsViewController, "endAppearanceTransition");
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  -[MRUNowPlayingController updateAutomaticResponseLoading](self->_controller, "updateAutomaticResponseLoading");
  v3.receiver = self;
  v3.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUNowPlayingViewController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p route: %@"), v4, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setOnScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_onScreen != a3)
  {
    v3 = a3;
    self->_onScreen = a3;
    -[MRUNowPlayingViewController controller](self, "controller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateAutomaticResponseLoading");

    -[MRUNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
    -[MRUNowPlayingViewController updateRouteLabel](self, "updateRouteLabel");
    -[MRUNowPlayingViewController updateArtwork](self, "updateArtwork");
    -[MRUNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
    -[MRUNowPlayingViewController updateTransportControls](self, "updateTransportControls");
    -[MRUNowPlayingViewController updateQuickControl](self, "updateQuickControl");
    -[MRUNowPlayingViewController updateRoutingDiscoveryMode](self, "updateRoutingDiscoveryMode");
    -[MRUNowPlayingViewController updateSuggestions](self, "updateSuggestions");
    -[MRUNowPlayingViewController trackStartedShowingMediaSuggestions](self, "trackStartedShowingMediaSuggestions");
    -[MRUNowPlayingViewController updateTimeControls](self, "updateTimeControls");
    -[MRUNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
    -[MRUNowPlayingViewController updateVisibility](self, "updateVisibility");
    if (v3)
    {
      -[MRUNowPlayingViewController controller](self, "controller");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaSuggestionsController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "refreshMediaSuggestions");

    }
  }
}

- (MRUArtworkView)artworkView
{
  void *v2;
  void *v3;

  -[MRUNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MRUArtworkView *)v3;
}

- (void)setController:(id)a3
{
  MRUNowPlayingController *v4;
  MRUNowPlayingController *controller;
  MRUNowPlayingController *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (MRUNowPlayingController *)a3;
  -[MRUNowPlayingController removeObserver:](self->_controller, "removeObserver:", self);
  controller = self->_controller;
  self->_controller = v4;
  v6 = v4;

  -[MRUNowPlayingController addObserver:](self->_controller, "addObserver:", self);
  -[MRUNowPlayingController updateAutomaticResponseLoading](v6, "updateAutomaticResponseLoading");
  v7 = -[MRUNowPlayingViewController context](self, "context");
  -[MRUNowPlayingController tvRemoteController](v6, "tvRemoteController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContext:", v7);
  -[MRUNowPlayingViewController createRoutingViewController](self, "createRoutingViewController");
  -[MRUNowPlayingViewController controller](self, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaSuggestionsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refreshMediaSuggestions");

  -[MRUNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
  -[MRUNowPlayingViewController updateRouteLabel](self, "updateRouteLabel");
  -[MRUNowPlayingViewController updateArtwork](self, "updateArtwork");
  -[MRUNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRUNowPlayingViewController updateTimeControls](self, "updateTimeControls");
  -[MRUNowPlayingViewController updateTransportControls](self, "updateTransportControls");
  -[MRUNowPlayingViewController updateQuickControl](self, "updateQuickControl");
  -[MRUNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUNowPlayingViewController updateVisibility](self, "updateVisibility");
  -[MRUNowPlayingViewController updateRoutingDiscoveryMode](self, "updateRoutingDiscoveryMode");
  -[MRUNowPlayingViewController updateSuggestions](self, "updateSuggestions");
  -[MRUNowPlayingViewController trackStartedShowingMediaSuggestions](self, "trackStartedShowingMediaSuggestions");
}

- (void)setLayout:(int64_t)a3
{
  int64_t layout;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  layout = self->_layout;
  if (layout != a3)
  {
    self->_layout = a3;
    -[MRUNowPlayingViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayout:", a3);

    -[MRUNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayout:", a3 == 4);

    -[MRUNowPlayingViewController updateRoutingContentEdgeInsets](self, "updateRoutingContentEdgeInsets");
    -[MRUNowPlayingViewController updateArtwork](self, "updateArtwork");
    -[MRUNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
    -[MRUNowPlayingViewController updateRouteLabel](self, "updateRouteLabel");
    -[MRUNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
    -[MRUNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
    -[MRUNowPlayingViewController updateRoutingDiscoveryMode](self, "updateRoutingDiscoveryMode");
    -[MRUNowPlayingViewController updateSuggestions](self, "updateSuggestions");
    -[MRUNowPlayingViewController updateVisibility](self, "updateVisibility");
    v8 = a3 != 1 || layout == 1;
    v9 = !v8;
    if (!v8 || a3 != 1 && layout == 1)
    {
      -[MRURoutingViewController beginAppearanceTransition:animated:](self->_routingViewController, "beginAppearanceTransition:animated:", v9, 1);
      -[MRURoutingViewController endAppearanceTransition](self->_routingViewController, "endAppearanceTransition");
    }
  }
}

- (void)setContext:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_context != a3)
  {
    self->_context = a3;
    -[MRUNowPlayingViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContext:", a3);

    -[MRUNowPlayingViewController controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tvRemoteController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContext:", a3);

    -[MRUNowPlayingViewController updateSuggestionContext](self, "updateSuggestionContext");
    -[MRUNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  }
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_supportsHorizontalLayout != a3)
  {
    v3 = a3;
    self->_supportsHorizontalLayout = a3;
    -[MRUNowPlayingViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSupportsHorizontalLayout:", v3);

    -[MRUNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSupportsHorizontalLayout:", v3);

  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v7;
  void *v12;
  void *v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self->_contentEdgeInsets.top;
  if (self->_contentEdgeInsets.left != a3.left
    || v7 != top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets.top = top;
    self->_contentEdgeInsets.left = a3.left;
    self->_contentEdgeInsets.bottom = a3.bottom;
    self->_contentEdgeInsets.right = a3.right;
    -[MRUNowPlayingViewController viewIfLoaded](self, "viewIfLoaded", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentEdgeInsets:", top, left, bottom, right);

    -[MRUNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentEdgeInsets:", top, left, bottom, right);

    -[MRUNowPlayingViewController updateRoutingContentEdgeInsets](self, "updateRoutingContentEdgeInsets");
  }
}

- (void)_setStylingProvider:(id)a3
{
  MRUVisualStylingProvider **p_stylingProvider;
  void *v6;
  void *v7;
  void *v8;
  MRUVisualStylingProvider *v9;

  p_stylingProvider = &self->_stylingProvider;
  v9 = (MRUVisualStylingProvider *)a3;
  if (*p_stylingProvider != v9)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider setTraitChangeObservable:](*p_stylingProvider, "setTraitChangeObservable:", self);
    -[MRUNowPlayingViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStylingProvider:", v9);

    -[MRUNowPlayingViewController suggestionsViewController](self, "suggestionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStylingProvider:", v9);

    -[MRUNowPlayingViewController routingViewController](self, "routingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStylingProvider:", v9);

  }
}

- (void)setStylingProvider:(id)a3
{
  -[MRUNowPlayingViewController setPendingVisualStylingProvider:](self, "setPendingVisualStylingProvider:", a3);
  -[MRUNowPlayingViewController schedulePendingTraitCollectionUpdates](self, "schedulePendingTraitCollectionUpdates");
}

- (void)setPlaybackDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_playbackDataSource, obj);
    -[MRUNowPlayingViewController routingViewController](self, "routingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routingController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackDataSource:", obj);

  }
}

- (void)setConfigureRoutingButton:(id)a3
{
  void *v4;
  id configureRoutingButton;

  v4 = (void *)objc_msgSend(a3, "copy");
  configureRoutingButton = self->_configureRoutingButton;
  self->_configureRoutingButton = v4;

  -[MRUNowPlayingViewController updateRoutingButton](self, "updateRoutingButton");
}

- (void)setRoutingViewController:(id)a3
{
  MRURoutingViewController **p_routingViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_routingViewController = &self->_routingViewController;
  -[MRURoutingViewController setDelegate:](self->_routingViewController, "setDelegate:", 0);
  if (self->_layout == 1)
  {
    -[MRURoutingViewController beginAppearanceTransition:animated:](*p_routingViewController, "beginAppearanceTransition:animated:", 0, 0);
    -[MRURoutingViewController endAppearanceTransition](*p_routingViewController, "endAppearanceTransition");
  }
  -[MRURoutingViewController willMoveToParentViewController:](*p_routingViewController, "willMoveToParentViewController:", 0);
  -[MRURoutingViewController removeFromParentViewController](*p_routingViewController, "removeFromParentViewController");
  objc_storeStrong((id *)&self->_routingViewController, a3);
  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURoutingViewController setEndpointRoute:](*p_routingViewController, "setEndpointRoute:", v7);

  -[MRURoutingViewController setDelegate:](*p_routingViewController, "setDelegate:", self);
  -[MRURoutingViewController setVolumeGroupCoordinator:](*p_routingViewController, "setVolumeGroupCoordinator:", self->_volumeGroupCoordinator);
  -[MRURoutingViewController setStylingProvider:](*p_routingViewController, "setStylingProvider:", self->_stylingProvider);
  -[MRUNowPlayingViewController updateRoutingContentEdgeInsets](self, "updateRoutingContentEdgeInsets");
  -[MRUNowPlayingViewController updateRoutingDiscoveryMode](self, "updateRoutingDiscoveryMode");
  -[MRUNowPlayingViewController addChildViewController:](self, "addChildViewController:", v10);
  objc_msgSend(v10, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentView:", v8);

  objc_msgSend(v10, "didMoveToParentViewController:", self);
  if (self->_layout == 1)
  {
    -[MRURoutingViewController beginAppearanceTransition:animated:](*p_routingViewController, "beginAppearanceTransition:animated:", 1, 0);
    -[MRURoutingViewController endAppearanceTransition](*p_routingViewController, "endAppearanceTransition");
  }

}

- (void)setShowArtworkView:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    -[MRUNowPlayingViewController updateArtwork](self, "updateArtwork");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__MRUNowPlayingViewController_setShowArtworkView___block_invoke;
    v5[3] = &unk_1E5818D00;
    v5[4] = self;
    v6 = a3;
    -[MRUNowPlayingViewController updateContentAnimated:completion:](self, "updateContentAnimated:completion:", v5, 0);
  }
}

void __50__MRUNowPlayingViewController_setShowArtworkView___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowArtworkView:", v1);

}

- (NSArray)restrictedRects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "showSuggestionsView"))
  {
    -[MRUNowPlayingViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionsView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    -[MRUNowPlayingViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suggestionsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v10, v12, v14, v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
  }

LABEL_5:
  -[MRUNowPlayingViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "showArtworkView");

  if (v18)
  {
    -[MRUNowPlayingViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "artworkView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v22, v24, v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  -[MRUNowPlayingViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "headerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v33, v35, v37, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  -[MRUNowPlayingViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = objc_msgSend(v41, "showTimeControlsView");

  if ((_DWORD)v31)
  {
    -[MRUNowPlayingViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeControlsView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");

    UIRectInset();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v44);

  }
  -[MRUNowPlayingViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "showTransportControlsView");

  if (v46)
  {
    -[MRUNowPlayingViewController view](self, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "transportControlsView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "frame");

    UIRectInset();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v49);

  }
  -[MRUNowPlayingViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "showVolumeControlsView");

  if (v51)
  {
    -[MRUNowPlayingViewController view](self, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "volumeControlsView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "frame");

    UIRectInset();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v54);

  }
  v55 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v55;
}

- (void)initiateQueueHandoffTansitionWithCoordinator:(id)a3
{
  -[MRUNowPlayingController setQueueHandoffCoordinator:](self->_controller, "setQueueHandoffCoordinator:", a3);
}

- (void)didSelectArtworkView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[MRUNowPlayingViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (-[MRUNowPlayingViewController delegate](self, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "nowPlayingViewControllerDidSelectArtworkView:", self),
        v6,
        (v7 & 1) == 0))
  {
    -[MRUNowPlayingViewController launchNowPlayingApp](self, "launchNowPlayingApp");
  }
}

- (void)didSelectQuickControl:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[MRUNowPlayingController quickControlItem](self->_controller, "quickControlItem", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainAction");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)volumeControlsView:(id)a3 volumeValueDidChange:(float)a4
{
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("volume changed"));
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  -[MRUNowPlayingViewController updateRouteLabel](self, "updateRouteLabel", a3, a4, a5);
  -[MRUNowPlayingViewController updateVolumeControls](self, "updateVolumeControls");
  -[MRUNowPlayingViewController updateRoutingButtonAnimated:](self, "updateRoutingButtonAnimated:", 1);
  -[MRUNowPlayingViewController updateLayout](self, "updateLayout");
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("route changed"));
}

- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = objc_msgSend(a4, "showTVRemote", a3);
  -[MRUNowPlayingViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transportControlsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowTVRemoteButton:", v6);

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  self->_playing = objc_msgSend(a5, "isPlaying", a3, a4);
  -[MRUNowPlayingViewController updateNowPlayingInfo](self, "updateNowPlayingInfo");
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("now playing info changed"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTimeControls:(id)a5
{
  -[MRUNowPlayingViewController updateTimeControls](self, "updateTimeControls", a3, a4, a5);
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("time controls changed"));
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTransportControls:(id)a5
{
  -[MRUNowPlayingViewController updateTransportControls](self, "updateTransportControls", a3, a4, a5);
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("transport controls changed"));
}

- (void)nowPlayingController:(id)a3 queueHandoffCoordinator:(id)a4 didChangeState:(int64_t)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  switch(a5)
  {
    case 4:
      -[MRUNowPlayingViewController updateSuggestions](self, "updateSuggestions");
      break;
    case 2:
      v20 = *MEMORY[0x1E0C9D820];
      v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      -[MRUNowPlayingViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setArtworkOverrideSize:", v20, v21);

      -[MRUNowPlayingViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 0;
LABEL_10:
      objc_msgSend(v17, "setUseArtworkOverrideSize:", v19);

      break;
    case 1:
      -[MRUNowPlayingViewController updateSuggestions](self, "updateSuggestions");
      objc_msgSend(v8, "artworkSize");
      v10 = v9;
      v12 = v11;
      -[MRUNowPlayingViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setArtworkOverrideSize:", v10, v12);

      objc_msgSend(v8, "artworkSize");
      v16 = v15 != *(double *)(MEMORY[0x1E0C9D820] + 8) || v14 != *MEMORY[0x1E0C9D820];
      -[MRUNowPlayingViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = v16;
      goto LABEL_10;
  }

}

- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "mediaSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v8);

  -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__MRUNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke;
  v15[3] = &unk_1E581B288;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v11;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "playSuggestion:completion:", v14, v15);

}

uint64_t __93__MRUNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "trackSuggestionSelected:atIndex:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CC1D18]) & 1) != 0)
  {
    -[MRUNowPlayingViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v11, &location);
      SBSRequestPasscodeUnlockAlertUI();
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __78__MRUNowPlayingViewController_routingViewController_didSelectRoutingViewItem___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D975F8], "instantiateViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFlags:", 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __78__MRUNowPlayingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2;
    v7[3] = &unk_1E58191D8;
    v5 = WeakRetained;
    v8 = v5;
    objc_msgSend(v4, "setCompletion:", v7);
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nowPlayingViewController:showViewController:", v5, v4);

  }
}

void __78__MRUNowPlayingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(v5, "mediaRouteIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%@ ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nowPlayingViewController:showViewController:", *(_QWORD *)(a1 + 32), 0);

}

- (void)routingViewControllerDidUpdateItems:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_layout == 1)
  {
    v7 = WeakRetained;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "nowPlayingViewController:didChangeSizeWithAnimations:completion:", self, 0, 0);
      v5 = v7;
    }
  }

}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**coordinatedDismissalBlock)(id, _QWORD *);
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_coordinatedDismissalBlock)
  {
    -[MRUNowPlayingController tvRemoteController](self->_controller, "tvRemoteController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v8);

    coordinatedDismissalBlock = (void (**)(id, _QWORD *))self->_coordinatedDismissalBlock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__MRUNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke;
    v11[3] = &unk_1E5818E18;
    objc_copyWeak(&v12, &location);
    coordinatedDismissalBlock[2](coordinatedDismissalBlock, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MRUNowPlayingController tvRemoteController](self->_controller, "tvRemoteController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentTVRemoteUsingApp:", 0);

  }
}

void __77__MRUNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentTVRemoteUsingApp:", 0);

}

- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4
{
  -[MRUNowPlayingViewController presentRoutingControlsFromSourceView:](self, "presentRoutingControlsFromSourceView:", a4);
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("artwork changed"), a4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController traitCollectionDidChange:](&v13, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "mr_shouldDim");
  -[MRUNowPlayingViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mr_shouldDim");

  if (v5 != (_DWORD)v7)
  {
    MCLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v4, "_backlightLuminance");
      -[MRUNowPlayingViewController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_backlightLuminance");
      *(_DWORD *)buf = 134218240;
      v15 = v9;
      v16 = 2048;
      v17 = v11;
      _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[AOD] Backlight luminance changed from %ld to %ld", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUNowPlayingViewController setPendingDimmed:](self, "setPendingDimmed:", v12);

    -[MRUNowPlayingViewController schedulePendingTraitCollectionUpdates](self, "schedulePendingTraitCollectionUpdates");
  }

}

- (id)_timelinesForDateInterval:(id)a3
{
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_dimmed && self->_playing)
  {
    objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flipBookUpdateInterval");
    v5 = (uint64_t)(60.0 / v4);

    objc_msgSend(MEMORY[0x1E0D00F38], "timelineWithPerMinuteUpdateFrequency:identifier:configure:", v5, CFSTR("aod-on"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D00F38], "emptyTimelineWithIdentifier:", CFSTR("aod-off"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4;

  objc_msgSend(a3, "presentationInterval");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingViewController updateTimeControlsForPresentationInterval:](self, "updateTimeControlsForPresentationInterval:", v4);

}

- (void)schedulePendingTraitCollectionUpdates
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (!-[MRUNowPlayingViewController hasPendingTraitCollectionUpdates](self, "hasPendingTraitCollectionUpdates"))
  {
    -[MRUNowPlayingViewController setHasPendingTraitCollectionUpdates:](self, "setHasPendingTraitCollectionUpdates:", 1);
    v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MRUNowPlayingViewController_schedulePendingTraitCollectionUpdates__block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __68__MRUNowPlayingViewController_schedulePendingTraitCollectionUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingDimmed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingDimmed");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDimmed:", objc_msgSend(v3, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "updateDimmed");
    objc_msgSend(*(id *)(a1 + 32), "setPendingDimmed:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "pendingVisualStylingProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "pendingVisualStylingProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setStylingProvider:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setPendingVisualStylingProvider:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingTraitCollectionUpdates:", 0);
}

- (id)backlightSceneEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MRUNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backlightSceneEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MRUNowPlayingViewController isDimmed](self, "isDimmed"))
  {
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[AOD] Enqueueing timeline invalidation because %@", buf, 0xCu);
    }

    if (!-[MRUNowPlayingViewController pendingTimelineInvalidation](self, "pendingTimelineInvalidation"))
    {
      -[MRUNowPlayingViewController setPendingTimelineInvalidation:](self, "setPendingTimelineInvalidation:", 1);
      v6 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__MRUNowPlayingViewController_invalidateAllTimelinesForReason___block_invoke;
      block[3] = &unk_1E5818C88;
      block[4] = self;
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);
    }
  }

}

void __63__MRUNowPlayingViewController_invalidateAllTimelinesForReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setPendingTimelineInvalidation:", 0);
  MCLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "[AOD] Invalidating all timelines", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "backlightSceneEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAllTimelinesForReason:", CFSTR("now playing state changed"));

}

- (void)updateDimmed
{
  -[MRUNowPlayingViewController invalidateAllTimelinesForReason:](self, "invalidateAllTimelinesForReason:", CFSTR("backlight luminance changed"));
  -[MRUNowPlayingViewController updateVisibility](self, "updateVisibility");
  -[MRUNowPlayingViewController updateTimeControls](self, "updateTimeControls");
}

- (void)createRoutingViewController
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  if (!self->_routeControlsPresentation)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(devices)"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke;
    block[3] = &unk_1E5818C18;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    v8 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  MRUOutputDeviceRoutingDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MRUOutputDeviceRoutingDataSource *v8;
  _QWORD block[4];
  MRUOutputDeviceRoutingDataSource *v10;
  id v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(MRUOutputDeviceRoutingDataSource);
    objc_msgSend(WeakRetained, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUOutputDeviceRoutingDataSource setEndpointRoute:](v3, "setEndpointRoute:", v6);

    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      v7 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      -[MRUOutputDeviceRoutingDataSource setRoutingContextUID:](v3, "setRoutingContextUID:", v7);

    }
    -[MRUOutputDeviceRoutingDataSource setSupportsMultipleSelection:](v3, "setSupportsMultipleSelection:", 1);
    -[MPAVRoutingDataSource setFilterMode:](v3, "setFilterMode:", 0);
    -[MRUOutputDeviceRoutingDataSource setInitiator:](v3, "setInitiator:", *MEMORY[0x1E0CF63F0]);
    -[MRUOutputDeviceRoutingDataSource setDetachesRoutesToGroup:](v3, "setDetachesRoutesToGroup:", 1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke_2;
    block[3] = &unk_1E5819160;
    v10 = v3;
    v11 = *(id *)(a1 + 32);
    v12 = WeakRetained;
    v8 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  MRURoutingViewController *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CC2318]), "initWithDataSource:name:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 1104));
  objc_msgSend(v4, "setPlaybackDataSource:", WeakRetained);

  v3 = -[MRURoutingViewController initWithRoutingController:]([MRURoutingViewController alloc], "initWithRoutingController:", v4);
  objc_msgSend(*(id *)(a1 + 48), "setRoutingViewController:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setHearingAidDelegate:", v3);

}

- (void)createSuggestionsViewController
{
  void *v3;
  MRUMediaSuggestionsViewController *v4;
  MRUMediaSuggestionsViewController *suggestionsViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaSuggestions");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[MRUMediaSuggestionsViewController initWithMediaSuggestions:]([MRUMediaSuggestionsViewController alloc], "initWithMediaSuggestions:", v10);
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v4;

  -[MRUMediaSuggestionsViewController setDelegate:](self->_suggestionsViewController, "setDelegate:", self);
  -[MRUNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsViewController setLayout:](self->_suggestionsViewController, "setLayout:", objc_msgSend(v6, "layout") == 4);

  -[MRUNowPlayingViewController stylingProvider](self, "stylingProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUMediaSuggestionsViewController setStylingProvider:](self->_suggestionsViewController, "setStylingProvider:", v7);

  -[MRUMediaSuggestionsViewController setSupportsHorizontalLayout:](self->_suggestionsViewController, "setSupportsHorizontalLayout:", self->_supportsHorizontalLayout);
  -[MRUMediaSuggestionsViewController setContentEdgeInsets:](self->_suggestionsViewController, "setContentEdgeInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right);
  -[MRUNowPlayingViewController addChildViewController:](self, "addChildViewController:", self->_suggestionsViewController);
  -[MRUMediaSuggestionsViewController view](self->_suggestionsViewController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUNowPlayingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSuggestionsView:", v8);

  -[MRUMediaSuggestionsViewController didMoveToParentViewController:](self->_suggestionsViewController, "didMoveToParentViewController:", self);
}

- (void)updateRoutingContentEdgeInsets
{
  void *v3;
  BOOL ShouldBeVertical;
  double left;
  MRURoutingViewController *routingViewController;
  double right;
  double v8;

  if (self->_supportsHorizontalLayout
    && (-[MRUNowPlayingViewController view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        ShouldBeVertical = MRULayoutShouldBeVertical(),
        v3,
        !ShouldBeVertical))
  {
    v8 = 13.0;
    routingViewController = self->_routingViewController;
    left = self->_contentEdgeInsets.left;
    right = self->_contentEdgeInsets.right;
  }
  else
  {
    left = self->_contentEdgeInsets.left;
    routingViewController = self->_routingViewController;
    right = self->_contentEdgeInsets.right;
    v8 = 0.0;
  }
  -[MRURoutingViewController setContentEdgeInsets:](routingViewController, "setContentEdgeInsets:", v8, left, 13.0, right);
}

- (void)updateRoutingDiscoveryMode
{
  uint64_t v3;

  if (-[MRUNowPlayingViewController isOnScreen](self, "isOnScreen"))
  {
    if (-[MRUNowPlayingViewController layout](self, "layout") == 1)
      v3 = 3;
    else
      v3 = 1;
  }
  else
  {
    v3 = 1;
  }
  -[MRURoutingViewController setDiscoveryMode:](self->_routingViewController, "setDiscoveryMode:", v3);
}

- (void)updateArtwork
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[MRUNowPlayingViewController showArtworkView](self, "showArtworkView"))
  {
    -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "artwork");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[MRUNowPlayingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "artworkView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setArtwork:", v6);
  }
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
  void *v12;
  int v13;
  _QWORD v14[4];
  id v15;
  char v16;

  -[MRUNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3870];
  -[MRUNowPlayingController deviceSymbolName](self->_controller, "deviceSymbolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_systemImageNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholderImage:", v12);

  objc_msgSend(v7, "setRoute:", v9);
  v13 = -[MRUNowPlayingViewController showRouteLabel](self, "showRouteLabel");
  if (v13 != objc_msgSend(v7, "showRoute"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__MRUNowPlayingViewController_updateRouteLabel__block_invoke;
    v14[3] = &unk_1E5818D00;
    v15 = v7;
    v16 = v13;
    -[MRUNowPlayingViewController updateContentAnimated:completion:](self, "updateContentAnimated:completion:", v14, 0);

  }
}

uint64_t __47__MRUNowPlayingViewController_updateRouteLabel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowRoute:", *(unsigned __int8 *)(a1 + 40));
}

- (void)updateNowPlayingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t layout;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  char v24;
  char v25;

  -[MRUNowPlayingController metadataController](self->_controller, "metadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEndpointDiscovered") & 1) != 0
    || -[MRUNowPlayingViewController context](self, "context") != 3)
  {
    objc_msgSend(v4, "placeholder");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MRUStringsProvider controlsUnavailable](MRUStringsProvider, "controlsUnavailable");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  objc_msgSend(v7, "setPlaceholder:", v9);

  layout = self->_layout;
  if (layout > 4)
  {
    v13 = 58;
    v12 = 1;
  }
  else
  {
    v12 = qword_1AAAD60B8[layout];
    v13 = qword_1AAAD60E0[layout];
  }
  objc_msgSend(v4, "stringForComponents:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v14);

  objc_msgSend(v4, "stringForComponents:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSubtitle:", v15);

  v16 = self->_layout != 3 || self->_context == 3;
  v17 = objc_msgSend(v4, "showPlaceholder");
  if (v17 != objc_msgSend(v7, "showPlaceholder") || v16 != objc_msgSend(v7, "showSubtitle"))
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __51__MRUNowPlayingViewController_updateNowPlayingInfo__block_invoke;
    v22 = &unk_1E581B2B0;
    v23 = v7;
    v24 = v17;
    v25 = v16;
    -[MRUNowPlayingViewController updateContentAnimated:completion:](self, "updateContentAnimated:completion:", &v19, 0);

  }
  -[MRUNowPlayingViewController view](self, "view", v19, v20, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

}

uint64_t __51__MRUNowPlayingViewController_updateNowPlayingInfo__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShowPlaceholder:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setShowSubtitle:", *(unsigned __int8 *)(a1 + 41));
}

- (void)updateTimeControlsForPresentationInterval:(id)a3
{
  MRUNowPlayingController *controller;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  controller = self->_controller;
  v5 = a3;
  -[MRUNowPlayingController metadataController](controller, "metadataController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeControls");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeControlsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTimeControls:forPresentationInterval:", v9, v5);
}

- (void)updateTimeControls
{
  -[MRUNowPlayingViewController updateTimeControlsForPresentationInterval:](self, "updateTimeControlsForPresentationInterval:", 0);
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

  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportControlsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTransportControls:", v7);
  -[MRUNowPlayingController tvRemoteController](self->_controller, "tvRemoteController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));

}

- (void)updateQuickControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MRUNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController quickControlItem](self->_controller, "quickControlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowTransportButton:", objc_msgSend(v4, "isEnabled"));
  objc_msgSend(v7, "transportButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsset:", v6);

}

- (void)updateVolumeControls
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
  char v13;
  uint64_t v14;
  MRUVolumeController *v15;
  MRUVolumeGroupCoordinator *v16;
  void *v17;
  MRUVolumeGroupCoordinator *v18;
  MRUVolumeGroupCoordinator *volumeGroupCoordinator;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  int64_t layout;
  BOOL v26;
  void *v27;
  int v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  void *v42;
  BSInvalidatable *v43;
  BSInvalidatable *hardwareVolumeControlAssertion;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  _QWORD v53[5];
  char v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  _BYTE v64[34];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  -[MRUNowPlayingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volumeControlsView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "volumeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "volumeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v4, "volumeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v6, 0);

    v15 = -[MPVolumeController initWithDataSource:]([MRUVolumeController alloc], "initWithDataSource:", v14);
    objc_msgSend(v4, "setVolumeController:", v15);

    goto LABEL_8;
  }
  objc_msgSend(v10, "groupRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v6);

  if ((v13 & 1) == 0)
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2538]), "initWithGroupRoute:outputDeviceRoute:", v6, 0);

    objc_msgSend(v4, "setDataSource:", v14);
LABEL_8:
    v10 = (void *)v14;
  }
  if (!self->_volumeGroupCoordinator && !self->_routeControlsPresentation)
  {
    v16 = [MRUVolumeGroupCoordinator alloc];
    objc_msgSend(v4, "volumeController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MRUVolumeGroupCoordinator initWithMainVolumeController:](v16, "initWithMainVolumeController:", v17);
    volumeGroupCoordinator = self->_volumeGroupCoordinator;
    self->_volumeGroupCoordinator = v18;

    objc_msgSend(v4, "setVolumeGroupCoordinator:", self->_volumeGroupCoordinator);
    -[MRURoutingViewController setVolumeGroupCoordinator:](self->_routingViewController, "setVolumeGroupCoordinator:", self->_volumeGroupCoordinator);
  }
  if (-[MRUNowPlayingViewController context](self, "context") == 2
    || -[MRUNowPlayingViewController context](self, "context") == 8)
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isDeviceSystemRoute"))
    {
      -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isAirPlaying") & 1) != 0)
      {
        v22 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v23, "alwaysShowVolumeControls");

      }
    }
    else
    {
      v22 = 1;
    }

  }
  else
  {
    v22 = 1;
  }
  v24 = 0;
  if (self->_onScreen && v22)
  {
    layout = self->_layout;
    if (layout)
      v26 = layout == 3;
    else
      v26 = 1;
    v24 = !v26;
  }
  +[MRUCallMonitor sharedMonitor](MRUCallMonitor, "sharedMonitor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isOnCall");

  v29 = objc_msgSend(v10, "volumeControlCapabilities");
  if (+[MRUFeatureFlagProvider isAutobahnEnabled](MRUFeatureFlagProvider, "isAutobahnEnabled"))
  {
    -[MRUNowPlayingViewController view](self, "view");
    v30 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "volumeControlsView");
    v32 = v4;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setOnScreen:", v24);

    -[MRUNowPlayingViewController view](self, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v34, "showVolumeControlsView");

    v6 = v30;
    v26 = v22 == (_DWORD)v33;
    v4 = v32;
    if (!v26)
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __51__MRUNowPlayingViewController_updateVolumeControls__block_invoke;
      v53[3] = &unk_1E5818D00;
      v53[4] = self;
      v54 = v22;
      -[MRUNowPlayingViewController updateContentAnimated:completion:](self, "updateContentAnimated:completion:", v53, 0);
    }
  }
  if (((v24 ^ 1 | v28) & 1) == 0 && (objc_msgSend(v6, "isDeviceRoute") & 1) == 0 && (v29 & 3) != 0)
  {
    MCLogCategoryVolume();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_opt_class();
      MRUNowPlayingLayoutDescription(self->_layout);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      MRUNowPlayingContextDescription(self->_context);
      v38 = v6;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v56 = v36;
      v57 = 1024;
      v58 = 1;
      v59 = 1024;
      v60 = v22;
      v61 = 1024;
      v62 = 0;
      v63 = 1024;
      *(_DWORD *)v64 = 1;
      *(_WORD *)&v64[4] = 2114;
      *(_QWORD *)&v64[6] = v37;
      *(_WORD *)&v64[14] = 2114;
      *(_QWORD *)&v64[16] = v39;
      *(_WORD *)&v64[24] = 2114;
      *(_QWORD *)&v64[26] = v38;
      _os_log_impl(&dword_1AA991000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | control: %{BOOL}u | layout: %{public}@ | context: %{public}@ | route: %{public}@", buf, 0x42u);

      v6 = v38;
    }

    +[MRUHardwareVolumeController sharedInstance](MRUHardwareVolumeController, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "requestControlsForVolumeDataSource:reason:", v10, v42);
    v43 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = v43;

LABEL_43:
    goto LABEL_44;
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    MCLogCategoryVolume();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v51 = v22;
      v46 = v10;
      v47 = v6;
      v48 = objc_opt_class();
      MRUNowPlayingLayoutDescription(self->_layout);
      v52 = v4;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      MRUNowPlayingContextDescription(self->_context);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v56 = v48;
      v6 = v47;
      v10 = v46;
      v57 = 1024;
      v58 = v24;
      v59 = 1024;
      v60 = v51;
      v61 = 1024;
      v62 = v28;
      v63 = 2114;
      *(_QWORD *)v64 = v49;
      *(_WORD *)&v64[8] = 2114;
      *(_QWORD *)&v64[10] = v50;
      *(_WORD *)&v64[18] = 2114;
      *(_QWORD *)&v64[20] = v6;
      _os_log_impl(&dword_1AA991000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | layout: %{public}@ | context: %{public}@ | route: %{public}@", buf, 0x3Cu);

      v4 = v52;
    }

    v40 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_43;
  }
LABEL_44:

}

void __51__MRUNowPlayingViewController_updateVolumeControls__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowVolumeControlsView:", v1);

}

- (void)updateRoutingButton
{
  -[MRUNowPlayingViewController updateRoutingButtonAnimated:](self, "updateRoutingButtonAnimated:", 0);
}

- (void)updateRoutingButtonAnimated:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void (**configureRoutingButton)(id, uint64_t);
  void *v17;
  uint64_t v18;
  MRUNowPlayingController *controller;
  id v20;
  _QWORD v21[4];
  id v22;
  MRUNowPlayingViewController *v23;
  BOOL v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[MRUNowPlayingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transportControlsView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "route");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canModifyGroupMembership");

  v12 = (_DWORD)v11 && self->_context == 3 && self->_layout == 3;
  objc_msgSend(v6, "setShowRoutingButton:", v12);
  objc_msgSend(v8, "setShowRoutingButton:", v11);
  objc_msgSend(v8, "routingButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(v6, "routingButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  configureRoutingButton = (void (**)(id, uint64_t))self->_configureRoutingButton;
  if (configureRoutingButton)
  {
    configureRoutingButton[2](configureRoutingButton, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v18;
  }
  controller = self->_controller;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __59__MRUNowPlayingViewController_updateRoutingButtonAnimated___block_invoke;
  v21[3] = &unk_1E581B2D8;
  v22 = v15;
  v23 = self;
  v24 = a3;
  v20 = v15;
  -[MRUNowPlayingController routingDeviceImage:](controller, "routingDeviceImage:", v21);

}

void __59__MRUNowPlayingViewController_updateRoutingButtonAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BOOL8 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[MRUAsset image:](MRUAsset, "image:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "isOnScreen", (_QWORD)v11))
          v10 = *(_BYTE *)(a1 + 48) != 0;
        else
          v10 = 0;
        objc_msgSend(v9, "setAsset:animated:", v3, v10);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)showRouteLabel
{
  int64_t layout;
  void *v4;
  void *v5;
  char v6;

  layout = self->_layout;
  if (!layout)
    return 0;
  if (layout == 2)
    return self->_context != 3;
  if (layout != 4 || -[MRUNowPlayingViewController context](self, "context") != 2)
    return 1;
  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDeviceSystemRoute"))
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAirPlaying");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)updateLayout
{
  void *v3;
  int64_t v4;
  id v5;

  if (-[MRUNowPlayingViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "canModifyGroupMembership") & 1) != 0)
    {

    }
    else
    {
      v4 = -[MRUNowPlayingViewController layout](self, "layout");

      if (v4 == 1)
        -[MRUNowPlayingViewController setLayout:](self, "setLayout:", 2);
    }
  }
}

- (void)updateVisibility
{
  _BOOL8 onScreen;
  void *v4;
  _BOOL8 dimmed;
  void *v6;
  int64_t layout;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  id v20;

  onScreen = self->_onScreen;
  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnScreen:", onScreen);

  dimmed = self->_dimmed;
  -[MRUNowPlayingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDimmed:", dimmed);

  layout = self->_layout;
  if (layout)
    v8 = layout == 3;
  else
    v8 = 1;
  v9 = !v8;
  -[MRUNowPlayingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v9);

  v12 = self->_layout;
  if (v12)
    v13 = v12 == 3;
  else
    v13 = 1;
  v14 = !v13;
  -[MRUNowPlayingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "headerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "labelView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEnabled:", v14);

  v18 = self->_layout == 3;
  -[MRUNowPlayingViewController view](self, "view");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "artworkView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShowPlaceholder:", v18);

}

- (void)updateSuggestionContext
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[MRUNowPlayingViewController context](self, "context") == 3)
  {
    v3 = *MEMORY[0x1E0D4C320];
    -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContext:", v3);

  }
  v5 = *MEMORY[0x1E0D4C328];
  -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContext:", v5);

}

- (void)updateSuggestions
{
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  char v14;
  id location;

  v3 = -[MRUNowPlayingViewController shouldShowMediaSuggestions](self, "shouldShowMediaSuggestions");
  objc_initWeak(&location, self);
  -[MRUNowPlayingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showSuggestionsView");

  if (v3 == v5)
  {
    if (v3)
    {
      -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mediaSuggestions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRUMediaSuggestionsViewController setMediaSuggestions:](self->_suggestionsViewController, "setMediaSuggestions:", v8);

    }
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__MRUNowPlayingViewController_updateSuggestions__block_invoke;
    v12[3] = &unk_1E5819428;
    objc_copyWeak(&v13, &location);
    v14 = v3;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __48__MRUNowPlayingViewController_updateSuggestions__block_invoke_2;
    v9[3] = &unk_1E5819428;
    objc_copyWeak(&v10, &location);
    v11 = v3;
    -[MRUNowPlayingViewController updateContentAnimated:completion:](self, "updateContentAnimated:completion:", v12, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
}

void __48__MRUNowPlayingViewController_updateSuggestions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "createSuggestionsViewController");
    WeakRetained = v7;
  }
  objc_msgSend(WeakRetained, "suggestionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginAppearanceTransition:animated:", *(unsigned __int8 *)(a1 + 40), 0);

  v4 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(v7, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowSuggestionsView:", v4);

  objc_msgSend(v7, "suggestionsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endAppearanceTransition");

}

void __48__MRUNowPlayingViewController_updateSuggestions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "trackStartedShowingMediaSuggestions");
  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "suggestionsViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "willMoveToParentViewController:", 0);

    objc_msgSend(WeakRetained, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSuggestionsView:", 0);

    objc_msgSend(WeakRetained, "suggestionsViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromParentViewController");

    objc_msgSend(WeakRetained, "setSuggestionsViewController:", 0);
  }

}

- (BOOL)shouldShowMediaSuggestions
{
  int64_t layout;
  BOOL v3;
  char v5;
  void *v6;
  void *v7;
  id WeakRetained;

  layout = self->_layout;
  v3 = layout == 4 || layout == 2;
  if (v3 && self->_context != 7)
  {
    -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v5 = objc_opt_respondsToSelector();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)isShowingMediaSuggestions
{
  void *v2;
  char v3;

  -[MRUNowPlayingViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSuggestionsView");

  return v3;
}

- (void)trackStartedShowingMediaSuggestions
{
  void *v3;
  id v4;

  if (-[MRUNowPlayingViewController shouldShowMediaSuggestions](self, "shouldShowMediaSuggestions"))
  {
    if (-[MRUNowPlayingViewController isOnScreen](self, "isOnScreen"))
    {
      -[MRUNowPlayingController mediaSuggestionsController](self->_controller, "mediaSuggestionsController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mediaSuggestions");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      -[MRUNowPlayingViewController trackSuggestionsDisplayed:](self, "trackSuggestionsDisplayed:", v4);
    }
  }
}

- (void)presentRoutingControlsFromSourceView:(id)a3
{
  id v4;
  id v5;
  id WeakRetained;
  MROutputDevicePicker *v7;
  MROutputDevicePicker *outputDevicePicker;
  id *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MRUViewServiceContainerViewController *v17;
  uint64_t v18;
  MRUViewServiceContainerViewController *v19;
  MPMediaControls *v20;
  MPMediaControls *mediaControls;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  MRUViewServiceContainerViewController *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;

  v4 = a3;
  if (self->_routeControlsPresentation)
  {
    if (+[MRUFeatureFlagProvider isCuminTestUIEnabled](MRUFeatureFlagProvider, "isCuminTestUIEnabled"))
    {
      v5 = objc_alloc(MEMORY[0x1E0D4C5C0]);
      WeakRetained = (id)objc_msgSend(v5, "initWithSessionID:presentingAppBundleID:surface:", *MEMORY[0x1E0D4C220], 0, 0);
      v7 = (MROutputDevicePicker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5D0]), "initWithConfiguration:", WeakRetained);
      outputDevicePicker = self->_outputDevicePicker;
      self->_outputDevicePicker = v7;

      objc_initWeak(&location, self);
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke;
      v30[3] = &unk_1E5818E18;
      v9 = &v31;
      objc_copyWeak(&v31, &location);
      -[MROutputDevicePicker setDismissHandler:](self->_outputDevicePicker, "setDismissHandler:", v30);
      -[MROutputDevicePicker present](self->_outputDevicePicker, "present");
    }
    else
    {
      WeakRetained = objc_alloc_init(MEMORY[0x1E0CC23D8]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPresentingAppBundleID:", v13);

      objc_msgSend(WeakRetained, "setStyle:", 2);
      if (MRAVOutputContextGetSharedAudioPresentationContext())
      {
        v14 = (void *)MRAVOutputContextCopyUniqueIdentifier();
        objc_msgSend(WeakRetained, "setRoutingContextUID:", v14);

      }
      if (self->_routeControlsPresentation == 2)
      {
        -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "routeUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setRouteUID:", v16);

      }
      objc_initWeak(&location, self);
      if (objc_msgSend(MEMORY[0x1E0CB34D0], "mru_isProximityControl"))
      {
        v17 = objc_alloc_init(MRUViewServiceContainerViewController);
        -[MRUViewServiceContainerViewController setConfiguration:](v17, "setConfiguration:", WeakRetained);
        -[MRUViewServiceContainerViewController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 5);
        v18 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_2;
        v28[3] = &unk_1E5818E18;
        objc_copyWeak(&v29, &location);
        -[MRUViewServiceContainerViewController setDismissalBlock:](v17, "setDismissalBlock:", v28);
        v26[0] = v18;
        v26[1] = 3221225472;
        v26[2] = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_3;
        v26[3] = &unk_1E5818C88;
        v19 = v17;
        v27 = v19;
        -[MRUNowPlayingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 0, v26);

        objc_destroyWeak(&v29);
LABEL_20:
        objc_destroyWeak(&location);
        goto LABEL_21;
      }
      v20 = (MPMediaControls *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC23D0]), "initWithConfiguration:shouldObserveRoutingContextUIDChanges:", WeakRetained, 0);
      mediaControls = self->_mediaControls;
      self->_mediaControls = v20;

      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "userInterfaceIdiom");

      if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1 && -[MRUNowPlayingViewController context](self, "context") != 2)
        -[MPMediaControls setSourceView:](self->_mediaControls, "setSourceView:", v4);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_4;
      v24[3] = &unk_1E5818E18;
      v9 = &v25;
      objc_copyWeak(&v25, &location);
      -[MPMediaControls setDismissHandler:](self->_mediaControls, "setDismissHandler:", v24);
      -[MPMediaControls present](self->_mediaControls, "present");
    }
    objc_destroyWeak(v9);
    goto LABEL_20;
  }
  v10 = -[MRUNowPlayingViewController layout](self, "layout");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v10 == 1)
      v11 = 2;
    else
      v11 = 1;
    objc_msgSend(WeakRetained, "nowPlayingViewController:applyLayout:", self, v11);
  }
LABEL_21:

}

void __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "setOutputDevicePicker:", 0);

    WeakRetained = v4;
  }

}

void __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);

}

uint64_t __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionToVisible:animated:", 1, 1);
}

void __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMediaControls:", 0);

}

- (void)updateContentAnimated:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD aBlock[5];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E5819B40;
  aBlock[4] = self;
  v9 = v6;
  v17 = v9;
  v10 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "nowPlayingViewController:didChangeSizeWithAnimations:completion:", self, v10, v7);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_3;
    v13[3] = &unk_1E581B300;
    v14 = v10;
    v15 = v7;
    objc_msgSend(v12, "mru_animateUsingType:animations:", 0, v13);

  }
}

void __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v3 == 0.0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  if (v6 == 0.0)
  {
LABEL_5:
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_2;
    v12[3] = &unk_1E58194F0;
    v10 = *(id *)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v10;
    objc_msgSend(v9, "performWithoutAnimation:", v12);
    v8 = v13;
    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");
  v8 = v11;
LABEL_6:

}

void __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)launchNowPlayingApp
{
  void *v3;
  void (**coordinatedDismissalBlock)(id, _QWORD *);
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (self->_coordinatedDismissalBlock)
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v3);

    coordinatedDismissalBlock = (void (**)(id, _QWORD *))self->_coordinatedDismissalBlock;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__MRUNowPlayingViewController_launchNowPlayingApp__block_invoke;
    v6[3] = &unk_1E5818E18;
    objc_copyWeak(&v7, &location);
    coordinatedDismissalBlock[2](coordinatedDismissalBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchNowPlayingApp");

  }
}

void __50__MRUNowPlayingViewController_launchNowPlayingApp__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "launchNowPlayingApp");

}

- (id)_stateDumpObject
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  MRUNowPlayingController *controller;
  MRURoutingViewController *routingViewController;
  MPMediaControls *mediaControls;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  _QWORD v24[8];
  _QWORD v25[9];

  v25[8] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("hardwareVolumeControlAssertion");
  -[BSInvalidatable description](self->_hardwareVolumeControlAssertion, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("<NONE>");
  v25[0] = v5;
  v24[1] = CFSTR("layout");
  MRUNowPlayingLayoutDescription(self->_layout);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("<NONE>");
  v25[1] = v8;
  v24[2] = CFSTR("context");
  MRUNowPlayingContextDescription(self->_context);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("<NONE>");
  v25[2] = v11;
  v24[3] = CFSTR("endpointController");
  -[MRUNowPlayingController endpointController](self->_controller, "endpointController");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("<NONE>");
  controller = self->_controller;
  if (!controller)
    controller = (MRUNowPlayingController *)CFSTR("<NONE>");
  v25[3] = v14;
  v25[4] = controller;
  v24[4] = CFSTR("dataController");
  v24[5] = CFSTR("routingViewController");
  routingViewController = self->_routingViewController;
  if (!routingViewController)
    routingViewController = (MRURoutingViewController *)CFSTR("<NONE>");
  mediaControls = self->_mediaControls;
  if (!mediaControls)
    mediaControls = (MPMediaControls *)CFSTR("<NONE>");
  v25[5] = routingViewController;
  v25[6] = mediaControls;
  v24[6] = CFSTR("mediaControls");
  v24[7] = CFSTR("window");
  -[MRUNowPlayingViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("<NONE>");
  v25[7] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (MRUNowPlayingViewControllerDelegate)delegate
{
  return (MRUNowPlayingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (int64_t)context
{
  return self->_context;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)coordinatedDismissalBlock
{
  return self->_coordinatedDismissalBlock;
}

- (void)setCoordinatedDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (MRUMediaSuggestionsViewController)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (void)setSuggestionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsViewController, a3);
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (void)setVolumeGroupCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, a3);
}

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, a3);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControls, a3);
}

- (MROutputDevicePicker)outputDevicePicker
{
  return self->_outputDevicePicker;
}

- (void)setOutputDevicePicker:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevicePicker, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (BOOL)pendingTimelineInvalidation
{
  return self->_pendingTimelineInvalidation;
}

- (void)setPendingTimelineInvalidation:(BOOL)a3
{
  self->_pendingTimelineInvalidation = a3;
}

- (MRUVisualStylingProvider)pendingVisualStylingProvider
{
  return self->_pendingVisualStylingProvider;
}

- (void)setPendingVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVisualStylingProvider, a3);
}

- (NSNumber)pendingDimmed
{
  return self->_pendingDimmed;
}

- (void)setPendingDimmed:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDimmed, a3);
}

- (BOOL)hasPendingTraitCollectionUpdates
{
  return self->_hasPendingTraitCollectionUpdates;
}

- (void)setHasPendingTraitCollectionUpdates:(BOOL)a3
{
  self->_hasPendingTraitCollectionUpdates = a3;
}

- (int64_t)routeControlsPresentation
{
  return self->_routeControlsPresentation;
}

- (MRURoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (MPAVOutputDevicePlaybackDataSource)playbackDataSource
{
  return (MPAVOutputDevicePlaybackDataSource *)objc_loadWeakRetained((id *)&self->_playbackDataSource);
}

- (id)configureRoutingButton
{
  return self->_configureRoutingButton;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configureRoutingButton, 0);
  objc_destroyWeak((id *)&self->_playbackDataSource);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_pendingDimmed, 0);
  objc_storeStrong((id *)&self->_pendingVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_outputDevicePicker, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong(&self->_coordinatedDismissalBlock, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
