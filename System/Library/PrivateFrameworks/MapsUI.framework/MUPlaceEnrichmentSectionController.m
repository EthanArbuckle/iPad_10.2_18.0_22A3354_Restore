@implementation MUPlaceEnrichmentSectionController

- (MUPlaceEnrichmentSectionController)initWithMapItem:(id)a3 actionManager:(id)a4 dataAvailability:(id)a5 amsResultProvider:(id)a6 callToActionDelegate:(id)a7 externalActionHandler:(id)a8 rapActionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MUPlaceEnrichmentSectionController *v21;
  NSObject *v22;
  MUWebContentViewController *v23;
  MUWebContentViewController *webContentViewController;
  MUPlaceEnrichmentActionManager *v25;
  MUPlaceEnrichmentSectionController *v26;
  uint64_t v27;
  MUPlaceEnrichmentActionManager *actionManager;
  NSObject *v29;
  _QWORD v31[4];
  MUPlaceEnrichmentSectionController *v32;
  uint8_t buf[16];
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)MUPlaceEnrichmentSectionController;
  v21 = -[MUPlaceSectionController initWithMapItem:](&v34, sel_initWithMapItem_, v15);
  if (v21)
  {
    MUGetPlaceCardLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceEnrichmentSectionController", ", buf, 2u);
    }

    v21->_shouldRemoveWebContent = 0;
    v23 = objc_alloc_init(MUWebContentViewController);
    webContentViewController = v21->_webContentViewController;
    v21->_webContentViewController = v23;

    v25 = [MUPlaceEnrichmentActionManager alloc];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __163__MUPlaceEnrichmentSectionController_initWithMapItem_actionManager_dataAvailability_amsResultProvider_callToActionDelegate_externalActionHandler_rapActionHandler___block_invoke;
    v31[3] = &unk_1E2E02D88;
    v26 = v21;
    v32 = v26;
    v27 = -[MUPlaceEnrichmentActionManager initWithPlaceActionManager:mapItem:dataAvailability:amsResultProvider:callToActionDelegate:contextMenuDelegate:externalActionHandler:analyticsDelegate:onActionUpdate:](v25, "initWithPlaceActionManager:mapItem:dataAvailability:amsResultProvider:callToActionDelegate:contextMenuDelegate:externalActionHandler:analyticsDelegate:onActionUpdate:", v16, v15, v17, v18, v19, v26, v20, v26, v31);
    actionManager = v26->_actionManager;
    v26->_actionManager = (MUPlaceEnrichmentActionManager *)v27;

    -[MUPlaceEnrichmentSectionController _setupPlaceEnrichmentViewController](v26, "_setupPlaceEnrichmentViewController");
    MUGetPlaceCardLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceEnrichmentSectionController", ", buf, 2u);
    }

  }
  return v21;
}

void __163__MUPlaceEnrichmentSectionController_initWithMapItem_actionManager_dataAvailability_amsResultProvider_callToActionDelegate_externalActionHandler_rapActionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(*(id *)(a1 + 32), "updateActionsOverWebBridge:", v3);

}

