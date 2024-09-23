@implementation FIUIPageViewController

- (FIUIPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FIUIPageViewController *v4;
  FIUIPageViewController *v5;
  NSCache *v6;
  NSCache *viewControllerForIndexPath;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FIUIPageViewController;
  v4 = -[FIUIPageViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_currentlyDisplayedIndex = 0;
    v6 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    viewControllerForIndexPath = v5->_viewControllerForIndexPath;
    v5->_viewControllerForIndexPath = v6;

    -[NSCache setCountLimit:](v5->_viewControllerForIndexPath, "setCountLimit:", 5);
    v5->_scrollDirection = 1;
    v5->_shouldNotifyDelegateWhenScrollViewSettles = 0;
  }
  return v5;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)FIUIPageViewController;
  -[FIUIPageViewController loadView](&v47, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BEBD488]);
  -[FIUIPageViewController setCollectionViewLayout:](self, "setCollectionViewLayout:", v3);

  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumLineSpacing:", 0.0);

  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumInteritemSpacing:", 0.0);

  v6 = *MEMORY[0x24BEBE158];
  v7 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v8 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v9 = *(double *)(MEMORY[0x24BEBE158] + 24);
  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSectionInset:", v6, v7, v8, v9);

  v11 = -[FIUIPageViewController scrollDirection](self, "scrollDirection");
  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScrollDirection:", v11);

  v13 = objc_alloc(MEMORY[0x24BEBD450]);
  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDBF090];
  v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v19 = (void *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v14, *MEMORY[0x24BDBF090], v16, v17, v18);
  -[FIUIPageViewController setCollectionView:](self, "setCollectionView:", v19);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPrefetchingEnabled:", 1);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPrefetchDataSource:", self);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDataSource:", self);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDelegate:", self);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setShowsHorizontalScrollIndicator:", 0);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShowsVerticalScrollIndicator:", 0);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPagingEnabled:", 1);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setContentInsetAdjustmentBehavior:", 2);

  -[FIUIPageViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIPageViewController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v29);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("com.apple.FitnessUI.FIUIPageViewController.ReuseIdentifier"));

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7D0]), "initWithFrame:", v15, v16, v17, v18);
  -[FIUIPageViewController setPageControl:](self, "setPageControl:", v31);

  -[FIUIPageViewController pageControl](self, "pageControl");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHidesForSinglePage:", 1);

  -[FIUIPageViewController pageControl](self, "pageControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__pageSelectedWithControl_, 4096);

  -[FIUIPageViewController pageControl](self, "pageControl");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FIUIPageViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIPageViewController pageControl](self, "pageControl");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addSubview:", v36);

  -[FIUIPageViewController pageControl](self, "pageControl");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIPageViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerXAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[FIUIPageViewController pageControl](self, "pageControl");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIPageViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FIUIPageViewController;
  -[FIUIPageViewController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  -[FIUIPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[FIUIPageViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[FIUIPageViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setItemSize:", v15, v17);

  if (-[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex") >= 1)
    -[FIUIPageViewController setCurrentlyDisplayedIndex:](self, "setCurrentlyDisplayedIndex:", -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"));
}

- (void)setCurrentlyDisplayedIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  int64_t currentlyDisplayedIndex;
  void *v8;
  int64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  currentlyDisplayedIndex = self->_currentlyDisplayedIndex;
  -[FIUIPageViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfViewControllersForPageViewController:", self);

  if (v9 <= a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Requested setting currently displayed index out of range"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise");
  }
  else
  {
    self->_currentlyDisplayedIndex = a3;
    v10 = currentlyDisplayedIndex != a3 && v4;
    -[FIUIPageViewController setShouldNotifyDelegateWhenScrollViewSettles:](self, "setShouldNotifyDelegateWhenScrollViewSettles:", v10 | -[FIUIPageViewController shouldNotifyDelegateWhenScrollViewSettles](self, "shouldNotifyDelegateWhenScrollViewSettles"));
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", self->_currentlyDisplayedIndex, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIPageViewController collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIPageViewController collectionView:prefetchItemsAtIndexPaths:](self, "collectionView:prefetchItemsAtIndexPaths:", v12, v13);

    -[FIUIPageViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 16, v4);

  }
  if (currentlyDisplayedIndex != a3 && !v4)
  {
    -[FIUIPageViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pageViewController:didUpdateCurrentlyDisplayedIndex:", self, self->_currentlyDisplayedIndex);

  }
}

- (void)setCurrentlyDisplayedIndex:(int64_t)a3
{
  -[FIUIPageViewController setCurrentlyDisplayedIndex:animated:](self, "setCurrentlyDisplayedIndex:animated:", a3, 0);
}

- (void)setDataSource:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_storeWeak((id *)&self->_dataSource, a3);
  -[FIUIPageViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[FIUIPageViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfViewControllersForPageViewController:", self);

  if (-[FIUIPageViewController showsPagingIndicator](self, "showsPagingIndicator"))
  {
    -[FIUIPageViewController pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfPages:", v6);

  }
  if (-[FIUIPageViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[FIUIPageViewController view](self, "view");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)setScrollDirection:(int64_t)a3
{
  id v4;

  -[FIUIPageViewController collectionViewLayout](self, "collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollDirection:", a3);

}

- (void)setShowsPagingIndicator:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  self->_showsPagingIndicator = a3;
  if (a3)
  {
    -[FIUIPageViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfViewControllersForPageViewController:", self);

    -[FIUIPageViewController pageControl](self, "pageControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfPages:", v6);

  }
  -[FIUIPageViewController pageControl](self, "pageControl");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", !v3);

}

- (UIViewController)currentlyDisplayedViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[FIUIPageViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v6, v3);

    }
  }

  return (UIViewController *)v6;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[FIUIPageViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[FIUIPageViewController setShowsPagingIndicator:](self, "setShowsPagingIndicator:", self->_showsPagingIndicator);
  -[FIUIPageViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfViewControllersForPageViewController:", self);

  if (self->_currentlyDisplayedIndex >= v6)
  {
    -[FIUIPageViewController dataSource](self, "dataSource");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[FIUIPageViewController setCurrentlyDisplayedIndex:](self, "setCurrentlyDisplayedIndex:", objc_msgSend(v7, "numberOfViewControllersForPageViewController:", self) - 1);

  }
  else
  {
    -[FIUIPageViewController setCurrentlyDisplayedIndex:](self, "setCurrentlyDisplayedIndex:");
  }
}

- (void)_pageSelectedWithControl:(id)a3
{
  uint64_t v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v4 = objc_msgSend(a3, "currentPage");
  -[FIUIPageViewController setUserDidTapPageControl:](self, "setUserDidTapPageControl:", 1);
  -[FIUIPageViewController setCurrentlyDisplayedIndex:animated:](self, "setCurrentlyDisplayedIndex:animated:", v4, 1);
  v5 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__FIUIPageViewController__pageSelectedWithControl___block_invoke;
  block[3] = &unk_24CF30600;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
}

uint64_t __51__FIUIPageViewController__pageSelectedWithControl___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserDidTapPageControl:", 0);
}

- (void)_addViewController:(id)a3 toCell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  objc_msgSend(v6, "setViewController:", v9);
  -[FIUIPageViewController addChildViewController:](self, "addChildViewController:", v9);
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v9, "didMoveToParentViewController:", self);
}

- (void)_scrollViewDidStop
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 IsRightToLeft;
  double v12;
  double v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;

  -[FIUIPageViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FIUIPageViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v3, 0);

  -[FIUIPageViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  -[FIUIPageViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSize");
  v10 = v7 / v9;

  IsRightToLeft = FIUILocaleIsRightToLeft();
  v12 = (double)v4;
  v13 = -v10;
  if (!IsRightToLeft)
  {
    v13 = (double)v4;
    v12 = v10;
  }
  v14 = (uint64_t)(v12 * v13);
  v15 = FIUILocaleIsRightToLeft();
  v16 = v4 - 1;
  if (!v15)
    v16 = 0;
  -[FIUIPageViewController setCurrentlyDisplayedIndex:](self, "setCurrentlyDisplayedIndex:", v16 + v14);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[FIUIPageViewController shouldNotifyDelegateWhenScrollViewSettles](self, "shouldNotifyDelegateWhenScrollViewSettles", a3))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[FIUIPageViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItemAtIndexPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[FIUIPageViewController setShouldNotifyDelegateWhenScrollViewSettles:](self, "setShouldNotifyDelegateWhenScrollViewSettles:", 0);
      -[FIUIPageViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pageViewController:didUpdateCurrentlyDisplayedIndex:", self, -[FIUIPageViewController currentlyDisplayedIndex](self, "currentlyDisplayedIndex"));

    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  if (!-[FIUIPageViewController userDidTapPageControl](self, "userDidTapPageControl", a3))
  {
    -[FIUIPageViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    -[FIUIPageViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    v9 = v6 / v8;

    -[FIUIPageViewController pageControl](self, "pageControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)objc_msgSend(v10, "numberOfPages");

    -[FIUIPageViewController pageControl](self, "pageControl");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentPage:", llround(v9 * v11));

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[FIUIPageViewController _scrollViewDidStop](self, "_scrollViewDidStop", a3);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[FIUIPageViewController dataSource](self, "dataSource", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfViewControllersForPageViewController:", self);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[FIUIPageViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("com.apple.FitnessUI.FIUIPageViewController.ReuseIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = objc_msgSend(v10, "item");
          -[FIUIPageViewController dataSource](self, "dataSource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "pageViewController:viewControllerAtIndex:", self, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v15, v10);

          }
          objc_msgSend(v15, "view");

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_msgSend(v7, "item");
    -[FIUIPageViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pageViewController:viewControllerAtIndex:", self, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIPageViewController viewControllerForIndexPath](self, "viewControllerForIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v9, v7);

  }
  -[FIUIPageViewController _addViewController:toCell:](self, "_addViewController:toCell:", v9, v13);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setViewController:", 0);
}

- (FIUIPageViewControllerDataSource)dataSource
{
  return (FIUIPageViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (FIUIPageViewControllerDelegate)delegate
{
  return (FIUIPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (int64_t)currentlyDisplayedIndex
{
  return self->_currentlyDisplayedIndex;
}

- (BOOL)showsPagingIndicator
{
  return self->_showsPagingIndicator;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (BOOL)userDidTapPageControl
{
  return self->_userDidTapPageControl;
}

- (void)setUserDidTapPageControl:(BOOL)a3
{
  self->_userDidTapPageControl = a3;
}

- (NSCache)viewControllerForIndexPath
{
  return self->_viewControllerForIndexPath;
}

- (void)setViewControllerForIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerForIndexPath, a3);
}

- (BOOL)shouldNotifyDelegateWhenScrollViewSettles
{
  return self->_shouldNotifyDelegateWhenScrollViewSettles;
}

- (void)setShouldNotifyDelegateWhenScrollViewSettles:(BOOL)a3
{
  self->_shouldNotifyDelegateWhenScrollViewSettles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerForIndexPath, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
