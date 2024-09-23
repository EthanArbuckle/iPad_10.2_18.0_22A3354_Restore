@implementation SUUISwooshArrayViewController

- (SUUISwooshArrayViewController)initWithSwooshComponents:(id)a3
{
  id v4;
  SUUISwooshArrayViewController *v5;
  uint64_t v6;
  NSArray *swooshComponents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUISwooshArrayViewController;
  v5 = -[SUUISwooshArrayViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    swooshComponents = v5->_swooshComponents;
    v5->_swooshComponents = (NSArray *)v6;

  }
  return v5;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  v3 = self->_viewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setDelegate:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  v8.receiver = self;
  v8.super_class = (Class)SUUISwooshArrayViewController;
  -[SUUISwooshArrayViewController dealloc](&v8, sel_dealloc);
}

- (BOOL)isSkLoaded
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = self->_swooshComponents;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "lockups");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "item");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v13)
              {

                v14 = 0;
                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 1;
    }
    while (v4);
  }
  else
  {
    v14 = 1;
  }
LABEL_19:

  return v14;
}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 2);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext **p_clientContext;
  void *v7;
  SUUIClientContext *v8;

  v5 = (SUUIClientContext *)a3;
  p_clientContext = &self->_clientContext;
  if (self->_clientContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    if (*p_clientContext)
      -[SUUIClientContext localizedStringForKey:inTable:](*p_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_RELATED_TAB"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_RELATED_TAB"), 0, CFSTR("ProductPage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISwooshArrayViewController setTitle:](self, "setTitle:", v7);

    v5 = v8;
  }

}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  void *v7;
  void *v8;
  SUUIColorScheme *v9;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SUUISwooshArrayViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIColorScheme backgroundColor](*p_colorScheme, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v5 = v9;
  }

}

- (void)setSwooshComponents:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *swooshComponents;
  int v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_swooshComponents != v4)
  {
    v9 = v4;
    v6 = (NSArray *)-[NSArray copy](v4, "copy");
    swooshComponents = self->_swooshComponents;
    self->_swooshComponents = v6;

    v8 = -[SUUISwooshArrayViewController isViewLoaded](self, "isViewLoaded");
    v5 = v9;
    if (v8)
    {
      -[SUUISwooshArrayViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
      v5 = v9;
    }
  }

}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    -[SUUISwooshArrayViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setHeaderViewController:(id)a3
{
  SUUIProductPageHeaderViewController *v5;
  SUUIProductPageHeaderViewController **p_headerViewController;
  SUUIProductPageHeaderViewController *headerViewController;
  void *v8;
  void *v9;
  SUUIProductPageHeaderViewController *v10;

  v5 = (SUUIProductPageHeaderViewController *)a3;
  p_headerViewController = &self->_headerViewController;
  headerViewController = self->_headerViewController;
  v10 = v5;
  if (headerViewController != v5)
  {
    if (-[SUUIProductPageHeaderViewController isViewLoaded](headerViewController, "isViewLoaded"))
    {
      -[SUUIProductPageHeaderViewController view](*p_headerViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[SUUIProductPageHeaderViewController floatingView](*p_headerViewController, "floatingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    -[SUUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUISwooshArrayViewController addChildViewController:](self, "addChildViewController:");
      if (-[SUUISwooshArrayViewController isViewLoaded](self, "isViewLoaded"))
        -[SUUISwooshArrayViewController _addHeaderView](self, "_addHeaderView");
    }
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (self->_scrollView)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "productPageChildViewControllerDidLoadScrollView:", self);

      v5 = obj;
    }
  }

}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)loadView
{
  void *v3;

  -[SUUISwooshArrayViewController _scrollView](self, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISwooshArrayViewController setView:](self, "setView:", v3);

  -[SUUISwooshArrayViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
  -[SUUISwooshArrayViewController _addHeaderView](self, "_addHeaderView");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUISwooshArrayViewController _loadMissingItemsIfNecessary](self, "_loadMissingItemsIfNecessary");
  v5.receiver = self;
  v5.super_class = (Class)SUUISwooshArrayViewController;
  -[SUUISwooshArrayViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)swoosh:(id)a3 didSelectCellAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  SUUIProductPageChildViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  objc_msgSend(a3, "lockups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SUUISwooshArrayViewController _clickEventWithItem:](self, "_clickEventWithItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v8);
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v12, "productPageChildOpenItem:", v7);

    }
  }

}

