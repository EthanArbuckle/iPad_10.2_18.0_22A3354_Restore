@implementation SUUIIPadProductPageViewController

- (id)_initSUUIIPadProductPageViewController
{
  SUUIIPadProductPageViewController *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIIPadProductPageViewController;
  v2 = -[SUUIIPadProductPageViewController init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 4);
    v2->_defaultSelectedSectionIndex = 0;
    v2->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__metricsEnterEventNotification_, CFSTR("SUUIMetricsDidRecordEnterEventNotification"), 0);

  }
  return v2;
}

- (SUUIIPadProductPageViewController)initWithItem:(id)a3
{
  id v5;
  id *v6;
  SUUIIPadProductPageViewController *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSURLRequest *urlRequest;

  v5 = a3;
  v6 = -[SUUIIPadProductPageViewController _initSUUIIPadProductPageViewController](self, "_initSUUIIPadProductPageViewController");
  v7 = (SUUIIPadProductPageViewController *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 130, a3);
    v7->_lookupItemIdentifier = objc_msgSend(v5, "itemIdentifier");
    objc_msgSend(v5, "productPageURLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x24BDB74A0]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithURL:", v10);
      urlRequest = v7->_urlRequest;
      v7->_urlRequest = (NSURLRequest *)v11;

    }
  }

  return v7;
}

- (SUUIIPadProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  SUUIIPadProductPageViewController *result;

  result = -[SUUIIPadProductPageViewController _initSUUIIPadProductPageViewController](self, "_initSUUIIPadProductPageViewController");
  if (result)
    result->_lookupItemIdentifier = a3;
  return result;
}

- (SUUIIPadProductPageViewController)initWithProductPage:(id)a3
{
  id v5;
  void *v6;
  SUUIIPadProductPageViewController *v7;

  v5 = a3;
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIIPadProductPageViewController initWithItem:](self, "initWithItem:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    -[SUUIIPadProductPageViewController _setDefaultSectionIndexWithFragment:](v7, "_setDefaultSectionIndexWithFragment:", -[SUUIProductPage defaultPageFragment](v7->_productPage, "defaultPageFragment"));
  }

  return v7;
}

- (SUUIIPadProductPageViewController)initWithURL:(id)a3
{
  void *v4;
  SUUIIPadProductPageViewController *v5;

  objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIIPadProductPageViewController initWithURLRequest:](self, "initWithURLRequest:", v4);

  return v5;
}

- (SUUIIPadProductPageViewController)initWithURLRequest:(id)a3
{
  id v4;
  SUUIIPadProductPageViewController *v5;
  uint64_t v6;
  NSURLRequest *urlRequest;
  void *v8;

  v4 = a3;
  v5 = -[SUUIIPadProductPageViewController _initSUUIIPadProductPageViewController](self, "_initSUUIIPadProductPageViewController");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v6;

    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadProductPageViewController _setDefaultSectionIndexWithFragment:](v5, "_setDefaultSectionIndexWithFragment:", SUUIProductPageFragmentWithURL(v8));

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUUIMetricsDidRecordEnterEventNotification"), 0);
  -[SUUIProductPageHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", 0);
  -[SUUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", 0);
  -[SUUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", 0);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");

  v4.receiver = self;
  v4.super_class = (Class)SUUIIPadProductPageViewController;
  -[SUUIIPadProductPageViewController dealloc](&v4, sel_dealloc);
}

- (void)configureMetricsWithPageEvent:(id)a3
{
  id v4;
  SUUIMetricsController *metricsController;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  metricsController = self->_metricsController;
  if (metricsController)
  {
    -[SUUIMetricsController recordEvent:](metricsController, "recordEvent:", v4);
  }
  else
  {
    objc_initWeak(&location, self);
    -[SUUIIPadProductPageViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67__SUUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_2511F6C90;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "getDefaultMetricsControllerWithCompletionBlock:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __67__SUUIIPadProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v3 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_setMetricsController:", v6);

  objc_msgSend(*(id *)(a1 + 32), "pageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPageURL:", v5);

  objc_msgSend(v6, "recordEvent:", *(_QWORD *)(a1 + 32));
}

- (void)reloadData
{
  SUUIClientContext *clientContext;
  SUUILoadProductPageOperation *v4;
  SUUILoadProductPageOperation *loadOperation;
  SUUILoadProductPageOperation *v6;
  SSMetricsPageEvent *lastPageEvent;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  if (!self->_metricsController)
  {
    clientContext = self->_clientContext;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__SUUIIPadProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_2511F6CB8;
    objc_copyWeak(&v11, &location);
    -[SUUIClientContext getDefaultMetricsControllerWithCompletionBlock:](clientContext, "getDefaultMetricsControllerWithCompletionBlock:", v10);
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      v4 = -[SUUILoadProductPageOperation initWithProductPageURLRequest:clientContext:]([SUUILoadProductPageOperation alloc], "initWithProductPageURLRequest:clientContext:", self->_urlRequest, self->_clientContext);
    }
    else
    {
      if (!self->_lookupItemIdentifier)
        goto LABEL_10;
      v4 = -[SUUILoadProductPageOperation initWithItemIdentifier:clientContext:]([SUUILoadProductPageOperation alloc], "initWithItemIdentifier:clientContext:", self->_lookupItemIdentifier, self->_clientContext);
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __47__SUUIIPadProductPageViewController_reloadData__block_invoke_2;
      v8[3] = &unk_2511F6CE0;
      objc_copyWeak(&v9, &location);
      -[SUUILoadProductPageOperation setOutputBlock:](v6, "setOutputBlock:", v8);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_loadOperation);
      lastPageEvent = self->_lastPageEvent;
      self->_lastPageEvent = 0;

      objc_destroyWeak(&v9);
    }
  }
  objc_destroyWeak(&location);
}

