@implementation MKCollectionsCarouselView

- (id)initCollectionsCarouselViewWithContext:(int64_t)a3 withPlaceCollections:(id)a4 usingSyncCoordinator:(id)a5 withRoutingDelegate:(id)a6 withScrollViewDelegate:(id)a7 withAnalyticsDelegate:(id)a8 exploreGuides:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  MKCollectionsCarouselView *v23;
  MKCollectionsCarouselView *v24;
  uint64_t v25;
  OS_dispatch_queue *utilityQueue;
  UICollectionViewFlowLayout *v27;
  UICollectionViewFlowLayout *flowLayout;
  UICollectionView *v29;
  id v30;
  id v31;
  id v32;
  UICollectionView *collectionView;
  UICollectionView *v34;
  MKPlaceCollectionsLogicController *v35;
  MKPlaceCollectionsLogicController *logicController;
  MKPlaceCollectionsSizeController *v37;
  MKCollectionsSizeProvider *sizeController;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v41 = a4;
  v42 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v43.receiver = self;
  v43.super_class = (Class)MKCollectionsCarouselView;
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v23 = -[MKCollectionsCarouselView initWithFrame:](&v43, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v20, v21, v22);
  v24 = v23;
  if (v23)
  {
    v23->_carouselContext = a3;
    objc_storeWeak((id *)&v23->_routingDelegate, v15);
    objc_storeWeak((id *)&v24->_scrollViewDelegate, v16);
    objc_storeWeak((id *)&v24->_analyticsDelegate, v17);
    geo_dispatch_queue_create_with_qos();
    v25 = objc_claimAutoreleasedReturnValue();
    utilityQueue = v24->_utilityQueue;
    v24->_utilityQueue = (OS_dispatch_queue *)v25;

    v27 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0CEA450]);
    flowLayout = v24->_flowLayout;
    v24->_flowLayout = v27;

    v24->_hasDisplayedCollections = 0;
    objc_storeStrong((id *)&v24->_exploreGuides, a9);
    v29 = (UICollectionView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA410]), "initWithFrame:collectionViewLayout:", v24->_flowLayout, v19, v20, v21, v22);
    v40 = v17;
    v30 = v16;
    v31 = v15;
    v32 = v18;
    collectionView = v24->_collectionView;
    v24->_collectionView = v29;
    v34 = v29;

    v35 = -[MKPlaceCollectionsLogicController initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:]([MKPlaceCollectionsLogicController alloc], "initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:", v34, v41, 0, 0, 0, v42, a3, 0);
    logicController = v24->_logicController;
    v24->_logicController = v35;

    -[UICollectionView setShowsVerticalScrollIndicator:](v24->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v24->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[MKCollectionsCarouselView configureCarouselMetadata:](v24, "configureCarouselMetadata:", a3);
    v18 = v32;
    v15 = v31;
    v16 = v30;
    v17 = v40;
    v37 = -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", v24->_collectionsConfiguration.displayStyle, v24->_collectionsConfiguration.collectionsPerRow, objc_msgSend(v41, "count") == 1, v24, a3);
    sizeController = v24->_sizeController;
    v24->_sizeController = (MKCollectionsSizeProvider *)v37;

    -[MKCollectionsCarouselView configureCarouselCollectionView](v24, "configureCarouselCollectionView");
  }

  return v24;
}

- (void)dismissedCollections
{
  id v2;

  -[MKCollectionsCarouselView logicController](self, "logicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissedCollections");

}

- (void)displayCollectionsUsingBatchIds:(id)a3 usingGuideFetcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MKCollectionsCarouselView logicController](self, "logicController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__MKCollectionsCarouselView_displayCollectionsUsingBatchIds_usingGuideFetcher___block_invoke;
  v11[3] = &unk_1E20D7E80;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getCollections:", v11);

}

void __79__MKCollectionsCarouselView_displayCollectionsUsingBatchIds_usingGuideFetcher___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "logicController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateUsingBatchedIdentifiers:usingCollectionFetcher:usingBatchSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 10);

  objc_msgSend(*(id *)(a1 + 32), "logicController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayCollections");

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollViewDidScroll:", v5);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = 1;
}

- (BOOL)isDisplayingCollections
{
  return self->_hasDisplayedCollections;
}

- (BOOL)isShowingExploreGuides
{
  void *v2;
  BOOL v3;

  -[MKCollectionsCarouselView exploreGuides](self, "exploreGuides");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)resetScrollOffset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  if (-[UIView _mapkit_isRTL](self, "_mapkit_isRTL"))
  {
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSize");
    v5 = v4;
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v5 - v7;
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentInset");
    v11 = v8 - v10;

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentOffset:animated:", 0, v11, 0.0);
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentOffset:", v12, v13);
  }

}

