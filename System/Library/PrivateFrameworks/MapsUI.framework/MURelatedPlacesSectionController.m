@implementation MURelatedPlacesSectionController

- (MURelatedPlacesSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MURelatedPlacesSectionController *v10;
  NSObject *v11;
  NSObject *v12;
  MURelatedPlacesSectionController *v13;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "relatedPlaceList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)MURelatedPlacesSectionController;
    v10 = -[MUPlaceSectionController initWithMapItem:](&v16, sel_initWithMapItem_, v6);
    if (v10)
    {
      MUGetPlaceCardLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191DB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MURelatedPlacesSectionControllerInit", ", buf, 2u);
      }

      objc_storeStrong((id *)&v10->_configuration, a4);
      -[MURelatedPlacesSectionController _setupSectionView](v10, "_setupSectionView");
      -[MURelatedPlacesSectionController _buildInitialContent](v10, "_buildInitialContent");
      MUGetPlaceCardLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_191DB8000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MURelatedPlacesSectionControllerInit", ", buf, 2u);
      }

    }
    self = v10;
    v13 = self;
    goto LABEL_11;
  }
  objc_msgSend(v7, "trailHead");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_4;
  MUGetPlaceCardLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_FAULT, "MURelatedPlacesSectionController: Tried to initialize with no related place list or trail head", buf, 2u);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