void __47__SUUIIPadProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setMetricsController:", v3);

}

void __47__SUUIIPadProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __47__SUUIIPadProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __47__SUUIIPadProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setProductPage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setAskPermission:(BOOL)a3
{
  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    -[SUUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:");
    -[SUUIProductPageReviewsViewController setAskPermission:](self->_reviewsViewController, "setAskPermission:", self->_askPermission);
    -[SUUISwooshArrayViewController setAskPermission:](self->_relatedViewController, "setAskPermission:", self->_askPermission);
    -[SUUIProductPageHeaderViewController setAskPermission:](self->_headerViewController, "setAskPermission:", self->_askPermission);
  }
}

- (NSURL)URL
{
  return -[NSURLRequest URL](self->_urlRequest, "URL");
}

- (void)setBannerText:(id)a3
{
  NSString **p_bannerText;
  NSString *v6;

  p_bannerText = &self->_bannerText;
  v6 = (NSString *)a3;
  if (*p_bannerText != v6)
  {
    objc_storeStrong((id *)&self->_bannerText, a3);
    if (*p_bannerText)
      -[SUUIIPadProductPageViewController _showBanner](self, "_showBanner");
  }

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  SUUIMetricsController *metricsController;
  void *v6;
  objc_super v7;

  metricsController = self->_metricsController;
  SUUIMetricsWindowOrientationForInterfaceOrientation(-[SUUIIPadProductPageViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsController setWindowOrientation:](metricsController, "setWindowOrientation:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIIPadProductPageViewController;
  -[SUUIIPadProductPageViewController didRotateFromInterfaceOrientation:](&v7, sel_didRotateFromInterfaceOrientation_, a3);
}

- (void)loadView
{
  UIView *overlayView;
  UIView *v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  overlayView = self->_overlayView;
  if (!overlayView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 630.0, 630.0);
    v5 = self->_overlayView;
    self->_overlayView = v4;

    v6 = self->_overlayView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    overlayView = self->_overlayView;
  }
  -[SUUIIPadProductPageViewController setView:](self, "setView:", overlayView);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  if (self->_productPage && self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SUUIIPadProductPageViewController _selectSectionIndex:](self, "_selectSectionIndex:", self->_defaultSelectedSectionIndex);
    -[SUUIIPadProductPageViewController _reviewsViewController](self, "_reviewsViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIIPadProductPageViewController;
  -[SUUIIPadProductPageViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUUIItem *item;
  SSMetricsPageEvent *lastPageEvent;
  void *v7;
  objc_super v8;
  _QWORD block[5];

  v3 = a3;
  item = self->_item;
  if (item && !SUUIItemKindIsSoftwareKind(-[SUUIItem itemKind](item, "itemKind")))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__SUUIIPadProductPageViewController_viewWillAppear___block_invoke;
    block[3] = &unk_2511F47C0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v7);

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
  -[SUUIIPadProductPageViewController reloadData](self, "reloadData");
  -[SUUIIPadProductPageViewController _reloadHeaderViewController](self, "_reloadHeaderViewController");
  -[SUUIProductPageHeaderViewController reloadData](self->_headerViewController, "reloadData");
  v8.receiver = self;
  v8.super_class = (Class)SUUIIPadProductPageViewController;
  -[SUUIIPadProductPageViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
}

uint64_t __52__SUUIIPadProductPageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCannotOpen");
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4;
  SUUINetworkErrorViewController *networkErrorViewController;
  void *v6;
  SUUINetworkErrorViewController *v7;
  int IsVisible;
  id v9;

  v4 = a3;
  networkErrorViewController = self->_networkErrorViewController;
  if (networkErrorViewController)
  {
    v9 = v4;
    -[SUUINetworkErrorViewController view](networkErrorViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SUUINetworkErrorViewController removeFromParentViewController](self->_networkErrorViewController, "removeFromParentViewController");
    -[SUUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", 0);
    v7 = self->_networkErrorViewController;
    self->_networkErrorViewController = 0;

    IsVisible = SUUIViewControllerIsVisible(self);
    v4 = v9;
    if (IsVisible)
    {
      self->_selectedSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      -[SUUIIPadProductPageViewController reloadData](self, "reloadData");
      v4 = v9;
    }
  }

}

- (id)metricsControllerForProductPageHeader:(id)a3
{
  return self->_metricsController;
}

- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4
{
  -[SUUIIPadProductPageViewController _selectSectionIndex:](self, "_selectSectionIndex:", a4);
}

- (void)productPageHeaderView:(id)a3 didSelectURL:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__SUUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_2511F6D08;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[SUUIIPadProductPageViewController productPageChildOpenURL:viewControllerBlock:](self, "productPageChildOpenURL:viewControllerBlock:", v6, v7);

}

SUUIStorePageViewController *__72__SUUIIPadProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  SUUIStorePageViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(SUUIStorePageViewController);
  objc_msgSend(*(id *)(a1 + 32), "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setClientContext:](v2, "setClientContext:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setTitle:](v2, "setTitle:", v5);

  -[SUUIStorePageViewController loadURL:withCompletionBlock:](v2, "loadURL:withCompletionBlock:", *(_QWORD *)(a1 + 40), 0);
  return v2;
}

- (void)productPageChildOpenItem:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "iPadProductPage:openItem:", self, v7);

  }
}

- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "iPadProductPage:openURL:viewControllerBlock:", self, v10, v6);

  }
}

- (CGPoint)topContentOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  int64_t v8;
  id v9;

  if (!self->_bannerText)
  {
    v4 = SUUIAskPermissionFramework();
    v5 = SUUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v4);
    v6 = (void *)SUUIAskPermissionFramework();
    v7 = *(id *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v6);
    objc_msgSend(v5, "_requestQueueForIdentifier:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = -[SUUIItem itemIdentifier](self->_item, "itemIdentifier");

    objc_msgSend(v9, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v8, 0);
  }
}

- (void)_metricsEnterEventNotification:(id)a3
{
  SSMetricsPageEvent *lastPageEvent;
  void *v5;

  if (SUUIViewControllerIsVisible(self))
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v5);

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
}

- (id)_detailsViewController
{
  SUUIProductPageDetailsViewController *detailsViewController;
  SUUIProductPageDetailsViewController *v4;
  SUUIProductPageDetailsViewController *v5;
  SUUIProductPageDetailsViewController *v6;
  void *v7;

  detailsViewController = self->_detailsViewController;
  if (!detailsViewController)
  {
    v4 = -[SUUIProductPageDetailsViewController initWithProductPage:]([SUUIProductPageDetailsViewController alloc], "initWithProductPage:", self->_productPage);
    v5 = self->_detailsViewController;
    self->_detailsViewController = v4;

    v6 = self->_detailsViewController;
    -[SUUIIPadProductPageViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageDetailsViewController setClientContext:](v6, "setClientContext:", v7);

    -[SUUIProductPageDetailsViewController setDelegate:](self->_detailsViewController, "setDelegate:", self);
    -[SUUIProductPageDetailsViewController setOperationQueue:](self->_detailsViewController, "setOperationQueue:", self->_operationQueue);
    -[SUUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:", self->_askPermission);
    detailsViewController = self->_detailsViewController;
  }
  return detailsViewController;
}

- (BOOL)_isIncompatibleItem
{
  SUUIItem *v3;
  SUUIItem *item;
  SUUIItem *v5;
  uint64_t v6;

  -[SUUIProductPage item](self->_productPage, "item");
  v3 = (SUUIItem *)objc_claimAutoreleasedReturnValue();
  item = v3;
  if (!v3)
    item = self->_item;
  v5 = item;

  v6 = -[SUUIItem itemKind](v5, "itemKind");
  return v6 == 5;
}

- (id)_placeholderViewController
{
  SUUIProductPagePlaceholderViewController *placeholderViewController;
  SUUIProductPagePlaceholderViewController *v4;
  SUUIProductPagePlaceholderViewController *v5;
  SUUIProductPagePlaceholderViewController *v6;
  void *v7;
  void *v8;

  placeholderViewController = self->_placeholderViewController;
  if (!placeholderViewController)
  {
    v4 = objc_alloc_init(SUUIProductPagePlaceholderViewController);
    v5 = self->_placeholderViewController;
    self->_placeholderViewController = v4;

    v6 = self->_placeholderViewController;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPagePlaceholderViewController setColorScheme:](v6, "setColorScheme:", v8);

    -[SUUIProductPagePlaceholderViewController setClientContext:](self->_placeholderViewController, "setClientContext:", self->_clientContext);
    placeholderViewController = self->_placeholderViewController;
  }
  return placeholderViewController;
}

