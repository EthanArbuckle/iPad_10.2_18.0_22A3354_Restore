@implementation SUUIProductPageReviewsViewController

- (SUUIProductPageReviewsViewController)initWithProductPage:(id)a3
{
  id v5;
  SUUIProductPageReviewsViewController *v6;
  SUUIProductPageReviewsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageReviewsViewController;
  v6 = -[SUUIProductPageReviewsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isPad = SUUIUserInterfaceIdiom(v6->_clientContext) == 1;
    objc_storeStrong((id *)&v7->_productPage, a3);
    v7->_sortOrder = 1;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[SKComposeReviewViewController setDelegate:](self->_composeViewController, "setDelegate:", 0);
  -[SUUIReviewsHistogramViewController appSupportButton](self->_histogramViewController, "appSupportButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIReviewsHistogramViewController segmentedControl](self->_histogramViewController, "segmentedControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIReviewsHistogramViewController starRatingControl](self->_histogramViewController, "starRatingControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIIPadCustomerReviewsHeaderView removeTarget:action:forControlEvents:](self->_reviewsHeaderView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[SUUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  -[SUUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageReviewsViewController;
  -[SUUIProductPageReviewsViewController dealloc](&v9, sel_dealloc);
}

- (SUUIFacebookLikeStatus)facebookLikeStatus
{
  return -[SUUIReviewsFacebookViewController facebookLikeStatus](self->_facebookViewController, "facebookLikeStatus");
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

    -[NSOperationQueue setMaxConcurrentOperationCount:](self->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)reloadData
{
  void *v3;
  SSVLoadURLOperation *loadOperation;

  -[SUUIProductPageReviewsViewController _urlStringWithPageNumber:](self, "_urlStringWithPageNumber:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !self->_reviewList)
  {
    loadOperation = self->_loadOperation;

    if (!loadOperation)
      -[SUUIProductPageReviewsViewController _reloadData](self, "_reloadData");
  }
  else
  {

  }
}

- (void)setFacebookLikeStatus:(id)a3
{
  id v4;
  void *v5;
  SUUIReviewsFacebookViewController *facebookViewController;
  SUUIReviewsFacebookViewController *v7;
  SUUIReviewsFacebookViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  SUUIProductPageTableView *tableView;
  void *v17;
  id v18;

  v18 = a3;
  -[SUUIReviewsFacebookViewController facebookLikeStatus](self->_facebookViewController, "facebookLikeStatus");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v18;
  if (v4 != v18)
  {
    facebookViewController = self->_facebookViewController;
    if (v18)
    {
      if (!facebookViewController)
      {
        v7 = objc_alloc_init(SUUIReviewsFacebookViewController);
        v8 = self->_facebookViewController;
        self->_facebookViewController = v7;

        -[SUUIReviewsFacebookViewController setClientContext:](self->_facebookViewController, "setClientContext:", self->_clientContext);
        -[SUUIReviewsFacebookViewController setDelegate:](self->_facebookViewController, "setDelegate:", self);
        -[SUUIReviewsFacebookViewController view](self->_facebookViewController, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPage uber](self->_productPage, "uber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "colorScheme");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setColorScheme:", v11);

        -[SUUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:", self->_facebookViewController);
        facebookViewController = self->_facebookViewController;
      }
      -[SUUIReviewsFacebookViewController setFacebookLikeStatus:](facebookViewController, "setFacebookLikeStatus:");
      -[SUUIReviewsFacebookViewController view](self->_facebookViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAutoresizingMask:", 2);
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v13);

      -[SUUIProductPageReviewsViewController _defaultPageWidth](self, "_defaultPageWidth");
      objc_msgSend(v12, "sizeThatFits:");
      objc_msgSend(v12, "setFrame:", 0.0, 0.0, v14, v15);
    }
    else
    {
      if (!facebookViewController)
      {
LABEL_9:
        tableView = self->_tableView;
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageTableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v17, 100);

        v5 = v18;
        goto LABEL_10;
      }
      -[SUUIReviewsFacebookViewController removeFromParentViewController](facebookViewController, "removeFromParentViewController");
      v12 = self->_facebookViewController;
      self->_facebookViewController = 0;
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  void **p_clientContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SUUIClientContext *v14;

  v5 = (SUUIClientContext *)a3;
  p_clientContext = (void **)&self->_clientContext;
  if (self->_clientContext != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    self->_isPad = SUUIUserInterfaceIdiom(*p_clientContext) == 1;
    if (*p_clientContext)
      objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_REVIEWS_TAB"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_REVIEWS_TAB"), 0, CFSTR("ProductPage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageReviewsViewController setTitle:](self, "setTitle:", v7);

    -[SUUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_clientContext, "clientInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v10 == 0);

    -[SUUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_clientContext, "clientInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnabled:", v13 == 0);

    v5 = v14;
  }

}

- (void)setAskPermission:(BOOL)a3
{
  id v4;

  if (self->_askPermission != a3)
  {
    self->_askPermission = a3;
    -[SUUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", !self->_askPermission);

  }
}

- (void)loadView
{
  id v3;

  -[SUUIProductPageReviewsViewController _tableView](self, "_tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageReviewsViewController setView:](self, "setView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIProductPageTableView contentOffset](self->_tableView, "contentOffset");
  -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageReviewsViewController;
  -[SUUIProductPageReviewsViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIProductPageReviewsViewController reloadData](self, "reloadData");
  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageReviewsViewController;
  -[SUUIProductPageReviewsViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)setHeaderViewController:(id)a3
{
  SUUIProductPageHeaderViewController **p_headerViewController;
  void *v6;
  SUUIProductPageHeaderViewController *v7;

  p_headerViewController = &self->_headerViewController;
  v7 = (SUUIProductPageHeaderViewController *)a3;
  if (*p_headerViewController != v7)
  {
    -[SUUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", 0);
    -[SUUIProductPageHeaderViewController view](*p_headerViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SUUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:");
      if (-[SUUIProductPageReviewsViewController isViewLoaded](self, "isViewLoaded"))
        -[SUUIProductPageReviewsViewController _addHeaderView](self, "_addHeaderView");
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
    if (self->_tableView)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "productPageChildViewControllerDidLoadScrollView:", self);

      v5 = obj;
    }
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", self);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:", a3, a5->x, a5->y);
}

- (void)reviewsFacebookViewControllerDidChange:(id)a3
{
  -[SUUIProductPageTableView beginUpdates](self->_tableView, "beginUpdates", a3);
  -[SUUIProductPageTableView endUpdates](self->_tableView, "endUpdates");
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  -[SUUIProductPageTableView reloadData](self->_tableView, "reloadData", a3);
  -[SUUIProductPageTableView contentOffset](self->_tableView, "contentOffset");
  -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
}

- (void)reviewComposeViewControllerDidFinish:(id)a3
{
  SKComposeReviewViewController *composeViewController;

  if (self->_composeViewController == a3)
  {
    objc_msgSend(a3, "setDelegate:", 0);
    -[SKComposeReviewViewController dismissViewControllerAnimated:completion:](self->_composeViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    composeViewController = self->_composeViewController;
    self->_composeViewController = 0;

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 3)
  {
    -[SUUIProductPageReviewsViewController _loadMoreCellForTableView:indexPath:](self, "_loadMoreCellForTableView:indexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 != 2)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[SUUIProductPageReviewsViewController _textBoxCellForTableView:indexPath:](self, "_textBoxCellForTableView:indexPath:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a3;
  if (a4 == 2)
  {
    -[SUUIReviewList reviews](self->_reviewList, "reviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  else if (a4 == 3)
  {
    v7 = -[SUUIProductPageReviewsViewController _shouldShowLoadMoreCell](self, "_shouldShowLoadMoreCell");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  if (objc_msgSend(a5, "section") == 3)
    objc_msgSend(v6, "stopAnimating");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  NSMutableIndexSet *expandedIndexSet;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *v8;
  SUUIProductPageTableView *tableView;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  expandedIndexSet = self->_expandedIndexSet;
  if (!expandedIndexSet)
  {
    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    v8 = self->_expandedIndexSet;
    self->_expandedIndexSet = v7;

    expandedIndexSet = self->_expandedIndexSet;
  }
  -[NSMutableIndexSet addIndex:](expandedIndexSet, "addIndex:", objc_msgSend(v5, "row"));
  tableView = self->_tableView;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 100);

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  SUUIReviewsFacebookViewController *facebookViewController;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  v6 = a3;
  if (a4 == 2)
  {
    -[SUUIProductPageReviewsViewController _reviewsHeaderView](self, "_reviewsHeaderView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (v10)
    {
      objc_msgSend(v10, "frame");
      v7 = v11;
    }
    else
    {
      v7 = 0.0;
    }
    goto LABEL_12;
  }
  v7 = 0.0;
  if (a4 == 1)
  {
    if (self->_reviewList)
    {
      -[SUUIProductPageReviewsViewController _histogramViewController](self, "_histogramViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else if (!a4)
  {
    facebookViewController = self->_facebookViewController;
    if (facebookViewController)
    {
      -[SUUIReviewsFacebookViewController view](facebookViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      -[SUUIProductPageReviewsViewController _defaultPageWidth](self, "_defaultPageWidth");
      objc_msgSend(v9, "sizeThatFits:");
      v7 = v13;
LABEL_12:

    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double *v13;
  double v14;
  double *v15;
  double v16;
  double *v17;

  v5 = a4;
  if (objc_msgSend(v5, "section") == 2)
  {
    v6 = objc_msgSend(v5, "row");
    -[SUUILayoutCache layoutForIndex:](self->_layoutCache, "layoutForIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "requiresTruncation")
        && (-[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v6) & 1) == 0)
      {
        objc_msgSend(v8, "truncatedSize");
      }
      else
      {
        objc_msgSend(v8, "textSize");
      }
      if (self->_isPad)
        v11 = (double *)&kSUUITextBoxLayoutMarginTopIPad;
      else
        v11 = (double *)&kSUUITextBoxLayoutMarginTopIPhone;
      v12 = *v11;
      v13 = (double *)&kSUUITextBoxLayoutTitleHeightIPad;
      if (!self->_isPad)
        v13 = (double *)&kSUUITextBoxLayoutTitleHeightIPhone;
      v14 = v12 + *v13;
      v15 = (double *)&kSUUITextBoxLayoutTextRatingBottomPaddingIPad;
      if (!self->_isPad)
        v15 = (double *)&kSUUITextBoxLayoutTextRatingBottomPaddingIPhone;
      v16 = v14 + *v15 + 14.0 + 5.0;
      v17 = (double *)&kSUUITextBoxLayoutMarginBottomIPad;
      if (!self->_isPad)
        v17 = (double *)&kSUUITextBoxLayoutMarginBottomIPhone;
      v10 = v9 + v16 + *v17;
    }
    else
    {
      v10 = 100.0;
    }

  }
  else
  {
    v10 = 100.0;
  }

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  -[SUUIProductPage uber](self->_productPage, "uber", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorScheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (a4 == 2)
  {
    -[SUUIProductPageReviewsViewController _reviewsHeaderView](self, "_reviewsHeaderView");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    if (self->_reviewList)
    {
      -[SUUIProductPageReviewsViewController _histogramViewController](self, "_histogramViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_13;
  }
  if (a4)
    goto LABEL_12;
  -[SUUIReviewsFacebookViewController view](self->_facebookViewController, "view");
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)v12;
LABEL_13:
  objc_msgSend(v13, "setBackgroundColor:", v11);

  return v13;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  SUUIProductPage *productPage;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a4;
  productPage = self->_productPage;
  v10 = a5;
  -[SUUIProductPage uber](productPage, "uber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorScheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "setBackgroundColor:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v14);

  }
  v15 = objc_msgSend(v10, "section");

  if (v15 == 3)
  {
    objc_msgSend(v8, "startAnimating");
    objc_msgSend(v16, "contentOffset");
    -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");
  }

}

- (void)_appSupportAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SUUIProductPage item](self->_productPage, "item", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportURLString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIMetricsOpenURL(v5);

    v4 = v6;
  }

}

- (void)_sortSelectionAction:(id)a3
{
  int64_t sortOrder;
  unint64_t v5;
  SSVLoadURLOperation *loadOperation;

  sortOrder = self->_sortOrder;
  v5 = -[SUUIIPadCustomerReviewsHeaderView selectedSortIndex](self->_reviewsHeaderView, "selectedSortIndex", a3);
  if (v5 <= 3)
    sortOrder = qword_241EFBA28[v5];
  if (self->_sortOrder != sortOrder)
  {
    self->_sortOrder = sortOrder;
    -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
    -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
    loadOperation = self->_loadOperation;
    self->_loadOperation = 0;

    -[SUUIProductPageReviewsViewController _reloadData](self, "_reloadData");
  }
}

- (void)_starRatingAction:(id)a3
{
  id v4;
  int64_t v5;
  SUUIStarRatingQueue *v6;
  SUUIClientContext *clientContext;
  void *v8;
  SUUIStarRatingQueue *v9;
  SUUIStarRatingQueue *starRatingQueue;
  SUUIStarRatingQueue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SUUIStarRatingQueue *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v4 = a3;
  v5 = -[SUUIReviewsHistogramViewController personalStarRating](self->_histogramViewController, "personalStarRating");
  if (!self->_starRatingQueue)
  {
    v6 = [SUUIStarRatingQueue alloc];
    clientContext = self->_clientContext;
    -[SUUIProductPage reviewConfiguration](self->_productPage, "reviewConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SUUIStarRatingQueue initWithClientContext:reviewConfiguration:](v6, "initWithClientContext:reviewConfiguration:", clientContext, v8);
    starRatingQueue = self->_starRatingQueue;
    self->_starRatingQueue = v9;

    v11 = self->_starRatingQueue;
    -[SUUIProductPageReviewsViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStarRatingQueue setWindow:](v11, "setWindow:", v13);

  }
  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x24BDD17C8];
  -[SUUIProductPage item](self->_productPage, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v15, "itemIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = self->_starRatingQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke;
  v18[3] = &unk_2511F5770;
  objc_copyWeak(&v19, &location);
  -[SUUIStarRatingQueue setRating:forItemID:completionBlock:](v17, "setRating:forItemID:completionBlock:", v5, v16, v18);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v3;

  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke_2;
    block[3] = &unk_2511F53F8;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v3);
  }
}

void __58__SUUIProductPageReviewsViewController__starRatingAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetPersonalStarRating");

}

- (void)_versionSelectionAction:(id)a3
{
  _BOOL4 v4;
  SSVLoadURLOperation *loadOperation;

  v4 = -[SUUIReviewsHistogramViewController selectedSegmentIndex](self->_histogramViewController, "selectedSegmentIndex", a3) == 1;
  if (self->_showAllVersions != v4)
  {
    self->_showAllVersions = v4;
    -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
    -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
    loadOperation = self->_loadOperation;
    self->_loadOperation = 0;

    -[SUUIProductPageReviewsViewController _reloadData](self, "_reloadData");
  }
}

- (void)_writeAReviewAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (!self->_composeViewController)
  {
    v5 = objc_alloc(MEMORY[0x24BDEA6B8]);
    -[SUUIReviewList writeReviewURL](self->_reviewList, "writeReviewURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCompositionURL:", v6);

    objc_msgSend(v7, "setDelegate:", self);
    objc_storeStrong((id *)&self->_composeViewController, v7);
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__SUUIProductPageReviewsViewController__writeAReviewAction___block_invoke;
    v9[3] = &unk_2511F4D48;
    objc_copyWeak(&v11, &location);
    v8 = v7;
    v10 = v8;
    objc_msgSend(v8, "prepareWithCompletionBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __60__SUUIProductPageReviewsViewController__writeAReviewAction___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

  }
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
  -[SUUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[SUUIProductPageTableView _addContentSubview:atBack:](self->_tableView, "_addContentSubview:atBack:", v8, 0);
  -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SUUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[SUUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", v5);

}

- (void)_addReviewsFromResponse:(id)a3 error:(id)a4
{
  id v5;
  SSVLoadURLOperation *loadOperation;
  SUUIReviewList *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  SUUIProductPageTableView *tableView;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  SUUIReviewList *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[SUUIReviewList initWithReviewListDictionary:]([SUUIReviewList alloc], "initWithReviewListDictionary:", v5);
    -[SUUIReviewList reviews](v7, "reviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 > 0)
    {
      v28 = v9;
      v31 = v7;
      v32 = v5;
      -[SUUIReviewList reviews](self->_reviewList, "reviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      v29 = -[SUUIProductPageReviewsViewController _shouldShowLoadMoreCell](self, "_shouldShowLoadMoreCell");
      -[SUUIReviewList addReviews:](self->_reviewList, "addReviews:", v8);
      ++self->_loadedPageCount;
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v30 = v8;
      v13 = v8;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "body");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (v18)
              v20 = (const __CFString *)v18;
            else
              v20 = &stru_2511FF0C8;
            -[SUUIProductPageReviewsViewController _textLayoutRequestWithText:](self, "_textLayoutRequestWithText:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v21);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v15);
      }

      -[SUUILayoutCache populateCacheWithLayoutRequests:](self->_layoutCache, "populateCacheWithLayoutRequests:", v12);
      -[SUUIProductPageTableView beginUpdates](self->_tableView, "beginUpdates");
      v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v23 = v11 + v28;
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v24);

        ++v11;
      }
      while (v11 < v23);
      -[SUUIProductPageTableView insertRowsAtIndexPaths:withRowAnimation:](self->_tableView, "insertRowsAtIndexPaths:withRowAnimation:", v22, 5);
      if (v29 && !-[SUUIProductPageReviewsViewController _shouldShowLoadMoreCell](self, "_shouldShowLoadMoreCell"))
      {
        tableView = self->_tableView;
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIProductPageTableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v27, 5);

      }
      -[SUUIProductPageTableView endUpdates](self->_tableView, "endUpdates");

      v7 = v31;
      v5 = v32;
      v8 = v30;
    }
    -[SUUIProductPageTableView contentOffset](self->_tableView, "contentOffset");
    -[SUUIProductPageReviewsViewController _loadNextPageIfNecessaryForOffset:](self, "_loadNextPageIfNecessaryForOffset:");

  }
}

- (id)_bottomBorderColorForScheme:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "primaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (double)_defaultPageWidth
{
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;

  if (self->_isPad)
    return 630.0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    return 320.0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v2 = v6;

  return v2;
}

- (id)_histogramViewController
{
  SUUIReviewsHistogramViewController *histogramViewController;
  SUUIReviewsHistogramViewController *v4;
  SUUIReviewsHistogramViewController *v5;
  void *v6;
  uint64_t v7;
  SUUIClientContext *clientContext;
  id v9;
  void *v10;
  SUUIClientContext *v11;
  id v12;
  void *v13;
  SUUIReviewsHistogramViewController *v14;
  void *v15;
  SUUIReviewsHistogramViewController *v16;
  void *v17;
  void *v18;
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
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  histogramViewController = self->_histogramViewController;
  if (!histogramViewController)
  {
    v4 = objc_alloc_init(SUUIReviewsHistogramViewController);
    v5 = self->_histogramViewController;
    self->_histogramViewController = v4;

    -[SUUIReviewsHistogramViewController setClientContext:](self->_histogramViewController, "setClientContext:", self->_clientContext);
    -[SUUIReviewsHistogramViewController setReviewList:](self->_histogramViewController, "setReviewList:", self->_reviewList);
    -[SUUIProductPage item](self->_productPage, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "itemKind");

    if (v7 != 17)
    {
      clientContext = self->_clientContext;
      if (clientContext)
      {
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_CURRENT_VERSION"), CFSTR("ProductPage"));
      }
      else
      {
        v9 = 0;
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_CURRENT_VERSION"), 0, CFSTR("ProductPage"));
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = self->_clientContext;
      if (v11)
      {
        -[SUUIClientContext localizedStringForKey:inTable:](v11, "localizedStringForKey:inTable:", CFSTR("REVIEWS_ALL_VERSIONS"), CFSTR("ProductPage"));
      }
      else
      {
        v12 = 0;
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_ALL_VERSIONS"), 0, CFSTR("ProductPage"));
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = self->_histogramViewController;
      v31[0] = v10;
      v31[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIReviewsHistogramViewController setSegmentedControlTitles:](v14, "setSegmentedControlTitles:", v15);

      -[SUUIReviewsHistogramViewController setSelectedSegmentIndex:](self->_histogramViewController, "setSelectedSegmentIndex:", self->_showAllVersions);
      v16 = self->_histogramViewController;
      if (self->_showAllVersions)
      {
        -[SUUIReviewsHistogramViewController setVersionString:](self->_histogramViewController, "setVersionString:", 0);
      }
      else
      {
        -[SUUIProductPage item](self->_productPage, "item");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "versionString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIReviewsHistogramViewController setVersionString:](v16, "setVersionString:", v18);

      }
    }
    -[SUUIReviewsHistogramViewController view](self->_histogramViewController, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAutoresizingMask:", 2);
    -[SUUIProductPage uber](self->_productPage, "uber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorScheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColorScheme:", v21);

    -[SUUIReviewsHistogramViewController appSupportButton](self->_histogramViewController, "appSupportButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel__appSupportAction_, 64);

    -[SUUIReviewsHistogramViewController segmentedControl](self->_histogramViewController, "segmentedControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__versionSelectionAction_, 4096);

    -[SUUIReviewsHistogramViewController starRatingControl](self->_histogramViewController, "starRatingControl");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__starRatingAction_, 4096);

    -[SUUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__writeAReviewAction_, 64);

    -[SUUIReviewsHistogramViewController appSupportButton](self->_histogramViewController, "appSupportButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEnabled:", !self->_askPermission);

    -[SUUIReviewsHistogramViewController writeAReviewButton](self->_histogramViewController, "writeAReviewButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "clientIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEnabled:", v29 == 0);

    -[SUUIProductPageReviewsViewController addChildViewController:](self, "addChildViewController:", self->_histogramViewController);
    histogramViewController = self->_histogramViewController;
  }
  return histogramViewController;
}

- (id)_loadMoreCellForTableView:(id)a3 indexPath:(id)a4
{
  SUUILoadMoreCell *v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("1"), a4);
  v4 = (SUUILoadMoreCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = -[SUUILoadMoreCell initWithStyle:reuseIdentifier:]([SUUILoadMoreCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("1"));
  return v4;
}

- (void)_loadNextPageIfNecessaryForOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int64_t loadedPageCount;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  id v15;
  void *v16;
  SSVLoadURLOperation *v17;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v19;
  void *v20;
  SSVLoadURLOperation *v21;
  void *v22;
  void *v23;
  SSVLoadURLOperation *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  y = a3.y;
  x = a3.x;
  if (-[SUUIProductPageReviewsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUUIProductPageReviewsViewController view](self, "view");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isHidden"))
    {

    }
    else
    {
      objc_msgSend(v27, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (!self->_loadOperation)
        {
          loadedPageCount = self->_loadedPageCount;
          if (loadedPageCount >= 1
            && loadedPageCount < -[SUUIReviewList numberOfPages](self->_reviewList, "numberOfPages"))
          {
            -[SUUIProductPageTableView contentInset](self->_tableView, "contentInset");
            -[SUUIProductPageTableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:", x, y + v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9)
            {
              -[SUUIReviewList reviews](self->_reviewList, "reviews");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "count");

              v12 = objc_msgSend(v9, "row");
              if (v11 > v12 && v11 - v12 <= 10)
              {
                -[SUUIProductPageReviewsViewController _urlStringWithPageNumber:](self, "_urlStringWithPageNumber:", self->_loadedPageCount + 1);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_alloc(MEMORY[0x24BEB2040]);
                objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = (SSVLoadURLOperation *)objc_msgSend(v15, "initWithURL:", v16);
                loadOperation = self->_loadOperation;
                self->_loadOperation = v17;

                v19 = self->_loadOperation;
                +[SSVURLDataConsumer consumer](SUUIJSONDataConsumer, "consumer");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSVLoadURLOperation setDataConsumer:](v19, "setDataConsumer:", v20);

                -[SSVLoadURLOperation setQueuePriority:](self->_loadOperation, "setQueuePriority:", -4);
                v21 = self->_loadOperation;
                -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[SSVLoadURLOperation setStoreFrontSuffix:](v21, "setStoreFrontSuffix:", v22);

                objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = self->_loadOperation;
                v28[0] = MEMORY[0x24BDAC760];
                v28[1] = 3221225472;
                v28[2] = __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke;
                v28[3] = &unk_2511F5798;
                v29 = v23;
                v25 = v23;
                -[SSVLoadURLOperation setOutputBlock:](v24, "setOutputBlock:", v28);
                -[SUUIProductPageReviewsViewController operationQueue](self, "operationQueue");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addOperation:", self->_loadOperation);

              }
            }

          }
        }
      }
    }
  }
}

void __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke_2;
  block[3] = &unk_2511F4798;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__SUUIProductPageReviewsViewController__loadNextPageIfNecessaryForOffset___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_addReviewsFromResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_reloadData
{
  void *v3;
  id v4;
  void *v5;
  SSVLoadURLOperation *v6;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  void *v11;
  void *v12;
  SSVLoadURLOperation *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  -[SUUIProductPageReviewsViewController _urlStringWithPageNumber:](self, "_urlStringWithPageNumber:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BEB2040]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SSVLoadURLOperation *)objc_msgSend(v4, "initWithURL:", v5);
  loadOperation = self->_loadOperation;
  self->_loadOperation = v6;

  v8 = self->_loadOperation;
  +[SSVURLDataConsumer consumer](SUUIJSONDataConsumer, "consumer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setDataConsumer:](v8, "setDataConsumer:", v9);

  v10 = self->_loadOperation;
  -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVLoadURLOperation setStoreFrontSuffix:](v10, "setStoreFrontSuffix:", v11);

  objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_loadOperation;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__SUUIProductPageReviewsViewController__reloadData__block_invoke;
  v16[3] = &unk_2511F5798;
  v17 = v12;
  v14 = v12;
  -[SSVLoadURLOperation setOutputBlock:](v13, "setOutputBlock:", v16);
  -[SUUIProductPageReviewsViewController operationQueue](self, "operationQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", self->_loadOperation);

}

void __51__SUUIProductPageReviewsViewController__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __51__SUUIProductPageReviewsViewController__reloadData__block_invoke_2;
  block[3] = &unk_2511F4798;
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __51__SUUIProductPageReviewsViewController__reloadData__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setReviewListWithResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_resetPersonalStarRating
{
  -[SUUIReviewsHistogramViewController setPersonalStarRating:](self->_histogramViewController, "setPersonalStarRating:", 0);
}

- (id)_reviewsHeaderView
{
  SUUIIPadCustomerReviewsHeaderView *reviewsHeaderView;
  SUUIIPadCustomerReviewsHeaderView *v4;
  SUUIIPadCustomerReviewsHeaderView *v5;
  SUUIIPadCustomerReviewsHeaderView *v6;
  void *v7;
  void *v8;
  SUUIClientContext *clientContext;
  id v11;
  void *v12;
  SUUIClientContext *v13;
  id v14;
  void *v15;
  SUUIClientContext *v16;
  id v17;
  void *v18;
  SUUIClientContext *v19;
  id v20;
  void *v21;
  SUUIIPadCustomerReviewsHeaderView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  reviewsHeaderView = self->_reviewsHeaderView;
  if (!reviewsHeaderView)
  {
    if (!self->_isPad)
      return 0;
    v4 = -[SUUIIPadCustomerReviewsHeaderView initWithClientContext:]([SUUIIPadCustomerReviewsHeaderView alloc], "initWithClientContext:", self->_clientContext);
    v5 = self->_reviewsHeaderView;
    self->_reviewsHeaderView = v4;

    v6 = self->_reviewsHeaderView;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadCustomerReviewsHeaderView setColorScheme:](v6, "setColorScheme:", v8);

    -[SUUIIPadCustomerReviewsHeaderView addTarget:action:forControlEvents:](self->_reviewsHeaderView, "addTarget:action:forControlEvents:", self, sel__sortSelectionAction_, 4096);
    -[SUUIIPadCustomerReviewsHeaderView setAutoresizingMask:](self->_reviewsHeaderView, "setAutoresizingMask:", 2);
    clientContext = self->_clientContext;
    if (clientContext)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_CRITICAL"), CFSTR("ProductPage"));
    }
    else
    {
      v11 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_CRITICAL"), 0, CFSTR("ProductPage"));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_clientContext;
    if (v13)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v13, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_FAVORABLE"), CFSTR("ProductPage"));
    }
    else
    {
      v14 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_FAVORABLE"), 0, CFSTR("ProductPage"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = self->_clientContext;
    if (v16)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v16, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_RECENT"), CFSTR("ProductPage"));
    }
    else
    {
      v17 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_RECENT"), 0, CFSTR("ProductPage"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = self->_clientContext;
    if (v19)
    {
      -[SUUIClientContext localizedStringForKey:inTable:](v19, "localizedStringForKey:inTable:", CFSTR("REVIEWS_SORT_MOST_HELPFUL"), CFSTR("ProductPage"));
    }
    else
    {
      v20 = 0;
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REVIEWS_SORT_MOST_HELPFUL"), 0, CFSTR("ProductPage"));
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = self->_reviewsHeaderView;
    v30[0] = v21;
    v30[1] = v18;
    v30[2] = v15;
    v30[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIIPadCustomerReviewsHeaderView setSortTitles:](v22, "setSortTitles:", v23);

    -[SUUIIPadCustomerReviewsHeaderView sizeToFit](self->_reviewsHeaderView, "sizeToFit");
    -[SUUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__appSupportAction_, 64);

    -[SUUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__writeAReviewAction_, 64);

    -[SUUIIPadCustomerReviewsHeaderView appSupportButton](self->_reviewsHeaderView, "appSupportButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEnabled:", !self->_askPermission);

    -[SUUIIPadCustomerReviewsHeaderView writeAReviewButton](self->_reviewsHeaderView, "writeAReviewButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIClientContext clientInterface](self->_clientContext, "clientInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "clientIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setEnabled:", v29 == 0);

    reviewsHeaderView = self->_reviewsHeaderView;
  }
  return reviewsHeaderView;
}

- (void)_setReviewListWithResponse:(id)a3 error:(id)a4
{
  id v5;
  SSVLoadURLOperation *loadOperation;
  SUUIReviewList *v7;
  SUUIReviewList *reviewList;
  SUUILayoutCache *layoutCache;
  SUUILayoutCache *v10;
  SUUILayoutCache *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  SUUIReviewsHistogramViewController *histogramViewController;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v5;
    v7 = -[SUUIReviewList initWithReviewListDictionary:]([SUUIReviewList alloc], "initWithReviewListDictionary:", v5);
    reviewList = self->_reviewList;
    self->_reviewList = v7;

    self->_loadedPageCount = 1;
    -[SUUILayoutCache setDelegate:](self->_layoutCache, "setDelegate:", 0);
    layoutCache = self->_layoutCache;
    self->_layoutCache = 0;

    v10 = objc_alloc_init(SUUILayoutCache);
    v11 = self->_layoutCache;
    self->_layoutCache = v10;

    -[SUUILayoutCache setDelegate:](self->_layoutCache, "setDelegate:", self);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SUUIReviewList reviews](self->_reviewList, "reviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "body");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
            v20 = (const __CFString *)v18;
          else
            v20 = &stru_2511FF0C8;
          -[SUUIProductPageReviewsViewController _textLayoutRequestWithText:](self, "_textLayoutRequestWithText:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    -[SUUILayoutCache populateCacheWithLayoutRequests:](self->_layoutCache, "populateCacheWithLayoutRequests:", v12);
    -[SUUIReviewsHistogramViewController setReviewList:](self->_histogramViewController, "setReviewList:", self->_reviewList);
    histogramViewController = self->_histogramViewController;
    if (self->_showAllVersions)
    {
      -[SUUIReviewsHistogramViewController setVersionString:](self->_histogramViewController, "setVersionString:", 0);
    }
    else
    {
      -[SUUIProductPage item](self->_productPage, "item");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "versionString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIReviewsHistogramViewController setVersionString:](histogramViewController, "setVersionString:", v24);

    }
    -[SUUIProductPageTableView reloadData](self->_tableView, "reloadData");

    v5 = v25;
  }

}

- (BOOL)_shouldShowLoadMoreCell
{
  int64_t loadedPageCount;

  loadedPageCount = self->_loadedPageCount;
  return !loadedPageCount || loadedPageCount < -[SUUIReviewList numberOfPages](self->_reviewList, "numberOfPages");
}

- (id)_tableView
{
  SUUIProductPageTableView *tableView;
  SUUIProductPageTableView *v4;
  SUUIProductPageTableView *v5;
  SUUIProductPageTableView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc_init(SUUIProductPageTableView);
    v5 = self->_tableView;
    self->_tableView = v4;

    v6 = self->_tableView;
    -[SUUIProductPage uber](self->_productPage, "uber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SUUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v10);

    }
    -[SUUIProductPageTableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[SUUIProductPageTableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[SUUIProductPageTableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[SUUIProductPageTableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    if (self->_headerViewController)
      -[SUUIProductPageReviewsViewController _addHeaderView](self, "_addHeaderView");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", self);

    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_textBoxCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  SUUITextBoxTableViewCell *v7;
  SUUITextBoxTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIClientContext *clientContext;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  float v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("0"));
  v7 = (SUUITextBoxTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    -[SUUITextBoxTableViewCell textBoxView](v7, "textBoxView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[SUUITextBoxTableViewCell initWithStyle:reuseIdentifier:]([SUUITextBoxTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("0"));
    -[SUUITextBoxTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 0);
    -[SUUIProductPage uber](self->_productPage, "uber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorScheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIProductPageReviewsViewController _bottomBorderColorForScheme:](self, "_bottomBorderColorForScheme:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUITableViewCell setBottomBorderColor:](v8, "setBottomBorderColor:", v12);

    -[SUUITextBoxTableViewCell textBoxView](v8, "textBoxView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColorScheme:", v11);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("MORE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("MORE_BUTTON"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMoreButtonTitle:", v14);

  }
  v15 = objc_msgSend(v6, "row");

  -[SUUILayoutCache layoutForIndex:](self->_layoutCache, "layoutForIndex:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SUUIReviewList reviews](self->_reviewList, "reviews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setFixedWidthTextFrame:", objc_msgSend(v16, "textFrame"));
    if (-[NSMutableIndexSet containsIndex:](self->_expandedIndexSet, "containsIndex:", v15))
      v19 = 0;
    else
      v19 = 5;
    objc_msgSend(v9, "setNumberOfVisibleLines:", v19);
    objc_msgSend(v18, "rating");
    objc_msgSend(v9, "setRating:", (float)(v20 / 5.0));
    objc_msgSend(v18, "formattedBylineWithClientContext:", self->_clientContext);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRatingText:", v21);

    v22 = (void *)MEMORY[0x24BDD17C8];
    v23 = v15 + 1;
    objc_msgSend(v18, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%ld. %@"), v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v25);

  }
  else
  {
    objc_msgSend(v9, "reset");
  }

  return v8;
}

- (id)_textLayoutRequestWithText:(id)a3
{
  id v4;
  SUUITextLayoutRequest *v5;
  double v6;

  v4 = a3;
  v5 = objc_alloc_init(SUUITextLayoutRequest);
  -[SUUITextLayoutRequest setNumberOfLines:](v5, "setNumberOfLines:", 5);
  -[SUUITextLayoutRequest setText:](v5, "setText:", v4);

  -[SUUIProductPageReviewsViewController _defaultPageWidth](self, "_defaultPageWidth");
  -[SUUITextLayoutRequest setWidth:](v5, "setWidth:", v6 + -30.0);
  return v5;
}

- (id)_urlStringWithPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 showAllVersions;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;

  -[SUUIProductPage reviewConfiguration](self->_productPage, "reviewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[SUUIProductPage item](self->_productPage, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    showAllVersions = self->_showAllVersions;
    objc_msgSend(v7, "reviewsURLString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!showAllVersions)
    {
      objc_msgSend(v9, "stringByAppendingString:", CFSTR("&appVersion=current"));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }

    if (a3)
      goto LABEL_11;
    v12 = 0;
LABEL_13:
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("&sort-key=%ld"), self->_sortOrder, v16, v17);
    goto LABEL_14;
  }
  if (self->_showAllVersions)
    objc_msgSend(v5, "allVersionsURLString");
  else
    objc_msgSend(v5, "currentVersionURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pageNumberQueryParameter");
  v13 = objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)v13;
  if (!a3)
    goto LABEL_13;
  if (!v13)
LABEL_11:
    v12 = CFSTR("page-number");
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("&sort-key=%ld&%@=%ld"), self->_sortOrder, v12, a3);
LABEL_14:
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)askPermission
{
  return self->_askPermission;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  return (SUUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (SUUIProductPage)productPage
{
  return self->_productPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_starRatingQueue, 0);
  objc_storeStrong((id *)&self->_reviewsHeaderView, 0);
  objc_storeStrong((id *)&self->_reviewList, 0);
  objc_storeStrong((id *)&self->_productPage, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
  objc_storeStrong((id *)&self->_histogramViewController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_facebookViewController, 0);
  objc_storeStrong((id *)&self->_expandedIndexSet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