- (void)_setupPlaceEnrichmentViewController
{
  MUPlaceSectionView *v3;
  MUPlaceSectionView *sectionView;
  void *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  void *v35;
  MUPlaceEnrichmentSectionController *v36;
  id v37;
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[MUWebContentViewController setDelegate:](self->_webContentViewController, "setDelegate:", self);
  if (!self->_sectionView)
  {
    v3 = -[MUPlaceSectionView initWithStyle:alwaysHideSeparators:]([MUPlaceSectionView alloc], "initWithStyle:alwaysHideSeparators:", 0, 0);
    sectionView = self->_sectionView;
    self->_sectionView = v3;

    -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  }
  +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __73__MUPlaceEnrichmentSectionController__setupPlaceEnrichmentViewController__block_invoke;
  v35 = &unk_1E2E01730;
  v36 = self;
  v6 = v5;
  v37 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(&v32);
  objc_msgSend(v6, "mapItem", v32, v33, v34, v35, v36);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    if (objc_msgSend(v6, "currentState"))
    {
      switch(objc_msgSend(v6, "currentState"))
      {
        case 0:
          MUGetMUPlaceEnrichmentSectionControllerLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            goto LABEL_11;
          -[MUPlaceSectionController mapItem](self, "mapItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_identifier");
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = CFSTR("Unknown");
          v40 = 2112;
          v41 = v15;
          _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So Configuring with identifier: %@", buf, 0x16u);
          goto LABEL_10;
        case 1:
          MUGetMUPlaceEnrichmentSectionControllerLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            -[MUPlaceSectionController mapItem](self, "mapItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "_identifier");
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = CFSTR("Initialized");
            v40 = 2112;
            v41 = v21;
            _os_log_impl(&dword_191DB8000, v19, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So asking to fetch enrichment for identifier: %@", buf, 0x16u);

          }
          goto LABEL_12;
        case 2:
          MUGetMUPlaceEnrichmentSectionControllerLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            -[MUPlaceSectionController mapItem](self, "mapItem");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_identifier");
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = CFSTR("Loading");
            v40 = 2112;
            v41 = v24;
            _os_log_impl(&dword_191DB8000, v22, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So asking to register for enrichment updates for identifier: %@", buf, 0x16u);

          }
          objc_msgSend(v6, "registerObserver:", self);
          break;
        case 3:
          MUGetMUPlaceEnrichmentSectionControllerLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            -[MUPlaceSectionController mapItem](self, "mapItem");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "_identifier");
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = CFSTR("ReadyWithData");
            v40 = 2112;
            v41 = v27;
            _os_log_impl(&dword_191DB8000, v25, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So using enrichment for identifier: %@", buf, 0x16u);

          }
          objc_msgSend(v6, "placeEnrichmentData");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlaceEnrichmentSectionController setEnrichmentData:](self, "setEnrichmentData:", v28);

          break;
        case 4:
          MUGetMUPlaceEnrichmentSectionControllerLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            -[MUPlaceSectionController mapItem](self, "mapItem");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "_identifier");
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v39 = CFSTR("Error");
            v40 = 2112;
            v41 = v31;
            _os_log_impl(&dword_191DB8000, v29, OS_LOG_TYPE_DEBUG, "API Controller is in state: %@. So asking to remove enrichment module for identifier: %@", buf, 0x16u);

          }
          -[MUPlaceEnrichmentSectionController removeWebContentViewController:arguments:](self, "removeWebContentViewController:arguments:", self->_webContentViewController, 0);
          break;
        default:
          break;
      }
    }
  }
  else
  {
    MUGetMUPlaceEnrichmentSectionControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_identifier");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_identifier");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v15;
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_DEBUG, "Unequal mapitems. API controller was holding identifier: %@ but placecard wants to show identifier: %@", buf, 0x16u);

LABEL_10:
    }
LABEL_11:

    -[MUPlaceSectionController mapItem](self, "mapItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configureWithMapItem:traits:", v18, 0);

LABEL_12:
    v7[2](v7);
  }

}

uint64_t __73__MUPlaceEnrichmentSectionController__setupPlaceEnrichmentViewController__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MUGetMUPlaceEnrichmentSectionControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_191DB8000, v2, OS_LOG_TYPE_DEBUG, "Fetching Enrichment information for identifier: %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "registerObserver:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "fetchPlaceEnrichment:", 0);
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_webContentViewController;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)refreshPlaceEnrichment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint8_t v14[16];
  uint8_t buf[16];

  +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  objc_msgSend(v3, "placeEnrichmentData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentSectionController enrichmentData](self, "enrichmentData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  MUGetMUPlaceEnrichmentSectionControllerLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v8 && v11)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v12, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentSectionController was informed to refresh place enrichment but all the information is same. So no-operation here.", buf, 2u);
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_191DB8000, v12, OS_LOG_TYPE_DEBUG, "MUPlaceEnrichmentSectionController was informed to refresh place enrichment.", v14, 2u);
    }

    -[MUPlaceEnrichmentSectionController _setupPlaceEnrichmentViewController](self, "_setupPlaceEnrichmentViewController");
    -[MUPlaceSectionController delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject placeSectionControllerDidUpdateContent:](v12, "placeSectionControllerDidUpdateContent:", self);
  }

}