- (id)_relatedViewController
{
  SUUISwooshArrayViewController *relatedViewController;
  SUUISwooshArrayViewController *v4;
  void *v5;
  SUUISwooshArrayViewController *v6;
  SUUISwooshArrayViewController *v7;
  SUUISwooshArrayViewController *v8;
  void *v9;
  void *v10;

  relatedViewController = self->_relatedViewController;
  if (!relatedViewController)
  {
    v4 = [SUUISwooshArrayViewController alloc];
    -[SUUIProductPage relatedContentSwooshes](self->_productPage, "relatedContentSwooshes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUISwooshArrayViewController initWithSwooshComponents:](v4, "initWithSwooshComponents:", v5);
    v7 = self->_relatedViewController;
    self->_relatedViewController = v6;

    -[SUUISwooshArrayViewController setClientContext:](self->_relatedViewController, "setClientContext:", self->_clientContext);
    v8 = self->_relatedViewController;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISwooshArrayViewController setColorScheme:](v8, "setColorScheme:", v10);

    -[SUUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", self);
    -[SUUISwooshArrayViewController setOperationQueue:](self->_relatedViewController, "setOperationQueue:", self->_operationQueue);
    -[SUUISwooshArrayViewController setMetricsController:](self->_relatedViewController, "setMetricsController:", self->_metricsController);
    -[SUUISwooshArrayViewController setAskPermission:](self->_relatedViewController, "setAskPermission:", self->_askPermission);
    relatedViewController = self->_relatedViewController;
  }
  return relatedViewController;
}

- (void)_reloadHeaderViewController
{
  SUUIProductPageHeaderViewController *headerViewController;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SUUIProductPageHeaderViewController *v15;
  SUUIProductPageHeaderViewController *v16;
  SUUIProductPageHeaderViewController *v17;
  void *v18;
  id v19;
  CGRect v20;

  headerViewController = self->_headerViewController;
  if (headerViewController)
    goto LABEL_2;
  if (self->_item)
  {
    v15 = -[SUUIProductPageHeaderViewController initWithItem:]([SUUIProductPageHeaderViewController alloc], "initWithItem:", self->_item);
    v16 = self->_headerViewController;
    self->_headerViewController = v15;

    v17 = self->_headerViewController;
    -[SUUIIPadProductPageViewController clientContext](self, "clientContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageHeaderViewController setClientContext:](v17, "setClientContext:", v18);

    -[SUUIProductPageHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", self);
    -[SUUIProductPageHeaderViewController setOperationQueue:](self->_headerViewController, "setOperationQueue:", self->_operationQueue);
    -[SUUIProductPageHeaderViewController setProductPage:](self->_headerViewController, "setProductPage:", self->_productPage);
    -[SUUIProductPageHeaderViewController setSelectedSectionIndex:](self->_headerViewController, "setSelectedSectionIndex:", self->_defaultSelectedSectionIndex);
    -[SUUIProductPageHeaderViewController setAskPermission:](self->_headerViewController, "setAskPermission:", self->_askPermission);
    -[SUUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", self->_headerViewController);
    headerViewController = self->_headerViewController;
    if (headerViewController)
    {
LABEL_2:
      -[SUUIProductPageHeaderViewController view](headerViewController, "view");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v5 = v4;
      v7 = v6;
      -[SUUIMessageBanner frame](self->_banner, "frame");
      v9 = v8;
      objc_msgSend(v19, "setFrame:", v5, v8, 630.0, v7);
      -[UIView addSubview:](self->_overlayView, "addSubview:", v19);
      -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sizeToFit");
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v20.origin.x = v5;
      v20.origin.y = v9;
      v20.size.width = 630.0;
      v20.size.height = v7;
      objc_msgSend(v10, "setFrame:", v12, CGRectGetMaxY(v20), 630.0, v14);
      -[UIView addSubview:](self->_overlayView, "addSubview:", v10);

    }
  }
}

- (id)_reviewsViewController
{
  SUUIProductPageReviewsViewController *reviewsViewController;
  SUUIProductPageReviewsViewController *v4;
  SUUIProductPageReviewsViewController *v5;

  reviewsViewController = self->_reviewsViewController;
  if (!reviewsViewController)
  {
    v4 = -[SUUIProductPageReviewsViewController initWithProductPage:]([SUUIProductPageReviewsViewController alloc], "initWithProductPage:", self->_productPage);
    v5 = self->_reviewsViewController;
    self->_reviewsViewController = v4;

    -[SUUIProductPageReviewsViewController setClientContext:](self->_reviewsViewController, "setClientContext:", self->_clientContext);
    -[SUUIProductPageReviewsViewController setAskPermission:](self->_reviewsViewController, "setAskPermission:", self->_askPermission);
    reviewsViewController = self->_reviewsViewController;
  }
  return reviewsViewController;
}

- (void)_selectSectionIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_selectedSectionIndex != a3)
  {
    -[SUUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isViewLoaded"))
    {
      objc_msgSend(v7, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

    }
    objc_msgSend(v7, "removeFromParentViewController");
    self->_selectedSectionIndex = a3;
    -[SUUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SUUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", v6);
      -[SUUIIPadProductPageViewController _showViewController:](self, "_showViewController:", v6);
    }

  }
}

- (void)_sendCannotOpen
{
  SUUIIPadProductPageDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  if (!self->_didSendCannotOpen)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      self->_didSendCannotOpen = 1;
      v6 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v6, "iPadProductPageCannotOpen:", self);

    }
  }
}

- (void)_setDefaultSectionIndexWithFragment:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self->_defaultSelectedSectionIndex = a3;
}