- (id)swoosh:(id)a3 imageForCellAtIndex:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_viewControllers, "indexOfObjectIdenticalTo:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_swooshArtworkLoaders, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lockups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "cachedImageForItem:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v9, "loadImageForItem:reason:", v12, 1);
      v13 = v9;
      v14 = v12;
    }
    else
    {
      v13 = v9;
      v14 = 0;
    }
    objc_msgSend(v13, "placeholderImageForItem:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)swooshDidSelectSeeAll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  -[SUUISwooshArrayViewController _clickEventForSeeAllForViewController:](self, "_clickEventForSeeAllForViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v5);
  objc_msgSend(v4, "seeAllURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__SUUISwooshArrayViewController_swooshDidSelectSeeAll___block_invoke;
    v8[3] = &unk_2511F4560;
    v8[4] = self;
    v9 = v4;
    v10 = v6;
    objc_msgSend(WeakRetained, "productPageChildOpenURL:viewControllerBlock:", v10, v8);

  }
}

SUUIStorePageViewController *__55__SUUISwooshArrayViewController_swooshDidSelectSeeAll___block_invoke(uint64_t a1)
{
  SUUIStorePageViewController *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(SUUIStorePageViewController);
  objc_msgSend(*(id *)(a1 + 32), "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setClientContext:](v2, "setClientContext:", v3);

  objc_msgSend(*(id *)(a1 + 40), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setTitle:](v2, "setTitle:", v4);

  -[SUUIStorePageViewController loadURL:withCompletionBlock:](v2, "loadURL:withCompletionBlock:", *(_QWORD *)(a1 + 48), 0);
  return v2;
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", self);

}

- (void)_addHeaderView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  objc_msgSend(v8, "frame");
  v4 = v3;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[UIScrollView _addContentSubview:atBack:](self->_scrollView, "_addContentSubview:atBack:", v8, 0);
  -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[UIScrollView _addContentSubview:atBack:](self->_scrollView, "_addContentSubview:atBack:", v5, 0);

}

- (void)_addMissingItemsWithResponse:(id)a3 error:(id)a4
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SSVPlatformRequestOperation *platformOperation;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_swooshComponents;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "_updateLockupItemsWithLookupResponse:", v5, (_QWORD)v13);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[SUUISwooshArrayViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
    -[SUUISwooshArrayViewController _layoutSwooshViews](self, "_layoutSwooshViews");
  }
  -[SSVPlatformRequestOperation setResponseBlock:](self->_platformOperation, "setResponseBlock:", 0, (_QWORD)v13);
  platformOperation = self->_platformOperation;
  self->_platformOperation = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoad:", self);

  -[SUUISwooshArrayViewController _loadMissingItemsIfNecessary](self, "_loadMissingItemsIfNecessary");
}

