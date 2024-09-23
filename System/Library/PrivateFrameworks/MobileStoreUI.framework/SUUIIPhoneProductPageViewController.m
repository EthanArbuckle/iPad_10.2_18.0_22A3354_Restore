@implementation SUUIIPhoneProductPageViewController

- (id)_initSUUIIPhoneProductPageViewController
{
  SUUIIPhoneProductPageViewController *v2;
  id *p_isa;
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIIPhoneProductPageViewController;
  v2 = -[SUUIIPhoneProductPageViewController init](&v8, sel_init);
  p_isa = (id *)&v2->super.super.super.super.isa;
  if (v2)
  {
    v2->_sectionIndex = 0;
    v4 = objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = p_isa[145];
    p_isa[145] = v4;

    objc_msgSend(p_isa[145], "setMaxConcurrentOperationCount:", 6);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", p_isa, sel__metricsEnterEventNotification_, CFSTR("SUUIMetricsDidRecordEnterEventNotification"), 0);

  }
  return p_isa;
}

- (SUUIIPhoneProductPageViewController)initWithItem:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  SUUIIPhoneProductPageViewController *v15;
  SUUIDismissingProductViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = -[SUUIIPhoneProductPageViewController _initSUUIIPhoneProductPageViewController](self, "_initSUUIIPhoneProductPageViewController");
  v7 = v6;
  if (v6)
  {
    v8 = v6 + 139;
    objc_storeStrong(v6 + 139, a3);
    v7[143] = (id)objc_msgSend(*v8, "itemIdentifier");
    objc_msgSend(v5, "productPageURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDB74A0];
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestWithURL:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v7[151];
      v7[151] = (id)v12;

    }
    v14 = objc_msgSend(*v8, "itemKind");
    if (v14 != 5 && !SUUIItemKindIsSoftwareKind(v14))
    {
      v17 = objc_alloc_init(SUUIDismissingProductViewController);
      objc_msgSend(v7[151], "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKStoreProductViewController loadProductWithURL:completionBlock:](v17, "loadProductWithURL:completionBlock:", v18, 0);

      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "keyWindow");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rootViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "presentViewController:animated:completion:", v17, 1, 0);

      v15 = 0;
      goto LABEL_8;
    }

  }
  v15 = v7;
LABEL_8:

  return v15;
}

- (SUUIIPhoneProductPageViewController)initWithItemIdentifier:(int64_t)a3
{
  SUUIIPhoneProductPageViewController *result;

  result = -[SUUIIPhoneProductPageViewController _initSUUIIPhoneProductPageViewController](self, "_initSUUIIPhoneProductPageViewController");
  if (result)
    result->_lookupItemIdentifier = a3;
  return result;
}

- (SUUIIPhoneProductPageViewController)initWithProductPage:(id)a3
{
  id v5;
  void *v6;
  SUUIIPhoneProductPageViewController *v7;

  v5 = a3;
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIIPhoneProductPageViewController initWithItem:](self, "initWithItem:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_productPage, a3);
    -[SUUIIPhoneProductPageViewController _setSectionIndexWithFragment:](v7, "_setSectionIndexWithFragment:", objc_msgSend(v5, "defaultPageFragment"));
  }

  return v7;
}

- (SUUIIPhoneProductPageViewController)initWithURL:(id)a3
{
  void *v4;
  SUUIIPhoneProductPageViewController *v5;

  objc_msgSend(MEMORY[0x24BDB74A0], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SUUIIPhoneProductPageViewController initWithURLRequest:](self, "initWithURLRequest:", v4);

  return v5;
}

