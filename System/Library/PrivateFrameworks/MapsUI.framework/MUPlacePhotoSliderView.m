@implementation MUPlacePhotoSliderView

- (MUPlacePhotoSliderView)initWithDataSource:(id)a3 photoTileSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  MUPlacePhotoSliderView *v8;
  MUPlacePhotoSliderView *v9;
  objc_super v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUPlacePhotoSliderView;
  v8 = -[MUPlacePhotoSliderView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v7);
    v9->_photoTileSize.width = width;
    v9->_photoTileSize.height = height;
    -[MUPlacePhotoSliderView _setupSubviews](v9, "_setupSubviews");
    -[MUPlacePhotoSliderView _setupConstraints](v9, "_setupConstraints");
    -[MUPlacePhotoSliderView setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("PhotoSliderView"));
  }

  return v9;
}

- (void)_setupSubviews
{
  id v3;
  UICollectionView *v4;
  id *p_contentCollectionView;
  UICollectionView *contentCollectionView;
  void *v7;
  UICollectionView *v8;
  uint64_t v9;
  void *v10;
  UICollectionView *v11;
  uint64_t v12;
  void *v13;
  id v14;
  UICollectionView *v15;
  void *v16;
  UICollectionViewDiffableDataSource *v17;
  UICollectionViewDiffableDataSource *diffableDataSource;
  MUPagingScrollContainerView *v19;
  MUPagingScrollContainerView *pagingScrollView;
  id v21;
  _MUPhotoSliderViewFlowLayout *v22;

  v22 = objc_alloc_init(_MUPhotoSliderViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v22, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v22, "setMinimumInteritemSpacing:", 8.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v22, "setMinimumLineSpacing:", 8.0);
  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v22, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  p_contentCollectionView = (id *)&self->_contentCollectionView;
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v4;

  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentCollectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UICollectionView setContentInset:](self->_contentCollectionView, "setContentInset:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_contentCollectionView, "setBackgroundColor:", v7);

  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_contentCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", self);
  v8 = self->_contentCollectionView;
  v9 = objc_opt_class();
  +[MUPhotoTileCollectionViewCell reuseIdentifier](MUPhotoTileCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", v9, v10);

  v11 = self->_contentCollectionView;
  v12 = objc_opt_class();
  +[MUPunchoutCollectionViewCell reuseIdentifier](MUPunchoutCollectionViewCell, "reuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_contentCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("kHeaderViewCellIdentifier"));
  v14 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v15 = self->_contentCollectionView;
  MUCollectionViewDiffableDataSourceCellProviderForwardingBlock(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UICollectionViewDiffableDataSource *)objc_msgSend(v14, "initWithCollectionView:cellProvider:", v15, v16);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  if (MapKitIdiomIsMacCatalyst())
  {
    v19 = -[MUPagingScrollContainerView initWithHorizontalScrollView:]([MUPagingScrollContainerView alloc], "initWithHorizontalScrollView:", *p_contentCollectionView);
    p_contentCollectionView = (id *)&self->_pagingScrollView;
    pagingScrollView = self->_pagingScrollView;
    self->_pagingScrollView = v19;

    -[MUPagingScrollContainerView setAutomaticallyFlipsForRTL:](self->_pagingScrollView, "setAutomaticallyFlipsForRTL:", 1);
  }
  v21 = *p_contentCollectionView;
  -[MUPlacePhotoSliderView addSubview:](self, "addSubview:", v21);

}

- (void)_setupConstraints
{
  int IsMacCatalyst;
  uint64_t v4;
  id v5;
  MUEdgeLayout *v6;
  MUSizeLayout *v7;
  MUSizeLayout *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v4 = 2;
  if (IsMacCatalyst)
    v4 = 4;
  v5 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoSliderView__dataSource[v4]);
  v6 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", v5, self);
  v7 = [MUSizeLayout alloc];
  +[MUSizeLayout useIntrinsicContentSize](MUSizeLayout, "useIntrinsicContentSize");
  v8 = -[MUSizeLayout initWithItem:size:](v7, "initWithItem:size:", v5);
  v9 = (void *)MEMORY[0x1E0CB3718];
  v11[0] = v6;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_mapsui_activateLayouts:", v10);

}

- (id)imageViewForIndex:(unint64_t)a3
{
  UICollectionView *contentCollectionView;
  void *v4;
  void *v5;
  void *v6;

  contentCollectionView = self->_contentCollectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_hasHeaderView + a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](contentCollectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "contentImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)displayPhotos
{
  -[MUPlacePhotoSliderView displayPhotos:](self, "displayPhotos:", 0);
}

- (void)displayPhotos:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSArray *v13;
  NSArray *photoModels;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[8];
  void *v21;
  _QWORD v22[2];

  v3 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  MUGetMUPhotoSliderViewLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPhotoSliderViewDisplayPhotos", ", v20, 2u);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v22[0] = CFSTR("kPhotosSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "photoSliderViewHeaderViewForPhotoSlider:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self->_hasHeaderView = 1;
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("PhotoSliderHeaderView"));
    v21 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, CFSTR("kPhotosSection"));

  }
  else
  {
    self->_hasHeaderView = 0;
  }
  v11 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v11, "photoSliderViewRequestsViewModels:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (NSArray *)objc_msgSend(v12, "copy");
  photoModels = self->_photoModels;
  self->_photoModels = v13;

  if (objc_msgSend(v12, "count"))
  {
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, CFSTR("kPhotosSection"));

  }
  if (objc_msgSend(v12, "count"))
  {
    v16 = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v16, "attributionViewModelsForPhotoSliderView:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v6, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v18, CFSTR("kPhotosSection"));

    }
  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v6, v3);
  MUGetMUPhotoSliderViewLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPhotoSliderViewDisplayPhotos", ", v20, 2u);
  }

}

