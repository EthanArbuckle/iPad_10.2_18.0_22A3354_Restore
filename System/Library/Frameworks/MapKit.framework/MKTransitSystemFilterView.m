@implementation MKTransitSystemFilterView

- (MKTransitSystemFilterView)initWithFrame:(CGRect)a3
{
  MKTransitSystemFilterView *v3;
  MKTransitSystemFilterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKTransitSystemFilterView;
  v3 = -[MKTransitSystemFilterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKTransitSystemFilterView _setupCollectionView](v3, "_setupCollectionView");
    -[MKTransitSystemFilterView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupCollectionView
{
  id v3;
  UICollectionView *v4;
  UICollectionView *collectionView;
  void *v6;
  UICollectionViewDiffableDataSource *v7;
  UICollectionViewDiffableDataSource *dataSource;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v10, "setMinimumInteritemSpacing:", 8.0);
  objc_msgSend(v10, "setScrollDirection:", 1);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v4;

  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v6);

  -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
  -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("filterCell"));
  -[MKTransitSystemFilterView addSubview:](self, "addSubview:", self->_collectionView);
  v7 = (UICollectionViewDiffableDataSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA440]), "initWithCollectionView:cellProvider:", self->_collectionView, &__block_literal_global_75);
  dataSource = self->_dataSource;
  self->_dataSource = v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__contentSizeDidChange, *MEMORY[0x1E0CEB3F0], 0);

}

id __49__MKTransitSystemFilterView__setupCollectionView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE079B58))
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("filterCell"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitleText:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *heightConstraint;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  -[UICollectionView heightAnchor](self->_collectionView, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 0.0);
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v4;

  v16 = (void *)MEMORY[0x1E0CB3718];
  -[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitSystemFilterView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  -[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitSystemFilterView trailingAnchor](self, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  -[UICollectionView topAnchor](self->_collectionView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitSystemFilterView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  -[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKTransitSystemFilterView bottomAnchor](self, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_heightConstraint;
  v21[3] = v13;
  v21[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v15);

  -[MKTransitSystemFilterView _contentSizeDidChange](self, "_contentSizeDidChange");
}

- (void)setTransitSystems:(id)a3
{
  NSArray *v4;
  NSArray *transitSystems;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_transitSystems, "isEqual:") & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    transitSystems = self->_transitSystems;
    self->_transitSystems = v4;

    -[MKTransitSystemFilterView _updateAppearance](self, "_updateAppearance");
    -[MKTransitSystemFilterView _updateSegmentPosition](self, "_updateSegmentPosition");
  }

}

- (void)setSelectedIndex:(unint64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    -[MKTransitSystemFilterView _updateSegmentPosition](self, "_updateSegmentPosition");
  }
}

- (void)_updateSegmentPosition
{
  unint64_t selectedIndex;
  UICollectionView *collectionView;
  id v5;

  selectedIndex = self->_selectedIndex;
  if (selectedIndex < -[NSArray count](self->_transitSystems, "count"))
  {
    collectionView = self->_collectionView;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", self->_selectedIndex, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](collectionView, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 0);

  }
}

- (void)_updateAppearance
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CEA210]);
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E215A0C0);
  -[MKTransitSystemFilterView transitSystems](self, "transitSystems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendItemsWithIdentifiers:", v3);

  -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_dataSource, "applySnapshot:animatingDifferences:", v4, 0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "row") != self->_selectedIndex)
  {
    self->_selectedIndex = objc_msgSend(v8, "row");
    -[MKTransitSystemFilterView _updateSegmentPosition](self, "_updateSegmentPosition");
    -[MKTransitSystemFilterView transitSystems](self, "transitSystems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKTransitSystemFilterView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterView:didChangeSystemSelection:", self, v6);

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *transitSystems;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  _QWORD v23[2];
  CGSize result;

  v23[1] = *MEMORY[0x1E0C80C00];
  v22 = *MEMORY[0x1E0CEA098];
  v6 = a5;
  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionHeaderFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  transitSystems = self->_transitSystems;
  v11 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](transitSystems, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeWithAttributes:", v9);
  v15 = v14;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionHeaderFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_mapkit_scaledValueForValue:", 32.0);
  v19 = v18;

  v20 = v15 + 12.0 + 12.0;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[MKTransitSystemFilterView traitCollection](self, "traitCollection", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 16.0;
  if (objc_msgSend(v6, "userInterfaceIdiom") == 5)
    v8 = 24.0;
  else
    v8 = 16.0;
  -[MKTransitSystemFilterView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceIdiom") == 5)
    v7 = 24.0;

  v10 = 0.0;
  v11 = 0.0;
  v12 = v8;
  v13 = v7;
  result.right = v13;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  UICollectionViewDiffableDataSource *dataSource;
  id v6;

  +[MKFontManager sharedManager](MKFontManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionHeaderFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 32.0);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");

  dataSource = self->_dataSource;
  -[UICollectionViewDiffableDataSource snapshot](dataSource, "snapshot");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource applySnapshotUsingReloadData:](dataSource, "applySnapshotUsingReloadData:", v6);

}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)transitSystems
{
  return self->_transitSystems;
}

- (MKTransitSystemFilterViewDelegate)delegate
{
  return (MKTransitSystemFilterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitSystems, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