- (SUUIIPhoneProductPageViewController)initWithURLRequest:(id)a3
{
  id v4;
  SUUIIPhoneProductPageViewController *v5;
  void *v6;
  uint64_t v7;
  NSURLRequest *urlRequest;

  v4 = a3;
  v5 = -[SUUIIPhoneProductPageViewController _initSUUIIPhoneProductPageViewController](self, "_initSUUIIPhoneProductPageViewController");
  if (v5)
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPhoneProductPageViewController _setSectionIndexWithFragment:](v5, "_setSectionIndexWithFragment:", SUUIProductPageFragmentWithURL(v6));

    v7 = objc_msgSend(v4, "copy");
    urlRequest = v5->_urlRequest;
    v5->_urlRequest = (NSURLRequest *)v7;

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
  -[SUUIProductPageDetailsViewController setDelegate:](self->_detailsViewController, "setDelegate:", 0);
  -[SUUINetworkErrorViewController setDelegate:](self->_errorViewController, "setDelegate:", 0);
  -[SUUIIncompatibleAppViewController setDelegate:](self->_incompatibleViewController, "setDelegate:", 0);
  -[SUUIProductPagePlaceholderViewController setDelegate:](self->_relatedPlaceholderViewController, "setDelegate:", 0);
  -[SUUIProductPagePlaceholderViewController setDelegate:](self->_loadingViewController, "setDelegate:", 0);
  -[SUUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", 0);
  -[SUUIProductPageReviewsViewController setDelegate:](self->_reviewsViewController, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIIPhoneProductPageViewController;
  -[SUUIViewController dealloc](&v4, sel_dealloc);
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
      -[SUUIIPhoneProductPageViewController _showBanner](self, "_showBanner");
  }

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
    -[SUUIViewController clientContext](self, "clientContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __69__SUUIIPhoneProductPageViewController_configureMetricsWithPageEvent___block_invoke;
    v7[3] = &unk_2511F6C90;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v6, "getDefaultMetricsControllerWithCompletionBlock:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __69__SUUIIPhoneProductPageViewController_configureMetricsWithPageEvent___block_invoke(uint64_t a1, void *a2)
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

- (NSURL)URL
{
  return -[NSURLRequest URL](self->_urlRequest, "URL");
}

- (void)reloadData
{
  void *v3;
  SUUILoadProductPageOperation *v4;
  SUUILoadProductPageOperation *loadOperation;
  SUUILoadProductPageOperation *v6;
  SSMetricsPageEvent *lastPageEvent;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[SUUIViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (!self->_metricsController)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke;
    v10[3] = &unk_2511F6CB8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "getDefaultMetricsControllerWithCompletionBlock:", v10);
    objc_destroyWeak(&v11);
  }
  if (!self->_productPage && !self->_loadOperation)
  {
    if (self->_urlRequest)
    {
      v4 = -[SUUILoadProductPageOperation initWithProductPageURLRequest:clientContext:]([SUUILoadProductPageOperation alloc], "initWithProductPageURLRequest:clientContext:", self->_urlRequest, v3);
    }
    else
    {
      if (!self->_lookupItemIdentifier)
        goto LABEL_10;
      v4 = -[SUUILoadProductPageOperation initWithItemIdentifier:clientContext:]([SUUILoadProductPageOperation alloc], "initWithItemIdentifier:clientContext:", self->_lookupItemIdentifier, v3);
    }
    loadOperation = self->_loadOperation;
    self->_loadOperation = v4;

LABEL_10:
    v6 = self->_loadOperation;
    if (v6)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_2;
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

void __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_setMetricsController:", v3);

}

void __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  block[2] = __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_3;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __49__SUUIIPhoneProductPageViewController_reloadData__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setProductPage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)contentScrollView
{
  return 0;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  SUUIMetricsController *metricsController;
  void *v6;
  objc_super v7;

  metricsController = self->_metricsController;
  SUUIMetricsWindowOrientationForInterfaceOrientation(-[SUUIIPhoneProductPageViewController interfaceOrientation](self, "interfaceOrientation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsController setWindowOrientation:](metricsController, "setWindowOrientation:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIIPhoneProductPageViewController;
  -[SUUIIPhoneProductPageViewController didRotateFromInterfaceOrientation:](&v7, sel_didRotateFromInterfaceOrientation_, a3);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  SUUIIPhoneProductPageView *v10;

  v10 = objc_alloc_init(SUUIIPhoneProductPageView);
  -[SUUIIPhoneProductPageViewController setView:](self, "setView:");
  -[SUUIViewController showDefaultNavigationItems](self, "showDefaultNavigationItems");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__shareButtonAction_);
  objc_msgSend(v3, "setImageInsets:", -3.0, 0.0, 3.0, 0.0);
  -[SUUIIPhoneProductPageViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "addObject:", v3);
  objc_msgSend(v4, "setRightBarButtonItems:", v9);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  if (!self->_childViewController)
  {
    -[SUUIIPhoneProductPageViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
    -[SUUIProductPageHeaderViewController reloadData](self->_headerViewController, "reloadData");
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIIPhoneProductPageViewController;
  -[SUUIIPhoneProductPageViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  SSMetricsPageEvent *lastPageEvent;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (self->_metricsController)
  {
    lastPageEvent = self->_lastPageEvent;
    if (lastPageEvent)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsPageEvent setOriginalTimeUsingDate:](lastPageEvent, "setOriginalTimeUsingDate:", v6);

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", self->_lastPageEvent);
    }
  }
  -[SUUIIPhoneProductPageViewController reloadData](self, "reloadData");
  v7.receiver = self;
  v7.super_class = (Class)SUUIIPhoneProductPageViewController;
  -[SUUIViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (id)activeMetricsController
{
  return self->_metricsController;
}

- (void)networkErrorViewControllerInvalidated:(id)a3
{
  id v4;
  SUUINetworkErrorViewController *errorViewController;
  void *v6;
  SUUINetworkErrorViewController *v7;
  id v8;

  v4 = a3;
  errorViewController = self->_errorViewController;
  if (errorViewController)
  {
    v8 = v4;
    if (errorViewController == (SUUINetworkErrorViewController *)self->_childViewController)
    {
      self->_childViewController = 0;

      errorViewController = self->_errorViewController;
    }
    -[SUUINetworkErrorViewController setDelegate:](errorViewController, "setDelegate:", 0);
    -[SUUINetworkErrorViewController view](self->_errorViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SUUINetworkErrorViewController removeFromParentViewController](self->_errorViewController, "removeFromParentViewController");
    v7 = self->_errorViewController;
    self->_errorViewController = 0;

    -[SUUIIPhoneProductPageViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
    -[SUUIIPhoneProductPageViewController reloadData](self, "reloadData");
    v4 = v8;
  }

}

- (id)metricsControllerForProductPageHeader:(id)a3
{
  return self->_metricsController;
}

- (void)productPageHeaderView:(id)a3 didReloadItemOffer:(id)a4
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v5 = objc_msgSend(v17, "isViewLoaded");
  v6 = v17;
  if (v5)
  {
    objc_msgSend(v17, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeToFit");

    -[SUUIProductPageChildViewController scrollView](self->_childViewController, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "contentOffset");
      v11 = v10;
      v13 = v12;
      objc_msgSend(v9, "contentInset");
      v15 = v14;
      -[SUUIIPhoneProductPageViewController _setContentInsetsForChildViewController:](self, "_setContentInsetsForChildViewController:", self->_childViewController);
      -[SUUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:", self->_childViewController);
      objc_msgSend(v9, "contentInset");
      objc_msgSend(v9, "setContentOffset:", v11, v13 + v15 - v16);
    }

    v6 = v17;
  }

}

- (void)productPageHeaderView:(id)a3 didSelectSectionIndex:(int64_t)a4
{
  if (self->_sectionIndex != a4)
  {
    self->_sectionIndex = a4;
    -[SUUIIPhoneProductPageViewController _reloadChildViewControllers](self, "_reloadChildViewControllers", a3);
  }
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
  v7[2] = __74__SUUIIPhoneProductPageViewController_productPageHeaderView_didSelectURL___block_invoke;
  v7[3] = &unk_2511F6D08;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[SUUIIPhoneProductPageViewController productPageChildOpenURL:viewControllerBlock:](self, "productPageChildOpenURL:viewControllerBlock:", v6, v7);

}

SUUIStorePageViewController *__74__SUUIIPhoneProductPageViewController_productPageHeaderView_didSelectURL___block_invoke(uint64_t a1)
{
  SUUIStorePageViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(SUUIStorePageViewController);
  objc_msgSend(*(id *)(a1 + 32), "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setClientContext:](v2, "setClientContext:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artistName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageViewController setTitle:](v2, "setTitle:", v5);

  -[SUUIStorePageViewController loadURL:withCompletionBlock:](v2, "loadURL:withCompletionBlock:", *(_QWORD *)(a1 + 40), 0);
  return v2;
}

- (void)askPermissionBannerDidSelect:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (!self->_bannerText)
  {
    objc_initWeak(&location, self);
    v5 = SUUIAskPermissionFramework();
    v6 = SUUIWeakLinkedClassForString(CFSTR("PRRequestQueue"), v5);
    v7 = (void *)SUUIAskPermissionFramework();
    v8 = *(id *)SUUIWeakLinkedSymbolForString("kPRRequestQueueiTunesStoreIdentifier", v7);
    objc_msgSend(v6, "_requestQueueForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SUUIItem itemIdentifier](self->_item, "itemIdentifier");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke;
    v11[3] = &unk_2511F7A68;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:completionHandler:", v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke_2;
  v3[3] = &unk_2511F76B8;
  v5 = a3;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
}

void __68__SUUIIPhoneProductPageViewController_askPermissionBannerDidSelect___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_hideBanner");

  }
}

- (void)productPageChildOpenItem:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  int v7;
  SUUIIPhoneProductPageViewController *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (v6 = objc_loadWeakRetained((id *)&self->_delegate),
        v7 = objc_msgSend(v6, "iPhoneProductPage:shouldOpenItem:", self, v11),
        v6,
        v7))
  {
    v8 = -[SUUIIPhoneProductPageViewController initWithItem:]([SUUIIPhoneProductPageViewController alloc], "initWithItem:", v11);
    -[SUUIViewController clientContext](self, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController setClientContext:](v8, "setClientContext:", v9);

    -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v8, 1);

  }
}

- (void)productPageChildOpenURL:(id)a3 viewControllerBlock:(id)a4
{
  void (**v6)(_QWORD);
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0
    || (v9 = objc_loadWeakRetained((id *)&self->_delegate),
        v10 = objc_msgSend(v9, "iPhoneProductPage:shouldOpenURL:", self, v14),
        v9,
        v10))
  {
    if (v6 && (v6[2](v6), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pushViewController:animated:", v12, 1);

    }
    else
    {
      SUUIMetricsOpenURL(v14);
    }
  }

}

- (void)productPageChildViewControllerDidScroll:(id)a3
{
  if (self->_childViewController == a3)
    -[SUUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:");
}

- (CGPoint)topContentOffset
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  double v10;
  int v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v2 = self;
  -[SUUIMessageBanner frame](self->_banner, "frame");
  v4 = v3;
  objc_msgSend(v2, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SUUIUserInterfaceIdiom(v5) != 1;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v6 == v9)
  {
    v10 = 0.0;
  }
  else
  {
    objc_msgSend(v2, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
  }
  v11 = v6 ^ v9;
  v12 = v4 + v10;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v15 = v12 + 0.0;
    if (!v11)
      goto LABEL_11;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "statusBarFrame");
  v17 = 20.0;
  if (v18 == 0.0)
    v17 = 0.0;
  v15 = v12 + v17;

  if (v11)
  {
LABEL_10:

  }
LABEL_11:

  v19 = 0.0;
  v20 = -49.0 - v15;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)productViewControllerDidFinish:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "setDelegate:", 0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__SUUIIPhoneProductPageViewController_productViewControllerDidFinish___block_invoke;
  v5[3] = &unk_2511F53F8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __70__SUUIIPhoneProductPageViewController_productViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v1);

  v6 = objc_loadWeakRetained(v1);
  v9 = v6;
  if (v4 == v5)
  {
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
  else
  {
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
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

- (void)_shareButtonAction:(id)a3
{
  if (self->_productPage)
  {
    self->_wantsActivityViewController = 0;
    -[SUUIIPhoneProductPageViewController _showActivityViewController](self, "_showActivityViewController", a3);
  }
  else
  {
    self->_wantsActivityViewController = 1;
  }
}

- (void)_animateAddToWishlist
{
  void *v3;
  void *v4;
  SUUIAddToWishlistAnimation *v5;
  void *v6;
  SUUIAddToWishlistAnimation *v7;
  id v8;

  -[SUUIProductPageHeaderViewController iconImage](self->_headerViewController, "iconImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [SUUIAddToWishlistAnimation alloc];
  -[SUUIViewController _wishlistButtonItem](self, "_wishlistButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUIAddToWishlistAnimation initWithImage:buttonItem:navigationBar:](v5, "initWithImage:buttonItem:navigationBar:", v8, v6, v4);

  -[SUUIAddToWishlistAnimation animateWithCompletionBlock:](v7, "animateWithCompletionBlock:", 0);
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
    if (self->_productPage)
    {
      v4 = -[SUUIProductPageDetailsViewController initWithProductPage:]([SUUIProductPageDetailsViewController alloc], "initWithProductPage:", self->_productPage);
      v5 = self->_detailsViewController;
      self->_detailsViewController = v4;

      v6 = self->_detailsViewController;
      -[SUUIViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageDetailsViewController setClientContext:](v6, "setClientContext:", v7);

      -[SUUIProductPageDetailsViewController setDelegate:](self->_detailsViewController, "setDelegate:", self);
      -[SUUIProductPageDetailsViewController setOperationQueue:](self->_detailsViewController, "setOperationQueue:", self->_operationQueue);
      -[SUUIProductPageDetailsViewController setAskPermission:](self->_detailsViewController, "setAskPermission:", self->_askPermission);
      detailsViewController = self->_detailsViewController;
    }
    else
    {
      detailsViewController = 0;
    }
  }
  return detailsViewController;
}

- (id)_reviewsViewController
{
  SUUIProductPageReviewsViewController *reviewsViewController;
  SUUIProductPageReviewsViewController *v4;
  SUUIProductPageReviewsViewController *v5;
  SUUIProductPageReviewsViewController *v6;
  void *v7;

  reviewsViewController = self->_reviewsViewController;
  if (!reviewsViewController)
  {
    if (self->_productPage)
    {
      v4 = -[SUUIProductPageReviewsViewController initWithProductPage:]([SUUIProductPageReviewsViewController alloc], "initWithProductPage:", self->_productPage);
      v5 = self->_reviewsViewController;
      self->_reviewsViewController = v4;

      v6 = self->_reviewsViewController;
      -[SUUIViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageReviewsViewController setClientContext:](v6, "setClientContext:", v7);

      -[SUUIProductPageReviewsViewController setDelegate:](self->_reviewsViewController, "setDelegate:", self);
      -[SUUIProductPageReviewsViewController setAskPermission:](self->_reviewsViewController, "setAskPermission:", self->_askPermission);
      reviewsViewController = self->_reviewsViewController;
    }
    else
    {
      reviewsViewController = 0;
    }
  }
  return reviewsViewController;
}

- (id)_relatedViewController
{
  void *v3;
  void *v4;
  SUUISwooshArrayViewController *v5;
  SUUISwooshArrayViewController *relatedViewController;
  SUUISwooshArrayViewController *v7;
  void *v8;
  void *v9;
  SUUISwooshArrayViewController *v10;
  void *v11;
  SUUISwooshArrayViewController *v12;

  -[SUUIProductPage relatedContentSwooshes](self->_productPage, "relatedContentSwooshes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_relatedViewController && objc_msgSend(v3, "count"))
  {
    v5 = -[SUUISwooshArrayViewController initWithSwooshComponents:]([SUUISwooshArrayViewController alloc], "initWithSwooshComponents:", v4);
    relatedViewController = self->_relatedViewController;
    self->_relatedViewController = v5;

    v7 = self->_relatedViewController;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISwooshArrayViewController setColorScheme:](v7, "setColorScheme:", v9);

    v10 = self->_relatedViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISwooshArrayViewController setClientContext:](v10, "setClientContext:", v11);

    -[SUUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", self);
    -[SUUISwooshArrayViewController setOperationQueue:](self->_relatedViewController, "setOperationQueue:", self->_operationQueue);
    -[SUUISwooshArrayViewController setMetricsController:](self->_relatedViewController, "setMetricsController:", self->_metricsController);
    -[SUUISwooshArrayViewController setAskPermission:](self->_relatedViewController, "setAskPermission:", self->_askPermission);
  }
  v12 = self->_relatedViewController;

  return v12;
}

- (void)_showBanner
{
  double v3;
  double v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  double v10;
  int v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  SUUIMessageBanner *v18;
  SUUIMessageBanner *banner;
  SUUIMessageBanner *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (self->_banner)
    return;
  -[SUUIIPhoneProductPageViewController view](self, "view");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIMessageBanner frame](self->_banner, "frame");
  v4 = v3;
  -[SUUIViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SUUIUserInterfaceIdiom(v5) != 1;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (v6 == v9)
  {
    v10 = 0.0;
  }
  else
  {
    -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "frame");
  }
  v11 = v6 ^ v9;
  v12 = v4 + v10;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v25, "setBannerOffset:", v12 + 0.0);
    if (!v11)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "statusBarFrame");
    v16 = 20.0;
    if (v17 == 0.0)
      v16 = 0.0;
    objc_msgSend(v25, "setBannerOffset:", v12 + v16);

    if (!v11)
      goto LABEL_12;
  }

LABEL_12:
  v18 = objc_alloc_init(SUUIMessageBanner);
  banner = self->_banner;
  self->_banner = v18;

  -[SUUIMessageBanner setDelegate:](self->_banner, "setDelegate:", self);
  v20 = self->_banner;
  if (self->_bannerText)
  {
    -[SUUIMessageBanner setMessage:](self->_banner, "setMessage:");
  }
  else
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPhoneProductPageViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tintColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIMessageBannerAttributedString(v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMessageBanner setAttributedMessage:](v20, "setAttributedMessage:", v24);

  }
  objc_msgSend(v25, "setBannerView:", self->_banner);
  objc_msgSend(v25, "layoutSubviews");
  -[SUUIIPhoneProductPageViewController _setContentInsetsForChildViewController:](self, "_setContentInsetsForChildViewController:", self->_childViewController);
  -[SUUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:", self->_childViewController);

}

