@implementation AVMobileChromelessContentTabsViewController

- (AVMobileChromelessContentTabsViewController)init
{
  AVMobileChromelessContentTabsViewController *v2;
  void *v3;
  void *v4;
  AVMobileChromelessControlsStyleSheet *v5;
  AVMobileChromelessControlsStyleSheet *styleSheet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessContentTabsViewController;
  v2 = -[AVMobileChromelessContentTabsViewController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[AVMobileChromelessControlsStyleSheet initWithTraitCollection:]([AVMobileChromelessControlsStyleSheet alloc], "initWithTraitCollection:", v4);
    styleSheet = v2->_styleSheet;
    v2->_styleSheet = v5;

    v2->_initialContentTabIndex = 0;
  }
  return v2;
}

- (void)loadView
{
  AVMobileChromelessContentTabsView *v3;
  AVMobileChromelessContentTabsView *view;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessContentTabsViewController;
  -[AVMobileChromelessContentTabsViewController loadView](&v5, sel_loadView);
  v3 = -[AVMobileChromelessContentTabsView initWithStyleSheet:]([AVMobileChromelessContentTabsView alloc], "initWithStyleSheet:", self->_styleSheet);
  -[AVMobileChromelessContentTabsView setOverrideUserInterfaceStyle:](v3, "setOverrideUserInterfaceStyle:", 2);
  -[AVMobileChromelessContentTabsView setDelegate:](v3, "setDelegate:", self);
  -[AVMobileChromelessContentTabsView setContentViewDelegate:](v3, "setContentViewDelegate:", self);
  -[AVMobileChromelessContentTabsViewController setView:](self, "setView:", v3);
  view = self->_view;
  self->_view = v3;

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessContentTabsViewController;
  -[AVMobileChromelessContentTabsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__AVMobileChromelessContentTabsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5BB35A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)setCustomInfoViewControllers:(id)a3
{
  NSArray *v4;
  NSArray *customInfoViewControllers;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  AVMobileContentTab *v14;
  NSArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_customInfoViewControllers != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    customInfoViewControllers = self->_customInfoViewControllers;
    self->_customInfoViewControllers = v4;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_customInfoViewControllers, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = self->_customInfoViewControllers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%ld"), CFSTR("com.apple.avkit.AVPlayerViewController.content-tab-button"), CFSTR("-"), v9 + i);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[AVMobileContentTab initWithCustomInfoViewController:accessibilityIdentifier:]([AVMobileContentTab alloc], "initWithCustomInfoViewController:accessibilityIdentifier:", v12, v13);
          objc_msgSend(v6, "addObject:", v14);

        }
        v9 += i;
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    -[AVMobileChromelessContentTabsView setContentTabs:](self->_view, "setContentTabs:", v6);
  }
}

- (void)updateSelectedCustomInfoViewController
{
  id v3;

  -[AVMobileChromelessContentTabsView selectedContentTab](self->_view, "selectedContentTab");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVMobileChromelessContentTabsViewController _setActiveCustomInfoViewControllerForContentTab:]((uint64_t)self, v3);

}

- (void)invalidateContentTabsSelection
{
  -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  -[AVMobileChromelessContentTabsView resetSelection](self->_view, "resetSelection");
  -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_activeCustomInfoViewController);
  -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_upcomingCustomInfoViewController);
}

- (UIViewController)selectedCustomInfoViewController
{
  return self->_selectedCustomInfoViewController;
}