- (unint64_t)numInlineItems
{
  int64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t result;

  v3 = -[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource");
  if (v3 == 1)
  {
    -[MURelatedPlaceSectionControllerConfiguration trailHead](self->_configuration, "trailHead");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v3)
  {
    -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = v4;
    v6 = objc_msgSend(v4, "numberOfInlineItems");

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  result = GEOConfigGetUInteger();
  if (v6 < result)
    return v6;
  return result;
}

- (void)_setupSectionView
{
  MUPlaceTilesListView *v3;
  MUPlaceTilesListView *listView;
  void *v5;
  MUPlaceTilesView *v6;
  MUPlaceTilesView *tilesView;
  id v8;

  if (-[MURelatedPlacesSectionController isVertical](self, "isVertical"))
  {
    +[MUPlaceVerticalCardConfiguration separatorConfiguration](MUPlaceVerticalCardConfiguration, "separatorConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[MUPlaceTilesListView initWithConfiguration:]([MUPlaceTilesListView alloc], "initWithConfiguration:", v8);
    listView = self->_listView;
    self->_listView = v3;

    -[MUPlaceTilesListView setTranslatesAutoresizingMaskIntoConstraints:](self->_listView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUPlaceTilesListView setListFeedbackDelegate:](self->_listView, "setListFeedbackDelegate:", self);
  }
  else
  {
    if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
    {
      +[MUPlaceTilesViewConfiguration hikingTrailsConfiguration](MUPlaceTilesViewConfiguration, "hikingTrailsConfiguration");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MURelatedPlaceSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUPlaceTilesViewConfiguration configurationFromModuleConfiguration:](MUPlaceTilesViewConfiguration, "configurationFromModuleConfiguration:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = -[MUPlaceTilesView initWithConfiguration:]([MUPlaceTilesView alloc], "initWithConfiguration:", v8);
    tilesView = self->_tilesView;
    self->_tilesView = v6;

    -[MUPlaceTilesView setTranslatesAutoresizingMaskIntoConstraints:](self->_tilesView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUPlaceTilesView setDelegate:](self->_tilesView, "setDelegate:", self);
    -[MUPlaceTilesView setAnalyticsDelegate:](self->_tilesView, "setAnalyticsDelegate:", self);
  }

}

- (void)_buildInitialContent
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MUPlaceHikingTileViewModel *v14;
  void *v15;
  MUPlaceHikingTileViewModel *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[MURelatedPlacesSectionController needsToPerformRefinement](self, "needsToPerformRefinement"))
  {
    v3 = (void *)objc_opt_new();
    v4 = -[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource");
    if (v4 == 1)
    {
      v17 = v3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[MURelatedPlaceSectionControllerConfiguration trailHead](self->_configuration, "trailHead");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trails");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
            v14 = [MUPlaceHikingTileViewModel alloc];
            -[MUPlaceSectionController mapItem](self, "mapItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[MUPlaceHikingTileViewModel initWithGEOTrail:hikingItemType:](v14, "initWithGEOTrail:hikingItemType:", v13, objc_msgSend(v15, "_mapsui_associatedHikingItemType"));

            objc_msgSend(v6, "addObject:", v16);
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

    }
    else if (v4)
    {
      v6 = v3;
    }
    else
    {
      -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "placeTemplates");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[MURelatedPlacesSectionController _displayTilesForViewModels:](self, "_displayTilesForViewModels:", v6);

  }
}

- (void)_updateWithListFromFollowUpRequest:(id)a3
{
  MUPlaceSectionView *sectionView;
  id v5;

  -[MURelatedPlacesSectionController setRelatedPlaceListFromFollowUpRequest:](self, "setRelatedPlaceListFromFollowUpRequest:", a3);
  sectionView = self->_sectionView;
  self->_sectionView = 0;

  -[MURelatedPlacesSectionController _setupSectionView](self, "_setupSectionView");
  -[MURelatedPlacesSectionController _buildInitialContent](self, "_buildInitialContent");
  -[MURelatedPlacesSectionController _updateSection](self, "_updateSection");
  -[MUPlaceSectionController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeSectionControllerDidUpdateContent:", self);

}

- (BOOL)isVertical
{
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;

  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
    return -[MURelatedPlacesSectionController numInlineItems](self, "numInlineItems") < 3;
  -[MURelatedPlaceSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MURelatedPlaceSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVertical");

    return v6;
  }
  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeTemplates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v9, "count") < 3;

  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[MURelatedPlacesSectionController _updateSection](self, "_updateSection");
  }
}

- (void)_updateSection
{
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "followUpRequestMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearchRequestForNearbyPlaces");

  if (v5)
  {
    if (-[MURelatedPlacesSectionController isActive](self, "isActive"))
    {
      if (-[MURelatedPlacesSectionController isFollowUpRequestInProgress](self, "isFollowUpRequestInProgress"))
        return;
      if (!-[MURelatedPlacesSectionController hasFetchedFollowUpRequest](self, "hasFetchedFollowUpRequest"))
      {
        -[MURelatedPlacesSectionController performNearbyPlacesFollowUpRequest](self, "performNearbyPlacesFollowUpRequest");
        return;
      }
    }
    else
    {
      -[MURelatedPlacesSectionController _cancelFollowUpRequestIfNeeded](self, "_cancelFollowUpRequestIfNeeded");
    }
  }
  if (-[MURelatedPlacesSectionController needsToPerformRefinement](self, "needsToPerformRefinement"))
  {
    v6 = -[MURelatedPlacesSectionController isActive](self, "isActive");
    -[MURelatedPlacesSectionController _cancelPlaceRefinementIfNeeded](self, "_cancelPlaceRefinementIfNeeded");
    if (v6)
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__MURelatedPlacesSectionController__updateSection__block_invoke;
      v7[3] = &unk_1E2E01A88;
      objc_copyWeak(&v8, &location);
      -[MURelatedPlacesSectionController _refineRelatedPlaceListWithCompletion:](self, "_refineRelatedPlaceListWithCompletion:", v7);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __50__MURelatedPlacesSectionController__updateSection__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *WeakRetained;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    v7 = objc_msgSend(v10, "copy");
    v8 = (void *)v6[11];
    v6[11] = v7;

    objc_msgSend(v6, "_displayTilesForViewModels:", v6[11]);
    objc_msgSend(v6, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeSectionControllerDidUpdateContent:", v6);

  }
}

- (void)_displayTilesForViewModels:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v5 = -[MURelatedPlacesSectionController numInlineItems](self, "numInlineItems");
  v6 = objc_msgSend(v4, "count");
  if (v6 >= v5)
    v7 = v5;
  else
    v7 = v6;
  objc_msgSend(v4, "subarrayWithRange:", 0, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (-[MURelatedPlacesSectionController isVertical](self, "isVertical"))
  {
    -[MUPlaceTilesListView setViewModels:](self->_listView, "setViewModels:", v8);
  }
  else
  {
    -[MUPlaceTilesView setViewModels:](self->_tilesView, "setViewModels:", v8);
    -[MUPlaceTilesView displayPlaceTiles](self->_tilesView, "displayPlaceTiles");
  }

}

- (void)performNearbyPlacesFollowUpRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MKMapServiceTicket *v12;
  MKMapServiceTicket *nearbyPlacesTicket;
  MKMapServiceTicket *v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[MURelatedPlacesSectionController setIsFollowUpRequestInProgress:](self, "setIsFollowUpRequestInProgress:", 1);
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapsCategoryId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0D27500]);
  objc_msgSend(v8, "setSearchImplicitType:", 2);
  objc_msgSend(v7, "setSearchImplicitFilterInfo:", v8);
  objc_msgSend(v7, "setSearchOriginationType:", 3);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchAroundPOITicketWithIdentifier:categoryID:maxResults:traits:", v11, v5, 100, v7);
  v12 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  nearbyPlacesTicket = self->_nearbyPlacesTicket;
  self->_nearbyPlacesTicket = v12;

  v14 = self->_nearbyPlacesTicket;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__MURelatedPlacesSectionController_performNearbyPlacesFollowUpRequest__block_invoke;
  v15[3] = &unk_1E2E01A88;
  objc_copyWeak(&v16, &location);
  -[MKMapServiceTicket submitWithHandler:networkActivity:](v14, "submitWithHandler:networkActivity:", v15, 0);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __70__MURelatedPlacesSectionController_performNearbyPlacesFollowUpRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setIsFollowUpRequestInProgress:", 0);
    objc_msgSend(v8, "setHasFetchedFollowUpRequest:", v6 == 0);
    if (v6)
    {
      MUGetPlaceCardLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "mapItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134218242;
        v23 = objc_msgSend(v10, "_muid");
        v24 = 2112;
        v25 = (uint64_t)v6;
        _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_ERROR, "MURelatedPlacesSectionController: Error Fetching nearby places via follow-up request: muid: %llu, %@", (uint8_t *)&v22, 0x16u);

      }
    }
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_relatedPlaceLists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    MUGetPlaceCardLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "mapItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_muid");
        objc_msgSend(v13, "placeTemplates");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        v22 = 134218240;
        v23 = v17;
        v24 = 2048;
        v25 = v19;
        _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_INFO, "MURelatedPlacesSectionController: Follow-Up request for muid: %llu succeeded with %lu template items", (uint8_t *)&v22, 0x16u);

      }
      objc_msgSend(v8, "_updateWithListFromFollowUpRequest:", v13);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "mapItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "_muid");
        v22 = 134217984;
        v23 = v21;
        _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_ERROR, "MURelatedPlacesSectionController: Follow-up request for muid: %llu succeeded but did not return relatedPlaceList", (uint8_t *)&v22, 0xCu);

      }
    }

  }
}