- (void)_hideBanner
{
  void *v3;
  void *v4;
  SUUIMessageBanner *banner;

  if (self->_banner)
  {
    -[SUUIIPhoneProductPageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBannerView:", 0);

    -[SUUIIPhoneProductPageViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutSubviews");

    -[SUUIMessageBanner setDelegate:](self->_banner, "setDelegate:", 0);
    banner = self->_banner;
    self->_banner = 0;

    -[SUUIIPhoneProductPageViewController _setContentInsetsForChildViewController:](self, "_setContentInsetsForChildViewController:", self->_childViewController);
    -[SUUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:", self->_childViewController);
  }
}

- (id)_relatedPlaceholderViewController
{
  void *v3;
  void *v4;
  SUUIProductPagePlaceholderViewController *v5;
  SUUIProductPagePlaceholderViewController *relatedPlaceholderViewController;
  SUUIProductPagePlaceholderViewController *v7;
  void *v8;
  void *v9;
  SUUIProductPagePlaceholderViewController *v10;
  void *v11;
  SUUIProductPagePlaceholderViewController *v12;

  -[SUUIProductPage relatedContentSwooshes](self->_productPage, "relatedContentSwooshes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_relatedPlaceholderViewController && !objc_msgSend(v3, "count"))
  {
    v5 = -[SUUIProductPagePlaceholderViewController initWithStyle:]([SUUIProductPagePlaceholderViewController alloc], "initWithStyle:", 0);
    relatedPlaceholderViewController = self->_relatedPlaceholderViewController;
    self->_relatedPlaceholderViewController = v5;

    v7 = self->_relatedPlaceholderViewController;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPagePlaceholderViewController setColorScheme:](v7, "setColorScheme:", v9);

    v10 = self->_relatedPlaceholderViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPagePlaceholderViewController setClientContext:](v10, "setClientContext:", v11);

    -[SUUIProductPagePlaceholderViewController setDelegate:](self->_relatedPlaceholderViewController, "setDelegate:", self);
  }
  v12 = self->_relatedPlaceholderViewController;

  return v12;
}

- (id)_loadingViewController
{
  SUUIProductPagePlaceholderViewController *loadingViewController;
  SUUIProductPagePlaceholderViewController *v4;
  SUUIProductPagePlaceholderViewController *v5;
  SUUIProductPagePlaceholderViewController *v6;
  void *v7;
  void *v8;
  SUUIProductPagePlaceholderViewController *v9;
  void *v10;

  loadingViewController = self->_loadingViewController;
  if (!loadingViewController)
  {
    v4 = -[SUUIProductPagePlaceholderViewController initWithStyle:]([SUUIProductPagePlaceholderViewController alloc], "initWithStyle:", 1);
    v5 = self->_loadingViewController;
    self->_loadingViewController = v4;

    v6 = self->_loadingViewController;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPagePlaceholderViewController setColorScheme:](v6, "setColorScheme:", v8);

    v9 = self->_loadingViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPagePlaceholderViewController setClientContext:](v9, "setClientContext:", v10);

    -[SUUIProductPagePlaceholderViewController setDelegate:](self->_loadingViewController, "setDelegate:", self);
    loadingViewController = self->_loadingViewController;
  }
  return loadingViewController;
}

