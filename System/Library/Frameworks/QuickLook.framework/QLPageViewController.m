@implementation QLPageViewController

- (QLPageViewController)init
{
  QLPageViewController *v2;
  QLPageViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLPageViewController;
  v2 = -[QLPageViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[QLPageViewController _setUp](v2, "_setUp");
  return v3;
}

- (QLPageViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  float v11;
  QLPageViewController *v12;
  objc_super v14;

  v8 = *MEMORY[0x24BEBE5E8];
  v9 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  self->_interPageSpacing = v11;

  v14.receiver = self;
  v14.super_class = (Class)QLPageViewController;
  v12 = -[QLPageViewController initWithTransitionStyle:navigationOrientation:options:](&v14, sel_initWithTransitionStyle_navigationOrientation_options_, a3, a4, v9);

  -[QLPageViewController _setUp](v12, "_setUp");
  return v12;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  -[QLPageViewController _setCurrentPageIndex:direction:animated:completion:](self, "_setCurrentPageIndex:direction:animated:completion:", a3, 0, 0, 0);
}

- (void)setCurrentPageIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  _BOOL8 v8;
  unint64_t v9;
  NSMapTable *pages;
  void *v11;
  void *v12;
  NSMapTable *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27[3];
  BOOL v28;
  id location;

  if (!self->_isTransitioning)
  {
    v4 = a4;
    -[QLPageViewController scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

    v8 = -[QLPageViewController currentPageIndex](self, "currentPageIndex") >= a3;
    v9 = -[QLPageViewController currentPageIndex](self, "currentPageIndex");
    pages = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](pages, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v13, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      -[QLPageViewController _viewControllerAtIndex:offset:](self, "_viewControllerAtIndex:offset:", a3, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    if (!v12)
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v9 != a3)
    {
      -[QLPageViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        -[QLPageViewController delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pageViewController:willTransitionFromPage:withIndex:toPage:withIndex:animated:", self, v12, v9, v18, a3, v4);

      }
    }
    self->_isTransitioning = 1;
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __53__QLPageViewController_setCurrentPageIndex_animated___block_invoke;
    v24[3] = &unk_24C725E20;
    objc_copyWeak(v27, &location);
    v27[1] = (id)v9;
    v27[2] = (id)a3;
    v24[4] = self;
    v22 = v12;
    v25 = v22;
    v23 = v18;
    v26 = v23;
    v28 = v4;
    -[QLPageViewController _setCurrentPageIndex:direction:animated:completion:](self, "_setCurrentPageIndex:direction:animated:completion:", a3, v8, v4, v24);

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);

  }
}

void __53__QLPageViewController_setCurrentPageIndex_animated___block_invoke(uint64_t a1, int a2)
{
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  id v12;

  v4 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_unsetParallaxEffect");

  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

  if (a2 && *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v12 = objc_loadWeakRetained(v4);
      objc_msgSend(v12, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained(v4);
      objc_msgSend(v10, "pageViewController:didTransitionFromPage:withIndex:toPage:withIndex:animated:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80));

    }
  }
}

- (UIViewController)currentPage
{
  void *v2;
  void *v3;

  -[QLPageViewController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIViewController *)v3;
}

- (void)clearInternalCache
{
  self->_currentPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentPageIndexForAppliedParallaxEffect = 0x7FFFFFFFFFFFFFFFLL;
  -[NSMapTable removeAllObjects](self->_pages, "removeAllObjects");
}

- (UIScrollView)scrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[QLPageViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v4;
}

- (void)setDelegate:(id)a3
{
  UIPageViewControllerDelegate **p_definedDelegate;
  id v5;

  p_definedDelegate = &self->_definedDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_definedDelegate, v5);
  -[QLDelegateProxy setSecondDelegate:](self->_pageViewControllerDelegateProxy, "setSecondDelegate:", v5);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_definedDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  -[QLDelegateProxy setSecondDelegate:](self->_scrollViewDelegateProxy, "setSecondDelegate:", a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLPageViewController;
  -[QLPageViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[QLPageViewController _unsetParallaxEffect](self, "_unsetParallaxEffect");
}

- (void)_setUp
{
  NSMapTable *v3;
  NSMapTable *pages;
  QLDelegateProxy *v5;
  QLDelegateProxy *scrollViewDelegateProxy;
  void *v7;
  void *v8;
  UIScrollView *v9;
  UIScrollView *scrollView;
  QLDelegateProxy *v11;
  QLDelegateProxy *pageViewControllerDelegateProxy;
  QLDelegateProxy *v13;
  objc_super v14;

  self->_currentPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  self->_currentPageIndexForAppliedParallaxEffect = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  pages = self->_pages;
  self->_pages = v3;

  v5 = [QLDelegateProxy alloc];
  scrollViewDelegateProxy = self->_scrollViewDelegateProxy;
  self->_scrollViewDelegateProxy = v5;

  -[QLDelegateProxy setFirstDelegate:](self->_scrollViewDelegateProxy, "setFirstDelegate:", self);
  -[QLPageViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  scrollView = self->_scrollView;
  self->_scrollView = v9;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self->_scrollViewDelegateProxy);
  -[UIScrollView _setAutoScrollEnabled:](self->_scrollView, "_setAutoScrollEnabled:", 0);
  v11 = [QLDelegateProxy alloc];
  pageViewControllerDelegateProxy = self->_pageViewControllerDelegateProxy;
  self->_pageViewControllerDelegateProxy = v11;

  -[QLDelegateProxy setFirstDelegate:](self->_pageViewControllerDelegateProxy, "setFirstDelegate:", self);
  v13 = self->_pageViewControllerDelegateProxy;
  v14.receiver = self;
  v14.super_class = (Class)QLPageViewController;
  -[QLPageViewController setDelegate:](&v14, sel_setDelegate_, v13);
  -[QLPageViewController setDataSource:](self, "setDataSource:", self);
}

- (void)_loadAndCacheViewControllersBeforeAndAfterIndex:(int64_t)a3
{
  id v5;
  id v6;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v5 = -[QLPageViewController _viewControllerAtIndex:offset:](self, "_viewControllerAtIndex:offset:", a3, -1);
  v6 = -[QLPageViewController _viewControllerAtIndex:offset:](self, "_viewControllerAtIndex:offset:", a3, 1);
}

- (void)_rearrangeCachedViewControllersWithNewCurrentPageIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMapTable keyEnumerator](self->_pages, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "longValue");
        v13 = v12 - a3;
        if (v12 - a3 < 0)
          v13 = a3 - v12;
        if (v13 >= 2)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[NSMapTable removeObjectForKey:](self->_pages, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (unint64_t)_indexOfViewController:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_pages;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_pages, "objectForKey:", v10, (_QWORD)v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = objc_msgSend(v10, "unsignedIntegerValue");
          goto LABEL_11;
        }
      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (id)_cachedViewControllerAtIndex:(unint64_t)a3 offset:(int64_t)a4
{
  void *v4;
  NSMapTable *pages;
  void *v6;

  if ((a4 & 0x8000000000000000) == 0 || (v4 = 0, -a4 <= a3))
  {
    pages = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4 + a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](pages, "objectForKey:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_viewControllerAtIndex:(unint64_t)a3 offset:(int64_t)a4
{
  void *v7;
  NSMapTable *pages;
  void *v9;
  void *v10;
  id v11;
  NSMapTable *v12;
  void *v13;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if ((a4 & 0x8000000000000000) == 0 || (v7 = 0, -a4 <= a3))
  {
    pages = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4 + a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](pages, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      v11 = -[QLPageViewController _retrieveAndStoreViewControllerAtIndex:offset:](self, "_retrieveAndStoreViewControllerAtIndex:offset:", a3, a4);
    v12 = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4 + a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v12, "objectForKey:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_retrieveAndStoreViewControllerAtIndex:(unint64_t)a3 offset:(unint64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  NSMapTable *pages;
  void *v11;

  -[QLPageViewController indexedDataSource](self, "indexedDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4 + a3;
  objc_msgSend(v7, "pageViewController:viewControllerAtIndex:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    pages = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](pages, "setObject:forKey:", v9, v11);

  }
  return v9;
}

- (void)_setCurrentPageIndex:(unint64_t)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;
  _QWORD aBlock[5];
  id v22[2];
  id location;
  _QWORD v24[2];

  v6 = a5;
  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  -[QLPageViewController _viewControllerAtIndex:offset:](self, "_viewControllerAtIndex:offset:", a3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_initWeak(&location, self);
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke;
    aBlock[3] = &unk_24C725E48;
    objc_copyWeak(v22, &location);
    aBlock[4] = self;
    v22[1] = (id)a3;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (!v6)
      (*((void (**)(void *))v13 + 2))(v13);
    v24[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke_2;
    v17[3] = &unk_24C725E70;
    v20 = v6;
    v16 = v14;
    v18 = v16;
    v19 = v10;
    -[QLPageViewController _setViewControllers:direction:animated:completion:](self, "_setViewControllers:direction:animated:completion:", v15, a4, v6, v17);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

}

uint64_t __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t result;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("currentPageIndex"));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1352) = *(_QWORD *)(a1 + 48);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "didChangeValueForKey:", CFSTR("currentPageIndex"));

  result = objc_msgSend(*(id *)(a1 + 32), "_rearrangeCachedViewControllersWithNewCurrentPageIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1352));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1347) = 0;
  return result;
}

uint64_t __75__QLPageViewController__setCurrentPageIndex_direction_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_setViewControllers:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, _QWORD);
  void *v12;
  void *v13;
  objc_super v14;

  v7 = a5;
  v10 = a3;
  v11 = (void (**)(id, _QWORD))a6;
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPageViewController currentPage](self, "currentPage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13)
  {
    if (v11)
      v11[2](v11, 0);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)QLPageViewController;
    -[QLPageViewController setViewControllers:direction:animated:completion:](&v14, sel_setViewControllers_direction_animated_completion_, v10, a4, v7, v11);
  }

}

- (void)setParallaxIntensity:(double)a3
{
  self->_parallaxIntensity = a3;
}

- (void)_applyParallaxEffectWithTransitionProgress:(double)a3
{
  void *v5;
  double v6;
  double v7;
  unint64_t currentPageIndex;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  double v25;
  CGRect v26;

  if (self->_parallaxIntensity != 0.0)
  {
    -[QLPageViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v6 = CGRectGetWidth(v26) * self->_parallaxIntensity;

    v7 = fmin(v6, 100.0);
    -[QLPageViewController _unsetParallaxEffect](self, "_unsetParallaxEffect");
    currentPageIndex = self->_currentPageIndex;
    self->_currentPageIndexForAppliedParallaxEffect = currentPageIndex;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

    v11 = 0;
    v12 = v7 - v7 * a3;
    v13 = -(a3 * v7);
    v14 = -(v7 * (a3 + 1.0));
    v15 = 2;
    do
    {
      -[QLPageViewController _cachedViewControllerAtIndex:offset:](self, "_cachedViewControllerAtIndex:offset:", currentPageIndex, v11 - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        -[QLPageViewController delegate](self, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_respondsToSelector();

        if ((v18 & 1) != 0)
        {
          -[QLPageViewController delegate](self, "delegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "pageViewController:parallaxViewInPage:withIndex:", self, v16, currentPageIndex + v11 - 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          self->_pageClipsToBounds[v11] = objc_msgSend(v21, "clipsToBounds");

          objc_msgSend(v16, "view");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setClipsToBounds:", 1);

          objc_msgSend(v20, "bounds");
          if (v10 == 1)
            v24 = v15;
          else
            v24 = v11;
          if (v24 == 2)
          {
            v25 = v12;
          }
          else
          {
            v25 = v13;
            if (v24 != 1)
            {
              v25 = v23;
              if (!v24)
                v25 = v14;
            }
          }
          objc_msgSend(v20, "setBounds:", v25);

        }
      }

      ++v11;
      --v15;
    }
    while (v11 != 3);
  }
}

- (void)_unsetParallaxEffect
{
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  for (i = 0; i != 3; ++i)
  {
    -[QLPageViewController _cachedViewControllerAtIndex:offset:](self, "_cachedViewControllerAtIndex:offset:", self->_currentPageIndexForAppliedParallaxEffect, i - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[QLPageViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pageViewController:parallaxViewInPage:withIndex:", self, v4, i + self->_currentPageIndexForAppliedParallaxEffect - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "bounds");
      objc_msgSend(v6, "setBounds:", 0.0, 0.0);
      v7 = self->_pageClipsToBounds[i];
      objc_msgSend(v4, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setClipsToBounds:", v7);

    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  CGPoint *p_scrollingStartOffset;
  CGFloat v5;
  CGFloat v6;

  p_scrollingStartOffset = &self->_scrollingStartOffset;
  objc_msgSend(a3, "contentOffset");
  p_scrollingStartOffset->x = v5;
  p_scrollingStartOffset->y = v6;
  -[QLPageViewController _loadAndCacheViewControllersBeforeAndAfterIndex:](self, "_loadAndCacheViewControllersBeforeAndAfterIndex:", self->_currentPageIndex);
  if (!self->_isTransitioning)
  {
    self->_isTransitioning = 1;
    self->_currentPageIndexForAppliedParallaxEffect = self->_currentPageIndex;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t currentPageIndexForAppliedParallaxEffect;
  int64_t v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  CGRect v18;

  -[QLPageViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = CGRectGetWidth(v18) + self->_interPageSpacing;

  -[QLPageViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7 - v5;

  v9 = v8 / v5;
  if (v8 / v5 > 1.0)
    v9 = 1.0;
  if (self->_isTransitioning)
  {
    v10 = fmax(v9, -1.0);
    currentPageIndexForAppliedParallaxEffect = self->_currentPageIndexForAppliedParallaxEffect;
    if (v8 >= 0.0)
      v12 = currentPageIndexForAppliedParallaxEffect + 1;
    else
      v12 = currentPageIndexForAppliedParallaxEffect - 1;
    -[QLPageViewController _cachedViewControllerAtIndex:offset:](self, "_cachedViewControllerAtIndex:offset:", v12, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[QLPageViewController _cachedViewControllerAtIndex:offset:](self, "_cachedViewControllerAtIndex:offset:", -[QLPageViewController currentPageIndex](self, "currentPageIndex"), 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v17 != v13)
    {
      -[QLPageViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[QLPageViewController delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pageViewController:isTransitioningFromPage:withIndex:toPage:withIndex:withProgress:", self, v13, -[QLPageViewController currentPageIndex](self, "currentPageIndex"), v17, v12, fabs(v10));

      }
    }
    -[QLPageViewController _applyParallaxEffectWithTransitionProgress:](self, "_applyParallaxEffectWithTransitionProgress:", v10);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_isTransitioning = 0;
  if (self->_didTryScrollingBeforeFirstPage)
  {
    self->_didTryScrollingBeforeFirstPage = 0;
    -[QLPageViewController pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:](self, "pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:", self, 1, MEMORY[0x24BDBD1A8], 0);
  }
  -[QLPageViewController _unsetParallaxEffect](self, "_unsetParallaxEffect", a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  int *v8;
  uint64_t v9;
  unint64_t currentPageIndex;
  void *v11;
  char v12;
  void *v13;
  NSMapTable *pages;
  void *v15;
  void *v16;
  unint64_t v17;
  NSMapTable *v18;
  void *v19;
  void *v20;
  char v21;
  NSMapTable *v22;
  unint64_t v23;
  NSMapTable *v24;
  id v25;

  v25 = a3;
  x = a5->x;
  v8 = &OBJC_IVAR___QLPageViewController__nextPageIndex;
  if (a5->x == self->_scrollingStartOffset.x)
    v8 = &OBJC_IVAR___QLPageViewController__currentPageIndex;
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v8);
  currentPageIndex = self->_currentPageIndex;
  if (!currentPageIndex && !self->_nextPageIndex)
    self->_didTryScrollingBeforeFirstPage = 1;
  -[QLPageViewController delegate](self, "delegate", x);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == currentPageIndex)
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[QLPageViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      pages = self->_pages;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPageIndex);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](pages, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self->_currentPageIndex;
      v18 = self->_pages;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_nextPageIndex);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v18, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pageViewController:willCancelTransitionFromPage:withIndex:toPage:withIndex:animated:", self, v16, v17, v20, self->_nextPageIndex, 1);
LABEL_11:

    }
  }
  else
  {
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[QLPageViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = self->_pages;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPageIndex);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v22, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = self->_currentPageIndex;
      v24 = self->_pages;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v24, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pageViewController:willTransitionFromPage:withIndex:toPage:withIndex:animated:", self, v16, v23, v20, v9, 1);
      goto LABEL_11;
    }
  }

}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;

  v5 = -[QLPageViewController _indexOfViewController:](self, "_indexOfViewController:", a4);
  v6 = v5;
  v7 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[QLPageViewController _viewControllerAtIndex:offset:](self, "_viewControllerAtIndex:offset:", v5, -1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)

  return v8;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[QLPageViewController _indexOfViewController:](self, "_indexOfViewController:", a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[QLPageViewController _viewControllerAtIndex:offset:](self, "_viewControllerAtIndex:offset:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  unint64_t currentPageIndex;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSMapTable *pages;
  void *v18;
  void *v19;
  NSMapTable *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSMapTable *v25;
  NSMapTable *v26;
  id v27;

  v6 = a6;
  v27 = a3;
  v10 = a5;
  currentPageIndex = self->_currentPageIndex;
  if (v6)
  {
    -[QLPageViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentPageIndex"));
    -[QLPageViewController viewControllers](self, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_currentPageIndex = -[QLPageViewController _indexOfViewController:](self, "_indexOfViewController:", v13);

    -[QLPageViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentPageIndex"));
    -[QLPageViewController _rearrangeCachedViewControllersWithNewCurrentPageIndex:](self, "_rearrangeCachedViewControllersWithNewCurrentPageIndex:", self->_currentPageIndex);
    if (a4)
    {
      -[QLPageViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[QLPageViewController delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        pages = self->_pages;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", currentPageIndex);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](pages, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = self->_pages;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPageIndex);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](v20, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pageViewController:didTransitionFromPage:withIndex:toPage:withIndex:animated:", self, v19, currentPageIndex, v22, self->_currentPageIndex, 1);
LABEL_8:

      }
    }
  }
  else
  {
    -[QLPageViewController _rearrangeCachedViewControllersWithNewCurrentPageIndex:](self, "_rearrangeCachedViewControllersWithNewCurrentPageIndex:", self->_currentPageIndex);
    if (a4)
    {
      -[QLPageViewController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        -[QLPageViewController delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = self->_pages;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", currentPageIndex);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](v25, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self->_pages;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_nextPageIndex);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](v26, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pageViewController:didCancelTransitionFromPage:withIndex:toPage:withIndex:animated:", self, v19, currentPageIndex, v22, self->_nextPageIndex, 1);
        goto LABEL_8;
      }
    }
  }
  self->_nextPageIndex = self->_currentPageIndex;

}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  NSMapTable *pages;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a4, "firstObject", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  self->_nextPageIndex = -[QLPageViewController _indexOfViewController:](self, "_indexOfViewController:");
  -[QLPageViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLPageViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    pages = self->_pages;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_currentPageIndex);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](pages, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageViewController:willBeginInteractiveTransitionFromPage:withIndex:toPage:withIndex:", self, v10, self->_currentPageIndex, v11, self->_nextPageIndex);

  }
}

- (QLPageViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLPageViewController;
  return -[QLPageViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setViewControllers:(id)a3 direction:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ not supported on QLPageViewController. Use setCurrentPageIndex:; and provide a data source instead."),
    v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)setDataSource:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 == self)
  {
    v6 = v3;
    v7 = v4;
    v5.receiver = a3;
    v5.super_class = (Class)QLPageViewController;
    -[QLPageViewController setDataSource:](&v5, sel_setDataSource_);
  }
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (QLPageViewControllerDataSource)indexedDataSource
{
  return (QLPageViewControllerDataSource *)objc_loadWeakRetained((id *)&self->_indexedDataSource);
}

- (void)setIndexedDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_indexedDataSource, a3);
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (double)parallaxIntensity
{
  return self->_parallaxIntensity;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_destroyWeak((id *)&self->_indexedDataSource);
  objc_storeStrong((id *)&self->_pageViewControllerDelegateProxy, 0);
  objc_storeStrong((id *)&self->_scrollViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_destroyWeak((id *)&self->_definedDelegate);
  objc_storeStrong((id *)&self->_pages, 0);
}

@end