- (BOOL)hasContent
{
  int64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource");
  if (v3 == 1)
  {
    -[MURelatedPlaceSectionControllerConfiguration trailHead](self->_configuration, "trailHead");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v7 = v6;
    v4 = objc_msgSend(v6, "count") != 0;

    return v4;
  }
  if (v3)
    return 0;
  if (!-[MURelatedPlacesSectionController needsToPerformRefinement](self, "needsToPerformRefinement"))
  {
    -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeTemplates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  return -[NSArray count](self->_mapItemList, "count") != 0;
}

- (UIView)sectionView
{
  MUPlaceSectionView *sectionView;
  MUPlatterView *v4;
  uint64_t v5;
  MUPlaceSectionView *v6;
  void *v7;
  MUPlaceSectionView *v8;
  MUPlaceSectionView *v9;
  MUPlaceSectionView *v10;

  sectionView = self->_sectionView;
  if (!sectionView)
  {
    if (-[MURelatedPlacesSectionController isVertical](self, "isVertical"))
    {
      v4 = -[MUPlatterView initWithContentView:]([MUPlatterView alloc], "initWithContentView:", self->_listView);
      v5 = 1;
    }
    else
    {
      v4 = self->_tilesView;
      v5 = 0;
    }
    v6 = [MUPlaceSectionView alloc];
    -[MURelatedPlacesSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v6, "initWithStyle:sectionHeaderViewModel:", v5, v7);

    -[MUPlaceSectionView attachViewToContentView:](v8, "attachViewToContentView:", v4);
    v9 = self->_sectionView;
    self->_sectionView = v8;
    v10 = v8;

    -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
    sectionView = self->_sectionView;
  }
  return (UIView *)sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  int64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  int v9;
  __CFString *v10;
  MUPlaceSectionHeaderViewModel *v11;
  MUPlaceSectionHeaderViewModel *v12;
  MUPlaceSectionHeaderViewModel *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (sectionHeaderViewModel)
    goto LABEL_24;
  v4 = -[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource");
  if (v4 != 1)
  {
    if (!v4)
    {
      -[MURelatedPlaceSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionTitle");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!-[__CFString length](v6, "length"))
      {
        -[MURelatedPlacesSectionController _moduleTitle](self, "_moduleTitle");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v7;
      }
LABEL_14:
      v12 = -[MUPlaceSectionHeaderViewModel initWithTitleString:]([MUPlaceSectionHeaderViewModel alloc], "initWithTitleString:", v6);
      v13 = self->_sectionHeaderViewModel;
      self->_sectionHeaderViewModel = v12;

      if (-[MURelatedPlaceSectionControllerConfiguration suppressSeeAllButton](self->_configuration, "suppressSeeAllButton"))
      {
LABEL_23:

        sectionHeaderViewModel = self->_sectionHeaderViewModel;
LABEL_24:
        v11 = sectionHeaderViewModel;
        return v11;
      }
      v14 = -[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource");
      if (v14 == 1)
      {
        -[MURelatedPlaceSectionControllerConfiguration trailHead](self->_configuration, "trailHead");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "trails");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14)
        {
          v18 = 0;
LABEL_21:
          if (v18 > GEOConfigGetUInteger())
            -[MUPlaceSectionHeaderViewModel setTarget:selector:](self->_sectionHeaderViewModel, "setTarget:selector:", self, sel__seeAllTapped);
          goto LABEL_23;
        }
        -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mapIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      v18 = objc_msgSend(v16, "count");

      goto LABEL_21;
    }
LABEL_10:
    v6 = &stru_1E2E05448;
    goto LABEL_14;
  }
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_mapsui_associatedHikingItemType");

  if (v9)
  {
    if (v9 == 1)
    {
      v10 = CFSTR("Trails [Place card]");
    }
    else
    {
      if (v9 != 2)
        goto LABEL_10;
      v10 = CFSTR("Trailheads [Place card]");
    }
    _MULocalizedStringFromThisBundle(v10);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v11 = 0;
  return v11;
}

- (void)placeTileCollectionView:(id)a3 didTapOnViewModel:(id)a4
{
  -[MURelatedPlacesSectionController _handleViewModel:](self, "_handleViewModel:", a4);
}

- (void)placeTilesListView:(id)a3 didSelectViewModel:(id)a4
{
  -[MURelatedPlacesSectionController _handleViewModel:](self, "_handleViewModel:", a4);
}

- (void)_handleViewModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (-[MURelatedPlaceSectionControllerConfiguration suppressItemSelection](self->_configuration, "suppressItemSelection"))
  {
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_DEBUG, "MURelatedPlacesSectionController: Will not refine and punch out", v8, 2u);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "mapItemIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[MURelatedPlacesSectionController _refinePlaceAndNotifyDelegate:](self, "_refinePlaceAndNotifyDelegate:", v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        objc_msgSend(v4, "geoTrail");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "trailIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MURelatedPlacesSectionController _refinePlaceAndNotifyDelegate:](self, "_refinePlaceAndNotifyDelegate:", v7);

      }
      goto LABEL_12;
    }
    -[MURelatedPlacesSectionController _notifyDelegateOfSelectedMapItem:](self, "_notifyDelegateOfSelectedMapItem:", v4);
  }