- (id)_headerViewController
{
  SUUIProductPageHeaderViewController *headerViewController;
  SUUIProductPageHeaderViewController *v4;
  SUUIProductPageHeaderViewController *v5;
  SUUIProductPageHeaderViewController *v6;
  void *v7;

  headerViewController = self->_headerViewController;
  if (!headerViewController)
  {
    if (self->_item)
    {
      v4 = -[SUUIProductPageHeaderViewController initWithItem:]([SUUIProductPageHeaderViewController alloc], "initWithItem:", self->_item);
      v5 = self->_headerViewController;
      self->_headerViewController = v4;

      v6 = self->_headerViewController;
      -[SUUIViewController clientContext](self, "clientContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageHeaderViewController setClientContext:](v6, "setClientContext:", v7);

      -[SUUIProductPageHeaderViewController setDelegate:](self->_headerViewController, "setDelegate:", self);
      -[SUUIProductPageHeaderViewController setOperationQueue:](self->_headerViewController, "setOperationQueue:", self->_operationQueue);
      -[SUUIProductPageHeaderViewController setProductPage:](self->_headerViewController, "setProductPage:", self->_productPage);
      -[SUUIProductPageHeaderViewController setSelectedSectionIndex:](self->_headerViewController, "setSelectedSectionIndex:", self->_sectionIndex);
      -[SUUIProductPageHeaderViewController setAskPermission:](self->_headerViewController, "setAskPermission:", self->_askPermission);
      headerViewController = self->_headerViewController;
    }
    else
    {
      headerViewController = 0;
    }
  }
  return headerViewController;
}

- (void)_invalidateChildViewControllers
{
  void *v3;
  SUUIProductPageChildViewController *childViewController;
  SUUIProductPageDetailsViewController *detailsViewController;
  SUUIIncompatibleAppViewController *incompatibleViewController;
  SUUIProductPagePlaceholderViewController *loadingViewController;
  SUUIProductPagePlaceholderViewController *relatedPlaceholderViewController;
  SUUISwooshArrayViewController *relatedViewController;
  SUUIProductPageReviewsViewController *reviewsViewController;

  if (-[SUUIIPhoneProductPageViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUUIIPhoneProductPageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setView:", 0);

  }
  childViewController = self->_childViewController;
  self->_childViewController = 0;

  -[SUUIProductPageDetailsViewController setDelegate:](self->_detailsViewController, "setDelegate:", 0);
  -[SUUIProductPageDetailsViewController removeFromParentViewController](self->_detailsViewController, "removeFromParentViewController");
  detailsViewController = self->_detailsViewController;
  self->_detailsViewController = 0;

  -[SUUIIncompatibleAppViewController setDelegate:](self->_incompatibleViewController, "setDelegate:", 0);
  -[SUUIIncompatibleAppViewController removeFromParentViewController](self->_incompatibleViewController, "removeFromParentViewController");
  incompatibleViewController = self->_incompatibleViewController;
  self->_incompatibleViewController = 0;

  -[SUUIProductPagePlaceholderViewController setDelegate:](self->_loadingViewController, "setDelegate:", 0);
  -[SUUIProductPagePlaceholderViewController removeFromParentViewController](self->_loadingViewController, "removeFromParentViewController");
  loadingViewController = self->_loadingViewController;
  self->_loadingViewController = 0;

  -[SUUIProductPagePlaceholderViewController setDelegate:](self->_relatedPlaceholderViewController, "setDelegate:", 0);
  -[SUUIProductPagePlaceholderViewController removeFromParentViewController](self->_relatedPlaceholderViewController, "removeFromParentViewController");
  relatedPlaceholderViewController = self->_relatedPlaceholderViewController;
  self->_relatedPlaceholderViewController = 0;

  -[SUUISwooshArrayViewController setDelegate:](self->_relatedViewController, "setDelegate:", 0);
  -[SUUISwooshArrayViewController removeFromParentViewController](self->_relatedViewController, "removeFromParentViewController");
  relatedViewController = self->_relatedViewController;
  self->_relatedViewController = 0;

  -[SUUIProductPageReviewsViewController setDelegate:](self->_reviewsViewController, "setDelegate:", 0);
  -[SUUIProductPageReviewsViewController removeFromParentViewController](self->_reviewsViewController, "removeFromParentViewController");
  reviewsViewController = self->_reviewsViewController;
  self->_reviewsViewController = 0;

}

- (BOOL)_isIncompatibleItem
{
  SUUIItem *v3;
  char v4;
  BOOL v5;
  char v6;
  void *v7;
  uint64_t v8;

  -[SUUIProductPage item](self->_productPage, "item");
  v3 = (SUUIItem *)objc_claimAutoreleasedReturnValue();
  if ((v3 || (v3 = self->_item) != 0)
    && (v4 = -[SUUIItem deviceFamilies](v3, "deviceFamilies"), (v4 & 6) == 0))
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v5 = (v6 & 1) == 0 || (v8 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  else
  {
    v5 = 0;
  }
  if (-[SUUIItem itemKind](v3, "itemKind") == 5)
    v5 = 1;

  return v5;
}

- (void)_presentHTMLProductPage
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDEA6E0]);
  -[NSURLRequest URL](self->_urlRequest, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadProductWithURL:completionBlock:", v3, 0);

  objc_msgSend(v4, "setDelegate:", self);
  -[SUUIIPhoneProductPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_reloadChildViewControllers
{
  int v3;
  SUUIIncompatibleAppViewController *v4;
  SUUIProductPageChildViewController **p_childViewController;
  void *v6;
  void *item;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  double v26;
  int v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  void *v38;
  uint64_t v39;
  int v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  double v46;
  double v47;
  double *v48;
  int v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  int v60;
  double v61;
  double v62;
  int v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  int v73;
  void *v74;
  uint64_t v75;
  int v76;
  double v77;
  double v78;
  int v79;
  double v80;
  void *v81;
  uint64_t v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  int v89;
  void *v90;
  uint64_t v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  int v110;
  void *v111;
  uint64_t v112;
  int v113;
  double v114;
  double v115;
  void *v116;
  uint64_t v117;
  unint64_t v118;
  double v119;
  double v120;
  double v121;
  int v122;
  void *v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  void *v133;
  int v134;
  void *v135;
  uint64_t v136;
  int v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  uint64_t v143;
  unint64_t v144;
  double v145;
  double v146;
  double v147;
  int v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  void *v156;
  int v157;
  void *v158;
  uint64_t v159;
  int v160;
  double v161;
  double v162;
  double v163;
  void *v164;
  uint64_t v165;
  unint64_t v166;
  double v167;
  int v168;
  double v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  double v181;
  void *v182;
  unint64_t v183;
  int v184;
  int v185;
  double v186;
  void *v187;
  double v188;
  double v189;
  void *v190;
  void *v191;
  SUUIProductPageChildViewController *v192;
  SUUIIncompatibleAppViewController *v193;

  -[SUUIIPhoneProductPageViewController _viewControllerForSectionIndex:](self, "_viewControllerForSectionIndex:", self->_sectionIndex);
  v193 = (SUUIIncompatibleAppViewController *)objc_claimAutoreleasedReturnValue();
  v3 = -[SUUIIPhoneProductPageViewController isViewLoaded](self, "isViewLoaded");
  v4 = v193;
  if (v3)
  {
    p_childViewController = &self->_childViewController;
    if ((SUUIIncompatibleAppViewController *)self->_childViewController != v193)
    {
      -[SUUIIPhoneProductPageViewController navigationItem](self, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPage item](self->_productPage, "item");
      item = (void *)objc_claimAutoreleasedReturnValue();
      v8 = item;
      if (!item)
        item = self->_item;
      objc_msgSend(item, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackButtonTitle:", v9);

      -[SUUIIPhoneProductPageViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIIPhoneProductPageViewController _headerViewController](self, "_headerViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = *p_childViewController;
      -[SUUIProductPageChildViewController setHeaderViewController:](v192, "setHeaderViewController:", 0);
      objc_msgSend(v10, "setView:", 0);
      -[SUUIProductPageChildViewController removeFromParentViewController](v192, "removeFromParentViewController");
      objc_storeStrong((id *)&self->_childViewController, v193);
      -[SUUIIPhoneProductPageViewController addChildViewController:](self, "addChildViewController:", *p_childViewController);
      -[SUUIProductPageChildViewController view](*p_childViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setView:", v12);

      -[SUUIProductPageChildViewController setHeaderViewController:](*p_childViewController, "setHeaderViewController:", v11);
      -[SUUIIPhoneProductPageViewController _setHeaderPositionForChildViewController:](self, "_setHeaderPositionForChildViewController:", *p_childViewController);
      -[SUUIMessageBanner frame](self->_banner, "frame");
      v14 = v13;
      -[SUUIViewController clientContext](self, "clientContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = SUUIUserInterfaceIdiom(v15) != 1;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      v19 = (v18 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v190 = v11;
      if (v16 == v19)
      {
        v20 = 0.0;
      }
      else
      {
        -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v18, "navigationBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
      }
      v21 = v14 + v20;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "userInterfaceIdiom");

      v24 = v23 & 0xFFFFFFFFFFFFFFFBLL;
      if (v24 == 1
        || (objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v22, "statusBarFrame"),
            v25 == 0.0))
      {
        v26 = 0.0;
      }
      else
      {
        v26 = 20.0;
      }
      v27 = v16 ^ v19;
      v28 = v21 + v26;
      -[SUUIMessageBanner frame](self->_banner, "frame");
      objc_msgSend(v10, "setBannerOffset:", v28 - v29);
      if (v24 != 1)

      if (v27)
      {

      }
      v191 = v10;
      if (v192)
      {
        -[SUUIProductPageChildViewController scrollView](v192, "scrollView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "contentOffset");
        v32 = v31;
        v34 = v33;
      }
      else
      {
        -[SUUIMessageBanner frame](self->_banner, "frame");
        v36 = v35;
        -[SUUIViewController clientContext](self, "clientContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = SUUIUserInterfaceIdiom(v30) != 1;
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "userInterfaceIdiom");

        v40 = (v39 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        if (v37 == v40)
        {
          v41 = 0.0;
        }
        else
        {
          -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v39, "navigationBar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "frame");
        }
        v42 = v36 + v41;
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "userInterfaceIdiom");

        v45 = v44 & 0xFFFFFFFFFFFFFFFBLL;
        if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1
          || (objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"),
              v44 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend((id)v44, "statusBarFrame"),
              v46 == 0.0))
        {
          v47 = 0.0;
        }
        else
        {
          v47 = 20.0;
        }
        v48 = (double *)MEMORY[0x24BDBEFB0];
        v49 = v37 ^ v40;
        v50 = -(v42 + v47);
        -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "frame");
        v53 = v50 - v52;

        if (v45 != 1)
        v32 = *v48;
        v34 = v53 + -49.0;
        p_childViewController = &self->_childViewController;
        if (v49)
        {

        }
      }

      -[SUUIMessageBanner frame](self->_banner, "frame");
      v55 = v54;
      -[SUUIViewController clientContext](self, "clientContext");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = SUUIUserInterfaceIdiom(v56) != 1;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "userInterfaceIdiom");

      v60 = (v59 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v61 = 0.0;
      v62 = 0.0;
      if (v57 != v60)
      {
        -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v59, "navigationBar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frame");
      }
      v63 = v57 ^ v60;
      v64 = v55 + v62;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "userInterfaceIdiom");

      if ((v66 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "statusBarFrame");
        if (v68 == 0.0)
          v61 = 0.0;
        else
          v61 = 20.0;

      }
      v69 = -49.0 - (v64 + v61);
      if (v63)
      {

      }
      if (v34 > v69)
      {
        -[SUUIMessageBanner frame](self->_banner, "frame");
        v71 = v70;
        -[SUUIViewController clientContext](self, "clientContext");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = SUUIUserInterfaceIdiom(v72) != 1;
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "userInterfaceIdiom");

        v76 = (v75 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        v77 = 0.0;
        v78 = 0.0;
        if (v73 != v76)
        {
          -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
          v75 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v75, "navigationBar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "frame");
        }
        v79 = v73 ^ v76;
        v80 = v71 + v78;
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "userInterfaceIdiom");

        if ((v82 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "statusBarFrame");
          if (v84 == 0.0)
            v77 = 0.0;
          else
            v77 = 20.0;

        }
        v85 = v80 + v77;
        if (v79)
        {

        }
        v34 = -49.0 - v85;

      }
      -[SUUIMessageBanner frame](self->_banner, "frame");
      v87 = v86;
      -[SUUIViewController clientContext](self, "clientContext");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = SUUIUserInterfaceIdiom(v88) != 1;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "userInterfaceIdiom");

      v184 = (v91 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v185 = v89;
      v188 = v34;
      if (v89 == v184)
      {
        v93 = 0.0;
      }
      else
      {
        -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "navigationBar");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "frame");
        v93 = v92;
      }
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "userInterfaceIdiom");

      v183 = v95 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v95 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || (objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"),
            v177 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v177, "statusBarFrame"),
            v96 == 0.0))
      {
        v97 = 0.0;
      }
      else
      {
        v97 = 20.0;
      }
      SUUIViewControllerGetAncestorTabBarController(self);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "tabBar");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "frame");
      v99 = v98;
      -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "frame");
      v102 = v101;
      -[SUUIProductPageChildViewController scrollView](*p_childViewController, "scrollView");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "contentSize");
      v181 = v104;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "bounds");
      v186 = v106;
      -[SUUIMessageBanner frame](self->_banner, "frame");
      v108 = v107;
      -[SUUIViewController clientContext](self, "clientContext");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = SUUIUserInterfaceIdiom(v109) != 1;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v111, "userInterfaceIdiom");

      v113 = (v112 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v189 = v32;
      v187 = v88;
      if (v110 == v113)
      {
        v115 = 0.0;
      }
      else
      {
        -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "navigationBar");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "frame");
        v115 = v114;
      }
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "userInterfaceIdiom");

      v118 = v117 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v117 & 0xFFFFFFFFFFFFFFFBLL) == 1
        || (objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"),
            v116 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v116, "statusBarFrame"),
            v119 == 0.0))
      {
        v120 = 0.0;
      }
      else
      {
        v120 = 20.0;
      }
      v121 = v87 + v93;
      v122 = v110 ^ v113;
      -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "frame");
      v125 = v124;

      if (v118 != 1)
      v126 = v121 + v97;
      if (v122)
      {

      }
      v127 = v126 + v99;

      if (v183 != 1)
      v128 = v127 + v102;
      v129 = v108 + v115;
      if (v185 != v184)
      {

      }
      v130 = v129 + v120;

      -[SUUIMessageBanner frame](self->_banner, "frame");
      v132 = v131;
      -[SUUIViewController clientContext](self, "clientContext");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = SUUIUserInterfaceIdiom(v133) != 1;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_msgSend(v135, "userInterfaceIdiom");

      v137 = (v136 & 0xFFFFFFFFFFFFFFFBLL) == 1;
      v138 = 0.0;
      v139 = 0.0;
      if (v134 != v137)
      {
        -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
        v136 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v136, "navigationBar");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "frame");
      }
      v140 = v130 + v125;
      v141 = v132 + v139;
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v142, "userInterfaceIdiom");

      v144 = v143 & 0xFFFFFFFFFFFFFFFBLL;
      if ((v143 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "statusBarFrame");
        if (v145 == 0.0)
          v138 = 0.0;
        else
          v138 = 20.0;
      }
      v146 = v128 + v181 + 49.0 - v186;
      v147 = v140 + 49.0;
      v148 = v134 ^ v137;
      -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "frame");
      v151 = -(v141 + v138) - v150;

      if (v144 != 1)
      v152 = v146 - v147;
      v153 = v191;
      if (v148)
      {

      }
      if (v152 < v151 + -49.0)
      {
        -[SUUIMessageBanner frame](self->_banner, "frame");
        v155 = v154;
        -[SUUIViewController clientContext](self, "clientContext");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = SUUIUserInterfaceIdiom(v156) != 1;
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = objc_msgSend(v158, "userInterfaceIdiom");

        v160 = (v159 & 0xFFFFFFFFFFFFFFFBLL) == 1;
        v161 = 0.0;
        v162 = 0.0;
        if (v157 != v160)
        {
          -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
          v159 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v159, "navigationBar");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "frame");
        }
        v163 = v155 + v162;
        objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = objc_msgSend(v164, "userInterfaceIdiom");

        v166 = v165 & 0xFFFFFFFFFFFFFFFBLL;
        if ((v165 & 0xFFFFFFFFFFFFFFFBLL) != 1)
        {
          objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "statusBarFrame");
          if (v167 == 0.0)
            v161 = 0.0;
          else
            v161 = 20.0;
        }
        v168 = v157 ^ v160;
        v169 = -(v163 + v161);
        -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "frame");
        v172 = v171;

        if (v166 != 1)
        v173 = v169 - v172;
        v153 = v191;
        if (v168)
        {

        }
        v152 = v173 + -49.0;

      }
      if (v188 <= v152)
        v152 = v188;
      -[SUUIProductPageChildViewController scrollView](self->_childViewController, "scrollView");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "setContentOffset:", v189, v152);

      objc_msgSend(v153, "animateYPosition:", v188 - v152);
      if (v193 == self->_incompatibleViewController)
        -[SUUIIncompatibleAppViewController reloadData](v193, "reloadData");

      v4 = v193;
    }
  }

}

