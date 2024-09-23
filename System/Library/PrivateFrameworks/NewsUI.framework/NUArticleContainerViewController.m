@implementation NUArticleContainerViewController

- (NUArticleContainerViewController)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("Unavailable"), CFSTR("Must use initWithPagingFactory:interstitialAdManager:router:"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NUArticleContainerViewController)initWithPagingFactory:(id)a3 router:(id)a4
{
  id v7;
  id v8;
  NUArticleContainerViewController *v9;
  NUArticleContainerViewController *v10;
  NUPageViewController *v11;
  NUPageViewController *pageViewController;
  NUArticleContainerTitleView *v13;
  NUArticleContainerTitleView *v14;
  void *v15;
  NUArticleNavigationController *v16;
  NUArticleNavigationController *navigationController;
  NUArticleBarButtonItemManager *v18;
  NUArticleBarButtonItemManager *barButtonItemManager;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NUArticleContainerViewController;
  v9 = -[NUArticleContainerViewController init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_linkPreviewing = 0;
    objc_storeStrong((id *)&v9->_pagingFactory, a3);
    objc_storeStrong((id *)&v10->_router, a4);
    v11 = -[NUPageViewController initWithNibName:bundle:]([NUPageViewController alloc], "initWithNibName:bundle:", 0, 0);
    pageViewController = v10->_pageViewController;
    v10->_pageViewController = v11;

    -[NUPageViewController setDelegate:](v10->_pageViewController, "setDelegate:", v10);
    -[NUPageViewController setDataSource:](v10->_pageViewController, "setDataSource:", v10);
    v13 = [NUArticleContainerTitleView alloc];
    v14 = -[NUArticleContainerTitleView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[NUPageViewController navigationItem](v10->_pageViewController, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitleView:", v14);

    v16 = -[NUArticleNavigationController initWithRootViewController:]([NUArticleNavigationController alloc], "initWithRootViewController:", v10->_pageViewController);
    navigationController = v10->_navigationController;
    v10->_navigationController = v16;

    v18 = -[NUArticleBarButtonItemManager initWithViewController:]([NUArticleBarButtonItemManager alloc], "initWithViewController:", v10->_pageViewController);
    barButtonItemManager = v10->_barButtonItemManager;
    v10->_barButtonItemManager = v18;

    -[NUArticleBarButtonItemManager setDelegate:](v10->_barButtonItemManager, "setDelegate:", v10);
  }

  return v10;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NUArticleContainerViewController;
  -[NUArticleContainerViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController addChildViewController:](self, "addChildViewController:", v3);

  -[NUArticleContainerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", self);

  -[NUArticleContainerViewController pageViewController](self, "pageViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NUArticleContainerViewController pageViewController](self, "pageViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoresizingMask:", 2);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.850980392, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleContainerViewController pageViewController](self, "pageViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v12);

  }
}

- (void)viewDidLayoutSubviews
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
  void *v14;
  void *v15;
  double Height;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  CGRect v23;

  v22.receiver = self;
  v22.super_class = (Class)NUArticleContainerViewController;
  -[NUArticleContainerViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[NUArticleContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v5, v7, v9, v11);

  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  Height = CGRectGetHeight(v23);

  -[NUArticleContainerViewController pageViewController](self, "pageViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, 180.0, Height);

  -[NUArticleContainerViewController barButtonItemManager](self, "barButtonItemManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeBarButtonItemsForTraitCollection:", v21);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUArticleContainerViewController;
  -[NUArticleContainerViewController traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[NUArticleContainerViewController barButtonItemManager](self, "barButtonItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "positionBarButtonItemsForTraitCollection:", v5);

}

- (void)didReceiveMemoryWarning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NUArticleContainerViewController *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUArticleContainerViewController;
  -[NUArticleContainerViewController didReceiveMemoryWarning](&v11, sel_didReceiveMemoryWarning);
  -[NUArticleContainerViewController pageViewController](self, "pageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleContainerViewController paging](self, "paging");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__NUArticleContainerViewController_didReceiveMemoryWarning__block_invoke;
  v8[3] = &unk_24D5A1D60;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "forEachPage:", v8);

}

void __59__NUArticleContainerViewController_didReceiveMemoryWarning__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 40), "paging");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageForIdentifier:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v13)
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "paging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageBeforeForIdentifier:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v13)
  {

    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "paging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pageIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pageAfterIdentifier:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v13)
LABEL_5:
    objc_msgSend(v13, "unprepare");
LABEL_9:

}

- (void)loadWithArticleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[NUArticleContainerViewController pagingFactory](self, "pagingFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createPagingForArticleIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleContainerViewController setPaging:](self, "setPaging:", v6);
  -[NUArticleContainerViewController paging](self, "paging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstPage");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NUArticleContainerViewController paging](self, "paging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstPage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setLoadingDelegate:", self);
    -[NUArticleContainerViewController pageViewController](self, "pageViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVisibleViewController:", v10);

    -[NUArticleContainerViewController styleNavigationForPage:](self, "styleNavigationForPage:", v12);
  }

}

