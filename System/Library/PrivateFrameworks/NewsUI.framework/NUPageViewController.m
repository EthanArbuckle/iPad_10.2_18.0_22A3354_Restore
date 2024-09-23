@implementation NUPageViewController

- (NUPageViewController)initWithCoder:(id)a3
{
  NUPageViewController *v3;
  NUPageViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUPageViewController;
  v3 = -[NUPageViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[NUPageViewController commonInit](v3, "commonInit");
  return v4;
}

- (NUPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  NUPageViewController *v4;
  NUPageViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUPageViewController;
  v4 = -[NUPageViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[NUPageViewController commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  NUPageViewControllerScrollView *v3;
  NUPageViewControllerScrollView *scrollView;
  OS_dispatch_group *v5;
  OS_dispatch_group *idleDispatchGroup;
  NSMutableArray *v7;
  NSMutableArray *replayViewTransitions;

  v3 = objc_alloc_init(NUPageViewControllerScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v3;

  -[NUPageViewControllerScrollView _setContentInsetAdjustmentBehavior:](self->_scrollView, "_setContentInsetAdjustmentBehavior:", 2);
  -[NUPageViewControllerScrollView setAutoresizesSubviews:](self->_scrollView, "setAutoresizesSubviews:", 0);
  -[NUPageViewControllerScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  -[NUPageViewControllerScrollView setAlwaysBounceHorizontal:](self->_scrollView, "setAlwaysBounceHorizontal:", 1);
  -[NUPageViewControllerScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 0);
  -[NUPageViewControllerScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[NUPageViewControllerScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[NUPageViewControllerScrollView setCanCancelContentTouches:](self->_scrollView, "setCanCancelContentTouches:", 1);
  -[NUPageViewControllerScrollView setDelaysContentTouches:](self->_scrollView, "setDelaysContentTouches:", 0);
  -[NUPageViewControllerScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[NUPageViewControllerScrollView setAccessibilityDelegate:](self->_scrollView, "setAccessibilityDelegate:", self);
  -[NUPageViewControllerScrollView setDirectionalLockEnabled:](self->_scrollView, "setDirectionalLockEnabled:", 1);
  v5 = (OS_dispatch_group *)dispatch_group_create();
  idleDispatchGroup = self->_idleDispatchGroup;
  self->_idleDispatchGroup = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  replayViewTransitions = self->_replayViewTransitions;
  self->_replayViewTransitions = v7;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[NUPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[NUPageViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v15 = CGRectInset(v14, -2.0, 0.0);
  objc_msgSend(v5, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

  -[NUPageViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[NUPageViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[NUPageViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  -[NUPageViewController transitionToSize:](self, "transitionToSize:", v11, v12);

  -[NUPageViewController updateContentSize](self, "updateContentSize");
  -[NUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewWillLayoutSubviews](&v17, sel_viewWillLayoutSubviews);
  -[NUPageViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  -[NUPageViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    -[NUPageViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[NUPageViewController transitionToSize:](self, "transitionToSize:", v15, v16);

  }
  -[NUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
  -[NUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;
  objc_super v29;

  v3 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewWillAppear:](&v29, sel_viewWillAppear_);
  -[NUPageViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  -[NUPageViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    -[NUPageViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    -[NUPageViewController transitionToSize:](self, "transitionToSize:", v17, v18);

  }
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "beginAppearanceTransition:animated:", 1, v3);

  }
  else
  {
    objc_initWeak(&location, self);
    -[NUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __39__NUPageViewController_viewWillAppear___block_invoke;
    v26 = &unk_24D5A2B30;
    objc_copyWeak(&v27, &location);
    v22 = (void *)MEMORY[0x2199FC190](&v23);
    objc_msgSend(v21, "addObject:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __39__NUPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginAppearanceTransition:animated:", 1, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAppearanceTransition");

  }
  else
  {
    objc_initWeak(&location, self);
    -[NUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __38__NUPageViewController_viewDidAppear___block_invoke;
    v11 = &unk_24D5A2B30;
    objc_copyWeak(&v12, &location);
    v7 = (void *)MEMORY[0x2199FC190](&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __38__NUPageViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAppearanceTransition");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginAppearanceTransition:animated:", 0, v3);

  }
  else
  {
    objc_initWeak(&location, self);
    -[NUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __42__NUPageViewController_viewWillDisappear___block_invoke;
    v12 = &unk_24D5A2B30;
    objc_copyWeak(&v13, &location);
    v8 = (void *)MEMORY[0x2199FC190](&v9);
    objc_msgSend(v7, "addObject:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __42__NUPageViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginAppearanceTransition:animated:", 0, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUPageViewController;
  -[NUPageViewController viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAppearanceTransition");

  }
  else
  {
    objc_initWeak(&location, self);
    -[NUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __41__NUPageViewController_viewDidDisappear___block_invoke;
    v11 = &unk_24D5A2B30;
    objc_copyWeak(&v12, &location);
    v7 = (void *)MEMORY[0x2199FC190](&v8);
    objc_msgSend(v6, "addObject:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __41__NUPageViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAppearanceTransition");

}

- (void)performWhenIdle:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[NUPageViewController idleDispatchGroup](self, "idleDispatchGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v5, MEMORY[0x24BDAC9B8], v4);

}

- (void)setVisibleViewController:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NUPageViewController visibleViewController](self, "visibleViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController removeViewController:](self, "removeViewController:", v9);

    }
    -[NUPageViewController addViewController:fromScroll:](self, "addViewController:fromScroll:", v5, 0);
    objc_storeStrong((id *)&self->_visibleViewController, a3);
    -[NUPageViewController reindexViewControllers](self, "reindexViewControllers");
    -[NUPageViewController replayViewTransitions](self, "replayViewTransitions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[NUPageViewController replayViewTransitions](self, "replayViewTransitions", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++) + 16))();
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

      -[NUPageViewController setReplayViewTransitions:](self, "setReplayViewTransitions:", 0);
    }
    -[NUPageViewController updateContentOffset](self, "updateContentOffset");
    -[NUPageViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[NUPageViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pageViewController:didChangeVisibleViewControllerFromViewController:direction:", self, v7, 0);

    }
  }

}

- (CGSize)pageSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[NUPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (-[NUPageViewController isTransitioning](self, "isTransitioning"))
  {
    -[NUPageViewController transitioningSize](self, "transitioningSize");
  }
  else
  {
    v8 = v5;
    v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPagingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUPageViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (BOOL)pagingEnabled
{
  void *v2;
  char v3;

  -[NUPageViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScrollEnabled");

  return v3;
}

- (void)updateScrollView
{
  -[NUPageViewController updateContentSize](self, "updateContentSize");
  -[NUPageViewController updateContentOffset](self, "updateContentOffset");
}

- (void)updateContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  -[NUPageViewController nextViewController](self, "nextViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = 2;
  else
    v4 = 1;
  -[NUPageViewController previousViewController](self, "previousViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v4 + 1;
  else
    v6 = v4;
  -[NUPageViewController pageSize](self, "pageSize");
  v8 = (double)(4 * v6) + v7 * (double)v6;
  -[NUPageViewController pageSize](self, "pageSize");
  v10 = v9;
  -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
  -[NUPageViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentSize:", v8, v10);

  -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);
}

- (void)updateContentOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  CGRect v11;

  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v6 = v5;
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v9 = v6 + CGRectGetWidth(v11) * -0.5 + -2.0;

  -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
  -[NUPageViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentOffset:", v9, 0.0);

  -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);
}

- (void)setPossibleNextViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_possibleNextViewController;
  void *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  p_possibleNextViewController = &self->_possibleNextViewController;
  if (*p_possibleNextViewController != v5)
  {
    v8 = v5;
    if (-[UIViewController isViewLoaded](*p_possibleNextViewController, "isViewLoaded"))
    {
      -[UIViewController view](*p_possibleNextViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserInteractionEnabled:", 1);

    }
    objc_storeStrong((id *)p_possibleNextViewController, a3);
    v5 = v8;
  }

}

- (CGPoint)centerForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[NUPageViewController pageSize](self, "pageSize");
  v6 = (double)(4 * a3) + v5 * ((double)a3 + 0.5) + 2.0;
  -[NUPageViewController pageSize](self, "pageSize");
  v8 = v7 * 0.5;
  v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)repositionPages
{
  void *v3;
  void *v4;
  id v5;

  -[NUPageViewController nextViewController](self, "nextViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v3);

  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v4);

  -[NUPageViewController previousViewController](self, "previousViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v5);

}

- (void)managePreviousAndNextViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Width;
  void *v12;
  double Height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[NUPageViewController managedForViewController](self, "managedForViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[NUPageViewController previousViewController](self, "previousViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[NUPageViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController visibleViewController](self, "visibleViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pageViewController:viewControllerBeforeViewController:", self, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController setPreviousViewController:](self, "setPreviousViewController:", v8);

    }
    -[NUPageViewController previousViewController](self, "previousViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NUPageViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      Width = CGRectGetWidth(v31);
      -[NUPageViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      Height = CGRectGetHeight(v32);
      -[NUPageViewController previousViewController](self, "previousViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

      -[NUPageViewController previousViewController](self, "previousViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v16);

    }
    -[NUPageViewController nextViewController](self, "nextViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[NUPageViewController dataSource](self, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController visibleViewController](self, "visibleViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pageViewController:viewControllerAfterViewController:", self, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController setNextViewController:](self, "setNextViewController:", v20);

    }
    -[NUPageViewController nextViewController](self, "nextViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[NUPageViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v23 = CGRectGetWidth(v33);
      -[NUPageViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      v25 = CGRectGetHeight(v34);
      -[NUPageViewController nextViewController](self, "nextViewController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, v23, v25);

      -[NUPageViewController nextViewController](self, "nextViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v28);

    }
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController updatePositionForViewController:](self, "updatePositionForViewController:", v29);

    -[NUPageViewController updateContentSize](self, "updateContentSize");
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setManagedForViewController:](self, "setManagedForViewController:", v30);

  }
}

- (void)updatePositionForViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[NUPageViewController previousViewController](self, "previousViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v13)
  {
    v7 = v5 != 0;
LABEL_9:

    goto LABEL_10;
  }

  if (v5 != v13)
  {
    -[NUPageViewController nextViewController](self, "nextViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v13)
    {
      -[NUPageViewController previousViewController](self, "previousViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
        v7 = 2;
      else
        v7 = 1;
      goto LABEL_9;
    }
  }
  v7 = 0;
LABEL_10:
  -[NUPageViewController centerForIndex:](self, "centerForIndex:", v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v13, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCenter:", v9, v11);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)removeViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NUPageViewController appearingViewController](self, "appearingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
  {
    objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);
    -[NUPageViewController setAppearingViewController:](self, "setAppearingViewController:", 0);
  }
  objc_msgSend(v9, "endAppearanceTransition");
  objc_msgSend(v9, "willMoveToParentViewController:", 0);
  objc_msgSend(v9, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(v9, "removeFromParentViewController");
  -[NUPageViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NUPageViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageViewController:didHideViewController:", self, v9);

  }
}

- (void)addViewController:(id)a3 fromScroll:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double Width;
  void *v13;
  double Height;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v4 = a4;
  v18 = a3;
  -[NUPageViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NUPageViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageViewController:willShowViewController:fromScroll:", self, v18, v4);

  }
  -[NUPageViewController addChildViewController:](self, "addChildViewController:", v18);
  -[NUPageViewController setAppearingViewController:](self, "setAppearingViewController:", v18);
  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginAppearanceTransition:animated:", 0, 0);

  -[NUPageViewController visibleViewController](self, "visibleViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController setDisappearingViewController:](self, "setDisappearingViewController:", v10);

  -[NUPageViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  Width = CGRectGetWidth(v19);
  -[NUPageViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Height = CGRectGetHeight(v20);
  objc_msgSend(v18, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, Height);

  -[NUPageViewController scrollView](self, "scrollView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v18, "didMoveToParentViewController:", self);
}

- (void)reindexViewControllers
{
  -[NUPageViewController setNextViewController:](self, "setNextViewController:", 0);
  -[NUPageViewController setPreviousViewController:](self, "setPreviousViewController:", 0);
  -[NUPageViewController setManagedForViewController:](self, "setManagedForViewController:", 0);
  -[NUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NUPageViewController visibleViewController](self, "visibleViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v4);

  -[NUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[NUPageViewController handleScrollStart](self, "handleScrollStart");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[NUPageViewController handleScrollEnd](self, "handleScrollEnd", a3);
}

- (void)handleScrollStart
{
  NSObject *v3;

  if (!-[NUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    -[NUPageViewController idleDispatchGroup](self, "idleDispatchGroup");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v3);

    self->_scrollViewStartedScrolling = 1;
  }
}

- (void)handleScrollEnd
{
  NSObject *v3;

  if (-[NUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    -[NUPageViewController idleDispatchGroup](self, "idleDispatchGroup");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v3);

    self->_scrollViewStartedScrolling = 0;
  }
  -[NUPageViewController callLastViewAppearanceMethods](self, "callLastViewAppearanceMethods");
}

- (void)callLastViewAppearanceMethods
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

  -[NUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  if (!-[NUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController disappearingViewController](self, "disappearingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      -[NUPageViewController disappearingViewController](self, "disappearingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "beginAppearanceTransition:animated:", 1, 0);

      -[NUPageViewController disappearingViewController](self, "disappearingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "endAppearanceTransition");

    }
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController appearingViewController](self, "appearingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      -[NUPageViewController appearingViewController](self, "appearingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "beginAppearanceTransition:animated:", 0, 0);

      -[NUPageViewController appearingViewController](self, "appearingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endAppearanceTransition");

    }
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController appearingViewController](self, "appearingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      -[NUPageViewController appearingViewController](self, "appearingViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endAppearanceTransition");

    }
    -[NUPageViewController setAppearingViewController:](self, "setAppearingViewController:", 0);
    -[NUPageViewController setDisappearingViewController:](self, "setDisappearingViewController:", 0);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  double v35;
  CGFloat v36;
  void *v37;
  CGFloat v38;
  double width;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  void *v56;
  double v57;
  CGFloat v58;
  void *v59;
  CGFloat v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  id v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v83 = a3;
  if (!-[NUPageViewController cancelScrollViewDidScroll](self, "cancelScrollViewDidScroll")
    && !-[NUPageViewController _shouldIgnoreDidScrollWithScrollView:](self, "_shouldIgnoreDidScrollWithScrollView:", v83))
  {
    objc_msgSend(v83, "contentOffset");
    v5 = v4;
    objc_msgSend(v83, "contentOffset");
    v7 = v6;
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    v11 = v10;
    objc_msgSend(v83, "bounds");
    v13 = v7 - (v11 + v12 * -0.5);

    if (v13 >= 0.0)
    {
      if (v13 <= 0.0)
      {
        v15 = 0;
        goto LABEL_9;
      }
      -[NUPageViewController nextViewController](self, "nextViewController");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NUPageViewController previousViewController](self, "previousViewController");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
LABEL_9:
    -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16 && v15)
    {
      -[NUPageViewController setPossibleNextViewController:](self, "setPossibleNextViewController:", v15);
      -[NUPageViewController addViewController:fromScroll:](self, "addViewController:fromScroll:", v15, 1);
LABEL_15:
      -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "beginAppearanceTransition:animated:", 1, 0);

      goto LABEL_16;
    }
    -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (v17 != v15)
      {
        -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUPageViewController removeViewController:](self, "removeViewController:", v18);

        -[NUPageViewController setPossibleNextViewController:](self, "setPossibleNextViewController:", v15);
        -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUPageViewController addViewController:fromScroll:](self, "addViewController:fromScroll:", v19, 1);

        goto LABEL_15;
      }
    }
    else if (v17)
    {
      -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController removeViewController:](self, "removeViewController:", v82);

      -[NUPageViewController setPossibleNextViewController:](self, "setPossibleNextViewController:", 0);
    }
LABEL_16:
    -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v22, "setUserInteractionEnabled:", 0);

    -[NUPageViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v22) = objc_opt_respondsToSelector();

    if ((v22 & 1) != 0)
    {
      -[NUPageViewController visibleViewController](self, "visibleViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "frame");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[NUPageViewController view](self, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bounds");
      v36 = v35;
      -[NUPageViewController view](self, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "bounds");
      v88.size.height = v38;
      v88.origin.y = 0.0;
      v84.origin.x = v27;
      v84.origin.y = v29;
      v84.size.width = v31;
      v84.size.height = v33;
      v88.origin.x = v5;
      v88.size.width = v36;
      v85 = CGRectIntersection(v84, v88);
      width = v85.size.width;

      -[NUPageViewController view](self, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "bounds");
      v42 = width / v41;

      -[NUPageViewController delegate](self, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController visibleViewController](self, "visibleViewController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pageViewController:viewController:changedVisibilityFactor:", self, v44, v42);

      -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "frame");
        v49 = v48;
        v51 = v50;
        v53 = v52;
        v55 = v54;
        -[NUPageViewController view](self, "view");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "bounds");
        v58 = v57;
        -[NUPageViewController view](self, "view");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "bounds");
        v89.size.height = v60;
        v89.origin.y = 0.0;
        v86.origin.x = v49;
        v86.origin.y = v51;
        v86.size.width = v53;
        v86.size.height = v55;
        v89.origin.x = v5;
        v89.size.width = v58;
        v87 = CGRectIntersection(v86, v89);
        v61 = v87.size.width;

        -[NUPageViewController view](self, "view");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "bounds");
        v64 = v61 / v63;

        -[NUPageViewController delegate](self, "delegate");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[NUPageViewController possibleNextViewController](self, "possibleNextViewController");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "pageViewController:viewController:changedVisibilityFactor:", self, v66, v64);

      }
    }
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "center");
    v70 = v69;
    -[NUPageViewController scrollView](self, "scrollView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bounds");
    v73 = v70 + v72 * -1.5;

    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "center");
    v77 = v76;
    -[NUPageViewController scrollView](self, "scrollView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bounds");
    v80 = v79;

    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 <= v73)
    {
      -[NUPageViewController switchToPreviousViewController](self, "switchToPreviousViewController");
    }
    else
    {
      if (v5 < v77 + v80 * 0.5)
      {
LABEL_24:

        goto LABEL_25;
      }
      -[NUPageViewController switchToNextViewController](self, "switchToNextViewController");
    }
    -[NUPageViewController removeViewController:](self, "removeViewController:", v81);
    -[NUPageViewController setPossibleNextViewController:](self, "setPossibleNextViewController:", 0);
    goto LABEL_24;
  }
LABEL_25:

}

- (BOOL)_shouldIgnoreDidScrollWithScrollView:(id)a3
{
  id v4;
  _BOOL4 v5;
  char v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isDragging"))
  {
    -[NUPageViewController _assistiveTechnologyIsRunning](self, "_assistiveTechnologyIsRunning");
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "isDecelerating");
    v7 = -[NUPageViewController _assistiveTechnologyIsRunning](self, "_assistiveTechnologyIsRunning");
    LOBYTE(v5) = 0;
    if ((v6 & 1) == 0 && !v7)
      v5 = !-[NUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling");
  }

  return v5;
}

- (BOOL)_assistiveTechnologyIsRunning
{
  return UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
}

- (void)switchToNextViewController
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  UIViewController *v7;
  void *v8;
  UIViewController *visibleViewController;
  UIViewController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  id v37;

  -[NUPageViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[NUPageViewController nextViewController](self, "nextViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUPageViewController nextViewController](self, "nextViewController");
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setNextViewController:](self, "setNextViewController:", 0);
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setPreviousViewController:](self, "setPreviousViewController:", v8);

    visibleViewController = self->_visibleViewController;
    self->_visibleViewController = v7;
    v10 = v7;

    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v11);

    -[NUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "setUserInteractionEnabled:", 0);

    -[NUPageViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[NUPageViewController delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pageViewController:didChangeVisibleViewControllerFromViewController:direction:", self, v37, 2);

    }
    -[NUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
    -[NUPageViewController scrollView](self, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOffset");
    v18 = v17;

    -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
    -[NUPageViewController nextViewController](self, "nextViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[NUPageViewController scrollView](self, "scrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contentOffset");
      v22 = v21;
      v24 = v23;

      -[NUPageViewController scrollView](self, "scrollView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v27 = v26 + v26;

      if (v22 < v27)
      {
LABEL_12:
        -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);

        return;
      }
      -[NUPageViewController scrollView](self, "scrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v30 = v22 - v29;

    }
    else
    {
      v31 = v5 * 0.5;
      v32 = v5 * 0.5 + v18;
      -[NUPageViewController previousViewController](self, "previousViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[NUPageViewController scrollView](self, "scrollView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contentOffset");
      v24 = v35;

      if (v33)
        v30 = v32 - v31;
      else
        v30 = v32 - v5 - v31;
    }
    -[NUPageViewController scrollView](self, "scrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setContentOffset:", v30, v24);

    goto LABEL_12;
  }
}

- (BOOL)canSwitchToPreviousViewController
{
  void *v2;
  BOOL v3;

  -[NUPageViewController previousViewController](self, "previousViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canSwitchToNextViewController
{
  void *v2;
  BOOL v3;

  -[NUPageViewController nextViewController](self, "nextViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_keyboardSwitchGoingRight:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  double Width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  CGRect v20;

  v3 = a3;
  if (!-[NUPageViewController scrollViewStartedScrolling](self, "scrollViewStartedScrolling"))
  {
    v5 = -[NUPageViewController canSwitchToNextViewController](self, "canSwitchToNextViewController");
    v6 = -[NUPageViewController canSwitchToPreviousViewController](self, "canSwitchToPreviousViewController");
    if (v3 ? v5 : v6)
    {
      -[NUPageViewController visibleViewController](self, "visibleViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v8);

      -[NUPageViewController scrollView](self, "scrollView");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      Width = CGRectGetWidth(v20);
      if (v3)
        v10 = Width;
      else
        v10 = -Width;
      objc_msgSend(v19, "contentOffset");
      v12 = fmax(v10 + v11, 0.0);
      objc_msgSend(v19, "contentSize");
      v14 = v13 - Width;
      if (v12 >= v14)
        v15 = v14;
      else
        v15 = v12;
      objc_msgSend(v19, "contentOffset");
      v17 = v16;
      -[NUPageViewController handleScrollStart](self, "handleScrollStart");
      -[NUPageViewController scrollView](self, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setContentOffset:animated:", 1, v15, v17);

    }
  }
}

- (void)keyboardOrActionSwitchToNextViewController
{
  -[NUPageViewController _keyboardSwitchGoingRight:](self, "_keyboardSwitchGoingRight:", 1);
}

- (void)keyboardOrActionSwitchToPreviousViewController
{
  -[NUPageViewController _keyboardSwitchGoingRight:](self, "_keyboardSwitchGoingRight:", 0);
}

- (void)switchToPreviousViewController
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UIViewController *v10;
  void *v11;
  UIViewController *visibleViewController;
  UIViewController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  -[NUPageViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[NUPageViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;

  -[NUPageViewController previousViewController](self, "previousViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NUPageViewController previousViewController](self, "previousViewController");
    v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setPreviousViewController:](self, "setPreviousViewController:", 0);
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setNextViewController:](self, "setNextViewController:", v11);

    visibleViewController = self->_visibleViewController;
    self->_visibleViewController = v10;
    v13 = v10;

    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUPageViewController setOriginalVisibleViewController:](self, "setOriginalVisibleViewController:", v14);

    -[NUPageViewController originalVisibleViewController](self, "originalVisibleViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "setUserInteractionEnabled:", 0);

    -[NUPageViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[NUPageViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pageViewController:didChangeVisibleViewControllerFromViewController:direction:", self, v29, 1);

    }
    -[NUPageViewController managePreviousAndNextViewController](self, "managePreviousAndNextViewController");
    -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 1);
    -[NUPageViewController previousViewController](self, "previousViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUPageViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentOffset");
    v23 = v22;
    if (v19)
    {
      v24 = v21;

      -[NUPageViewController scrollView](self, "scrollView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      v27 = v24 + v26;

    }
    else
    {

      v27 = v5 * 0.5 + v8 - v5 * 0.5;
    }
    -[NUPageViewController scrollView](self, "scrollView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentOffset:", v27, v23);

    -[NUPageViewController setCancelScrollViewDidScroll:](self, "setCancelScrollViewDidScroll:", 0);
  }
}

- (void)transitionToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  height = a3.height;
  width = a3.width;
  v31 = *MEMORY[0x24BDAC8D0];
  -[NUPageViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  -[NUPageViewController scrollView](self, "scrollView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", v8, v10, width + 4.0, height);

  -[NUPageViewController childViewControllers](self, "childViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NUPageViewController childViewControllers](self, "childViewControllers", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v19, "view");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bounds");
          v22 = v21;
          v24 = v23;

          objc_msgSend(v19, "view");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setBounds:", v22, v24, width, height);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    -[NUPageViewController repositionPages](self, "repositionPages");
    -[NUPageViewController updateContentSize](self, "updateContentSize");
    -[NUPageViewController updateContentOffset](self, "updateContentOffset");
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[7];
  objc_super v21;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  v21.receiver = self;
  v21.super_class = (Class)NUPageViewController;
  v7 = a4;
  -[NUPageViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[NUPageViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isDecelerating"))
  {

LABEL_4:
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "center");
    v14 = v13;
    -[NUPageViewController visibleViewController](self, "visibleViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v17 = v14 + CGRectGetWidth(v22) * -0.5 + -2.0;

    -[NUPageViewController scrollView](self, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentOffset:animated:", 0, v17, 0.0);

    goto LABEL_5;
  }
  -[NUPageViewController scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDragging");

  if (v10)
    goto LABEL_4;
LABEL_5:
  self->_isTransitioning = 1;
  self->_transitioningSize.width = width;
  self->_transitioningSize.height = height;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__NUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v20[3] = &unk_24D5A2D88;
  v20[4] = self;
  *(double *)&v20[5] = width;
  *(double *)&v20[6] = height;
  v19 = (void *)MEMORY[0x2199FC190](v20);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v19, 0);

}

uint64_t __75__NUPageViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "transitionToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 969) = 0;
  return result;
}

- (NUPageViewControllerDataSource)dataSource
{
  return (NUPageViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NUPageViewControllerDelegate)delegate
{
  return (NUPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)visibleViewController
{
  return self->_visibleViewController;
}

- (NUPageViewControllerScrollView)scrollView
{
  return self->_scrollView;
}

- (OS_dispatch_group)idleDispatchGroup
{
  return self->_idleDispatchGroup;
}

- (UIViewController)managedForViewController
{
  return self->_managedForViewController;
}

- (void)setManagedForViewController:(id)a3
{
  objc_storeStrong((id *)&self->_managedForViewController, a3);
}

- (UIViewController)previousViewController
{
  return self->_previousViewController;
}

- (void)setPreviousViewController:(id)a3
{
  objc_storeStrong((id *)&self->_previousViewController, a3);
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nextViewController, a3);
}

- (UIViewController)possibleNextViewController
{
  return self->_possibleNextViewController;
}

- (UIViewController)originalVisibleViewController
{
  return self->_originalVisibleViewController;
}

- (void)setOriginalVisibleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_originalVisibleViewController, a3);
}

- (UIViewController)appearingViewController
{
  return self->_appearingViewController;
}

- (void)setAppearingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appearingViewController, a3);
}

- (UIViewController)disappearingViewController
{
  return self->_disappearingViewController;
}

- (void)setDisappearingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_disappearingViewController, a3);
}

- (BOOL)cancelScrollViewDidScroll
{
  return self->_cancelScrollViewDidScroll;
}

- (void)setCancelScrollViewDidScroll:(BOOL)a3
{
  self->_cancelScrollViewDidScroll = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (CGSize)transitioningSize
{
  double width;
  double height;
  CGSize result;

  width = self->_transitioningSize.width;
  height = self->_transitioningSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)scrollViewStartedScrolling
{
  return self->_scrollViewStartedScrolling;
}

- (NSMutableArray)replayViewTransitions
{
  return self->_replayViewTransitions;
}

- (void)setReplayViewTransitions:(id)a3
{
  objc_storeStrong((id *)&self->_replayViewTransitions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayViewTransitions, 0);
  objc_storeStrong((id *)&self->_disappearingViewController, 0);
  objc_storeStrong((id *)&self->_appearingViewController, 0);
  objc_storeStrong((id *)&self->_originalVisibleViewController, 0);
  objc_storeStrong((id *)&self->_possibleNextViewController, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_previousViewController, 0);
  objc_storeStrong((id *)&self->_managedForViewController, 0);
  objc_storeStrong((id *)&self->_idleDispatchGroup, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_visibleViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