- (void)selectInitialCustomInfoViewController
{
  unint64_t initialContentTabIndex;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  if (!self)
    goto LABEL_7;
  initialContentTabIndex = self->_initialContentTabIndex;
  -[AVMobileChromelessContentTabsView contentTabs](self->_view, "contentTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[AVMobileChromelessContentTabsView contentTabs](self->_view, "contentTabs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    if (initialContentTabIndex >= v5 - 1)
      v8 = v5 - 1;
    else
      v8 = initialContentTabIndex;
    -[AVMobileChromelessContentTabsView contentTabs](self->_view, "contentTabs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v10 = 0;
  }
  -[AVMobileChromelessContentTabsViewController _setSelectedCustomInfoViewControllerForContentTab:withChangingReason:]((id *)&self->super.super.super.isa, v10, 0);

}

- (UIViewController)upcomingCustomInfoViewController
{
  return self->_upcomingCustomInfoViewController;
}

- (void)setUpcomingContentTab:(id)a3
{
  AVMobileContentTab *v5;
  AVMobileContentTab *v6;
  UIViewController *v7;
  UIViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  UIViewController *upcomingCustomInfoViewController;
  UIViewController *v13;
  uint64_t v14;
  void *v15;
  AVMobileContentTab *v16;

  v5 = (AVMobileContentTab *)a3;
  if (self->_upcomingContentTab != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_upcomingContentTab, a3);
    v6 = self->_upcomingContentTab;
    -[AVMobileContentTab viewController](v6, "viewController");
    v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_upcomingCustomInfoViewController != v7)
    {
      -[UIViewController view](v7, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && !-[UIViewController isViewLoaded](v8, "isViewLoaded"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error: Internal inconsistency. The upcomingCustomInfoViewController's view has not been loaded yet."));
      -[UIViewController parentViewController](v8, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("A customInfoViewController already has a parent view controller: %@"), v8);
      objc_msgSend(v9, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("A customInfoViewController's view already has a superview: %@"), v8);
      upcomingCustomInfoViewController = self->_upcomingCustomInfoViewController;
      if (upcomingCustomInfoViewController)
        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, upcomingCustomInfoViewController);
      objc_storeStrong((id *)&self->_upcomingCustomInfoViewController, v8);
      v13 = self->_upcomingCustomInfoViewController;
      if (v13)
      {
        -[UIViewController willMoveToParentViewController:](v13, "willMoveToParentViewController:", self);
        -[AVMobileChromelessContentTabsViewController addChildViewController:](self, "addChildViewController:", self->_upcomingCustomInfoViewController);
        -[UIViewController didMoveToParentViewController:](self->_upcomingCustomInfoViewController, "didMoveToParentViewController:", self);
      }
      v14 = -[AVMobileChromelessContentTabsViewController transitionState](self, "transitionState");
      -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:]((uint64_t)self, v14, v15, v6);

    }
    v5 = v16;
  }

}

- (void)setTransitionState:(unint64_t)a3
{
  void *v5;
  id v6;

  if (self->_transitionState != a3)
  {
    self->_transitionState = a3;
    -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessContentTabsViewController upcomingContentTab](self, "upcomingContentTab");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:]((uint64_t)self, a3, v6, v5);

  }
}

- (void)setCurrentContentTabIndex:(int64_t)a3
{
  id v4;

  if (self->_currentContentTabIndex != a3)
  {
    self->_currentContentTabIndex = a3;
    -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVMobileChromelessContentTabsViewController _setActiveCustomInfoViewControllerForContentTab:]((uint64_t)self, v4);

  }
}