- (id)_artworkLoader
{
  SUUIResourceLoader *artworkLoader;
  SUUIResourceLoader *v4;
  SUUIResourceLoader *v5;
  SUUIResourceLoader *v6;
  void *v7;

  artworkLoader = self->_artworkLoader;
  if (!artworkLoader)
  {
    v4 = -[SUUIResourceLoader initWithClientContext:]([SUUIResourceLoader alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_artworkLoader;
    self->_artworkLoader = v4;

    v6 = self->_artworkLoader;
    SUUIResourceLoaderGetNameForObject(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v6, "setName:", v7);

    artworkLoader = self->_artworkLoader;
  }
  return artworkLoader;
}

- (id)_clickEventForSeeAllForViewController:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SUUIMetricsController canRecordEventWithType:](self->_metricsController, "canRecordEventWithType:", *MEMORY[0x24BEB2910]))
  {
    v5 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    v6 = *MEMORY[0x24BEB2968];
    objc_msgSend(v5, "setTargetType:", *MEMORY[0x24BEB2968]);
    -[SUUIMetricsController locationWithPosition:type:fieldData:](self->_metricsController, "locationWithPosition:type:fieldData:", -[NSMutableArray indexOfObjectIdenticalTo:](self->_viewControllers, "indexOfObjectIdenticalTo:", v4), CFSTR("swoosh"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController locationWithPosition:type:fieldData:](self->_metricsController, "locationWithPosition:type:fieldData:", 0, v6, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      v15[0] = v8;
      v15[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLocationWithEventLocations:", v11);

    }
    objc_msgSend(v4, "seeAllButtonFrame");
    SUUIMetricsSetClickEventPositionWithPoint(v5, v12, v13);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_clickEventWithItem:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *viewControllers;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, _BYTE *);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[SUUIMetricsController canRecordEventWithType:](self->_metricsController, "canRecordEventWithType:", *MEMORY[0x24BEB2910]))
  {
    v5 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0x7FFFFFFFFFFFFFFFLL;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__40;
    v32 = __Block_byref_object_dispose__40;
    v33 = 0;
    viewControllers = self->_viewControllers;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke;
    v23 = &unk_2511F9600;
    v7 = v4;
    v24 = v7;
    v25 = &v38;
    v26 = &v34;
    v27 = &v28;
    -[NSMutableArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", &v20);
    -[SUUIMetricsController locationWithPosition:type:fieldData:](self->_metricsController, "locationWithPosition:type:fieldData:", v35[3], CFSTR("swoosh"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BEB2978];
    -[SUUIMetricsController locationWithPosition:type:fieldData:](self->_metricsController, "locationWithPosition:type:fieldData:", v39[3], *MEMORY[0x24BEB2978], v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8 && v10)
    {
      v42[0] = v10;
      v42[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLocationWithEventLocations:", v12);

    }
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = objc_msgSend(v7, "itemIdentifier");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%lld"), v14, v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTargetIdentifier:", v15);

    objc_msgSend(v5, "setTargetType:", v9);
    objc_msgSend(v7, "productPageURLString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTargetURL:", v16);

    objc_msgSend((id)v29[5], "frameForItemAtIndex:", v39[3]);
    SUUIMetricsSetClickEventPositionWithPoint(v5, v17, v18);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a2;
  objc_msgSend(v10, "lockups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke_2;
  v11[3] = &unk_2511F95D8;
  v12 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v11);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }

}

BOOL __53__SUUISwooshArrayViewController__clickEventWithItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_layoutSwooshViews
{
  void *v3;
  double v4;
  double v5;
  NSMutableArray *viewControllers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;

  -[SUUISwooshArrayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  viewControllers = self->_viewControllers;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__SUUISwooshArrayViewController__layoutSwooshViews__block_invoke;
  v11[3] = &unk_2511F9628;
  v11[4] = self;
  v13 = &v18;
  v14 = v7;
  v15 = v8;
  v16 = v4;
  v17 = v9;
  v10 = v3;
  v12 = v10;
  -[NSMutableArray enumerateObjectsUsingBlock:](viewControllers, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(v10, "setContentSize:", v5, v19[3]);

  _Block_object_dispose(&v18, 8);
}

void __51__SUUISwooshArrayViewController__layoutSwooshViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;

  objc_msgSend(a2, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v14, "setBackgroundColor:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v4);

  }
  objc_msgSend(v14, "frame");
  v6 = v5;
  v8 = v7;
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v10 = *(double *)(a1 + 72);
  objc_msgSend(v14, "setFrame:");
  v11 = *(void **)(a1 + 40);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  if (v12)
  {
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:belowSubview:", v14, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", v14, 0);
  }
  v15.origin.x = v6;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v8;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CGRectGetMaxY(v15) + 0.0;

}

- (void)_loadMissingItemsIfNecessary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  id v17;
  void *v18;
  SSVPlatformRequestOperation *v19;
  SSVPlatformRequestOperation *platformOperation;
  SSVPlatformRequestOperation *v21;
  void *v22;
  SSVPlatformRequestOperation *v23;
  void *v24;
  NSArray *obj;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (!self->_platformOperation)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = self->_swooshComponents;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v36;
      v4 = *MEMORY[0x24BEB2C90];
LABEL_4:
      v5 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v5), "lockups");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v32;
LABEL_9:
          v10 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
            objc_msgSend(v11, "item");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (v13)
            {
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", objc_msgSend(v11, "itemIdentifier"));
              objc_msgSend(v3, "addObject:", v14);
              v15 = objc_msgSend(v3, "count") == v4;

              if (v15)
                break;
            }
            if (v8 == ++v10)
            {
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v8)
                goto LABEL_9;
              break;
            }
          }
        }

        v16 = objc_msgSend(v3, "count") == v4;
        if (v16)
          break;
        if (++v5 == v27)
        {
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v27)
            goto LABEL_4;
          break;
        }
      }
    }

    if (objc_msgSend(v3, "count"))
    {
      v17 = objc_alloc(MEMORY[0x24BEB2058]);
      -[SUUIClientContext platformContext](self->_clientContext, "platformContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (SSVPlatformRequestOperation *)objc_msgSend(v17, "initWithPlatformContext:", v18);
      platformOperation = self->_platformOperation;
      self->_platformOperation = v19;

      -[SSVPlatformRequestOperation setItemIdentifiers:](self->_platformOperation, "setItemIdentifiers:", v3);
      -[SSVPlatformRequestOperation setKeyProfile:](self->_platformOperation, "setKeyProfile:", *MEMORY[0x24BEB2770]);
      v21 = self->_platformOperation;
      -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVPlatformRequestOperation setStoreFrontSuffix:](v21, "setStoreFrontSuffix:", v22);

      objc_initWeak(&location, self);
      v23 = self->_platformOperation;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke;
      v28[3] = &unk_2511F5448;
      objc_copyWeak(&v29, &location);
      -[SSVPlatformRequestOperation setResponseBlock:](v23, "setResponseBlock:", v28);
      -[SUUISwooshArrayViewController operationQueue](self, "operationQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addOperation:", self->_platformOperation);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }

  }
}