- (void)updateActionsOverWebBridge:(id)a3
{
  -[MUWebContentViewController updateActionOverBridge:](self->_webContentViewController, "updateActionOverBridge:", a3);
}

- (BOOL)hasContent
{
  MUWebContentViewController *webContentViewController;

  webContentViewController = self->_webContentViewController;
  if (webContentViewController)
    LOBYTE(webContentViewController) = -[MUWebContentViewController isLoading](webContentViewController, "isLoading")
                                    || !self->_shouldRemoveWebContent;
  return (char)webContentViewController;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceCardPlaceActionDetailsShowcaseId:", 0);

  v5.receiver = self;
  v5.super_class = (Class)MUPlaceEnrichmentSectionController;
  -[MUPlaceEnrichmentSectionController dealloc](&v5, sel_dealloc);
}

- (void)placeEnrichmentAPIContollerDidFetchEnrichmentData:(id)a3 forMapItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v8, "isEqual:", v9);
  if ((_DWORD)v6)
  {
    -[MUPlaceEnrichmentSectionController setEnrichmentData:](self, "setEnrichmentData:", v11);
    +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterObserver:", self);

  }
}

- (void)setEnrichmentData:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MUPresentationOptions *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  MUWebContentViewController *webContentViewController;
  void *v25;
  MUPlaceSectionView *sectionView;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  objc_msgSend(v29, "enrichmentEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enrichmentHtml");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentSectionController enrichmentData](self, "enrichmentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrichmentEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enrichmentHtml");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "isEqualToString:", v11);

  v13 = v29;
  if ((v12 & 1) == 0)
  {
    objc_msgSend(v29, "enrichmentEntities");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enrichmentHtml");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_storeStrong((id *)&self->_enrichmentData, a3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:", CFSTR("MUPlaceEnrichmentSectionControllerDidFetchEnrichmentNotification"), self);

      v18 = objc_alloc_init(MUPresentationOptions);
      -[MUPresentationOptions setPresentingViewController:](v18, "setPresentingViewController:", self->_webContentViewController);
      -[MUPresentationOptions setSourceView:](v18, "setSourceView:", self->_sectionView);
      -[MUPlaceSectionView frame](self->_sectionView, "frame");
      -[MUPresentationOptions setSourceRect:](v18, "setSourceRect:");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:", CFSTR("MUPlaceEnrichmentSectionControllerDidStartLoadingNotification"), self);

      -[MUPlaceEnrichmentSectionController actionManager](self, "actionManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "configureWithEnrichmentDataProvider:presentationOptions:", v21, v18);

      v22 = 0.0;
      if (GEOConfigGetBOOL())
      {
        GEOConfigGetDouble();
        v22 = v23;
      }
      webContentViewController = self->_webContentViewController;
      -[MUPlaceEnrichmentSectionController actionManager](self, "actionManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebContentViewController configureWithHTML:actionManager:initialDefaultHeight:](webContentViewController, "configureWithHTML:actionManager:initialDefaultHeight:", v16, v25, v22);

      sectionView = self->_sectionView;
      -[MUWebContentViewController view](self->_webContentViewController, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceSectionView attachViewToContentView:](sectionView, "attachViewToContentView:", v27);

      +[MUPlaceEnrichmentAPIController sharedPlaceEnrichmentAPIController](MUPlaceEnrichmentAPIController, "sharedPlaceEnrichmentAPIController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "cancelFetchingPlaceEnrichment");

    }
    v13 = v29;
  }

}

- (BOOL)isWebContentViewControllerParentPlacecardLoading:(id)a3
{
  return 0;
}