- (void)contentTabsView:(id)a3 didChangeContentTab:(id)a4 withReason:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  UIViewPropertyAnimator *contentViewScrollViewAnimator;
  double v12;
  double v13;
  UIViewPropertyAnimator *v14;
  void *v15;
  id v16;
  double v17;
  UIViewPropertyAnimator *v18;
  UIViewPropertyAnimator *v19;
  UIViewPropertyAnimator *v20;
  void *v21;
  id v22;
  UIViewPropertyAnimator *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id from;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id location;
  uint64_t block;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39[2];

  v27 = a3;
  v8 = a4;
  v9 = v8;
  self->_selectionChangedReason = a5;
  if (a5 == 2)
  {
    -[AVMobileChromelessContentTabsViewController _didChangeContentTabTo:](self, "_didChangeContentTabTo:", v8, v27);
  }
  else
  {
    if (a5 == 1)
      goto LABEL_15;
    if (a5)
      goto LABEL_20;
    if (v8)
    {
      v10 = v8;
      contentViewScrollViewAnimator = self->_contentViewScrollViewAnimator;
      v12 = 1.0;
      if (contentViewScrollViewAnimator
        && -[UIViewPropertyAnimator isRunning](contentViewScrollViewAnimator, "isRunning", v27)
        && -[UIViewPropertyAnimator isInterruptible](self->_contentViewScrollViewAnimator, "isInterruptible"))
      {
        -[UIViewPropertyAnimator fractionComplete](self->_contentViewScrollViewAnimator, "fractionComplete");
        v12 = v13;
        -[UIViewPropertyAnimator stopAnimation:](self->_contentViewScrollViewAnimator, "stopAnimation:", 1);
        -[UIViewPropertyAnimator finishAnimationAtPosition:](self->_contentViewScrollViewAnimator, "finishAnimationAtPosition:", 2);
        v14 = self->_contentViewScrollViewAnimator;
        self->_contentViewScrollViewAnimator = 0;

        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_replacingCustomInfoViewController);
      }
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA0]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 250.0, 30.0, 0.0, 0.0);
      objc_initWeak(&location, self);
      v16 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v17 = 0.3;
      if (v12 <= 1.0)
        v17 = v12 * 0.3;
      v18 = (UIViewPropertyAnimator *)objc_msgSend(v16, "initWithDuration:timingParameters:", v15, v17, v27);
      v19 = self->_contentViewScrollViewAnimator;
      self->_contentViewScrollViewAnimator = v18;

      v20 = self->_contentViewScrollViewAnimator;
      v21 = (void *)MEMORY[0x1E0C809B0];
      block = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke;
      v37 = &unk_1E5BB45E8;
      objc_copyWeak(v39, &location);
      v22 = v10;
      v38 = v22;
      -[UIViewPropertyAnimator addAnimations:](v20, "addAnimations:", &block);
      v23 = self->_contentViewScrollViewAnimator;
      from = v21;
      v29 = 3221225472;
      v30 = __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke_2;
      v31 = &unk_1E5BB38A0;
      objc_copyWeak(&v32, &location);
      -[UIViewPropertyAnimator addCompletion:](v23, "addCompletion:", &from);
      -[UIViewPropertyAnimator startAnimation](self->_contentViewScrollViewAnimator, "startAnimation");
      objc_destroyWeak(&v32);

      objc_destroyWeak(v39);
      objc_destroyWeak(&location);

    }
    else
    {
      -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_replacingCustomInfoViewController);
    }
  }
  a5 = 0;
LABEL_15:
  -[AVMobileChromelessContentTabsView selectedContentTab](self->_view, "selectedContentTab", v27, from, v29, v30, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25 && (objc_msgSend(v25, "isViewLoaded") & 1) == 0)
  {
    objc_initWeak(&from, self);
    block = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __105__AVMobileChromelessContentTabsViewController__updateSelectedCustomInfoViewControllerWithChangingReason___block_invoke;
    v37 = &unk_1E5BB08F0;
    objc_copyWeak(v39, &from);
    v38 = v26;
    v39[1] = (id)a5;
    dispatch_async(MEMORY[0x1E0C80D38], &block);

    objc_destroyWeak(v39);
    objc_destroyWeak(&from);
  }
  else
  {
    -[AVMobileChromelessContentTabsViewController _setSelectedCustomInfoViewControllerForContentTab:withChangingReason:]((id *)&self->super.super.super.isa, v24, a5);
  }

LABEL_20:
}

