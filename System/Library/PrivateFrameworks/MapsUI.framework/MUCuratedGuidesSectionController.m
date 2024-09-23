@implementation MUCuratedGuidesSectionController

- (MUCuratedGuidesSectionController)initWithDelegate:(id)a3 withPlaceCollections:(id)a4 usingSyncCoordinator:(id)a5 usingMapItem:(id)a6 usingCollectionIds:(id)a7 exploreGuides:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MUCuratedGuidesSectionController *v19;
  NSObject *v20;
  MUCuratedCollectionsPlacecardAnalyticsManager *v21;
  MUCuratedCollectionsPlacecardAnalyticsManager *analyticsManager;
  MUCuratedGuidesSectionView *v23;
  MUCuratedGuidesSectionView *carouselView;
  uint64_t v25;
  NSArray *placeCollections;
  NSObject *v27;
  uint8_t v29[16];
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)MUCuratedGuidesSectionController;
  v19 = -[MUPlaceSectionController initWithMapItem:](&v30, sel_initWithMapItem_, a6);
  if (v19)
  {
    MUGetPlaceCardLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerInit", ", v29, 2u);
    }

    v21 = objc_alloc_init(MUCuratedCollectionsPlacecardAnalyticsManager);
    analyticsManager = v19->_analyticsManager;
    v19->_analyticsManager = v21;

    v23 = -[MUCuratedGuidesSectionView initCollectionsCarouselViewWithPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:]([MUCuratedGuidesSectionView alloc], "initCollectionsCarouselViewWithPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:", v15, v16, v14, v19, v19, v18);
    carouselView = v19->_carouselView;
    v19->_carouselView = v23;

    objc_storeWeak((id *)&v19->_collectionsDelegate, v14);
    objc_storeStrong((id *)&v19->_collectionIds, a7);
    v25 = objc_msgSend(v15, "copy");
    placeCollections = v19->_placeCollections;
    v19->_placeCollections = (NSArray *)v25;

    -[MUCuratedGuidesSectionController _setupViews](v19, "_setupViews");
    MUGetPlaceCardLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerInit", ", v29, 2u);
    }

  }
  return v19;
}

- (void)_setupViews
{
  MUPlaceSectionView *v3;
  void *v4;
  MUPlaceSectionView *v5;
  MUPlaceSectionView *sectionView;
  MUPlaceSectionView *v7;
  id v8;

  v3 = [MUPlaceSectionView alloc];
  -[MUCuratedGuidesSectionController sectionHeaderViewModel](self, "sectionHeaderViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MUPlaceSectionView initWithStyle:sectionHeaderViewModel:](v3, "initWithStyle:sectionHeaderViewModel:", 0, v4);
  sectionView = self->_sectionView;
  self->_sectionView = v5;

  -[MUPlaceSectionView configureWithSectionController:](self->_sectionView, "configureWithSectionController:", self);
  -[MUPlaceSectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_sectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = self->_sectionView;
  -[MUCuratedGuidesSectionController carouselView](self, "carouselView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionView attachViewToContentView:](v7, "attachViewToContentView:", v8);

}

- (void)setActive:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (self->_active != a3)
  {
    self->_active = a3;
    MUGetPlaceCardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerActivate", ", buf, 2u);
    }

    -[MUCuratedGuidesSectionController _setupCollectionView](self, "_setupCollectionView");
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerActivate", ", v6, 2u);
    }

  }
}

