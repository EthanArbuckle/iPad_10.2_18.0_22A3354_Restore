@implementation MUCuratedGuidesSectionView

- (id)initCollectionsCarouselViewWithPlaceCollections:(id)a3 usingSyncCoordinator:(id)a4 withRoutingDelegate:(id)a5 withScrollViewDelegate:(id)a6 withAnalyticsDelegate:(id)a7 exploreGuides:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MUCuratedGuidesSectionView *v20;
  uint64_t v21;
  MKCollectionsCarouselView *carouselView;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MUCuratedGuidesSectionView;
  v20 = -[MUCuratedGuidesSectionView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v20)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC1780]), "initCollectionsCarouselViewWithContext:withPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:", -[MUCuratedGuidesSectionView carouselContext](v20, "carouselContext"), v14, v15, v16, v17, v18, v19);
    carouselView = v20->_carouselView;
    v20->_carouselView = (MKCollectionsCarouselView *)v21;

    v20->_isSingleCollection = objc_msgSend(v14, "count") == 1;
    -[MUCuratedGuidesSectionView _setupSubviews](v20, "_setupSubviews");
  }

  return v20;
}

- (void)_setupSubviews
{
  MUPagingScrollContainerView *v3;
  id *p_pagingContainerView;
  MUPagingScrollContainerView *pagingContainerView;
  id v6;
  MUEdgeLayout *v7;
  MUSizeLayout *v8;
  MKCollectionsCarouselView *carouselView;
  MUSizeLayout *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (MapKitIdiomIsMacCatalyst())
  {
    v3 = -[MUPagingScrollContainerView initWithHorizontalScrollView:]([MUPagingScrollContainerView alloc], "initWithHorizontalScrollView:", self->_carouselView);
    p_pagingContainerView = (id *)&self->_pagingContainerView;
    pagingContainerView = self->_pagingContainerView;
    self->_pagingContainerView = v3;

  }
  else
  {
    p_pagingContainerView = (id *)&self->_carouselView;
  }
  v6 = *p_pagingContainerView;
  -[MUCuratedGuidesSectionView addSubview:](self, "addSubview:", v6);
  v7 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", v6, self);
  objc_msgSend(MEMORY[0x1E0CC1780], "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", -[MUCuratedGuidesSectionView carouselContext](self, "carouselContext"), -[MKCollectionsCarouselView isShowingExploreGuides](self->_carouselView, "isShowingExploreGuides"), self->_isSingleCollection);
  v8 = [MUSizeLayout alloc];
  carouselView = self->_carouselView;
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v10 = -[MUSizeLayout initWithItem:size:](v8, "initWithItem:size:", carouselView);
  v11 = (void *)MEMORY[0x1E0CB3718];
  v13[0] = v7;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_mapsui_activateLayouts:", v12);

}

- (int64_t)carouselContext
{
  if (MapKitIdiomIsMacCatalyst())
    return 6;
  else
    return 1;
}

- (void)displayCollectionsIfNeeded
{
  void *v3;
  char v4;
  id v5;

  -[MUCuratedGuidesSectionView carouselView](self, "carouselView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDisplayingCollections");

  if ((v4 & 1) == 0)
  {
    -[MUCuratedGuidesSectionView carouselView](self, "carouselView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayCollections");

  }
}

- (void)refreshCollections
{
  -[MKCollectionsCarouselView refreshCollections](self->_carouselView, "refreshCollections");
}

- (BOOL)isShowingExploreGuides
{
  return -[MKCollectionsCarouselView isShowingExploreGuides](self->_carouselView, "isShowingExploreGuides");
}

- (MKPlaceCollectionsDelegate)collectionsDelegate
{
  return (MKPlaceCollectionsDelegate *)objc_loadWeakRetained((id *)&self->_collectionsDelegate);
}

- (void)setCollectionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_collectionsDelegate, a3);
}

- (MKCollectionsCarouselView)carouselView
{
  return self->_carouselView;
}

- (void)setCarouselView:(id)a3
{
  objc_storeStrong((id *)&self->_carouselView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_destroyWeak((id *)&self->_collectionsDelegate);
  objc_storeStrong((id *)&self->_pagingContainerView, 0);
}

@end