- (void)setLinkPreviewing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_linkPreviewing = a3;
  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:", v3);

  -[NUArticleContainerViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNavigationBarHidden:", v3);

}

- (void)pageViewController:(id)a3 didChangeVisibleViewControllerFromViewController:(id)a4 direction:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "visibleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NUArticleContainerViewController paging](self, "paging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pageIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleContainerViewController styleNavigationForPage:](self, "styleNavigationForPage:", v9);
}

- (void)pageViewController:(id)a3 viewController:(id)a4 changedVisibilityFactor:(double)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a5 > 0.5)
  {
    -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v10 = v6;
      -[NUArticleContainerViewController paging](self, "paging");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pageIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pageForIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        -[NUArticleContainerViewController styleNavigationForPage:](self, "styleNavigationForPage:", v9);

      v6 = v10;
    }

  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v15;

  -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NUArticleContainerViewController paging](self, "paging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageBeforeForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NUArticleContainerViewController paging](self, "paging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pageBeforeForIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __90__NUArticleContainerViewController_pageViewController_viewControllerBeforeViewController___block_invoke_3;
        block[3] = &unk_24D5A1D88;
        v15 = v11;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
      objc_msgSend(v8, "viewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __90__NUArticleContainerViewController_pageViewController_viewControllerBeforeViewController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepare");
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v15;

  -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NUArticleContainerViewController paging](self, "paging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pageIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pageAfterIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NUArticleContainerViewController paging](self, "paging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pageAfterIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __89__NUArticleContainerViewController_pageViewController_viewControllerAfterViewController___block_invoke_3;
        block[3] = &unk_24D5A1D88;
        v15 = v11;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
      objc_msgSend(v8, "viewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __89__NUArticleContainerViewController_pageViewController_viewControllerAfterViewController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepare");
}

- (void)articleBarButtonItemManager:(id)a3 performDoneActionForBarButtonItem:(id)a4
{
  id v5;

  -[NUArticleContainerViewController delegate](self, "delegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "articleContainerViewControllerDidFinishPresenting:", self);

}

- (void)articleBarButtonItemManager:(id)a3 performNextActionForBarButtonItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;

  -[NUArticleContainerViewController pageViewController](self, "pageViewController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NUArticleContainerViewController paging](self, "paging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pageIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pageAfterIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "pageNextAction");
    if (v10 == 2)
    {
      -[NUArticleContainerViewController router](self, "router");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "routeToNewsAppForYouFeed");
      goto LABEL_6;
    }
    if (v10 <= 1)
    {
      -[NUArticleContainerViewController pageViewController](self, "pageViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyboardOrActionSwitchToNextViewController");
LABEL_6:

    }
  }

}

- (void)articleBarButtonItemManager:(id)a3 performShareActionForBarButtonItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NUArticleContainerViewController *v15;

  v5 = a4;
  -[NUArticleContainerViewController pageViewController](self, "pageViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visibleViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleContainerViewController viewControllerPageableForViewController:](self, "viewControllerPageableForViewController:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUArticleContainerViewController paging](self, "paging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pageForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__NUArticleContainerViewController_articleBarButtonItemManager_performShareActionForBarButtonItem___block_invoke;
  v13[3] = &unk_24D5A1DB0;
  v14 = v5;
  v15 = self;
  v12 = v5;
  objc_msgSend(v11, "activityProvider:", v13);

}