- (void)updateCollections:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKCollectionsCarouselView logicController](self, "logicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCollections:usingBatchedIdentifiers:usingCollectionFetcher:usingBatchSize:", v4, 0, 0, 0);

}

- (void)refreshCollections
{
  id v2;

  -[MKCollectionsCarouselView logicController](self, "logicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshCollections");

}

- (void)resetCollectionsLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MKCollectionsCarouselView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayout");

  v7 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  -[MKCollectionsCarouselView flowLayout](self, "flowLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollDirection:", objc_msgSend(v5, "scrollDirection"));

  -[MKCollectionsCarouselView collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCollectionViewLayout:", v7);

  -[MKCollectionsCarouselView setFlowLayout:](self, "setFlowLayout:", v7);
}

- (void)configureCarouselMetadata:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if ((unint64_t)a3 <= 7)
  {
    if (((1 << a3) & 0xD2) != 0)
    {
      self->_collectionsConfiguration = ($6D52D4259129B2917F58F12EE7EDADA3)xmmword_18B2A9800;
      -[MKCollectionsCarouselView flowLayout](self, "flowLayout");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setScrollDirection:", 1);
    }
    else
    {
      if (a3)
        return;
      self->_collectionsConfiguration = ($6D52D4259129B2917F58F12EE7EDADA3)vdupq_n_s64(1uLL);
      -[MKCollectionsCarouselView flowLayout](self, "flowLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setScrollDirection:", 0);

      -[MKCollectionsCarouselView collectionView](self, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAlwaysBounceVertical:", 1);

      -[MKCollectionsCarouselView collectionView](self, "collectionView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBounces:", 1);
    }

  }
}

