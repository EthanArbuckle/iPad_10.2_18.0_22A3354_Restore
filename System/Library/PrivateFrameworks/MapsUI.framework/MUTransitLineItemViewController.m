@implementation MUTransitLineItemViewController

- (MUTransitLineItemViewController)initWithTransitLineItem:(id)a3
{
  id v5;
  MUTransitLineItemViewController *v6;
  MUTransitLineItemViewController *v7;
  MUTransitLineItemActionManager *v8;
  MUTransitLineItemActionManager *actionManager;
  MUNearestStationProvider *v10;
  MUNearestStationProvider *nearbyStationProvider;
  MKETAProvider *v12;
  MKETAProvider *etaProvider;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUTransitLineItemViewController;
  v6 = -[MUTransitLineItemViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitLineItem, a3);
    v7->_loading = 0;
    v8 = -[MUTransitLineItemActionManager initWithDelegate:analyticsDelegate:]([MUTransitLineItemActionManager alloc], "initWithDelegate:analyticsDelegate:", v7, v7);
    actionManager = v7->_actionManager;
    v7->_actionManager = v8;

    v10 = objc_alloc_init(MUNearestStationProvider);
    nearbyStationProvider = v7->_nearbyStationProvider;
    v7->_nearbyStationProvider = v10;

    v12 = (MKETAProvider *)objc_alloc_init(MEMORY[0x1E0CC17A8]);
    etaProvider = v7->_etaProvider;
    v7->_etaProvider = v12;

    -[MKETAProvider setDelegate:](v7->_etaProvider, "setDelegate:", v7);
    -[MUTransitLineItemViewController _setupContentView](v7, "_setupContentView");
  }

  return v7;
}

