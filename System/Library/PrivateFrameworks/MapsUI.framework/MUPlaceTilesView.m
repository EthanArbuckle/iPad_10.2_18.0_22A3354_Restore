@implementation MUPlaceTilesView

- (MUPlaceTilesView)initWithConfiguration:(id)a3
{
  id v5;
  char *v6;
  MUPlaceTilesView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceTilesView;
  v6 = -[MUPlaceTilesView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = (MUPlaceTilesView *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 472) = *MEMORY[0x1E0C9D820];
    objc_storeStrong((id *)v6 + 54, a3);
    -[MUPlaceTilesView _setupStackView](v7, "_setupStackView");
  }

  return v7;
}

- (void)_setupStackView
{
  id v3;
  id v4;
  UICollectionView *v5;
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
  MUPagingScrollContainerView *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *heightConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[6];

  v44[5] = *MEMORY[0x1E0C80C00];
  -[MUPlaceTilesView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setScrollDirection:", 1);
  objc_msgSend(v3, "setMinimumInteritemSpacing:", 8.0);
  objc_msgSend(v3, "setMinimumLineSpacing:", 8.0);
  objc_storeStrong((id *)&self->_flowLayout, v3);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v42 = v3;
  v5 = (UICollectionView *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  contentCollectionView = self->_contentCollectionView;
  self->_contentCollectionView = v5;

  -[UICollectionView setContentInset:](self->_contentCollectionView, "setContentInset:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_contentCollectionView, "setBackgroundColor:", v7);

  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_contentCollectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView setDelegate:](self->_contentCollectionView, "setDelegate:", self);
  -[UICollectionView setClipsToBounds:](self->_contentCollectionView, "setClipsToBounds:", 0);
  v8 = self->_contentCollectionView;
  v9 = objc_opt_class();
  +[MUPlaceTileCollectionViewCell reuseIdentifier](MUPlaceTileCollectionViewCell, "reuseIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v8, "registerClass:forCellWithReuseIdentifier:", v9, v10);

  v11 = self->_contentCollectionView;
  v12 = objc_opt_class();
  +[MUPunchoutCollectionViewCell reuseIdentifier](MUPunchoutCollectionViewCell, "reuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v12, v13);

  v14 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v15 = self->_contentCollectionView;
  MUCollectionViewDiffableDataSourceCellProviderForwardingBlock(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UICollectionViewDiffableDataSource *)objc_msgSend(v14, "initWithCollectionView:cellProvider:", v15, v16);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  if (MapKitIdiomIsMacCatalyst())
    v19 = -[MUPagingScrollContainerView initWithHorizontalScrollView:]([MUPagingScrollContainerView alloc], "initWithHorizontalScrollView:", self->_contentCollectionView);
  else
    v19 = self->_contentCollectionView;
  v20 = v19;
  -[MUPagingScrollContainerView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPlaceTilesView addSubview:](self, "addSubview:", v20);
  -[MUPagingScrollContainerView heightAnchor](v20, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 0.0);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v22;

  v36 = (void *)MEMORY[0x1E0CB3718];
  -[MUPagingScrollContainerView leadingAnchor](v20, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTilesView leadingAnchor](self, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v39;
  -[MUPagingScrollContainerView trailingAnchor](v20, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTilesView trailingAnchor](self, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v24;
  -[MUPagingScrollContainerView topAnchor](v20, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTilesView topAnchor](self, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v27;
  -[MUPagingScrollContainerView bottomAnchor](v20, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceTilesView bottomAnchor](self, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self->_heightConstraint;
  v44[3] = v30;
  v44[4] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v32);

  objc_opt_self();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)-[MUPlaceTilesView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v34, sel__contentSizeDidChange);

}

- (void)displayPlaceTiles
{
  if (-[NSArray count](self->_viewModels, "count"))
  {
    -[MUPlaceTilesView _updateTileMetrics](self, "_updateTileMetrics");
    -[MUPlaceTilesView _updateContent](self, "_updateContent");
  }
}

- (void)_updateTileMetrics
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  +[MUPlaceTileMeasurements defaultMeasurements](MUPlaceTileMeasurements, "defaultMeasurements");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MUPlaceTilesView shouldCalculateTileSizeAccordingToBounds](self, "shouldCalculateTileSizeAccordingToBounds"))
  {
    -[MUPlaceTilesView _calculatedTileWidthFromBounds](self, "_calculatedTileWidthFromBounds");
    objc_msgSend(v7, "setTileWidth:");
  }
  v3 = (void *)-[NSArray copy](self->_viewModels, "copy");
  -[MUPlaceTilesViewConfiguration cellConfiguration](self->_configuration, "cellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUPlaceTileCollectionViewCell preferredSizeForViewModels:cellConfiguration:usingMeasurements:](MUPlaceTileCollectionViewCell, "preferredSizeForViewModels:cellConfiguration:usingMeasurements:", v3, v4, v7);
  self->_tileSize.width = v5;
  self->_tileSize.height = v6;

  -[MUPlaceTilesView heightForTileSize:](self, "heightForTileSize:", self->_tileSize.width, self->_tileSize.height);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

}

- (void)_updateContent
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  MUPunchoutViewModel *accessoryViewModel;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  MUGetMUPlaceTilesViewLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceTilesViewUpdateContent", ", v8, 2u);
  }

  v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v10[0] = CFSTR("kPlaceTilesSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_viewModels, CFSTR("kPlaceTilesSection"));
  if (self->_accessoryViewModel)
  {
    accessoryViewModel = self->_accessoryViewModel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &accessoryViewModel, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, CFSTR("kPlaceTilesSection"));

  }
  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v4, 0);
  MUGetMUPlaceTilesViewLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_191DB8000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceTilesViewUpdateContent", ", v8, 2u);
  }

}