- (void)configureCarouselCollectionView
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
  MKExploreGuidesView *v35;
  void *v36;
  MKExploreGuidesView *v37;
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
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[5];
  id v69;
  id location;
  _QWORD v71[4];
  void *v72;
  void *v73;
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  if (self->_collectionsConfiguration.displayStyle == 1)
  {
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", self);

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView addSubview:](self, "addSubview:", v7);

    v52 = (void *)MEMORY[0x1E0CB3718];
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView leadingAnchor](self, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v62);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v60;
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView trailingAnchor](self, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v54);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v8;
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView topAnchor](self, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v12;
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView bottomAnchor](self, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v17);

  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[MKCollectionsCarouselView setContentView:](self, "setContentView:", v19);

    -[MKCollectionsCarouselView contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MKCollectionsCarouselView contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAxis:", 1);

    -[MKCollectionsCarouselView contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDistribution:", 0);

    -[MKCollectionsCarouselView contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlignment:", 0);

    -[MKCollectionsCarouselView contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView addSubview:](self, "addSubview:", v24);

    v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", self);

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v28);

    -[MKCollectionsCarouselView contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addArrangedSubview:", v30);

    -[MKCollectionsCarouselView collectionView](self, "collectionView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", -[MKCollectionsCarouselView carouselContext](self, "carouselContext"), 0, 0);
    objc_msgSend(v32, "constraintEqualToConstant:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObjectsFromArray:", v34);

    if (-[MKCollectionsCarouselView isShowingExploreGuides](self, "isShowingExploreGuides"))
    {
      objc_initWeak(&location, self);
      v35 = [MKExploreGuidesView alloc];
      -[MKCollectionsCarouselView exploreGuides](self, "exploreGuides");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __60__MKCollectionsCarouselView_configureCarouselCollectionView__block_invoke;
      v68[3] = &unk_1E20D96E0;
      objc_copyWeak(&v69, &location);
      v68[4] = self;
      v37 = -[MKExploreGuidesView initWithExploreGuides:tapHandler:](v35, "initWithExploreGuides:tapHandler:", v36, v68);

      -[MKExploreGuidesView setTranslatesAutoresizingMaskIntoConstraints:](v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MKCollectionsCarouselView contentView](self, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addArrangedSubview:", v37);

      -[MKExploreGuidesView heightAnchor](v37, "heightAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKExploreGuidesView defaultHeight](MKExploreGuidesView, "defaultHeight");
      objc_msgSend(v39, "constraintEqualToConstant:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "addObjectsFromArray:", v41);

      objc_destroyWeak(&v69);
      objc_destroyWeak(&location);
    }
    -[MKCollectionsCarouselView contentView](self, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView leadingAnchor](self, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v61);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v59;
    -[MKCollectionsCarouselView contentView](self, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView trailingAnchor](self, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v53);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v42;
    -[MKCollectionsCarouselView contentView](self, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView topAnchor](self, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v46;
    -[MKCollectionsCarouselView contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView bottomAnchor](self, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObjectsFromArray:", v51);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v67);
  }
}

void __60__MKCollectionsCarouselView_configureCarouselCollectionView__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "routingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "routingDelegate");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "routeToGuidesHomeFromExploreGuides:", v10);

    objc_msgSend(*(id *)(a1 + 32), "analyticsDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "analyticsDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exploreGuidesButtonTapped");

    }
  }

}

- (void)fetchCollections
{
  void *v3;
  _QWORD v4[5];

  -[MKCollectionsCarouselView logicController](self, "logicController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__MKCollectionsCarouselView_fetchCollections__block_invoke;
  v4[3] = &unk_1E20D7D98;
  v4[4] = self;
  objc_msgSend(v3, "getCollections:", v4);

}

void __45__MKCollectionsCarouselView_fetchCollections__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "logicController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayCollections");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewDidScroll:", v4);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *utilityQueue;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v5 = a4;
  -[MKCollectionsCarouselView logicController](self, "logicController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionKindAtIndex:", objc_msgSend(v5, "section"));

  if (v7 != 1)
  {
    -[MKCollectionsCarouselView routingDelegate](self, "routingDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKCollectionsCarouselView logicController](self, "logicController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "geoCollectionAtIndex:", objc_msgSend(v5, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "routeToCuratedCollection:", v10);

    objc_initWeak(&location, self);
    utilityQueue = self->_utilityQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__MKCollectionsCarouselView_collectionView_didSelectItemAtIndexPath___block_invoke;
    block[3] = &unk_1E20D8970;
    objc_copyWeak(&v14, &location);
    v13 = v5;
    dispatch_async(utilityQueue, block);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __69__MKCollectionsCarouselView_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "analyticsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v14 = objc_loadWeakRetained(v2);
    objc_msgSend(v14, "analyticsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "logicController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "geoCollectionAtIndex:", objc_msgSend(*(id *)(a1 + 32), "item"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "item");
    v12 = objc_loadWeakRetained(v2);
    objc_msgSend(v12, "logicController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionsCarouselDidRouteToCollectionId:atIndex:isSaved:", v10, v11, objc_msgSend(v13, "isCollectionSavedAtIndex:", objc_msgSend(*(id *)(a1 + 32), "item")));

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a5;
  -[MKCollectionsCarouselView logicController](self, "logicController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionKindAtIndex:", objc_msgSend(v9, "section"));

  if (v7 != 1)
  {
    -[MKCollectionsCarouselView logicController](self, "logicController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willDisplayCellAtIndexpath:", v9);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
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
  -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewWillBeginDragging:", v7);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *utilityQueue;
  _QWORD block[5];
  id v15[3];
  id location;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

  }
  objc_initWeak(&location, self);
  utilityQueue = self->_utilityQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MKCollectionsCarouselView_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
  block[3] = &unk_1E20D9708;
  block[4] = self;
  v15[1] = *(id *)&x;
  v15[2] = *(id *)&y;
  objc_copyWeak(v15, &location);
  dispatch_async(utilityQueue, block);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

}

void __88__MKCollectionsCarouselView_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;
  id *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  id *v9;
  id WeakRetained;
  void *v11;
  char v12;
  char v13;
  char v14;
  id v15;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
  if ((unint64_t)(v1 - 1) >= 2)
  {
    if (v1)
      return;
    v8 = *(double *)(a1 + 48);
    v9 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "analyticsDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= 0.0)
    {
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
        return;
      v15 = objc_loadWeakRetained(v9);
      objc_msgSend(v15, "analyticsDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionsCarouselDidScrollBackward");
    }
    else
    {
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0)
        return;
      v15 = objc_loadWeakRetained(v9);
      objc_msgSend(v15, "analyticsDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionsCarouselDidScrollForward");
    }
  }
  else
  {
    v2 = *(double *)(a1 + 56);
    v3 = (id *)(a1 + 40);
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "analyticsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 <= 0.0)
    {
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
        return;
      v15 = objc_loadWeakRetained(v3);
      objc_msgSend(v15, "analyticsDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionsCarouselDidScrollUp");
    }
    else
    {
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0)
        return;
      v15 = objc_loadWeakRetained(v3);
      objc_msgSend(v15, "analyticsDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionsCarouselDidScrollDown");
    }
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MKCollectionsCarouselView scrollViewDelegate](self, "scrollViewDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollViewDidEndDecelerating:", v7);

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  CGSize result;

  v7 = a3;
  v8 = a5;
  -[MKCollectionsCarouselView logicController](self, "logicController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "section");

  v11 = objc_msgSend(v9, "sectionKindAtIndex:", v10);
  if (v11 == 1)
  {
    objc_msgSend(v7, "frame");
    v13 = v12;
    *(double *)&v14 = 100.0;
  }
  else
  {
    -[MKCollectionsCarouselView sizeController](self, "sizeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    objc_msgSend(v15, "sizeForCollectionWithMaxCollectionsWidth:", v16);
    v13 = v17;
    v14 = v18;

  }
  v19 = v13;
  v20 = *(double *)&v14;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  -[MKCollectionsCarouselView logicController](self, "logicController", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sectionKindAtIndex:", a5);

  if (v8 == 1)
  {
    v9 = *MEMORY[0x1E0CEB4B0];
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    -[MKCollectionsCarouselView sizeController](self, "sizeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sectionInsets");
    v9 = v14;
    v10 = v15;
    v11 = v16;
    v12 = v17;

  }
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;

  -[MKCollectionsCarouselView sizeController](self, "sizeController", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumInterItemSpacing");
  v7 = v6;

  return v7;
}

+ (double)horizontalLayoutHeightInContext:(int64_t)a3 includeExploreGuidesHeight:(BOOL)a4 isSingleCollection:(BOOL)a5
{
  _BOOL4 v5;
  MKPlaceCollectionsSizeController *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v5 = a4;
  v6 = -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 0, 1, a5, 0, a3);
  -[MKPlaceCollectionsSizeController sizeForCollectionWithMaxCollectionsWidth:](v6, "sizeForCollectionWithMaxCollectionsWidth:", 100.0);
  v8 = v7;
  -[MKPlaceCollectionsSizeController sectionInsets](v6, "sectionInsets");
  v10 = v9;
  -[MKPlaceCollectionsSizeController sectionInsets](v6, "sectionInsets");
  v12 = v10 + v11;
  if (v5)
  {
    v12 = v12 + 5.0;
    +[MKExploreGuidesView defaultHeight](MKExploreGuidesView, "defaultHeight");
    v8 = v8 + v13;
  }

  return v12 + v8;
}

+ (double)verticalLayoutHeightWithNumberOfItems:(unint64_t)a3 maxWidth:(double)a4 usingTraitEnvironment:(id)a5 inContext:(int64_t)a6
{
  id v9;
  MKPlaceCollectionsSizeController *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v9 = a5;
  v10 = -[MKPlaceCollectionsSizeController initWithDefaultCollectionsConfigurationUsingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithDefaultCollectionsConfigurationUsingTraitCollections:inContext:", v9, a6);

  -[MKPlaceCollectionsSizeController sizeForCollectionWithMaxCollectionsWidth:](v10, "sizeForCollectionWithMaxCollectionsWidth:", a4);
  v12 = v11;
  -[MKPlaceCollectionsSizeController minimumInterItemSpacing](v10, "minimumInterItemSpacing");
  v14 = v13;
  -[MKPlaceCollectionsSizeController sectionInsets](v10, "sectionInsets");
  v16 = v15 + (v12 + v14) * (double)a3;

  return v16;
}

- (void)setContentOffset:(CGPoint)a3
{
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", a3.x, a3.y);
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)contentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UICollectionView contentSize](self->_collectionView, "contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (MKPlaceCollectionsLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_logicController, a3);
}

- (MKCollectionsSizeProvider)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
}

- (MKCollectionCarouselRoutingDelegate)routingDelegate
{
  return (MKCollectionCarouselRoutingDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void)setRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routingDelegate, a3);
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (MKCollectionCarouselAnalyticsDelegate)analyticsDelegate
{
  return (MKCollectionCarouselAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (GEOExploreGuides)exploreGuides
{
  return self->_exploreGuides;
}

- (void)setExploreGuides:(id)a3
{
  objc_storeStrong((id *)&self->_exploreGuides, a3);
}

- (int64_t)carouselContext
{
  return self->_carouselContext;
}

- (void)setCarouselContext:(int64_t)a3
{
  self->_carouselContext = a3;
}

- (UIStackView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_exploreGuides, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
}

@end