- (void)_didChangeContentTabTo:(id)a3
{
  AVMobileChromelessContentTabsView *view;
  id v5;
  void *v6;
  uint64_t v7;
  int64_t initialContentTabIndex;

  if (a3)
  {
    view = self->_view;
    v5 = a3;
    -[AVMobileChromelessContentTabsView contentTabs](view, "contentTabs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v5);

    initialContentTabIndex = v7;
  }
  else
  {
    initialContentTabIndex = self->_initialContentTabIndex;
    v7 = -1;
  }
  self->_initialContentTabIndex = initialContentTabIndex;
  -[AVMobileChromelessContentTabsViewController setCurrentContentTabIndex:](self, "setCurrentContentTabIndex:", v7);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isDecelerating") & 1) == 0)
    -[AVMobileChromelessContentTabsView setNeedsLayout](self->_view, "setNeedsLayout");
  if (objc_msgSend(v4, "isTracking"))
    -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  -[AVMobileChromelessContentTabsViewController setTransitionState:](self, "setTransitionState:", 0);

}

- (void)scrollViewDidScroll:(id)a3
{
  AVMobileContentTab *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  int64_t currentContentTabIndex;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v27;
  id v28;

  v28 = a3;
  if (objc_msgSend(v28, "isTracking"))
    -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  v4 = self->_upcomingContentTab;
  -[AVMobileChromelessContentTabsView contentTabs](self->_view, "contentTabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isTracking") && objc_msgSend(v28, "isDragging"))
  {
    v6 = -[AVMobileChromelessContentTabsView effectiveUserInterfaceLayoutDirection](self->_view, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(v28, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "translationInView:", v28);
    v9 = v8;

    if (v9 <= 0.0)
    {
      if (v6 == 1)
      {
        currentContentTabIndex = self->_currentContentTabIndex;
        if (currentContentTabIndex <= 1)
          currentContentTabIndex = 1;
        v12 = currentContentTabIndex - 1;
      }
      else
      {
        v16 = objc_msgSend(v5, "count");
        v17 = self->_currentContentTabIndex;
        if (v16 - 1 >= (unint64_t)(v17 + 1))
          v12 = v17 + 1;
        else
          v12 = v16 - 1;
      }
      v6 = 2;
    }
    else if (v6 == 1)
    {
      v10 = objc_msgSend(v5, "count");
      v11 = self->_currentContentTabIndex;
      if (v10 - 1 >= (unint64_t)(v11 + 1))
        v12 = v11 + 1;
      else
        v12 = v10 - 1;
    }
    else
    {
      v15 = self->_currentContentTabIndex;
      if (v15 <= 1)
        v15 = 1;
      v12 = v15 - 1;
      v6 = 1;
    }
    objc_msgSend(v5, "objectAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "panGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "panGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "locationInView:", v19);
    v22 = v21;
    v23 = v21 - 1;
    v24 = ((v21 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;

    if (v22 >= 0 && v24 <= 0x3FE || v23 <= 0xFFFFFFFFFFFFELL)
    {
      -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27 != v13)
        -[AVMobileChromelessContentTabsViewController setUpcomingContentTab:](self, "setUpcomingContentTab:", v13);
      -[AVMobileChromelessContentTabsViewController setTransitionState:](self, "setTransitionState:", v6);
    }

  }
  else
  {
    v13 = v4;
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v20;
  id v21;
  void *v22;
  UIViewController *v23;
  UIViewController *upcomingCustomInfoViewController;
  UIViewController *v25;
  id v26;

  v26 = a3;
  -[AVMobileChromelessContentTabsViewController _invalidateContentViewScrollViewAnimator]((uint64_t)self);
  -[AVMobileChromelessContentTabsView setNeedsLayout](self->_view, "setNeedsLayout");
  objc_msgSend(v26, "frame");
  v5 = v4;
  objc_msgSend(v26, "contentOffset");
  v7 = (unint64_t)(v6 / v5);
  if (-[AVMobileChromelessContentTabsView effectiveUserInterfaceLayoutDirection](self->_view, "effectiveUserInterfaceLayoutDirection") == 1)
  {
    -[AVMobileChromelessContentTabsView contentTabs](self->_view, "contentTabs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count") + ~v7;

  }
  -[AVMobileChromelessContentTabsView contentTabs](self->_view, "contentTabs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v26, "panGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "panGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationInView:", v12);
  v15 = v14;
  v16 = v14 - 1;
  v17 = ((v14 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;

  if (v15 >= 0 && v17 <= 0x3FE || v16 <= 0xFFFFFFFFFFFFELL)
  {
    if (v7 >= v10 - 1)
      v20 = v10 - 1;
    else
      v20 = v7;
    -[AVMobileChromelessContentTabsViewController setCurrentContentTabIndex:](self, "setCurrentContentTabIndex:", v20);
    -[AVMobileChromelessContentTabsViewController setTransitionState:](self, "setTransitionState:", 0);
    -[AVMobileChromelessContentTabsViewController setUpcomingContentTab:](self, "setUpcomingContentTab:", 0);
    -[AVMobileChromelessContentTabsViewController _activeContentTab]((id *)&self->super.super.super.isa);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (self->_upcomingCustomInfoViewController)
    {
      objc_msgSend(v21, "viewController");
      v23 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      upcomingCustomInfoViewController = self->_upcomingCustomInfoViewController;

      if (v23 != upcomingCustomInfoViewController)
      {
        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)self, self->_upcomingCustomInfoViewController);
        v25 = self->_upcomingCustomInfoViewController;
        self->_upcomingCustomInfoViewController = 0;

        -[AVMobileChromelessContentTabsViewController setUpcomingContentTab:](self, "setUpcomingContentTab:", 0);
      }
    }

  }
}

- (NSArray)customInfoViewControllers
{
  return self->_customInfoViewControllers;
}

- (AVMobileContentTab)upcomingContentTab
{
  return self->_upcomingContentTab;
}

- (unint64_t)transitionState
{
  return self->_transitionState;
}

- (int64_t)currentContentTabIndex
{
  return self->_currentContentTabIndex;
}

- (AVMobileChromelessContentTabsViewControllerDelegate)delegate
{
  return (AVMobileChromelessContentTabsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_upcomingContentTab, 0);
  objc_storeStrong((id *)&self->_customInfoViewControllers, 0);
  objc_storeStrong((id *)&self->_contentViewScrollViewAnimator, 0);
  objc_storeStrong((id *)&self->_replacingCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_upcomingCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_activeCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_selectedCustomInfoViewController, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)_invalidateContentViewScrollViewAnimator
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 1016);
    if (v2)
    {
      objc_msgSend(v2, "stopAnimation:", 1);
      objc_msgSend(*(id *)(a1 + 1016), "finishAnimationAtPosition:", 2);
      v3 = *(void **)(a1 + 1016);
      *(_QWORD *)(a1 + 1016) = 0;

      -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:](a1, *(void **)(a1 + 1008));
    }
  }
}

- (_QWORD)_activeContentTab
{
  _QWORD *v1;
  void *v2;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1[121], "contentTabs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "count") || v1[133] == -1)
    {
      v1 = 0;
    }
    else
    {
      objc_msgSend(v2, "objectAtIndex:");
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v1;
}

- (void)_detachViewControllerIfNeeded:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1 && v3)
  {
    v5 = v3;
    objc_msgSend(v3, "willMoveToParentViewController:", 0);
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v5, "removeFromParentViewController");
    objc_msgSend(v5, "didMoveToParentViewController:", 0);

    v3 = 0;
  }

}

