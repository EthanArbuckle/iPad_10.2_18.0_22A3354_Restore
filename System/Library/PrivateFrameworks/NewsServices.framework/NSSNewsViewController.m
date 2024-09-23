@implementation NSSNewsViewController

+ (BOOL)canOpenURL:(id)a3
{
  return objc_msgSend(a3, "fc_isNewsArticleURL");
}

- (NSSNewsViewController)initWithArticleID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSSNewsViewController *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NSSNewsViewController initWithArticleIDs:](self, "initWithArticleIDs:", v6, v9, v10);
  return v7;
}

- (NSSNewsViewController)initWithArticleIDs:(id)a3
{
  id v5;
  NSSNewsViewController *v6;
  NSSNewsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSSNewsViewController;
  v6 = -[NSSNewsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_articleIDs, a3);
    v7->_linkPreviewing = 0;
    -[NSSNewsViewController requestRemoteViewController](v7, "requestRemoteViewController");
  }

  return v7;
}

- (NSSNewsViewController)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSSNewsViewController *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[NSSNewsViewController canOpenURL:](NSSNewsViewController, "canOpenURL:", v4))
  {
    objc_msgSend(v4, "fc_NewsArticleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[NSSNewsViewController initWithArticleIDs:](self, "initWithArticleIDs:", v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isViewLoaded");

    if (v5)
    {
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willMoveToParentViewController:", 0);

    -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromParentViewController");

  }
  v10.receiver = self;
  v10.super_class = (Class)NSSNewsViewController;
  -[NSSNewsViewController dealloc](&v10, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSSNewsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)NSSNewsViewController;
  -[NSSNewsViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[NSSNewsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parentViewController");
    v8 = (NSSNewsViewController *)objc_claimAutoreleasedReturnValue();

    if (v8 != self)
    {
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSNewsViewController addChildViewController:](self, "addChildViewController:", v9);

      -[NSSNewsViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v12);

      -[NSSNewsViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);

      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "didMoveToParentViewController:", self);

    }
  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NSSNewsViewController;
  -[NSSNewsViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSSNewsViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBounds:", v6, v8, v10, v12);

  }
}

- (void)setLinkPreviewing:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  self->_linkPreviewing = a3;
  -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remoteViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceViewControllerProxy");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "articleViewServiceProviderShouldPresentForLinkPreviewing:", v3);
    }
  }
}

- (void)requestRemoteViewController
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;
  id v27;

  -[NSSNewsViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
  v3 = *MEMORY[0x24BE6D1B8];
  v27 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v3, &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  if (v4)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x24BDF7140];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __52__NSSNewsViewController_requestRemoteViewController__block_invoke;
    v24[3] = &unk_24E59E5C8;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v6, "instantiateWithExtension:completion:", v4, v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSNewsViewController setRemoteViewContainerViewController:](self, "setRemoteViewContainerViewController:", v7);

    if (-[NSSNewsViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSNewsViewController addChildViewController:](self, "addChildViewController:", v8);

      -[NSSNewsViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v11);

      -[NSSNewsViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

      -[NSSNewsViewController remoteViewContainerViewController](self, "remoteViewContainerViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didMoveToParentViewController:", self);

    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

void __52__NSSNewsViewController_requestRemoteViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setupRemoteViewController:", v6);

}

- (void)setupRemoteViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSSNewsViewController articleIDs](self, "articleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v4)
  {
    objc_msgSend(v7, "serviceViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "articleViewServiceProviderShouldPresentForLinkPreviewing:", -[NSSNewsViewController isLinkPreviewing](self, "isLinkPreviewing"));
    -[NSSNewsViewController articleIDs](self, "articleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "articleViewServiceProviderShouldLoadArticlesForArticleIDs:", v6);

  }
  -[NSSNewsViewController _endDelayingPresentation](self, "_endDelayingPresentation");

}

- (BOOL)isLinkPreviewing
{
  return self->_linkPreviewing;
}

- (NSArray)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (_UIResilientRemoteViewContainerViewController)remoteViewContainerViewController
{
  return self->_remoteViewContainerViewController;
}

- (void)setRemoteViewContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewContainerViewController, 0);
  objc_storeStrong((id *)&self->_articleIDs, 0);
}

@end