LABEL_12:

}

- (void)_refinePlaceAndNotifyDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1830]), "initWithGEOMapItemIdentifier:", v4);
  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ticketForIdentifiers:traits:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MURelatedPlacesSectionController__refinePlaceAndNotifyDelegate___block_invoke;
  v9[3] = &unk_1E2E01A88;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "submitWithHandler:networkActivity:", v9, 0);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __66__MURelatedPlacesSectionController__refinePlaceAndNotifyDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "_notifyDelegateOfSelectedMapItem:", v7);

  }
}

- (void)_notifyDelegateOfSelectedMapItem:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v17, "_muid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_mapsui_associatedHikingItemType");

    if (v6 == 2)
      v7 = 412;
    else
      v7 = 6079;
    if (v6 == 1)
      v8 = 365;
    else
      v8 = v7;
  }
  else if (objc_msgSend(v17, "_hasHikeInfo"))
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_hikeAssociatedInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasEncryptedTourMuid");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[MUPlaceSectionController mapItem](self, "mapItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_hikeAssociatedInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v14, "encryptedTourMuid"));
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = 467;
      v4 = (void *)v15;
    }
    else
    {
      v8 = 467;
    }
  }
  else
  {
    v8 = 6079;
  }
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", v8, v4, 0, 0);
  -[MURelatedPlacesSectionController relatedPlacesDelegate](self, "relatedPlacesDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "relatedPlaceSectionController:itemSelected:", self, v17);

}