- (void)_setContentInsetsForChildViewController:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  double v22;
  int v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  int v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  double v40;
  int v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  objc_msgSend(a3, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v50 = v4;
    -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    -[SUUIMessageBanner frame](self->_banner, "frame");
    v9 = v8;
    -[SUUIViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SUUIUserInterfaceIdiom(v10) != 1;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    v14 = (v13 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v15 = 0.0;
    v16 = 0.0;
    if (v11 != v14)
    {
      -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "navigationBar");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "frame");
    }
    v17 = v7 + 49.0;
    v18 = v9 + v16;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom");

    v21 = v20 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "statusBarFrame");
      if (v22 == 0.0)
        v15 = 0.0;
      else
        v15 = 20.0;
    }
    v23 = v11 ^ v14;
    SUUIViewControllerGetAncestorTabBarController(self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tabBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    objc_msgSend(v50, "setContentInset:", v17 + v18 + v15, 0.0, v26, 0.0);

    if (v21 != 1)
    if (v23)
    {

    }
    -[SUUIMessageBanner frame](self->_banner, "frame");
    v28 = v27;
    -[SUUIViewController clientContext](self, "clientContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = SUUIUserInterfaceIdiom(v29) != 1;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "userInterfaceIdiom");

    v33 = (v32 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    v34 = 0.0;
    v35 = 0.0;
    if (v30 != v33)
    {
      -[SUUIIPhoneProductPageViewController navigationController](self, "navigationController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "navigationBar");
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v32, "frame");
    }
    v36 = v28 + v35;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "userInterfaceIdiom");

    v39 = v38 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v38 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "statusBarFrame");
      if (v40 == 0.0)
        v34 = 0.0;
      else
        v34 = 20.0;
    }
    v41 = v30 ^ v33;
    SUUIViewControllerGetAncestorTabBarController(self);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "tabBar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "frame");
    objc_msgSend(v50, "setScrollIndicatorInsets:", v36 + v34, 0.0, v44, 0.0);

    if (v39 != 1)
    if (v41)
    {

    }
    -[SUUIProductPage uber](self->_productPage, "uber");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "colorScheme");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "backgroundColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      SUUIScrollViewSetTopBackgroundColor(v50, v47);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIScrollViewSetTopBackgroundColor(v50, v48);

    }
    SUUIScrollViewLayoutTopBackgroundColorForProductPage(v50, 0.0);
    v4 = v50;
  }

}