- (void)_setupContentView
{
  MUScrollableStackView *v3;
  MUScrollableStackView *v4;
  MUScrollableStackView *contentStackView;
  id v6;

  v3 = [MUScrollableStackView alloc];
  v4 = -[MUScrollableStackView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentStackView = self->_contentStackView;
  self->_contentStackView = v4;

  -[MUScrollableStackView setAxis:](self->_contentStackView, "setAxis:", 1);
  -[MUScrollableStackView setSpacing:](self->_contentStackView, "setSpacing:", 16.0);
  -[MUScrollableStackView setDelegate:](self->_contentStackView, "setDelegate:", self);
  -[MUScrollableStackView setAlwaysBounceVertical:](self->_contentStackView, "setAlwaysBounceVertical:", 1);
  -[MUScrollableStackView setScrollEnabled:](self->_contentStackView, "setScrollEnabled:", 1);
  -[MUTransitLineItemViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_contentStackView);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineItemViewController;
  -[MUTransitLineItemViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[MUTransitLineItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[MUScrollableStackView setFrame:](self->_contentStackView, "setFrame:");

  -[MULoadingOverlayController updateLayoutForBoundsChange](self->_loadingOverlayController, "updateLayoutForBoundsChange");
}

- (double)heightForContentAboveTitle
{
  return 0.0;
}

- (void)setTransitLineItem:(id)a3
{
  GEOTransitLineItem *v5;
  GEOTransitLineItem *v6;

  v5 = (GEOTransitLineItem *)a3;
  if (self->_transitLineItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_transitLineItem, a3);
    v5 = v6;
  }

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineItemViewController;
  -[MUTransitLineItemViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[MUTransitLineItemViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TransitLineItemView"));

  -[MUTransitLineItemViewController _updateSectionControllers](self, "_updateSectionControllers");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineItemViewController;
  -[MUTransitLineItemViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MUTransitLineItemViewController _fetchNearestStation](self, "_fetchNearestStation");
}

- (void)setTransitLineItem:(id)a3 loading:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
  {
    v7 = -[MUTransitLineItemViewController isLoading](self, "isLoading");

    if (v7 == v4)
      goto LABEL_9;
  }
  else
  {

  }
  -[MUTransitLineItemViewController setTransitLineItem:](self, "setTransitLineItem:", v8);
  -[MUTransitLineItemViewController setLoading:](self, "setLoading:", v4);
  if (!-[MUTransitLineItemViewController isLoading](self, "isLoading"))
    -[MUTransitLineItemViewController _attachLoadingOverlayIfNeeded](self, "_attachLoadingOverlayIfNeeded");
  if (-[MUTransitLineItemViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[MUTransitLineItemViewController _updateSectionControllers](self, "_updateSectionControllers");
    -[MUTransitLineItemViewController _fetchNearestStation](self, "_fetchNearestStation");
    if (-[MUTransitLineItemViewController isLoading](self, "isLoading"))
      -[MUTransitLineItemViewController _removeLoadingOverlayIfNeeded](self, "_removeLoadingOverlayIfNeeded");
  }
LABEL_9:

}

- (void)_updateSectionControllers
{
  id v3;
  id v4;
  MKETAProvider *v5;
  MKETAProvider *etaProvider;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MUTransitLineItemHeaderViewModel *v11;
  void *v12;
  MUPlaceHeaderView *v13;
  uint64_t v14;
  MUPlaceHeaderView *v15;
  MUPlaceHeaderView *headerView;
  MUHeaderButtonsSectionController *v17;
  MKETAProvider *v18;
  MUHeaderButtonsViewConfiguration *v19;
  MUHeaderButtonsSectionController *v20;
  MUHeaderButtonsSectionController *headerButtonsSectionController;
  MUHeaderButtonsSectionController *v22;
  id v23;
  MUHeaderButtonsSectionController *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  MUNearestStationSectionController *v30;
  void *v31;
  MUNearestStationSectionController *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  MUPlaceDescriptionSectionController *v39;
  void *v40;
  MUPlaceDescriptionSectionController *v41;
  id v42;
  MUPlaceDescriptionSectionController *v43;
  MUTransitLineIncidentsSectionController *v44;
  void *v45;
  MUTransitLineIncidentsSectionController *v46;
  id v47;
  void *v48;
  id v49;
  NSArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  BOOL v56;
  void *v57;
  NSArray *v58;
  NSArray *sectionControllers;
  NSArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  BOOL v66;
  void *v67;
  void *v68;
  BOOL v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id *v73;
  MUTransitLineItemHeaderViewModel *v74;
  MUTransitLineIncidentsSectionController *v75;
  MUNearestStationSectionController *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id location;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_transitLineItem)
  {
    -[MKETAProvider cancel](self->_etaProvider, "cancel");
    v5 = (MKETAProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17A8]), "initWithLineItem:", self->_transitLineItem);
    etaProvider = self->_etaProvider;
    self->_etaProvider = v5;

    -[MKETAProvider setDelegate:](self->_etaProvider, "setDelegate:", self);
    -[MUTransitLineItemViewController automobileOptions](self, "automobileOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider setAutomobileOptions:](self->_etaProvider, "setAutomobileOptions:", v7);

    -[MUTransitLineItemViewController walkingOptions](self, "walkingOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider setWalkingOptions:](self->_etaProvider, "setWalkingOptions:", v8);

    -[MUTransitLineItemViewController transitOptions](self, "transitOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider setTransitOptions:](self->_etaProvider, "setTransitOptions:", v9);

    -[MUTransitLineItemViewController cyclingOptions](self, "cyclingOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKETAProvider setCyclingOptions:](self->_etaProvider, "setCyclingOptions:", v10);

  }
  v11 = [MUTransitLineItemHeaderViewModel alloc];
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[MUTransitLineItemHeaderViewModel initWithTransitLineItem:](v11, "initWithTransitLineItem:", v12);

  objc_initWeak(&location, self);
  v13 = [MUPlaceHeaderView alloc];
  v14 = MEMORY[0x1E0C809B0];
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke;
  v88[3] = &unk_1E2E03960;
  v73 = &v89;
  objc_copyWeak(&v89, &location);
  v15 = -[MUPlaceHeaderView initWithViewModel:trailingConstraintProvider:](v13, "initWithViewModel:trailingConstraintProvider:", v74, v88);
  headerView = self->_headerView;
  self->_headerView = v15;

  objc_msgSend(v4, "addObject:", self->_headerView);
  v17 = [MUHeaderButtonsSectionController alloc];
  v18 = self->_etaProvider;
  v19 = objc_alloc_init(MUHeaderButtonsViewConfiguration);
  v20 = -[MUHeaderButtonsSectionController initWithETAProvider:headerButtonsConfiguration:](v17, "initWithETAProvider:headerButtonsConfiguration:", v18, v19);
  headerButtonsSectionController = self->_headerButtonsSectionController;
  self->_headerButtonsSectionController = v20;

  -[MUHeaderButtonsSectionController setPrimaryButtonType:](self->_headerButtonsSectionController, "setPrimaryButtonType:", 0);
  -[MUHeaderButtonsSectionController setDelegate:](self->_headerButtonsSectionController, "setDelegate:", self);
  v22 = self->_headerButtonsSectionController;
  v23 = v3;
  v24 = v22;
  if (v24)
    objc_msgSend(v23, "addObject:", v24);

  if (!-[MUTransitLineItemViewController isLoading](self, "isLoading"))
  {
    -[GEOTransitLineItem mapRegion](self->_transitLineItem, "mapRegion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25 == 0;

    if (!v26)
    {
      v27 = (void *)MEMORY[0x1E0CC1A40];
      _MULocalizedStringFromThisBundle(CFSTR("View [Line Card]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v14;
      v86[1] = 3221225472;
      v86[2] = __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke_2;
      v86[3] = &unk_1E2E027C8;
      objc_copyWeak(&v87, &location);
      objc_msgSend(v27, "actionButtonControllerWithTitle:subTitle:selectedBlock:disabled:symbolName:", v28, 0, v86, 0, CFSTR("map"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[MUHeaderButtonsSectionController setSecondaryButtonController:](self->_headerButtonsSectionController, "setSecondaryButtonController:", v29);
      objc_destroyWeak(&v87);
    }
  }
  v30 = [MUNearestStationSectionController alloc];
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[MUNearestStationSectionController initWithTransitLineItem:etaProvider:](v30, "initWithTransitLineItem:etaProvider:", v31, self->_etaProvider);

  -[MUNearestStationSectionController setNearestStationDelegate:](v32, "setNearestStationDelegate:", self);
  objc_storeStrong((id *)&self->_nearestStationSectionController, v32);
  v33 = v23;
  v76 = v32;
  if (v76)
    objc_msgSend(v33, "addObject:", v76);

  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "hasEncyclopedicInfo");

  if (v35)
  {
    -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "encyclopedicInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    +[MUPlaceDescriptionConfiguration configurationWithEncyclopedicInfo:](MUPlaceDescriptionConfiguration, "configurationWithEncyclopedicInfo:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = [MUPlaceDescriptionSectionController alloc];
    -[MUNearestStationProvider nearestStation](self->_nearbyStationProvider, "nearestStation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[MUPlaceDescriptionSectionController initWithMapItem:configuration:](v39, "initWithMapItem:configuration:", v40, v38);

    -[MUPlaceDescriptionSectionController setActionDelegate:](v41, "setActionDelegate:", self);
    v42 = v33;
    v43 = v41;
    if (v43)
      objc_msgSend(v42, "addObject:", v43);

  }
  v44 = [MUTransitLineIncidentsSectionController alloc];
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[MUTransitLineIncidentsSectionController initWithTransitLineItem:](v44, "initWithTransitLineItem:", v45);

  -[MUTransitLineIncidentsSectionController setIncidentsDelegate:](v46, "setIncidentsDelegate:", self);
  v47 = v33;
  v75 = v46;
  if (v75)
    objc_msgSend(v47, "addObject:", v75);

  -[MUTransitLineItemViewController _footerSectionController](self, "_footerSectionController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v47;
  v49 = v48;
  if (v49)
    objc_msgSend(v77, "addObject:", v49);

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v72 = 968;
  v50 = self->_sectionControllers;
  v51 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (v51)
  {
    v52 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v83 != v52)
          objc_enumerationMutation(v50);
        v54 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v54, "sectionViewController");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55 == 0;

          if (!v56)
          {
            objc_msgSend(v54, "sectionViewController");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "removeFromParentViewController");

          }
        }
      }
      v51 = -[NSArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    }
    while (v51);
  }

  v58 = (NSArray *)objc_msgSend(v77, "copy");
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v58;

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v60 = self->_sectionControllers;
  v61 = -[NSArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v79;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v79 != v62)
          objc_enumerationMutation(v60);
        v64 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
        if (objc_msgSend(v64, "hasContent", v72, v73))
        {
          objc_msgSend(v64, "sectionView");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v65 == 0;

          if (!v66)
          {
            objc_msgSend(v64, "sectionView");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v67);

          }
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v64, "sectionViewController");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v68 == 0;

          if (!v69)
          {
            objc_msgSend(v64, "sectionViewController");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[MUTransitLineItemViewController addChildViewController:](self, "addChildViewController:", v70);

            objc_msgSend(v64, "sectionViewController");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "didMoveToParentViewController:", self);

          }
        }
        objc_msgSend(v64, "setActive:", 1);
      }
      v61 = -[NSArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    }
    while (v61);
  }

  -[MUScrollableStackView setArrangedSubviews:](self->_contentStackView, "setArrangedSubviews:", v4);
  objc_destroyWeak(v73);
  objc_destroyWeak(&location);

}

double __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lineItemViewControllerHeaderTitleTrailingConstant:", v2);
    v5 = v4;

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

void __60__MUTransitLineItemViewController__updateSectionControllers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lineItemViewControllerDidSelectViewOnMap:", v3);

    WeakRetained = v3;
  }

}