- (id)imageViewForIndex:(unint64_t)a3
{
  UICollectionView *contentCollectionView;
  void *v4;
  void *v5;
  void *v6;

  contentCollectionView = self->_contentCollectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView cellForItemAtIndexPath:](contentCollectionView, "cellForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "tileImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
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
          objc_msgSend(v10, "tileImageView");
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

- (void)scrollToViewAtIndex:(unint64_t)a3
{
  UICollectionView *contentCollectionView;
  id v4;

  contentCollectionView = self->_contentCollectionView;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](contentCollectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 0);

}

- (id)accessoryView
{
  void *v3;
  void *v4;

  if (self->_accessoryViewModel)
  {
    -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UICollectionView cellForItemAtIndexPath:](self->_contentCollectionView, "cellForItemAtIndexPath:", v3);
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

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  MUPlatterView *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MUPunchoutCollectionViewCell reuseIdentifier](MUPunchoutCollectionViewCell, "reuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setViewModel:", v10);
  }
  else if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE289ED0))
  {
    v13 = v10;
    +[MUPlaceTileCollectionViewCell reuseIdentifier](MUPlaceTileCollectionViewCell, "reuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUPlaceTilesViewConfiguration cellConfiguration](self->_configuration, "cellConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCellConfiguration:", v15);

    objc_msgSend(v12, "setClipsToBounds:", 0);
    objc_msgSend(v12, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 0);

    v17 = objc_alloc_init(MUPlatterView);
    objc_msgSend(v12, "setBackgroundView:", v17);

    objc_msgSend(v12, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_mapsui_setCardCorner");

    objc_msgSend(v12, "setViewModel:", v13);
  }
  else
  {
    v12 = 0;
  }

  return v12;
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
    -[MUPlaceTilesView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeTileCollectionView:didTapOnAccessoryViewModel:", self, v6);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE289ED0))
  {
    -[MUPlaceTilesView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeTileCollectionView:didTapOnViewModel:", self, v6);
    goto LABEL_5;
  }
LABEL_6:

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
  -[MUPlaceTilesView analyticsDelegate](self, "analyticsDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 <= 0.0)
    objc_msgSend(v6, "performInstrumentationForScrollRight");
  else
    objc_msgSend(v6, "performInstrumentationForScrollLeft");

}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;
  CGRect v8;

  v7.receiver = self;
  v7.super_class = (Class)MUPlaceTilesView;
  -[MUPlaceTilesView layoutSubviews](&v7, sel_layoutSubviews);
  -[MUPlaceTilesView bounds](self, "bounds");
  if (!CGRectEqualToRect(v8, self->_cachedBounds))
  {
    -[MUPlaceTilesView bounds](self, "bounds");
    self->_cachedBounds.origin.x = v3;
    self->_cachedBounds.origin.y = v4;
    self->_cachedBounds.size.width = v5;
    self->_cachedBounds.size.height = v6;
    if (-[MUPlaceTilesView shouldCalculateTileSizeAccordingToBounds](self, "shouldCalculateTileSizeAccordingToBounds"))
    {
      -[MUPlaceTilesView _updateTileMetrics](self, "_updateTileMetrics");
      -[UICollectionViewFlowLayout invalidateLayout](self->_flowLayout, "invalidateLayout");
    }
  }
}

- (void)_contentSizeDidChange
{
  UICollectionViewDiffableDataSource *diffableDataSource;
  id v4;

  -[MUPlaceTilesView _updateTileMetrics](self, "_updateTileMetrics");
  diffableDataSource = self->_diffableDataSource;
  -[UICollectionViewDiffableDataSource snapshot](diffableDataSource, "snapshot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](diffableDataSource, "applySnapshotUsingReloadData:", v4);

}

- (BOOL)shouldCalculateTileSizeAccordingToBounds
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  CGRect v9;

  if (MUIdiomInTraitEnvironment(self) == 5)
    return 0;
  -[MUPlaceTilesView bounds](self, "bounds");
  if (CGRectGetWidth(v9) > 430.0)
    return 0;
  -[MUPlaceTilesView _calculatedTileWidthFromBounds](self, "_calculatedTileWidthFromBounds");
  v5 = v4;
  +[MUPlaceTileMeasurements defaultMeasurements](MUPlaceTileMeasurements, "defaultMeasurements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tileWidth");
  v8 = v7;

  return v5 >= v8;
}

- (double)_calculatedTileWidthFromBounds
{
  CGRect v3;

  -[MUPlaceTilesView bounds](self, "bounds");
  return (CGRectGetWidth(v3) + -16.0 + -16.0 + -8.0) * 0.5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  double v11;
  double v12;
  CGSize result;

  -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MUPunchoutView preferredWidth](MUPunchoutView, "preferredWidth");
    width = v7;
    -[MUPlaceTilesView heightForTileSize:](self, "heightForTileSize:", self->_tileSize.width, self->_tileSize.height);
    height = v9;
  }
  else
  {
    width = self->_tileSize.width;
    height = self->_tileSize.height;
  }

  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)heightForTileSize:(CGSize)a3
{
  double height;
  unint64_t v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;

  height = a3.height;
  if (!-[MUPlaceTilesViewConfiguration numberOfRows](self->_configuration, "numberOfRows", a3.width))
    return 0.0;
  v5 = 0;
  v6 = 0.0;
  do
  {
    v7 = height + v6;
    v8 = -[MUPlaceTilesViewConfiguration numberOfRows](self->_configuration, "numberOfRows") - 1;
    v9 = -0.0;
    if (v5 < v8)
      v9 = 8.0;
    v6 = v7 + v9;
    ++v5;
  }
  while (v5 < -[MUPlaceTilesViewConfiguration numberOfRows](self->_configuration, "numberOfRows"));
  return v6;
}

- (MUPunchoutViewModel)accessoryViewModel
{
  return self->_accessoryViewModel;
}

- (void)setAccessoryViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryViewModel, a3);
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_viewModels, a3);
}

- (MUScrollAnalyticActionObserving)analyticsDelegate
{
  return (MUScrollAnalyticActionObserving *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MUPlaceTilesViewDelegate)delegate
{
  return (MUPlaceTilesViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_accessoryViewModel, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_contentCollectionView, 0);
}

@end