- (void)removeWebContentViewController:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  self->_shouldRemoveWebContent = 1;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suppressionReason"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suppressionReason"));
        v10 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v10;
        if (v10)
          v26 = -[MUPlaceEnrichmentSectionController analyticSuppressionReasonFrom:](self, "analyticSuppressionReasonFrom:", v10);
        else
          v26 = 0;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appCategory"));
        v11 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v11;
        if (v11)
        {
          v12 = v11;
          v13 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v13, "setNumberStyle:", 1);
          -[MUPlaceEnrichmentSectionController actionManager](self, "actionManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "adamIDForAppCategory:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberFromString:", v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = 0;
        }
        v28 = (void *)MEMORY[0x1E0D263E8];
        -[MUPlaceSectionController mapItem](self, "mapItem");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v29, "_muid");
        -[MUPlaceSectionController mapItem](self, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_resultProviderID");
        -[MUPlaceEnrichmentSectionController enrichmentData](self, "enrichmentData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "enrichmentEntities");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "enrichmentInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "showcaseId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "captureShowcaseSuppressionEventWithBusinessId:localSearchProviderID:showcaseId:adamId:suppressionReason:", v27, v17, v22, v25, v26);

      }
    }
  }
  MUGetPlaceCardLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191DB8000, v23, OS_LOG_TYPE_INFO, "MUPlaceWebContentSectionController: Webmodule requested removal, will tell parent to update", buf, 2u);
  }

  -[MUPlaceSectionController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "placeSectionControllerDidUpdateContent:", self);

}

- (void)webContentViewController:(id)a3 performHeightChangeWithBlock:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_initWeak(&location, self);
  v12 = (void *)MEMORY[0x1E0DC3F10];
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke;
  v19[3] = &unk_1E2E020B8;
  objc_copyWeak(&v21, &location);
  v19[4] = self;
  v14 = v10;
  v20 = v14;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2;
  v16[3] = &unk_1E2E02260;
  objc_copyWeak(&v18, &location);
  v15 = v11;
  v17 = v15;
  objc_msgSend(v12, "_mapsui_animateWithDuration:animations:completion:", v19, v16, 0.3);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeSectionControllerRequestsRootView:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(v4, "_mapsui_layoutIfNeeded");

    WeakRetained = v5;
  }

}

void __112__MUPlaceEnrichmentSectionController_webContentViewController_performHeightChangeWithBlock_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "placeSectionControllerRequestsLayoutChange:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }

}

- (void)webContentViewControllerDidStopLoading:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MUPlaceEnrichmentSectionControllerDidFinishLoadingNotification"), self);

  -[MUPlaceEnrichmentSectionController placeEnrichmentDelegate](self, "placeEnrichmentDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeEnrichmentSectionControllerDidStopLoading:", self);

}

- (id)draggableContent
{
  return 0;
}

- (int)analyticsModuleType
{
  return 40;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D27470]);
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_enrichmentInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showcaseId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v4, "setShowcaseId:", v7);
    objc_msgSend(v8, "setShowcase:", v4);
  }

}

- (void)didTapAddPhoto
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 2147, CFSTR("business info"), 0);
}

- (void)didTapRatePlace
{
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 99, CFSTR("business info"), 0);
}