- (void)_setMetricsController:(id)a3
{
  id v5;
  id *p_metricsController;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v5 = a3;
  p_metricsController = (id *)&self->_metricsController;
  if (!self->_metricsController)
  {
    v21 = v5;
    -[SUUIProductPage metricsConfiguration](self->_productPage, "metricsConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_metricsController, a3);
    v8 = *p_metricsController;
    -[SUUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setApplicationIdentifier:", v10);

    objc_msgSend(*p_metricsController, "setPageConfiguration:", v7);
    v11 = *p_metricsController;
    -[SUUIClientContext metricsPageContextForViewController:](self->_clientContext, "metricsPageContextForViewController:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPageContext:", v12);

    v13 = *p_metricsController;
    -[SUUIProductPage pageURL](self->_productPage, "pageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPageURL:", v15);

    v16 = *p_metricsController;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIMetricsWindowOrientationForInterfaceOrientation(objc_msgSend(v17, "statusBarOrientation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWindowOrientation:", v18);

    -[SUUISwooshArrayViewController setMetricsController:](self->_relatedViewController, "setMetricsController:", *p_metricsController);
    v19 = *p_metricsController;
    objc_msgSend(v7, "pingURLs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pingURLs:withClientContext:", v20, self->_clientContext);

    objc_msgSend(*p_metricsController, "recordEvent:", self->_lastPageEvent);
    v5 = v21;
  }

}

- (void)_setProductPage:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUIProductPage **p_productPage;
  SUUIMetricsController *metricsController;
  void *v14;
  void *v15;
  SUUIItem *v16;
  SUUIItem *item;
  void *v18;
  void *v19;
  void *v20;
  SUUIMetricsController *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  SUUILoadProductPageOperation *loadOperation;
  id v26;

  v26 = a3;
  v7 = a4;
  objc_msgSend(v26, "ITMLData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUUIIPadProductPageViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ITMLData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ITMLResponse");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", 0, v10, v11, 0);
  }
  else
  {
    if (!v26)
      goto LABEL_12;
    p_productPage = &self->_productPage;
    objc_storeStrong((id *)&self->_productPage, a3);
    -[SUUIProductPage metricsConfiguration](self->_productPage, "metricsConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageConfiguration:](self->_metricsController, "setPageConfiguration:", v9);
    metricsController = self->_metricsController;
    -[SUUIProductPage pageURL](self->_productPage, "pageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageURL:](metricsController, "setPageURL:", v15);

    if (!self->_item)
    {
      objc_msgSend(v26, "item");
      v16 = (SUUIItem *)objc_claimAutoreleasedReturnValue();
      item = self->_item;
      self->_item = v16;

      -[SUUIIPadProductPageViewController _reloadHeaderViewController](self, "_reloadHeaderViewController");
    }
    -[SUUIProductPageHeaderViewController setProductPage:](self->_headerViewController, "setProductPage:", *p_productPage);
    if (self->_selectedSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
      -[SUUIIPadProductPageViewController _selectSectionIndex:](self, "_selectSectionIndex:", self->_defaultSelectedSectionIndex);
    -[SUUIProductPage uber](*p_productPage, "uber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIProductPagePlaceholderViewController setColorScheme:](self->_placeholderViewController, "setColorScheme:", v10);
    -[SUUISwooshArrayViewController setColorScheme:](self->_relatedViewController, "setColorScheme:", v10);
    -[SUUIIPadProductPageViewController _reviewsViewController](self, "_reviewsViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadData");

    -[SUUIProductPageHeaderViewController reloadData](self->_headerViewController, "reloadData");
    -[SUUILoadProductPageOperation metricsPageEvent](self->_loadOperation, "metricsPageEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSince1970");
      objc_msgSend(v11, "setPageRenderTime:");

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v11);
      objc_storeStrong((id *)&self->_lastPageEvent, v11);
    }
    v21 = self->_metricsController;
    objc_msgSend(v9, "pingURLs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController pingURLs:withClientContext:](v21, "pingURLs:withClientContext:", v22, self->_clientContext);

  }
LABEL_12:
  if (v7)
  {
    objc_msgSend(v7, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("SUUIErrorDomain")))
    {
      v24 = objc_msgSend(v7, "code");

      if (v24 == 1)
      {
        -[SUUIIPadProductPageViewController _sendCannotOpen](self, "_sendCannotOpen");
        goto LABEL_18;
      }
    }
    else
    {

    }
    -[SUUIIPadProductPageViewController _showError:](self, "_showError:", v7);
  }
LABEL_18:
  -[SUUILoadProductPageOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

}

- (void)_showError:(id)a3
{
  id v4;
  _BOOL4 v5;
  SUUINetworkErrorViewController *v6;
  SUUINetworkErrorViewController *networkErrorViewController;
  id v8;

  v4 = a3;
  if (!self->_networkErrorViewController)
  {
    v8 = v4;
    v5 = +[SUUINetworkErrorViewController canDisplayError:](SUUINetworkErrorViewController, "canDisplayError:", v4);
    v4 = v8;
    if (v5)
    {
      v6 = -[SUUINetworkErrorViewController initWithError:]([SUUINetworkErrorViewController alloc], "initWithError:", v8);
      networkErrorViewController = self->_networkErrorViewController;
      self->_networkErrorViewController = v6;

      -[SUUINetworkErrorViewController setClientContext:](self->_networkErrorViewController, "setClientContext:", self->_clientContext);
      -[SUUINetworkErrorViewController setDelegate:](self->_networkErrorViewController, "setDelegate:", self);
      -[SUUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", self->_networkErrorViewController);
      -[SUUIIPadProductPageViewController _showViewController:](self, "_showViewController:", self->_networkErrorViewController);
      v4 = v8;
    }
  }

}

- (void)_showIncompatibleView
{
  SUUIIncompatibleAppViewController *incompatibleViewController;
  SUUIIncompatibleAppViewController *v4;
  void *v5;
  SUUIIncompatibleAppViewController *v6;
  SUUIIncompatibleAppViewController *v7;
  void *v8;
  UIView *overlayView;
  id v10;

  incompatibleViewController = self->_incompatibleViewController;
  if (!incompatibleViewController)
  {
    v4 = [SUUIIncompatibleAppViewController alloc];
    -[SUUIProductPage item](self->_productPage, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIIncompatibleAppViewController initWithIncompatibleItem:](v4, "initWithIncompatibleItem:", v5);
    v7 = self->_incompatibleViewController;
    self->_incompatibleViewController = v6;

    -[SUUIViewController setClientContext:](self->_incompatibleViewController, "setClientContext:", self->_clientContext);
    -[SUUIIncompatibleAppViewController setOperationQueue:](self->_incompatibleViewController, "setOperationQueue:", self->_operationQueue);
    -[SUUIIPadProductPageViewController addChildViewController:](self, "addChildViewController:", self->_incompatibleViewController);
    -[SUUIIncompatibleAppViewController view](self->_incompatibleViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    -[UIView bounds](self->_overlayView, "bounds");
    objc_msgSend(v8, "setFrame:");
    -[UIView addSubview:](self->_overlayView, "addSubview:", v8);

    incompatibleViewController = self->_incompatibleViewController;
  }
  overlayView = self->_overlayView;
  -[SUUIIncompatibleAppViewController view](incompatibleViewController, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bringSubviewToFront:](overlayView, "bringSubviewToFront:", v10);

}

- (void)_showBanner
{
  SUUIMessageBanner *v3;
  SUUIMessageBanner *banner;
  SUUIMessageBanner *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  if (!self->_banner)
  {
    v3 = objc_alloc_init(SUUIMessageBanner);
    banner = self->_banner;
    self->_banner = v3;

    -[SUUIMessageBanner setDelegate:](self->_banner, "setDelegate:", self);
    v5 = self->_banner;
    if (self->_bannerText)
    {
      -[SUUIMessageBanner setMessage:](self->_banner, "setMessage:");
    }
    else
    {
      -[SUUIIPadProductPageViewController clientContext](self, "clientContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIIPadProductPageViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tintColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIMessageBannerAttributedString(v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIMessageBanner setAttributedMessage:](v5, "setAttributedMessage:", v9);

    }
    -[SUUIIPadProductPageViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_banner);

    -[SUUIIPadProductPageViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    -[SUUIMessageBanner sizeThatFits:](self->_banner, "sizeThatFits:", 630.0, 630.0);
    -[SUUIMessageBanner setFrame:](self->_banner, "setFrame:", v13, v15, v16, v17);
    -[SUUIIPadProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:", self->_selectedSectionIndex);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadProductPageViewController _showViewController:](self, "_showViewController:", v18);

  }
}

- (void)_showViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SUUIIPadProductPageViewController _reloadHeaderViewController](self, "_reloadHeaderViewController");
  objc_msgSend(v4, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIMessageBanner frame](self->_banner, "frame");
  -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");

  -[UIView bounds](self->_overlayView, "bounds");
  objc_msgSend(v7, "setFrame:");
  -[UIView insertSubview:atIndex:](self->_overlayView, "insertSubview:atIndex:", v7, 0);
  if (-[SUUIIPadProductPageViewController _isIncompatibleItem](self, "_isIncompatibleItem"))
    -[SUUIIPadProductPageViewController _showIncompatibleView](self, "_showIncompatibleView");

}

- (id)_viewControllerForSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3 == 2)
  {
    -[SUUIProductPage relatedContentSwooshes](self->_productPage, "relatedContentSwooshes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
      -[SUUIIPadProductPageViewController _relatedViewController](self, "_relatedViewController");
    else
      -[SUUIIPadProductPageViewController _placeholderViewController](self, "_placeholderViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[SUUIIPadProductPageViewController _reviewsViewController](self, "_reviewsViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v4 = 0;
  }
  else
  {
    -[SUUIIPadProductPageViewController _detailsViewController](self, "_detailsViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIIPadProductPageDelegate)delegate
{
  return (SUUIIPadProductPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIItem)item
{
  return self->_item;
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_reviewsViewController, 0);
  objc_storeStrong((id *)&self->_relatedViewController, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_networkErrorViewController, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_incompatibleViewController, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end