- (id)_footerSectionController
{
  MUTransitFooterActionsSectionController *v3;
  void *v4;
  MUTransitFooterActionsSectionController *v5;

  v3 = [MUTransitFooterActionsSectionController alloc];
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUTransitFooterActionsSectionController initWithTransitLineItem:actionManager:](v3, "initWithTransitLineItem:actionManager:", v4, self->_actionManager);

  return v5;
}

- (void)_fetchNearestStation
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  MUHeaderButtonsSectionController *headerButtonsSectionController;
  MKETAProvider *etaProvider;
  void *v9;
  MUNearestStationSectionController *nearestStationSectionController;
  void *v11;
  void *v12;
  MUNearestStationProvider *nearbyStationProvider;
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "muid");
  v5 = -[MUNearestStationProvider lastRequestedNearestID](self->_nearbyStationProvider, "lastRequestedNearestID");

  if (v4 == v5)
  {
    -[MUNearestStationProvider nearestStation](self->_nearbyStationProvider, "nearestStation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    headerButtonsSectionController = self->_headerButtonsSectionController;
    if (v6)
    {
      -[MUHeaderButtonsSectionController setPrimaryButtonType:](headerButtonsSectionController, "setPrimaryButtonType:", 1);
      etaProvider = self->_etaProvider;
      -[MUNearestStationProvider nearestStation](self->_nearbyStationProvider, "nearestStation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKETAProvider configureWithNearestStationMapItem:](etaProvider, "configureWithNearestStationMapItem:", v9);

      nearestStationSectionController = self->_nearestStationSectionController;
      -[MUNearestStationProvider nearestStation](self->_nearbyStationProvider, "nearestStation");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[MUNearestStationSectionController updateWithMapItem:isLoading:](nearestStationSectionController, "updateWithMapItem:isLoading:", v14, 0);

      return;
    }
    -[MUHeaderButtonsSectionController setPrimaryButtonType:](headerButtonsSectionController, "setPrimaryButtonType:", 0);
    -[MKETAProvider cancel](self->_etaProvider, "cancel");
  }
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MKMapItemIdentifierFromGEOTransitLine();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  nearbyStationProvider = self->_nearbyStationProvider;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__MUTransitLineItemViewController__fetchNearestStation__block_invoke;
  v15[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v16, &location);
  -[MUNearestStationProvider fetchStationForLineItemIdentifier:completion:](nearbyStationProvider, "fetchStationForLineItemIdentifier:completion:", v12, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __55__MUTransitLineItemViewController__fetchNearestStation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)*((_QWORD *)WeakRetained + 126);
    v4 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 125), "nearestStation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWithMapItem:isLoading:", v3, 0);

    WeakRetained = v4;
  }

}