- (void)_setupCollectionView
{
  id v2;

  if (self->_active)
  {
    -[MUCuratedGuidesSectionController carouselView](self, "carouselView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "displayCollectionsIfNeeded");

  }
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)collectionsCarouselDidScrollForward
{
  id v2;

  -[MUCuratedGuidesSectionController analyticsManager](self, "analyticsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placecardCollectionsScrollForward");

}

- (void)collectionsCarouselDidScrollBackward
{
  id v2;

  -[MUCuratedGuidesSectionController analyticsManager](self, "analyticsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placecardCollectionsScrollBackward");

}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  -[MUCuratedGuidesSectionController analyticsManager](self, "analyticsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "placecardCollectionTapped:atIndex:isCurrentlySaved:", v8, a4, v5);

}

- (void)exploreGuidesButtonTapped
{
  id v2;

  -[MUCuratedGuidesSectionController analyticsManager](self, "analyticsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placecardExploreGuidesButtonTapped");

}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  MUPlaceSectionHeaderViewModel *sectionHeaderViewModel;
  _BOOL8 v4;
  MUPlaceSectionHeaderViewModel *v5;
  void *v6;
  MUPlaceSectionHeaderViewModel *v7;
  MUPlaceSectionHeaderViewModel *v8;

  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    v4 = -[MUCuratedGuidesSectionController shouldShowMoreButton](self, "shouldShowMoreButton");
    v5 = [MUPlaceSectionHeaderViewModel alloc];
    -[MUCuratedGuidesSectionController _sectionHeaderTitle](self, "_sectionHeaderTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MUPlaceSectionHeaderViewModel initWithTitleString:showSeeMore:](v5, "initWithTitleString:showSeeMore:", v6, v4);
    v8 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v7;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
    if (v4)
    {
      -[MUPlaceSectionHeaderViewModel setTarget:selector:](sectionHeaderViewModel, "setTarget:selector:", self, sel__seeAllTapped);
      sectionHeaderViewModel = self->_sectionHeaderViewModel;
    }
  }
  return sectionHeaderViewModel;
}

- (id)draggableContent
{
  return 0;
}

- (void)refreshCollections
{
  -[MUCuratedGuidesSectionView refreshCollections](self->_carouselView, "refreshCollections");
}

- (void)_seeAllTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MUCuratedGuidesSectionController collectionsDelegate](self, "collectionsDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCuratedGuidesSectionController placeCollections](self, "placeCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceSectionHeaderViewModel titleString](self->_sectionHeaderViewModel, "titleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedGuidesSectionController collectionIds](self, "collectionIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showAllCollections:usingTitle:usingCollectionIds:", v3, v4, v5);

}

- (id)_sectionHeaderTitle
{
  void *v3;
  char v4;
  __CFString *v5;

  -[MUPlaceSectionController mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isMapItemTypeSettlement");

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("[Curated Collections] Guides");
  }
  else if (-[NSArray count](self->_placeCollections, "count") == 1)
  {
    v5 = CFSTR("[Curated Collections] poi section title for single guide");
  }
  else
  {
    v5 = CFSTR("[Curated Collections] poi section title for more than 1 guide");
  }
  _MULocalizedStringFromThisBundle(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowMoreButton
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[MUCuratedGuidesSectionController carouselView](self, "carouselView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom") == 5)
  {
    -[MUCuratedGuidesSectionController placeCollections](self, "placeCollections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 > 5)
      return 1;
  }
  else
  {

  }
  -[MUCuratedGuidesSectionController carouselView](self, "carouselView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isShowingExploreGuides") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[MUCuratedGuidesSectionController placeCollections](self, "placeCollections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v9, "count") > 5;

  }
  return v7;
}

- (int)analyticsModuleType
{
  return 31;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUCuratedGuidesSectionView)carouselView
{
  return self->_carouselView;
}

- (void)setCarouselView:(id)a3
{
  objc_storeStrong((id *)&self->_carouselView, a3);
}

- (MUCuratedCollectionsPlacecardAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (MKPlaceCollectionsDelegate)collectionsDelegate
{
  return (MKPlaceCollectionsDelegate *)objc_loadWeakRetained((id *)&self->_collectionsDelegate);
}

- (void)setCollectionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_collectionsDelegate, a3);
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIds, a3);
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_destroyWeak((id *)&self->_collectionsDelegate);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