- (void)_refineRelatedPlaceListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MKMapServiceTicket *v7;
  MKMapServiceTicket *ticket;
  MKMapServiceTicket *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ticketForRelatedPlaceList:traits:", v6, 0);
  v7 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  ticket = self->_ticket;
  self->_ticket = v7;

  v9 = self->_ticket;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__MURelatedPlacesSectionController__refineRelatedPlaceListWithCompletion___block_invoke;
  v11[3] = &unk_1E2E016A8;
  v12 = v4;
  v10 = v4;
  -[MKMapServiceTicket submitWithHandler:networkActivity:](v9, "submitWithHandler:networkActivity:", v11, 0);

}

uint64_t __74__MURelatedPlacesSectionController__refineRelatedPlaceListWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_refineHikingTrailListWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MKMapServiceTicket *v9;
  MKMapServiceTicket *ticket;
  MKMapServiceTicket *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[MURelatedPlaceSectionControllerConfiguration trailHead](self->_configuration, "trailHead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MUMap(v6, &__block_literal_global_18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ticketForIdentifiers:traits:", v7, 0);
  v9 = (MKMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  ticket = self->_ticket;
  self->_ticket = v9;

  v11 = self->_ticket;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__MURelatedPlacesSectionController__refineHikingTrailListWithCompletion___block_invoke_2;
  v13[3] = &unk_1E2E016A8;
  v14 = v4;
  v12 = v4;
  -[MKMapServiceTicket submitWithHandler:networkActivity:](v11, "submitWithHandler:networkActivity:", v13, 0);

}

id __73__MURelatedPlacesSectionController__refineHikingTrailListWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "trailIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CC1830]);
    objc_msgSend(v2, "trailIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithGEOMapItemIdentifier:", v5);

  }
  return v3;
}

uint64_t __73__MURelatedPlacesSectionController__refineHikingTrailListWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_cancelPlaceRefinementIfNeeded
{
  -[MKMapServiceTicket cancel](self->_ticket, "cancel");
  -[MUPlaceSectionView endAnimatingActivityIndicatorWithError:](self->_sectionView, "endAnimatingActivityIndicatorWithError:", 0);
}

- (void)_cancelFollowUpRequestIfNeeded
{
  -[MKMapServiceTicket cancel](self->_nearbyPlacesTicket, "cancel");
  -[MURelatedPlacesSectionController setIsFollowUpRequestInProgress:](self, "setIsFollowUpRequestInProgress:", 0);
  -[MUPlaceSectionView endAnimatingActivityIndicatorWithError:](self->_sectionView, "endAnimatingActivityIndicatorWithError:", 0);
}

- (GEORelatedPlaceList)effectiveRelatedPlaceList
{
  void *v3;

  -[MURelatedPlacesSectionController relatedPlaceListFromFollowUpRequest](self, "relatedPlaceListFromFollowUpRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MURelatedPlacesSectionController relatedPlaceListFromFollowUpRequest](self, "relatedPlaceListFromFollowUpRequest");
  else
    -[MURelatedPlaceSectionControllerConfiguration relatedPlaceList](self->_configuration, "relatedPlaceList");
  return (GEORelatedPlaceList *)(id)objc_claimAutoreleasedReturnValue();
}

- (GEORelatedPlaceModuleConfiguration)moduleConfig
{
  return -[MURelatedPlaceSectionControllerConfiguration moduleConfiguration](self->_configuration, "moduleConfiguration");
}

- (BOOL)needsToPerformRefinement
{
  int v3;
  void *v4;

  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hasInitialData") ^ 1;

  }
  return v3;
}