void __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __61__SUUISwooshArrayViewController__loadMissingItemsIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addMissingItemsWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_reloadChildViewControllers
{
  uint64_t v3;
  NSMutableArray *v4;
  NSMutableArray *swooshArtworkLoaders;
  uint64_t v6;
  NSMutableArray *viewControllers;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  SUUIColorScheme *v22;
  void *v23;
  NSArray *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  SUUILockupSwooshViewController *v29;
  void *v30;
  SUUILockupSwooshArtworkLoader *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = 1048;
  if (!self->_swooshArtworkLoaders)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    swooshArtworkLoaders = self->_swooshArtworkLoaders;
    self->_swooshArtworkLoaders = v4;

  }
  v6 = 1064;
  viewControllers = self->_viewControllers;
  if (!viewControllers)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = self->_viewControllers;
    self->_viewControllers = v8;

    viewControllers = self->_viewControllers;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = viewControllers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v15, "isViewLoaded"))
        {
          objc_msgSend(v15, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeFromSuperview");

        }
        objc_msgSend(v15, "removeFromParentViewController");
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_swooshArtworkLoaders, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_viewControllers, "removeAllObjects");
  if (!self->_askPermission)
  {
    -[SUUISwooshArrayViewController _artworkLoader](self, "_artworkLoader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = self->_swooshComponents;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v33)
    {
      v19 = *(_QWORD *)v35;
      v32 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v18);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          v22 = self->_colorScheme;
          if (!v22)
          {
            v22 = objc_alloc_init(SUUIColorScheme);
            -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              -[SUUIColorScheme setBackgroundColor:](v22, "setBackgroundColor:", v23);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
              v24 = v18;
              v25 = v17;
              v26 = v6;
              v27 = v3;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUUIColorScheme setBackgroundColor:](v22, "setBackgroundColor:", v28);

              v3 = v27;
              v6 = v26;
              v17 = v25;
              v18 = v24;
              v19 = v32;
            }

          }
          v29 = -[SUUILockupSwooshViewController initWithSwoosh:]([SUUILockupSwooshViewController alloc], "initWithSwoosh:", v21);
          -[SUUILockupSwooshViewController setColorScheme:](v29, "setColorScheme:", v22);
          -[SUUILockupSwooshViewController setClientContext:](v29, "setClientContext:", self->_clientContext);
          -[SUUILockupSwooshViewController setDelegate:](v29, "setDelegate:", self);
          objc_msgSend(v21, "lockups");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUUILockupSwooshViewController setSeeAllHidden:](v29, "setSeeAllHidden:", (unint64_t)objc_msgSend(v30, "count") < 4);

          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "addObject:", v29);
          -[SUUISwooshArrayViewController addChildViewController:](self, "addChildViewController:", v29);
          v31 = -[SUUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:]([SUUILockupSwooshArtworkLoader alloc], "initWithArtworkLoader:swoosh:", v17, v29);
          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v3), "addObject:", v31);

        }
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v33);
    }

  }
  -[SUUISwooshArrayViewController _layoutSwooshViews](self, "_layoutSwooshViews", v32);
}

- (id)_scrollView
{
  UIScrollView *scrollView;
  UIScrollView *v4;
  UIScrollView *v5;
  UIScrollView *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x24BEBD918]);
    v5 = self->_scrollView;
    self->_scrollView = v4;

    -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
    -[UIScrollView setAutoresizesSubviews:](self->_scrollView, "setAutoresizesSubviews:", 1);
    v6 = self->_scrollView;
    -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[UIScrollView setBackgroundColor:](v6, "setBackgroundColor:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScrollView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    }
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", self);

    scrollView = self->_scrollView;
  }
  return scrollView;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  return (SUUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (SUUIMetricsController)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
  objc_storeStrong((id *)&self->_metricsController, a3);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (NSArray)swooshComponents
{
  return self->_swooshComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_swooshComponents, 0);
  objc_storeStrong((id *)&self->_swooshArtworkLoaders, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_platformOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