- (void)resetNearestStation
{
  -[MUNearestStationProvider resetNearestStation](self->_nearbyStationProvider, "resetNearestStation");
  -[MUHeaderButtonsSectionController setPrimaryButtonType:](self->_headerButtonsSectionController, "setPrimaryButtonType:", 0);
  -[MKETAProvider configureWithNearestStationMapItem:](self->_etaProvider, "configureWithNearestStationMapItem:", 0);
  -[MUNearestStationSectionController updateWithMapItem:isLoading:](self->_nearestStationSectionController, "updateWithMapItem:isLoading:", 0, 0);
}

- (void)_attachLoadingOverlayIfNeeded
{
  MULoadingOverlayController *loadingOverlayController;
  MULoadingOverlayController *v4;
  void *v5;
  MULoadingOverlayController *v6;
  MULoadingOverlayController *v7;

  if (-[MUTransitLineItemViewController isLoading](self, "isLoading"))
  {
    loadingOverlayController = self->_loadingOverlayController;
    if (!loadingOverlayController)
    {
      v4 = [MULoadingOverlayController alloc];
      -[MUTransitLineItemViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[MULoadingOverlayController initWithParentView:contentView:](v4, "initWithParentView:contentView:", v5, self->_contentStackView);
      v7 = self->_loadingOverlayController;
      self->_loadingOverlayController = v6;

      loadingOverlayController = self->_loadingOverlayController;
    }
    -[MULoadingOverlayController attachLoadingOverlay](loadingOverlayController, "attachLoadingOverlay");
  }
}

- (void)_removeLoadingOverlayIfNeeded
{
  -[MULoadingOverlayController removeLoadingOverlayAnimated:completion:](self->_loadingOverlayController, "removeLoadingOverlayAnimated:completion:", 1, 0);
}

- (void)lineItemManager:(id)a3 didSelectReportAProblemWithEnvironment:(id)a4
{
  id v5;

  -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 5013, 0, 0);
  -[MUTransitLineItemViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineItemViewControllerDidSelectReportAProblem:", self);

}

- (void)placeDescriptionSectionControllerDidTapAttribution:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encyclopedicInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encyclopedicAttribution");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CC1A30];
  -[MUTransitLineItemViewController transitLineItem](self, "transitLineItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encyclopedicInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributionFromEncyclopedicInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "attributionURLs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUTransitLineItemViewController _openAttributionURLStrings:usingAttribution:](self, "_openAttributionURLStrings:usingAttribution:", v10, v9);

}

