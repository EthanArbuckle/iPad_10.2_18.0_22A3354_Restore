@implementation HKScalarGraphCollectionViewController

- (HKScalarGraphCollectionViewController)initWithMinimumHeight:(double)a3 unitController:(id)a4
{
  id v6;
  HKScalarGraphCollectionViewController *v7;
  HKScalarGraphCollectionViewController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKScalarGraphCollectionViewController;
  v7 = -[HKScalarGraphCollectionViewController init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[HKScalarGraphCollectionViewController setMinimumHeight:](v7, "setMinimumHeight:", a3);
    -[HKScalarGraphCollectionViewController setUnitController:](v8, "setUnitController:", v6);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UICollectionView *collectionView;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKScalarGraphCollectionViewController;
  -[HKScalarGraphCollectionViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[HKScalarGraphCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKScalarGraphCollectionViewController _setupChartCollectionView](self, "_setupChartCollectionView");
  -[HKScalarGraphCollectionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  collectionView = self->_collectionView;
  -[HKScalarGraphCollectionViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKScalarGraphCollectionViewController _pinView:toParentGuide:](self, "_pinView:toParentGuide:", collectionView, v8);

  -[HKScalarGraphCollectionViewController reload](self, "reload");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKScalarGraphCollectionViewController;
  -[HKScalarGraphCollectionViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKScalarGraphCollectionViewController;
  -[HKScalarGraphCollectionViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[HKScalarGraphCollectionViewController setCollectionViewHeight:](self, "setCollectionViewHeight:", v4);

  -[HKScalarGraphCollectionViewController _resetScrollPositionForIndex:](self, "_resetScrollPositionForIndex:", self->_currentIndex);
}

- (void)reload
{
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");
}

- (void)redrawCurrentCell
{
  HKScalarGraphCollectionViewController *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphSeriesForIndex:", v2->_currentIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (HKScalarGraphCollectionViewController *)((char *)v2 + 992);
  v5 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(v5, "setGraphSeries:", v4);

  v6 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(v6, "graphViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graphView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsReloadSeries");

  v11 = objc_loadWeakRetained((id *)&v2->super.super.super.isa);
  objc_msgSend(v11, "graphViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "graphView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 0, 0, 0, 0);

}

- (void)_resetScrollPositionForIndex:(int64_t)a3
{
  id WeakRetained;
  int64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "numberOfItemsInCollection");

  if (v6 > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 8, 0);
    -[UICollectionView layoutIfNeeded](self->_collectionView, "layoutIfNeeded");

  }
}

- (void)resetToIndex:(int64_t)a3
{
  HKScalarGraphCollectionViewDelegate **p_delegate;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "numberOfItemsInCollection");

  if (v7)
  {
    self->_currentIndex = a3;
    -[HKScalarGraphCollectionViewController _resetScrollPositionForIndex:](self, "_resetScrollPositionForIndex:", a3);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_currentIndex, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_currentCell, v8);

    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "graphCollectionView:didChangeVisibleIndex:", self, self->_currentIndex);

  }
}

- (void)resetToMostRecent
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "numberOfItemsInCollection");

  if (v4)
    -[HKScalarGraphCollectionViewController resetToIndex:](self, "resetToIndex:", v4 - 1);
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double collectionViewHeight;
  double v7;
  double v8;
  CGSize result;

  -[HKScalarGraphCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  collectionViewHeight = self->_collectionViewHeight;

  v7 = v5;
  v8 = collectionViewHeight;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_setupChartCollectionView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v18;
  void *v19;
  id v20;

  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[HKScalarGraphCollectionViewController _buildCollectionViewLayout](self, "_buildCollectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKScalarGraphCollectionViewController setCollectionView:](self, "setCollectionView:", v5);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[HKScalarGraphCollectionViewCell reuseIdentifier](HKScalarGraphCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKScalarGraphCollectionViewController minimumHeight](self, "minimumHeight");
  objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataSource:", self);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAllowsSelection:", 0);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAllowsMultipleSelection:", 0);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPagingEnabled:", 1);

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowsHorizontalScrollIndicator:", 0);

}