void __105__AVMobileChromelessContentTabsViewController__updateSelectedCustomInfoViewControllerWithChangingReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[121], "selectedContentTab");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 == *(void **)(a1 + 32))
    {
      objc_msgSend(v4, "loadViewIfNeeded");
      -[AVMobileChromelessContentTabsViewController _setSelectedCustomInfoViewControllerForContentTab:withChangingReason:](v6, v3, *(_QWORD *)(a1 + 48));
    }

    WeakRetained = v6;
  }

}

- (void)_setSelectedCustomInfoViewControllerForContentTab:(uint64_t)a3 withChangingReason:
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  if (a1)
  {
    v11 = v5;
    objc_msgSend(v5, "viewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a1[123] != v6)
    {
      objc_storeStrong(a1 + 123, v6);
      -[AVMobileChromelessContentTabsViewController _setActiveCustomInfoViewControllerForContentTab:]((uint64_t)a1, v11);
      objc_msgSend(a1, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        objc_msgSend(a1, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "viewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contentTabsViewController:didChangeSelectedCustomInfoViewController:withReason:", a1, v10, a3);

      }
    }

    v5 = v11;
  }

}

- (void)_setActiveCustomInfoViewControllerForContentTab:(uint64_t)a1
{
  id v3;
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
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a2;
  if (a1)
  {
    v16 = v3;
    objc_msgSend(v3, "viewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(void **)(a1 + 992) != v4)
    {
      objc_msgSend(v4, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_msgSend(v5, "isViewLoaded") & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error: Internal inconsistency. The activeCustomInfoViewController's view has not been loaded yet."));
      objc_msgSend(v5, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = *(void **)(a1 + 1000);

        if (v5 != v8)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("A customInfoViewController already has a parent view controller: %@"), v5);
      }
      objc_msgSend(v6, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = *(void **)(a1 + 1000);

        if (v5 != v10)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("A customInfoViewController's view already has a superview: %@"), v5);
      }
      v11 = *(void **)(a1 + 992);
      if (v11 && !*(_QWORD *)(a1 + 1016))
        -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:](a1, v11);
      else
        objc_storeStrong((id *)(a1 + 1008), v11);
      objc_storeStrong((id *)(a1 + 992), v5);
      v12 = *(void **)(a1 + 1000);
      v13 = *(void **)(a1 + 992);
      if (v12 && v12 == v13)
      {
        *(_QWORD *)(a1 + 1000) = 0;

      }
      else if (v13)
      {
        objc_msgSend(v13, "willMoveToParentViewController:", a1);
        objc_msgSend((id)a1, "addChildViewController:", *(_QWORD *)(a1 + 992));
        objc_msgSend(*(id *)(a1 + 992), "didMoveToParentViewController:", a1);
      }
      v14 = objc_msgSend((id)a1, "transitionState");
      objc_msgSend(*(id *)(a1 + 968), "selectedContentTab");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:](a1, v14, v15, v16);

    }
    v3 = v16;
  }

}