- (void)_openAttributionURLStrings:(id)a3 usingAttribution:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      v18 = v7;
      v19 = v6;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "scheme");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", CFSTR("http")))
          {

LABEL_13:
            -[MUTransitLineItemViewController delegate](self, "delegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "lineItemViewController:openURL:", self, v13);

            v7 = v18;
            v6 = v19;
            goto LABEL_14;
          }
          objc_msgSend(v13, "scheme");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("https"));

          if (v16)
            goto LABEL_13;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v7 = v18;
        v6 = v19;
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0CC1758], "launchAttributionURLs:withAttribution:completionHandler:", v8, v7, 0);
  }
LABEL_14:

}

+ (double)headerHeightInMinimalMode
{
  double result;

  +[MUPlaceHeaderView minimalModeHeight](MUPlaceHeaderView, "minimalModeHeight");
  return result;
}

- (void)hideTitle:(BOOL)a3
{
  -[MUPlaceHeaderView hideTitle:](self->_headerView, "hideTitle:", a3);
}

- (id)createMenuActions
{
  return -[MUTransitLineItemActionManager createRowActionsWithStyle:](self->_actionManager, "createRowActionsWithStyle:", 0);
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  -[MUTransitLineItemActionManager performAction:options:completion:](self->_actionManager, "performAction:options:completion:", a3, a4, a5);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_contentStackView;
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[MUScrollableStackView adjustedContentInset](self->_contentStackView, "adjustedContentInset");
  v8 = v5 - v7;
  -[MUScrollableStackView adjustedContentInset](self->_contentStackView, "adjustedContentInset");
  -[MUScrollableStackView setContentOffset:animated:](self->_contentStackView, "setContentOffset:animated:", v3, v8, v6 - v9);
}

- (double)currentHeight
{
  double v2;

  -[MUScrollableStackView contentSize](self->_contentStackView, "contentSize");
  return v2;
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUTransitLineItemViewController scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUTransitLineItemViewController scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewDidScroll:", v7);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MUTransitLineItemViewController scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MUTransitLineItemViewController scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewWillBeginDragging:", v7);

  }
}

- (void)setAutomobileOptions:(id)a3
{
  GEOAutomobileOptions *v5;
  GEOAutomobileOptions *v6;

  v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    -[MKETAProvider setAutomobileOptions:](self->_etaProvider, "setAutomobileOptions:", self->_automobileOptions);
    v5 = v6;
  }

}

- (void)setWalkingOptions:(id)a3
{
  GEOWalkingOptions *v5;
  GEOWalkingOptions *v6;

  v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    -[MKETAProvider setWalkingOptions:](self->_etaProvider, "setWalkingOptions:", self->_walkingOptions);
    v5 = v6;
  }

}

- (void)setTransitOptions:(id)a3
{
  GEOTransitOptions *v5;
  GEOTransitOptions *v6;

  v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_transitOptions, a3);
    -[MKETAProvider setTransitOptions:](self->_etaProvider, "setTransitOptions:", self->_transitOptions);
    v5 = v6;
  }

}

