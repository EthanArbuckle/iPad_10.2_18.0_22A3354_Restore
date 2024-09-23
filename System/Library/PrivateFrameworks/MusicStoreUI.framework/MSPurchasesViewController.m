@implementation MSPurchasesViewController

- (MSPurchasesViewController)initWithSection:(id)a3
{
  MSPurchasesViewController *v4;
  void *v5;
  SUSegmentedControl *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSPurchasesViewController;
  v4 = -[SUViewController initWithSection:](&v9, sel_initWithSection_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "pageSectionGroup");
    if (objc_msgSend((id)objc_msgSend(v5, "sections"), "count"))
    {
      v4->_activeViewControllerIndex = objc_msgSend(v5, "defaultSectionIndex");
      v6 = -[MSPurchasesViewController _newSegmentedControlWithPageSectionGroup:](v4, "_newSegmentedControlWithPageSectionGroup:", v5);
      v4->_segmentedControl = v6;
      -[SUSegmentedControl addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", v4, sel__segmentedControlAction_, 4096);
    }
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__tabConfigurationChangedNotification_, *MEMORY[0x24BEC8ED8], 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  NSArray *viewControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8ED8], 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  viewControllers = self->_viewControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(viewControllers);
        -[MSPurchasesViewController removeChildViewController:](self, "removeChildViewController:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[SUSegmentedControl removeTarget:action:forControlEvents:](self->_segmentedControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v9.receiver = self;
  v9.super_class = (Class)MSPurchasesViewController;
  -[SUViewController dealloc](&v9, sel_dealloc);
}

- (id)copyArchivableContext
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSPurchasesViewController;
  v3 = -[SUViewController copyArchivableContext](&v5, sel_copyArchivableContext);
  objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_activeViewControllerIndex), CFSTR("index"));
  return v3;
}

- (void)invalidateForMemoryPurge
{
  objc_super v3;

  -[NSArray makeObjectsPerformSelector:](self->_viewControllers, "makeObjectsPerformSelector:", a2);
  -[MSPurchasesViewController _reloadSegmentedControlPlacement](self, "_reloadSegmentedControlPlacement");
  v3.receiver = self;
  v3.super_class = (Class)MSPurchasesViewController;
  -[SUViewController invalidateForMemoryPurge](&v3, sel_invalidateForMemoryPurge);
}

- (void)loadView
{
  id v3;
  UIView *containerView;
  UIView *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSPurchasesViewController;
  -[SUViewController loadView](&v7, sel_loadView);
  v6.receiver = self;
  v6.super_class = (Class)MSPurchasesViewController;
  v3 = -[MSPurchasesViewController view](&v6, sel_view);
  containerView = self->_containerView;
  if (!containerView)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    self->_containerView = v5;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    containerView = self->_containerView;
  }
  objc_msgSend(v3, "bounds");
  -[UIView setFrame:](containerView, "setFrame:");
  objc_msgSend(v3, "addSubview:", self->_containerView);
  if (!-[NSArray count](self->_viewControllers, "count"))
    -[MSPurchasesViewController _reloadViewControllersWithSection:](self, "_reloadViewControllersWithSection:", -[MSPurchasesViewController section](self, "section"));
  -[MSPurchasesViewController _reloadSegmentedControlPlacement](self, "_reloadSegmentedControlPlacement");
  -[MSPurchasesViewController _showActiveViewController](self, "_showActiveViewController");
}

- (void)restoreArchivableContext:(id)a3
{
  unint64_t v5;
  NSUInteger v6;
  objc_super v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("index")), "integerValue");
  v6 = -[NSArray count](self->_viewControllers, "count");
  if (v5 >= v6 - 1)
    v5 = v6 - 1;
  -[MSPurchasesViewController _setActiveViewControllerIndex:](self, "_setActiveViewControllerIndex:", v5);
  -[SUSegmentedControl setSelectedItemIndex:](self->_segmentedControl, "setSelectedItemIndex:", v5);
  v7.receiver = self;
  v7.super_class = (Class)MSPurchasesViewController;
  -[SUViewController restoreArchivableContext:](&v7, sel_restoreArchivableContext_, a3);
}

- (void)tabBarControllerDidReselectTabBarItem:(id)a3
{
  NSArray *viewControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  viewControllers = self->_viewControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(viewControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "tabBarControllerDidReselectTabBarItem:", a3);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MSPurchasesViewController _reloadSegmentedControlPlacement](self, "_reloadSegmentedControlPlacement");
  v5.receiver = self;
  v5.super_class = (Class)MSPurchasesViewController;
  -[SUViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)_segmentedControlAction:(id)a3
{
  -[MSPurchasesViewController _setActiveViewControllerIndex:](self, "_setActiveViewControllerIndex:", -[SUSegmentedControl selectedItemIndex](self->_segmentedControl, "selectedItemIndex", a3));
}

- (id)_activeViewController
{
  return -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_activeViewControllerIndex);
}

- (id)_newSegmentedControlWithPageSectionGroup:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BEC8DB0]);
  v6 = (void *)objc_msgSend(a3, "sections");
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "segmentedControlItem"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  objc_msgSend(v5, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  objc_msgSend(v5, "setItems:", v7);
  objc_msgSend(v5, "setSelectedItemIndex:", self->_activeViewControllerIndex);

  return v5;
}