- (void)_seeAllTapped
{
  id *v3;
  NSArray *mapItemList;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (-[NSArray count](self->_mapItemList, "count"))
  {
    -[MURelatedPlacesSectionController _notifyDelegateForSeeAll](self, "_notifyDelegateForSeeAll");
    return;
  }
  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
  {
    -[MUPlaceSectionView beginAnimatingActivityIndicator](self->_sectionView, "beginAnimatingActivityIndicator");
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke;
    v8[3] = &unk_1E2E01A88;
    v3 = &v9;
    objc_copyWeak(&v9, &location);
    -[MURelatedPlacesSectionController _refineHikingTrailListWithCompletion:](self, "_refineHikingTrailListWithCompletion:", v8);
LABEL_5:
    objc_destroyWeak(v3);
    objc_destroyWeak(&location);
    return;
  }
  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasInitialData"))
  {
    mapItemList = self->_mapItemList;

    if (!mapItemList)
    {
      -[MUPlaceSectionView beginAnimatingActivityIndicator](self->_sectionView, "beginAnimatingActivityIndicator");
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke_2;
      v6[3] = &unk_1E2E01A88;
      v3 = &v7;
      objc_copyWeak(&v7, &location);
      -[MURelatedPlacesSectionController _refineRelatedPlaceListWithCompletion:](self, "_refineRelatedPlaceListWithCompletion:", v6);
      goto LABEL_5;
    }
  }
  else
  {

  }
}

void __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[12], "endAnimatingActivityIndicatorWithError:", v6);
    if (!v6)
    {
      objc_storeStrong(v8 + 11, a2);
      if (objc_msgSend(v8[11], "count"))
        objc_msgSend(v8, "_notifyDelegateForSeeAll");
    }
  }

}

void __49__MURelatedPlacesSectionController__seeAllTapped__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *WeakRetained;
  id *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[12], "endAnimatingActivityIndicatorWithError:", v6);
    if (!v6)
    {
      objc_storeStrong(v8 + 11, a2);
      if (objc_msgSend(v8[11], "count"))
        objc_msgSend(v8, "_notifyDelegateForSeeAll");
    }
  }

}

- (void)_notifyDelegateForSeeAll
{
  void *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  NSArray *mapItemList;
  void *v9;
  id v10;

  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_mapsui_associatedHikingItemType");

    if (v4 == 2)
      v5 = 428;
    else
      v5 = 9040;
    if (v4 == 1)
      v6 = 364;
    else
      v6 = v5;
  }
  else if (-[MURelatedPlacesSectionController _isCuratedHikesModule](self, "_isCuratedHikesModule"))
  {
    v6 = 464;
  }
  else
  {
    v6 = 9040;
  }
  -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:](self, "captureInfoCardAction:eventValue:feedbackType:actionRichProviderId:", v6, 0, 0, 0);
  -[MURelatedPlacesSectionController relatedPlacesDelegate](self, "relatedPlacesDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderViewModel titleString](self->_sectionHeaderViewModel, "titleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  mapItemList = self->_mapItemList;
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relatedPlaceSectionController:showSeeAllWithTitle:relatedMapItems:originalMapItem:", self, v7, mapItemList, v9);

}