- (void)setCyclingOptions:(id)a3
{
  GEOCyclingOptions *v5;
  GEOCyclingOptions *v6;

  v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    -[MKETAProvider setCyclingOptions:](self->_etaProvider, "setCyclingOptions:", self->_cyclingOptions);
    v5 = v6;
  }

}

- (void)headerButtonsSectionControllerDidUpdateContent:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  MUScrollableStackView *contentStackView;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if (self->_headerView)
    objc_msgSend(v4, "addObject:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_sectionControllers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasContent", (_QWORD)v16))
        {
          objc_msgSend(v11, "sectionView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "sectionView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  contentStackView = self->_contentStackView;
  v15 = (void *)objc_msgSend(v5, "copy");
  -[MUScrollableStackView setArrangedSubviews:](contentStackView, "setArrangedSubviews:", v15);

}

- (void)headerButtonsSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  if (a4 == 1)
  {
    -[MUNearestStationProvider nearestStation](self->_nearbyStationProvider, "nearestStation", a3, 1, a5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[MUTransitLineItemViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKETAProvider transportTypePreferenceNumber](self->_etaProvider, "transportTypePreferenceNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lineItemViewController:didSelectDirectionsToNearestStation:withTransportTypePreference:", self, v8, v7);

      -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 6003, 0, 0);
    }

  }
}

- (void)nearestStationSectionController:(id)a3 didTapStationItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUTransitLineItemViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineItemViewController:didSelectNearestStation:", self, v5);

}

- (void)nearestStationSectionController:(id)a3 didSelectStationAttributionURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUTransitLineItemViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineItemViewController:openURL:", self, v5);

}

- (void)incidentsSectionController:(id)a3 didSelectDetailsForIncidents:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUTransitLineItemViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineItemViewController:didSelectDetailsForIncidents:", self, v5);

}

- (int)mapTypeForETAProvider:(id)a3
{
  return 4;
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
  -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, 201, a4, *(_QWORD *)&a5, 0);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
  -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, 201, a4, *(_QWORD *)&a5, a6);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
  -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, 0, *(_QWORD *)&a6, a7);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 actionRichProviderId:(id)a9
{
  uint64_t v9;

  LODWORD(v9) = a8;
  -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, a7, 0, v9, a9);
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;

  v15 = *(_QWORD *)&a3;
  v16 = (void *)MEMORY[0x1E0CC1848];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  objc_msgSend(v16, "sharedService");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = a8;
  objc_msgSend(v21, "captureTransitPlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", v15, 201, 0, 0, a4, a5, CFAbsoluteTimeGetCurrent(), 0, -1, v20, v19, v18, v17);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v13 = *(_QWORD *)&a4;
  v14 = *(_QWORD *)&a3;
  v23[1] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = v18;
  if (v18)
  {
    v23[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 6;
  objc_msgSend(v21, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", v14, v13, v15, 0, 0xFFFFFFFFLL, 0, CFAbsoluteTimeGetCurrent(), 0, 0, v16, v17, v22, 0, 0, 0,
    v20,
    0,
    0);

}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  uint64_t v8;

  LODWORD(v8) = a7;
  -[MUTransitLineItemViewController infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:actionURL:photoID:moduleMetadata:feedbackDelegateSelector:actionRichProviderId:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, 0, 0, a6, v8, a8);
}

- (id)draggableContent
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (UIView)draggableHeaderView
{
  return (UIView *)self->_headerView;
}

- (UIView)viewForHeaderContainmentString
{
  return -[MUPlaceHeaderView viewForContainmentString](self->_headerView, "viewForContainmentString");
}

- (void)updateHeaderTrailingConstant
{
  -[MUPlaceHeaderView reloadTrailingConstraint](self->_headerView, "reloadTrailingConstraint");
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (GEOTransitLineItem)transitLineItem
{
  return self->_transitLineItem;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (MUTransitLineItemViewControllerDelegate)delegate
{
  return (MUTransitLineItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MUHeaderButtonsSectionController)headerButtonsSectionController
{
  return self->_headerButtonsSectionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerButtonsSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitLineItem, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_loadingOverlayController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_lastNearestRequestErrorMessage, 0);
  objc_storeStrong((id *)&self->_nearestStationSectionController, 0);
  objc_storeStrong((id *)&self->_nearbyStationProvider, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
}

@end