- (void)_setHeaderPositionForChildViewController:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  objc_msgSend(a3, "scrollView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentOffset");
  v5 = v4;
  -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentInset");
  v9 = v8;
  -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v9 - v11 + -49.0;

  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v6, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = -(v20 + 49.0);

  objc_msgSend(v6, "setFrame:", v14, v21, v16, v18);
  v22 = 0.0;
  v23 = 0.0;
  if (v5 > -(v12 + 49.0))
    v23 = (v5 + 49.0 + v12) / 49.0;
  if (v23 < 1.0)
    v22 = 1.0 - v23;
  objc_msgSend(v7, "setBackdropAlpha:", v22);

}

- (void)_setMetricsController:(id)a3
{
  id v5;
  SUUIMetricsController **p_metricsController;
  void *v7;
  SUUIMetricsController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SUUIMetricsController *v13;
  void *v14;
  void *v15;
  SUUIMetricsController *v16;
  void *v17;
  void *v18;
  SUUIMetricsController *v19;
  void *v20;
  SUUIMetricsController *v21;
  void *v22;
  id v23;

  v5 = a3;
  p_metricsController = &self->_metricsController;
  if (!self->_metricsController)
  {
    v23 = v5;
    -[SUUIProductPage metricsConfiguration](self->_productPage, "metricsConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_metricsController, a3);
    -[SUUIMetricsController setPageConfiguration:](*p_metricsController, "setPageConfiguration:", v7);
    v8 = *p_metricsController;
    -[SUUIProductPage pageURL](self->_productPage, "pageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageURL:](v8, "setPageURL:", v10);

    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "statusBarOrientation");

    v13 = *p_metricsController;
    SUUIMetricsWindowOrientationForInterfaceOrientation(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setWindowOrientation:](v13, "setWindowOrientation:", v14);

    -[SUUIViewController clientContext](self, "clientContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *p_metricsController;
    objc_msgSend(v15, "clientInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setApplicationIdentifier:](v16, "setApplicationIdentifier:", v18);

    v19 = *p_metricsController;
    objc_msgSend(v15, "metricsPageContextForViewController:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageContext:](v19, "setPageContext:", v20);

    -[SUUISwooshArrayViewController setMetricsController:](self->_relatedViewController, "setMetricsController:", *p_metricsController);
    v21 = *p_metricsController;
    objc_msgSend(v7, "pingURLs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController pingURLs:withClientContext:](v21, "pingURLs:withClientContext:", v22, v15);

    v5 = v23;
  }

}

- (void)_setProductPage:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SUUILoadProductPageOperation *loadOperation;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SUUIProductPage **p_productPage;
  SUUIMetricsController *metricsController;
  void *v17;
  void *v18;
  SUUIItem *v19;
  SUUIItem *item;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  SUUIMetricsController *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  -[SUUILoadProductPageOperation metricsPageEvent](self->_loadOperation, "metricsPageEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUILoadProductPageOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_msgSend(v7, "ITMLData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ITMLData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ITMLResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendOnPageResponseWithDocument:data:URLResponse:performanceMetrics:", 0, v13, v14, 0);

  }
  else
  {
    if (!v7)
      goto LABEL_14;
    p_productPage = &self->_productPage;
    objc_storeStrong((id *)&self->_productPage, a3);
    -[SUUIProductPage metricsConfiguration](self->_productPage, "metricsConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageConfiguration:](self->_metricsController, "setPageConfiguration:", v12);
    metricsController = self->_metricsController;
    -[SUUIProductPage pageURL](self->_productPage, "pageURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController setPageURL:](metricsController, "setPageURL:", v18);

    if (!self->_item)
    {
      -[SUUIProductPage item](*p_productPage, "item");
      v19 = (SUUIItem *)objc_claimAutoreleasedReturnValue();
      item = self->_item;
      self->_item = v19;

    }
    -[SUUIProductPageHeaderViewController setProductPage:](self->_headerViewController, "setProductPage:", *p_productPage);
    if (-[SUUIProductPageHeaderViewController isViewLoaded](self->_headerViewController, "isViewLoaded"))
    {
      -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeToFit");

    }
    -[SUUIIPhoneProductPageViewController _invalidateChildViewControllers](self, "_invalidateChildViewControllers");
    -[SUUIIPhoneProductPageViewController _reloadChildViewControllers](self, "_reloadChildViewControllers");
    -[SUUIProductPageHeaderViewController reloadData](self->_headerViewController, "reloadData");
    v22 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SUUIIPhoneProductPageViewController__setProductPage_error___block_invoke;
    block[3] = &unk_2511F47C0;
    block[4] = self;
    dispatch_after(v22, MEMORY[0x24BDAC9B8], block);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSince1970");
      objc_msgSend(v9, "setPageRenderTime:");

      -[SUUIMetricsController recordEvent:](self->_metricsController, "recordEvent:", v9);
      objc_storeStrong((id *)&self->_lastPageEvent, v9);
    }
    if (self->_wantsActivityViewController)
      -[SUUIIPhoneProductPageViewController _showActivityViewController](self, "_showActivityViewController");
    v24 = self->_metricsController;
    objc_msgSend(v12, "pingURLs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewController clientContext](self, "clientContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMetricsController pingURLs:withClientContext:](v24, "pingURLs:withClientContext:", v25, v26);

  }
LABEL_14:
  if (v8)
  {
    objc_msgSend(v8, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqualToString:", CFSTR("SUUIErrorDomain")))
    {
      v28 = objc_msgSend(v8, "code");

      if (v28 == 1)
      {
        -[SUUIIPhoneProductPageViewController _presentHTMLProductPage](self, "_presentHTMLProductPage");
        goto LABEL_20;
      }
    }
    else
    {

    }
    -[SUUIIPhoneProductPageViewController _showError:](self, "_showError:", v8);
  }
LABEL_20:

}

void __61__SUUIIPhoneProductPageViewController__setProductPage_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_reviewsViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)_setSectionIndexWithFragment:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self->_sectionIndex = a3;
}

- (void)_showError:(id)a3
{
  id v4;
  _BOOL4 v5;
  SUUINetworkErrorViewController *v6;
  SUUINetworkErrorViewController *errorViewController;
  SUUINetworkErrorViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (!self->_errorViewController)
  {
    v12 = v4;
    v5 = +[SUUINetworkErrorViewController canDisplayError:](SUUINetworkErrorViewController, "canDisplayError:", v4);
    v4 = v12;
    if (v5)
    {
      -[SUUIProductPageChildViewController setHeaderViewController:](self->_childViewController, "setHeaderViewController:", 0);
      -[SUUIProductPageChildViewController removeFromParentViewController](self->_childViewController, "removeFromParentViewController");
      v6 = -[SUUINetworkErrorViewController initWithError:]([SUUINetworkErrorViewController alloc], "initWithError:", v12);
      errorViewController = self->_errorViewController;
      self->_errorViewController = v6;

      v8 = self->_errorViewController;
      -[SUUIViewController clientContext](self, "clientContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINetworkErrorViewController setClientContext:](v8, "setClientContext:", v9);

      -[SUUINetworkErrorViewController setDelegate:](self->_errorViewController, "setDelegate:", self);
      objc_storeStrong((id *)&self->_childViewController, self->_errorViewController);
      -[SUUIIPhoneProductPageViewController addChildViewController:](self, "addChildViewController:", self->_childViewController);
      -[SUUIIPhoneProductPageViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUINetworkErrorViewController view](self->_errorViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAutoresizingMask:", 18);
      objc_msgSend(v10, "bounds");
      objc_msgSend(v11, "setFrame:");
      objc_msgSend(v10, "addSubview:", v11);

      v4 = v12;
    }
  }

}

- (void)_showActivityViewController
{
  SUUIProductPageActivityViewController *v3;
  void *v4;
  void *v5;
  SUUIProductPageActivityViewController *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, int);
  void *v10;
  id v11;
  id location;

  v3 = [SUUIProductPageActivityViewController alloc];
  -[SUUIProductPage item](self->_productPage, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewController clientContext](self, "clientContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUUIProductPageActivityViewController initWithProductPageItem:clientContext:](v3, "initWithProductPageItem:clientContext:", v4, v5);

  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __66__SUUIIPhoneProductPageViewController__showActivityViewController__block_invoke;
  v10 = &unk_2511F6E50;
  objc_copyWeak(&v11, &location);
  -[SUUIProductPageActivityViewController setCompletionWithItemsHandler:](v6, "setCompletionWithItemsHandler:", &v7);
  -[SUUIIPhoneProductPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0, v7, v8, v9, v10);
  self->_wantsActivityViewController = 0;
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __66__SUUIIPhoneProductPageViewController__showActivityViewController__block_invoke(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;

  if (a3)
  {
    if (objc_msgSend(a2, "isEqualToString:", 0x25120D288))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_animateAddToWishlist");

    }
  }
}

- (id)_viewControllerForSectionIndex:(unint64_t)a3
{
  SUUIIncompatibleAppViewController *incompatibleViewController;
  SUUIIncompatibleAppViewController *v6;
  void *v7;
  SUUIIncompatibleAppViewController *v8;
  SUUIIncompatibleAppViewController *v9;
  SUUIIncompatibleAppViewController *v10;
  void *v11;
  SUUIIncompatibleAppViewController *v12;
  SUUIProductPage *productPage;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (!self->_item)
  {
LABEL_11:
    v14 = 0;
    return v14;
  }
  if (-[SUUIIPhoneProductPageViewController _isIncompatibleItem](self, "_isIncompatibleItem"))
  {
    incompatibleViewController = self->_incompatibleViewController;
    if (!incompatibleViewController)
    {
      v6 = [SUUIIncompatibleAppViewController alloc];
      -[SUUIProductPage item](self->_productPage, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SUUIIncompatibleAppViewController initWithIncompatibleItem:](v6, "initWithIncompatibleItem:", v7);
      v9 = self->_incompatibleViewController;
      self->_incompatibleViewController = v8;

      v10 = self->_incompatibleViewController;
      -[SUUIViewController clientContext](self, "clientContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setClientContext:](v10, "setClientContext:", v11);

      -[SUUIIncompatibleAppViewController setDelegate:](self->_incompatibleViewController, "setDelegate:", self);
      -[SUUIIncompatibleAppViewController setOperationQueue:](self->_incompatibleViewController, "setOperationQueue:", self->_operationQueue);
      incompatibleViewController = self->_incompatibleViewController;
    }
    v12 = incompatibleViewController;
    goto LABEL_18;
  }
  productPage = self->_productPage;
  if (!productPage)
  {
    -[SUUIIPhoneProductPageViewController _loadingViewController](self, "_loadingViewController");
    v12 = (SUUIIncompatibleAppViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      -[SUUIIPhoneProductPageViewController _reviewsViewController](self, "_reviewsViewController");
      v12 = (SUUIIncompatibleAppViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (!a3)
    {
      -[SUUIIPhoneProductPageViewController _detailsViewController](self, "_detailsViewController");
      v12 = (SUUIIncompatibleAppViewController *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v14 = v12;
      return v14;
    }
    goto LABEL_11;
  }
  -[SUUIProductPage relatedContentSwooshes](productPage, "relatedContentSwooshes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    -[SUUIIPhoneProductPageViewController _relatedPlaceholderViewController](self, "_relatedPlaceholderViewController");
    v12 = (SUUIIncompatibleAppViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[SUUIIPhoneProductPageViewController _relatedViewController](self, "_relatedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isSkLoaded"))
  {
    v14 = v17;
  }
  else
  {
    -[SUUIIPhoneProductPageViewController _loadingViewController](self, "_loadingViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "loadMissingItemData");
  }

  return v14;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (NSString)bannerText
{
  return self->_bannerText;
}

- (SUUIIPhoneProductPageDelegate)delegate
{
  return (SUUIIPhoneProductPageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_relatedPlaceholderViewController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_lastPageEvent, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_incompatibleViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_detailsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_bannerText, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end