- (id)_newViewControllerForPageSection:(id)a3
{
  id v5;
  void *v6;

  v5 = -[SUViewController viewControllerFactory](self, "viewControllerFactory");
  if (objc_msgSend(a3, "structuredPageType") == 9)
  {
    v6 = (void *)objc_msgSend(v5, "newDownloadsViewController");
  }
  else
  {
    v6 = (void *)objc_msgSend(v5, "newStorePageViewControllerWithSection:", 0);
    objc_msgSend(v6, "setURLRequestProperties:", objc_msgSend(a3, "URLRequestProperties"));
  }
  objc_msgSend(v6, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
  return v6;
}

- (void)_reloadSegmentedControlPlacement
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
  UIView **p_containerView;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double MaxY;
  CGRect v20;
  CGRect v21;

  if (self->_segmentedControl && -[MSPurchasesViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)-[MSPurchasesViewController view](self, "view");
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1
      || !-[MSPurchasesViewController isInMoreList](self, "isInMoreList"))
    {
      if ((void *)-[SUSegmentedControl superview](self->_segmentedControl, "superview") == v3)
        -[SUSegmentedControl removeFromSuperview](self->_segmentedControl, "removeFromSuperview");
      -[SUSegmentedControl setAutoresizingMask:](self->_segmentedControl, "setAutoresizingMask:", 0);
      -[SUNavigationItem setTitleView:](-[SUViewController navigationItem](self, "navigationItem"), "setTitleView:", self->_segmentedControl);
    }
    else
    {
      -[SUNavigationItem setTitleView:](-[SUViewController navigationItem](self, "navigationItem"), "setTitleView:", 0);
      -[SUSegmentedControl setAutoresizingMask:](self->_segmentedControl, "setAutoresizingMask:", 2);
      -[SUSegmentedControl setSegmentedControlStyle:](self->_segmentedControl, "setSegmentedControlStyle:", 7);
      objc_msgSend(v3, "addSubview:", self->_segmentedControl);
    }
    -[SUSegmentedControl sizeToFitUserInterfaceIdiom](self->_segmentedControl, "sizeToFitUserInterfaceIdiom");
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    if ((void *)-[SUSegmentedControl superview](self->_segmentedControl, "superview") == v3)
    {
      -[SUSegmentedControl frame](self->_segmentedControl, "frame");
      v14 = v13;
      v15 = *MEMORY[0x24BDBEFB0];
      v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[SUSegmentedControl setFrame:](self->_segmentedControl, "setFrame:", *MEMORY[0x24BDBEFB0], v16, v9);
      p_containerView = &self->_containerView;
      -[UIView frame](*p_containerView, "frame");
      v18 = v17;
      v20.origin.x = v15;
      v20.origin.y = v16;
      v20.size.width = v9;
      v20.size.height = v14;
      MaxY = CGRectGetMaxY(v20);
      v21.origin.x = v5;
      v21.origin.y = v7;
      v21.size.width = v9;
      v21.size.height = v11;
      v11 = CGRectGetHeight(v21) - MaxY;
      v5 = v18;
      v7 = MaxY;
    }
    else
    {
      p_containerView = &self->_containerView;
    }
    -[UIView setFrame:](*p_containerView, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_reloadViewControllersWithSection:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "pageSectionGroup"), "sections");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = -[MSPurchasesViewController _newViewControllerForPageSection:](self, "_newViewControllerForPageSection:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10));
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v5, "addObject:", v11);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }
  if (!objc_msgSend(v5, "count"))
  {
    v13 = (void *)objc_msgSend(-[SUViewController viewControllerFactory](self, "viewControllerFactory"), "newStorePageViewControllerWithSection:", a3);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
      objc_msgSend(v5, "addObject:", v14);

    }
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v5);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
        objc_msgSend(v19, "_setExistingNavigationItem:", -[SUViewController navigationItem](self, "navigationItem"));
        objc_msgSend(v19, "_setExistingTabBarItem:", -[SUViewController tabBarItem](self, "tabBarItem"));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  self->_viewControllers = (NSArray *)objc_msgSend(v5, "copy");
}

- (void)_setActiveViewControllerIndex:(int64_t)a3
{
  id v5;

  if (self->_activeViewControllerIndex != a3)
  {
    if (-[MSPurchasesViewController isViewLoaded](self, "isViewLoaded"))
    {
      v5 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_activeViewControllerIndex);
      objc_msgSend(v5, "storePageCleanupBeforeTearDown");
      -[MSPurchasesViewController removeChildViewController:](self, "removeChildViewController:", v5);
      objc_msgSend(v5, "viewWillDisappear:", 0);
      objc_msgSend((id)objc_msgSend(v5, "view"), "removeFromSuperview");
      objc_msgSend(v5, "viewDidDisappear:", 0);
      self->_activeViewControllerIndex = a3;
      -[MSPurchasesViewController _showActiveViewController](self, "_showActiveViewController");
    }
    else
    {
      self->_activeViewControllerIndex = a3;
    }
  }
}

- (void)_showActiveViewController
{
  id v3;
  void *v4;

  v3 = -[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_activeViewControllerIndex);
  -[MSPurchasesViewController addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(v3, "viewWillAppear:", 0);
  v4 = (void *)objc_msgSend(v3, "view");
  -[UIView bounds](self->_containerView, "bounds");
  objc_msgSend(v4, "setFrame:");
  -[UIView addSubview:](self->_containerView, "addSubview:", v4);
  objc_msgSend(v3, "viewDidAppear:", 1);
}

@end