- (void)_updateContentTabsPresentationWithTransitioningState:(void *)a3 from:(void *)a4 to:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = v7;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 1024);
    _AVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "-[AVMobileChromelessContentTabsViewController _updateContentTabsPresentationWithTransitioningState:from:to:]";
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2048;
      v24 = a2;
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s Transitioning content tabs from: %@ --> to: %@, with transitioning state: %ld", buf, 0x2Au);
    }

    v13 = *(void **)(a1 + 968);
    v14 = v9;
    v16[0] = v14;
    v15 = v10;
    v16[1] = v15;
    v16[2] = a2;
    v16[3] = v11;
    if (v13)
    {
      objc_msgSend(v13, "setTransitionState:", v16);
    }
    else
    {

    }
  }

}

void __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didChangeContentTabTo:", *(_QWORD *)(a1 + 32));

}

void __97__AVMobileChromelessContentTabsViewController__performHorizontalTransitionAnimationToContentTab___block_invoke_2(uint64_t a1)
{
  void **WeakRetained;
  void *v2;
  void **v3;

  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    -[AVMobileChromelessContentTabsViewController _detachViewControllerIfNeeded:]((uint64_t)WeakRetained, WeakRetained[126]);
    v2 = v3[127];
    v3[127] = 0;

    WeakRetained = v3;
  }

}

void __98__AVMobileChromelessContentTabsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[121], "resetSelection");
    objc_msgSend(WeakRetained[121], "setNeedsLayout");
  }

}

@end