void __99__NUArticleContainerViewController_articleBarButtonItemManager_performShareActionForBarButtonItem___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDF67E0];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "activityItemSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, v7);
  v9 = *MEMORY[0x24BDF74D8];
  v15[0] = *MEMORY[0x24BDF7468];
  v15[1] = v9;
  v10 = *MEMORY[0x24BDF74E0];
  v15[2] = *MEMORY[0x24BDF7478];
  v15[3] = v10;
  v11 = *MEMORY[0x24BDF74C8];
  v15[4] = *MEMORY[0x24BDF74B0];
  v15[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExcludedActivityTypes:", v12);

  objc_msgSend(v8, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBarButtonItem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)articleBarButtonItemManagerDidLayoutBarButtonItems:(id)a3
{
  id v4;

  if (-[NUArticleContainerViewController isLinkPreviewing](self, "isLinkPreviewing", a3))
  {
    -[NUArticleContainerViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToolbarHidden:", 1);

  }
}

- (void)enableNavigation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NUArticleContainerViewController pageViewController](self, "pageViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPagingEnabled:", v3);

}

- (void)loadingWillStart
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NUArticleContainerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[NUArticleContainerViewController paging](self, "paging");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstPage");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[NUArticleContainerViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "articleContainerViewController:willLoadFirstPageWithIdentifier:", self, v7);

  }
}

- (void)loadingDidFinishWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NUArticleContainerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleContainerViewController paging](self, "paging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstPage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NUArticleContainerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "articleContainerViewController:didLoadFirstPageWithIdentifier:error:", self, v9, v10);

  }
}

- (void)styleNavigationForPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[NUArticleContainerViewController pageViewController](self, "pageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_2;
    v14[3] = &unk_24D5A1DD8;
    objc_copyWeak(&v16, &location);
    v15 = v7;
    objc_msgSend(v4, "pageStyling:", v14);
    -[NUArticleContainerViewController paging](self, "paging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pageAfterIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_4;
      v12[3] = &unk_24D5A1E00;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v11, "pageStyling:", v12);
      objc_destroyWeak(&v13);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "applyPageStyle:", v13);
    if ((objc_msgSend(v5, "isLinkPreviewing") & 1) == 0)
    {
      if (objc_msgSend(v13, "hideToolbar")
        && (objc_msgSend(v5, "navigationController"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "isToolbarHidden"),
            v6,
            (v7 & 1) == 0))
      {
        objc_msgSend(v5, "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = 1;
      }
      else
      {
        if ((objc_msgSend(v13, "hideToolbar") & 1) != 0)
          goto LABEL_10;
        objc_msgSend(v5, "navigationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isToolbarHidden");

        if (!v9)
          goto LABEL_10;
        objc_msgSend(v5, "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = 0;
      }
      objc_msgSend(v10, "setToolbarHidden:animated:", v12, 1);

    }
LABEL_10:

  }
}

void __59__NUArticleContainerViewController_styleNavigationForPage___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "barButtonItemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applyPageStyleToNextBarButtonItem:", v3);

}

- (id)viewControllerPageableForViewController:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "conformsToProtocol:", &unk_254E6ADD8))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (NUArticleContainerViewControllerDelegate)delegate
{
  return (NUArticleContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isLinkPreviewing
{
  return self->_linkPreviewing;
}

- (NUArticleNavigationController)navigationController
{
  return self->_navigationController;
}

- (NUPageViewController)pageViewController
{
  return self->_pageViewController;
}

- (NUPagingFactory)pagingFactory
{
  return self->_pagingFactory;
}

- (NUPaging)paging
{
  return self->_paging;
}

- (void)setPaging:(id)a3
{
  objc_storeStrong((id *)&self->_paging, a3);
}

- (NUArticleBarButtonItemManager)barButtonItemManager
{
  return self->_barButtonItemManager;
}

- (NURouter)router
{
  return self->_router;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_barButtonItemManager, 0);
  objc_storeStrong((id *)&self->_paging, 0);
  objc_storeStrong((id *)&self->_pagingFactory, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