- (void)setCollectionViewHeight:(double)a3
{
  double collectionViewHeight;
  void *v5;
  void *v6;

  collectionViewHeight = self->_collectionViewHeight;
  self->_collectionViewHeight = a3;
  if (collectionViewHeight != a3)
  {
    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateLayout");

    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareLayout");

    -[HKScalarGraphCollectionViewController reload](self, "reload");
    -[HKScalarGraphCollectionViewController resetToIndex:](self, "resetToIndex:", self->_currentIndex);
  }
}

- (void)_pinView:(id)a3 toParentGuide:(id)a4
{
  id v5;
  id v6;
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

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v6, "bottomAnchor");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

}

- (id)_buildCollectionViewLayout
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setScrollDirection:", 1);
  objc_msgSend(v2, "setSectionInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v2, "setMinimumLineSpacing:", 0.0);
  return v2;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double collectionViewHeight;
  double v10;
  double v11;
  CGSize result;

  -[HKScalarGraphCollectionViewController collectionView](self, "collectionView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleSize");
  v8 = v7;
  collectionViewHeight = self->_collectionViewHeight;

  v10 = v8;
  v11 = collectionViewHeight;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "numberOfItemsInCollection");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKScalarGraphCollectionViewDelegate **p_delegate;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a4;
  v7 = a3;
  +[HKScalarGraphCollectionViewCell reuseIdentifier](HKScalarGraphCollectionViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "graphViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "graphViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "willMoveToParentViewController:", 0);

    objc_msgSend(v9, "graphViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    objc_msgSend(v9, "graphViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromParentViewController");

  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "graphViewControllerForIndex:", objc_msgSend(v6, "row"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKScalarGraphCollectionViewController addChildViewController:](self, "addChildViewController:", v17);
  objc_msgSend(v9, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v17, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  objc_msgSend(v17, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v27);

  objc_msgSend(v17, "didMoveToParentViewController:", self);
  objc_msgSend(v9, "setGraphViewController:", v17);
  v28 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v28, "graphSeriesForIndex:", objc_msgSend(v6, "row"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGraphSeries:", v29);

  v30 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v30, "lollipopControllerForGraphCollectionView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLollipopController:", v31);

  v32 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v32, "headerViewForLollipop");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeader:", v33);

  objc_msgSend(v17, "graphView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDelegate:", v9);

  objc_msgSend(v17, "graphView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setNeedsReloadSeries");

  return v9;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  CGRect v20;
  CGRect v21;

  -[UICollectionView contentOffset](self->_collectionView, "contentOffset", a3);
  v5 = v4;
  v7 = v6;
  -[UICollectionView bounds](self->_collectionView, "bounds");
  width = v20.size.width;
  height = v20.size.height;
  v20.origin.x = v5;
  v20.origin.y = v7;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = width;
  v21.size.height = height;
  -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v21));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v19 = v11;
    -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_currentCell, v12);

    self->_currentIndex = objc_msgSend(v19, "row");
    -[HKScalarGraphCollectionViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[HKScalarGraphCollectionViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "graphCollectionView:didChangeVisibleIndex:", self, self->_currentIndex);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_currentCell);
    objc_msgSend(WeakRetained, "graphViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "graphView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsReloadSeries");

    v11 = v19;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentCell);
  objc_msgSend(WeakRetained, "lollipopController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvisibleAnimated:", 0);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (NSArray)audiograms
{
  return self->_audiograms;
}

- (void)setAudiograms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (HKScalarGraphCollectionViewDelegate)delegate
{
  return (HKScalarGraphCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (HKScalarGraphCollectionViewCell)currentCell
{
  return (HKScalarGraphCollectionViewCell *)objc_loadWeakRetained((id *)&self->_currentCell);
}

- (void)setCurrentCell:(id)a3
{
  objc_storeWeak((id *)&self->_currentCell, a3);
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int64_t)a3
{
  self->_currentIndex = a3;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (double)collectionViewHeight
{
  return self->_collectionViewHeight;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_destroyWeak((id *)&self->_currentCell);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audiograms, 0);
}

@end