- (void)addContextMenuUsingBoundingBox:(id)a3 accessibilityLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  MUPlaceEnrichmentContextMenu *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E2E145A8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E2E145C8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E2E14588);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x1E2E14568);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  -[MUPlaceEnrichmentSectionController contextMenuButton](self, "contextMenuButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  MUGetMUPlaceEnrichmentSectionControllerLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22)
    {
      -[MUPlaceEnrichmentSectionController contextMenuButton](self, "contextMenuButton");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      NSStringFromCGRect(v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41.origin.x = v10;
      v41.origin.y = v13;
      v41.size.width = v16;
      v41.size.height = v19;
      NSStringFromCGRect(v41);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138412546;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_191DB8000, v21, OS_LOG_TYPE_DEBUG, "Context menu button alreadyd exists; changing boundingBox (from:%@) -> (to:%@)",
        (uint8_t *)&v35,
        0x16u);

    }
    -[MUPlaceEnrichmentSectionController contextMenuButton](self, "contextMenuButton");
    v26 = (MUPlaceEnrichmentContextMenu *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceEnrichmentContextMenu setFrame:](v26, "setFrame:", v10, v13, v16, v19);
  }
  else
  {
    if (v22)
    {
      v35 = 138412290;
      v36 = v6;
      _os_log_impl(&dword_191DB8000, v21, OS_LOG_TYPE_DEBUG, "Trying to add a context menu button at: %@", (uint8_t *)&v35, 0xCu);
    }

    v26 = -[MUPlaceEnrichmentContextMenu initWithFrame:]([MUPlaceEnrichmentContextMenu alloc], "initWithFrame:", v10, v13, v16, v19);
    if (GEOConfigGetBOOL())
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceEnrichmentContextMenu setBackgroundColor:](v26, "setBackgroundColor:", v27);

      -[MUPlaceEnrichmentContextMenu setAlpha:](v26, "setAlpha:", 0.1);
    }
    -[MUPlaceEnrichmentContextMenu setIsAccessibilityElement:](v26, "setIsAccessibilityElement:", 1);
    -[MUPlaceEnrichmentContextMenu setAccessibilityTraits:](v26, "setAccessibilityTraits:", *MEMORY[0x1E0DC4660]);
    -[MUPlaceEnrichmentContextMenu setAccessibilityLabel:](v26, "setAccessibilityLabel:", v7);
    -[MUPlaceEnrichmentContextMenu setAccessibilityIdentifier:](v26, "setAccessibilityIdentifier:", v7);
    -[MUPlaceEnrichmentContextMenu setContextMenuDelegate:](v26, "setContextMenuDelegate:", self);
    -[MUPlaceEnrichmentSectionController actionManager](self, "actionManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceEnrichmentContextMenu setEnrichmentActionDelegate:](v26, "setEnrichmentActionDelegate:", v28);

    -[MUPlaceEnrichmentSectionController sectionView](self, "sectionView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v26);

    -[MUPlaceEnrichmentSectionController setContextMenuButton:](self, "setContextMenuButton:", v26);
    -[GEOEnrichmentData enrichmentEntities](self->_enrichmentData, "enrichmentEntities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "enrichmentInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "showcaseId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D263F0], "sharedData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPlaceCardPlaceActionDetailsShowcaseId:", v33);

    -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", 6111, v33, 0);
  }

}

- (void)didLayoutContextMenu:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;

  -[MUPlaceEnrichmentSectionController setContextMenuAction:](self, "setContextMenuAction:", a3, a4);
  -[MUPlaceEnrichmentSectionController contextMenuAction](self, "contextMenuAction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceEnrichmentSectionController contextMenuButton](self, "contextMenuButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContextMenuAction:", v6);

}

- (int)analyticSuppressionReasonFrom:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_DIRECTIONS_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_APP_EXTENSION_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_APP_CLIP_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_APP_QUICK_LINK_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_PHONE_NUMBER_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_MESSAGE_URL_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_WEBSITE_URL_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_ARP_RATING_UNSUPPORTED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ENRICHMENT_SUPPRESSION_REASON_ARP_PHOTOS_UNSUPPORTED")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (MUPlaceEnrichmentSectionControllerDelegate)placeEnrichmentDelegate
{
  return (MUPlaceEnrichmentSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_placeEnrichmentDelegate);
}

- (void)setPlaceEnrichmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeEnrichmentDelegate, a3);
}

- (GEOEnrichmentData)enrichmentData
{
  return self->_enrichmentData;
}

- (MUPlaceEnrichmentActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (MUPlaceEnrichmentAction)contextMenuAction
{
  return self->_contextMenuAction;
}

- (void)setContextMenuAction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuAction, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (MUPlaceEnrichmentContextMenu)contextMenuButton
{
  return self->_contextMenuButton;
}

- (void)setContextMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuButton, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_contextMenuAction, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_enrichmentData, 0);
  objc_destroyWeak((id *)&self->_placeEnrichmentDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
}

@end