- (void)_populateAnalyticsModule:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") != 1)
  {
    -[MURelatedPlacesSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMetadata:", v9);

LABEL_8:
    v6 = v10;
    goto LABEL_9;
  }
  -[MUPlaceSectionController mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_mapsui_associatedHikingItemType");

  if (v5 == 1)
  {
    v7 = CFSTR("Trails");
    goto LABEL_7;
  }
  v6 = v10;
  if (v5 == 2)
  {
    v7 = CFSTR("Trailheads");
LABEL_7:
    objc_msgSend(v10, "setMetadata:", v7);
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_moduleTitle
{
  MURelatedPlacesSectionController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v2 = self;
  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeTemplates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "count");

  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](v2, "effectiveRelatedPlaceList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v6, "type");

  switch((int)v2)
  {
    case 0:
    case 2:
    case 4:
      if ((unint64_t)v5 <= 1)
      {
        v7 = CFSTR("At this Address [Related Places]");
        goto LABEL_12;
      }
      v8 = CFSTR("[Related Places] Num Places At This Address");
      goto LABEL_8;
    case 1:
      if ((unint64_t)v5 < 2)
        v7 = CFSTR("[Related Places] Similar place Title");
      else
        v7 = CFSTR("[Related Places] Similar places Title");
LABEL_12:
      _MULocalizedStringFromThisBundle(v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "countryCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("CN"));

      if (v11)
        v8 = CFSTR("[Related Places] Popular Places");
      else
        v8 = CFSTR("[Related Places] Places");
LABEL_8:
      _MULocalizedStringFromThisBundle(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%lu"), 0, v5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v5;
  }
  return v5;
}

- (int)analyticsModuleType
{
  void *v4;
  int v5;

  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
    return 43;
  -[MURelatedPlacesSectionController effectiveRelatedPlaceList](self, "effectiveRelatedPlaceList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasInitialData");

  if (v5)
    return 38;
  else
    return 26;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)performInstrumentationForScrollLeft
{
  void *v3;
  int v4;
  uint64_t v5;

  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_mapsui_associatedHikingItemType");

    if (v4 == 2)
    {
      v5 = 422;
      goto LABEL_7;
    }
    if (v4 == 1)
    {
      v5 = 363;
LABEL_7:
      -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", v5, 0, 0);
    }
  }
}

- (void)performInstrumentationForScrollRight
{
  void *v3;
  int v4;
  uint64_t v5;

  if (-[MURelatedPlaceSectionControllerConfiguration dataSource](self->_configuration, "dataSource") == 1)
  {
    -[MUPlaceSectionController mapItem](self, "mapItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_mapsui_associatedHikingItemType");

    if (v4 == 2)
    {
      v5 = 410;
      goto LABEL_7;
    }
    if (v4 == 1)
    {
      v5 = 367;
LABEL_7:
      -[MUPlaceSectionController captureInfoCardAction:eventValue:feedbackType:](self, "captureInfoCardAction:eventValue:feedbackType:", v5, 0, 0);
    }
  }
}

- (BOOL)_isCuratedHikesModule
{
  void *v2;
  BOOL v3;

  -[NSArray _geo_filtered:](self->_mapItemList, "_geo_filtered:", &__block_literal_global_118);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

uint64_t __57__MURelatedPlacesSectionController__isCuratedHikesModule__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_hasHikeInfo") ^ 1;
}

- (BOOL)isActive
{
  return self->_active;
}

- (MURelatedPlacesSectionControllerDelegate)relatedPlacesDelegate
{
  return (MURelatedPlacesSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_relatedPlacesDelegate);
}

- (void)setRelatedPlacesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_relatedPlacesDelegate, a3);
}

- (GEORelatedPlaceList)relatedPlaceListFromFollowUpRequest
{
  return self->_relatedPlaceListFromFollowUpRequest;
}

- (void)setRelatedPlaceListFromFollowUpRequest:(id)a3
{
  objc_storeStrong((id *)&self->_relatedPlaceListFromFollowUpRequest, a3);
}

- (BOOL)isFollowUpRequestInProgress
{
  return self->_isFollowUpRequestInProgress;
}

- (void)setIsFollowUpRequestInProgress:(BOOL)a3
{
  self->_isFollowUpRequestInProgress = a3;
}

- (BOOL)hasFetchedFollowUpRequest
{
  return self->_hasFetchedFollowUpRequest;
}

- (void)setHasFetchedFollowUpRequest:(BOOL)a3
{
  self->_hasFetchedFollowUpRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlaceListFromFollowUpRequest, 0);
  objc_destroyWeak((id *)&self->_relatedPlacesDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_tilesView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_mapItemList, 0);
  objc_storeStrong((id *)&self->_nearbyPlacesTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