- (void)updateViewsWithAlpha:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UICollectionView visibleCells](self->_contentCollectionView, "visibleCells", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAlpha:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)attributionViewForAttribution:(id)a3
{
  void *v4;
  void *v5;

  -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UICollectionView cellForItemAtIndexPath:](self->_contentCollectionView, "cellForItemAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)scrollToViewAtIndex:(unint64_t)a3
{
  UICollectionView *contentCollectionView;
  id v6;

  if (-[NSArray count](self->_photoModels, "count") > a3)
  {
    contentCollectionView = self->_contentCollectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](contentCollectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 16, 0);

  }
}

- (void)enumerateImageViewsWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[UICollectionView visibleCells](self->_contentCollectionView, "visibleCells", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "contentImageView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  MUEdgeLayout *v14;
  void *WeakRetained;
  MUEdgeLayout *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kHeaderViewCellIdentifier"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "_mapsui_setCardCorner");
    objc_msgSend(v11, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v12);

    v14 = [MUEdgeLayout alloc];
    objc_msgSend(v11, "contentView");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MUEdgeLayout initWithItem:container:](v14, "initWithItem:container:", v12, WeakRetained);

    -[MUConstraintLayout activate](v16, "activate");
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EE27EE00))
    {
      v11 = 0;
      goto LABEL_8;
    }
    v18 = v10;
    +[MUPhotoTileCollectionViewCell reuseIdentifier](MUPhotoTileCollectionViewCell, "reuseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setTargetFrameSize:", self->_photoTileSize.width, self->_photoTileSize.height);
    objc_msgSend(v11, "setViewModel:", v18);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "photoSliderView:photoOverlayForModel:", self, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setPhotoOverlay:", v20);
    goto LABEL_7;
  }
  +[MUPunchoutCollectionViewCell reuseIdentifier](MUPunchoutCollectionViewCell, "reuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v17, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setViewModel:", v10);
LABEL_8:

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MUPlacePhotoSliderView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoSliderView:didTapAttribution:", self, v6);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE27EE00))
  {
    -[MUPlacePhotoSliderView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoSliderView:didTapViewModel:", self, v6);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MUPlacePhotoSliderView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoSliderViewDidTapHeaderView:", self);
    goto LABEL_7;
  }
LABEL_8:

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;
  char v9;
  id WeakRetained;
  int v11;
  char v12;
  double v13;
  double v14;
  double v15;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double width;
  void *v21;
  char isKindOfClass;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v6 = a5;
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v8 = objc_loadWeakRetained((id *)&self->_dataSource),
        v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v11 = objc_msgSend(WeakRetained, "photoSliderView:shouldShowFullWidthForModel:", self, v7);

  }
  else
  {
    v11 = 0;
  }
  if (self->_hasHeaderView)
  {
    if (-[NSArray count](self->_photoModels, "count"))
      v12 = v11;
    else
      v12 = 1;
    if ((v12 & 1) != 0)
      goto LABEL_10;
  }
  else if (v11)
  {
LABEL_10:
    -[UICollectionView frame](self->_contentCollectionView, "frame");
    v14 = v13;
    height = v15;
    -[UICollectionView contentInset](self->_contentCollectionView, "contentInset");
    v18 = v17;
    -[UICollectionView contentInset](self->_contentCollectionView, "contentInset");
    width = v14 - (v18 + v19);
    goto LABEL_15;
  }
  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MUPlacePhotoSliderView _sizeForAttribution](self, "_sizeForAttribution");
    width = v23;
    height = v24;
  }
  else
  {
    width = self->_photoTileSize.width;
    height = self->_photoTileSize.height;
  }
LABEL_15:

  v25 = width;
  v26 = height;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGPoint *p_beginAnalyticsScrollingPoint;
  CGFloat v4;
  CGFloat v5;

  p_beginAnalyticsScrollingPoint = &self->_beginAnalyticsScrollingPoint;
  objc_msgSend(a3, "contentOffset");
  p_beginAnalyticsScrollingPoint->x = v4;
  p_beginAnalyticsScrollingPoint->y = v5;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat v5;
  void *v6;
  id v7;

  v5 = self->_beginAnalyticsScrollingPoint.x - a5->x;
  -[MUPlacePhotoSliderView analyticsDelegate](self, "analyticsDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 <= 0.0)
    objc_msgSend(v6, "performInstrumentationForScrollRight");
  else
    objc_msgSend(v6, "performInstrumentationForScrollLeft");

}

- (CGSize)_sizeForAttribution
{
  id WeakRetained;
  uint64_t v4;
  double v5;
  double height;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfAttributionsForPhotoSliderView:", self);

  +[MUPunchoutView preferredWidth](MUPunchoutView, "preferredWidth");
  height = self->_photoTileSize.height;
  if (v4 != 1)
    height = (height + -8.0) * 0.5;
  result.height = height;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3618]);
  objc_msgSend(v3, "setInvalidateFlowLayoutDelegateMetrics:", 1);
  -[UICollectionView collectionViewLayout](self->_contentCollectionView, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateLayoutWithContext:", v3);

  v5.receiver = self;
  v5.super_class = (Class)MUPlacePhotoSliderView;
  -[MUPlacePhotoSliderView layoutSubviews](&v5, sel_layoutSubviews);

}

- (MUScrollAnalyticActionObserving)analyticsDelegate
{
  return (MUScrollAnalyticActionObserving *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MUPlacePhotoSliderDelegate)delegate
{
  return (MUPlacePhotoSliderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_photoModels, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pagingScrollView, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end
