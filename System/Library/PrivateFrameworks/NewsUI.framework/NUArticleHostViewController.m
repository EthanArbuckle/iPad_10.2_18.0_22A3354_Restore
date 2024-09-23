@implementation NUArticleHostViewController

- (NUArticleHostViewController)initWithArticle:(id)a3 issue:(id)a4 articleViewControllerFactory:(id)a5 settings:(id)a6 errorMessageFactory:(id)a7 analyticsReporting:(id)a8 contentSizeManager:(id)a9 relativePriority:(int64_t)a10
{
  id v17;
  id v18;
  NUArticleHostViewController *v19;
  NUArticleHostViewController *v20;
  uint64_t v21;
  FCObservable *articleViewStyler;
  void *v23;
  uint64_t v24;
  NSString *pageIdentifier;
  uint64_t v26;
  TFMultiDelegate *multiLoadingDelegate;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v17 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v34.receiver = self;
  v34.super_class = (Class)NUArticleHostViewController;
  v19 = -[NUArticleHostViewController init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_article, a3);
    objc_storeStrong((id *)&v20->_issue, a4);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CC80]), "initWithValue:", 0);
    articleViewStyler = v20->_articleViewStyler;
    v20->_articleViewStyler = (FCObservable *)v21;

    objc_storeStrong((id *)&v20->_articleViewControllerFactory, a5);
    objc_storeStrong((id *)&v20->_settings, a6);
    objc_storeStrong((id *)&v20->_errorMessageFactory, a7);
    objc_msgSend(v17, "articleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    pageIdentifier = v20->_pageIdentifier;
    v20->_pageIdentifier = (NSString *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BEB4798]), "initWithDelegate:delegateProtocol:", v20, &unk_254E61898);
    multiLoadingDelegate = v20->_multiLoadingDelegate;
    v20->_multiLoadingDelegate = (TFMultiDelegate *)v26;

    objc_storeStrong((id *)&v20->_analyticsReporting, a8);
    objc_storeStrong((id *)&v20->_contentSizeManager, a9);
    v20->_relativePriority = a10;
  }

  return v20;
}

- (NUArticleHostViewController)initWithArticle:(id)a3 articleViewControllerFactory:(id)a4 settings:(id)a5 errorMessageFactory:(id)a6 contentSizeManager:(id)a7
{
  return -[NUArticleHostViewController initWithArticle:issue:articleViewControllerFactory:settings:errorMessageFactory:analyticsReporting:contentSizeManager:relativePriority:](self, "initWithArticle:issue:articleViewControllerFactory:settings:errorMessageFactory:analyticsReporting:contentSizeManager:relativePriority:", a3, 0, a4, a5, a6, 0, a7, 0);
}

- (NSHashTable)loadingListeners
{
  return -[NUArticleViewControllerFactory loadingListeners](self->_articleViewControllerFactory, "loadingListeners");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NUActivityIndicatorLoadingView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)NUArticleHostViewController;
  -[NUArticleHostViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[NUArticleHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[NUArticleHostViewController article](self, "article");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewController loadingTextForArticle:](self, "loadingTextForArticle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NUActivityIndicatorLoadingView initWithText:activityIndicatorStyle:]([NUActivityIndicatorLoadingView alloc], "initWithText:activityIndicatorStyle:", v7, 100);
  -[NUArticleHostViewController setLoadingView:](self, "setLoadingView:", v8);

  -[NUArticleHostViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewController loadingView](self, "loadingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[NUArticleHostViewController loadArticleAndEmbedArticleViewController](self, "loadArticleAndEmbedArticleViewController");
  v14[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)-[NUArticleHostViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v11, &__block_literal_global_7);

}

uint64_t __42__NUArticleHostViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateContentScaleAndSize");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUArticleHostViewController;
  -[NUArticleHostViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[NUArticleHostViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFocusEffect:", 0);

  -[NUArticleHostViewController updateContentScaleAndSize](self, "updateContentScaleAndSize");
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NUArticleHostViewController;
  -[NUArticleHostViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[NUArticleHostViewController additionalSafeAreaInsets](self, "additionalSafeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdditionalSafeAreaInsets:", v4, v6, v8, v10);

}

- (BOOL)becomeFirstResponder
{
  void *v3;
  objc_super v5;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)NUArticleHostViewController;
  return -[NUArticleHostViewController becomeFirstResponder](&v5, sel_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  void *v3;
  objc_super v5;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)NUArticleHostViewController;
  return -[NUArticleHostViewController resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (UIResponder)responder
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "responder");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return (UIResponder *)v6;
}

- (NSString)contentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[NUArticleHostViewController article](self, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUArticleHostViewController contentSizeManager](self, "contentSizeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleHostViewController article](self, "article");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSizeCategoryForArticle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferredContentSizeCategory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v9 = v8;
    v8 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
LABEL_7:

  return (NSString *)v10;
}

- (void)setContentSizeCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a3;
  -[NUArticleHostViewController article](self, "article");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUArticleHostViewController contentSizeManager](self, "contentSizeManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleHostViewController article](self, "article");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "headline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateContentSizeCategory:forArticle:", v12, v8);

  }
  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentSizeCategory:", v12);

  }
}

- (int64_t)contentScale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[NUArticleHostViewController article](self, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 4;
  -[NUArticleHostViewController contentSizeManager](self, "contentSizeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewController article](self, "article");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "contentScaleForArticle:", v7);

  if (v8)
    return v8;
  else
    return 4;
}

- (void)setContentScale:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;

  -[NUArticleHostViewController article](self, "article");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUArticleHostViewController contentSizeManager](self, "contentSizeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticleHostViewController article](self, "article");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateContentScale:forArticle:", a3, v9);

  }
  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentScale:", a3);

  }
}

- (void)updateContentScaleAndSize
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentScale:", -[NUArticleHostViewController contentScale](self, "contentScale"));
    -[NUArticleHostViewController contentSizeCategory](self, "contentSizeCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentSizeCategory:", v5);

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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NUArticleHostViewController;
  -[NUArticleHostViewController viewDidLayoutSubviews](&v24, sel_viewDidLayoutSubviews);
  -[NUArticleHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[NUArticleHostViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[NUArticleHostViewController loadingView](self, "loadingView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

}

- (NSString)selectedText
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FCDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setLoadingDelegate:(id)a3
{
  void *v4;
  id WeakRetained;
  id obj;

  obj = a3;
  -[NUArticleHostViewController multiLoadingDelegate](self, "multiLoadingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self = (NUArticleHostViewController *)((char *)self + 976);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  objc_msgSend(v4, "replaceDelegate:withDelegate:", WeakRetained, obj);

  objc_storeWeak((id *)&self->super.super.super.isa, obj);
}

- (void)loadingWillStart
{
  void *v2;
  id v3;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)loadingDidStart
{
  id v2;

  -[NUArticleHostViewController loadingView](self, "loadingView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadingViewStartAnimating");

}

- (void)loadingDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NUErrorView *v9;
  void *v10;
  void *v11;
  double MaxY;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  if (v4)
  {
    -[NUArticleHostViewController loadingView](self, "loadingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadingViewStopAnimating");

    -[NUArticleHostViewController loadingView](self, "loadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[NUArticleHostViewController setLoadingView:](self, "setLoadingView:", 0);
    -[NUArticleHostViewController errorMessageFactory](self, "errorMessageFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorMessageForArticleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[NUErrorView initWithErrorMessage:]([NUErrorView alloc], "initWithErrorMessage:", v8);
      -[NUErrorView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
      -[NUArticleHostViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      MaxY = CGRectGetMaxY(v26);
      -[NUArticleHostViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toolbar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      CGRectGetHeight(v27);

      -[NUArticleHostViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      -[NUErrorView setFrame:](v9, "setFrame:", v16 + 0.0, MaxY + v17);

      -[NUArticleHostViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v9);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    v19 = (void *)MEMORY[0x24BDF6F90];
    v20 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke;
    v23[3] = &unk_24D5A2B30;
    objc_copyWeak(&v24, &location);
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke_3;
    v21[3] = &unk_24D5A2D10;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v19, "animateWithDuration:animations:completion:", v23, v21, 0.15);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

void __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v2 = WeakRetained;
    objc_msgSend(v2, "contentTypeViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    objc_msgSend(v2, "loadingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAlpha:", 0.0);
    WeakRetained = v6;
  }

}

void __57__NUArticleHostViewController_loadingDidFinishWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v2 = WeakRetained;
    objc_msgSend(v2, "contentTypeViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 1.0);

    objc_msgSend(v2, "loadingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loadingViewStopAnimating");

    objc_msgSend(v2, "loadingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(v2, "setLoadingView:", 0);
    WeakRetained = v7;
  }

}

- (void)loadingDidUpdateProgress:(double)a3
{
  void *v5;
  char v6;
  id v7;

  -[NUArticleHostViewController loadingView](self, "loadingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NUArticleHostViewController loadingView](self, "loadingView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadingViewUpdateProgress:", a3);

  }
}

- (UIScrollView)scrollView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_254E69C90);

  if (v4)
  {
    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UIScrollView *)v6;
}

- (void)articleViewController:(id)a3 didScrollToPosition:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NUArticleHostViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[NUArticleHostViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleHostViewController:didScrollToPosition:", self, v8);

  }
}

- (void)articleViewControllerDidScrollToBottomOfPrimaryContent:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[NUArticleHostViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[NUArticleHostViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "articleHostViewControllerDidScrollToBottomOfPrimaryContent:", self);

  }
}

- (void)reportEvent:(id)a3
{
  id v4;
  NUContentAnalyticsEvent *v5;
  id v6;

  v4 = a3;
  -[NUArticleHostViewController analyticsReporting](self, "analyticsReporting");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NUContentAnalyticsEvent initWithEvent:]([NUContentAnalyticsEvent alloc], "initWithEvent:", v4);

  objc_msgSend(v6, "reportEvent:", v5);
}

- (void)setArticleContext:(id)a3
{
  NUArticleContext *v4;
  NUArticleContext *articleContext;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (NUArticleContext *)objc_msgSend(v8, "copy");
  articleContext = self->_articleContext;
  self->_articleContext = v4;

  objc_opt_class();
  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FCDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "setArticleContext:", v8);

}

- (void)loadArticleAndEmbedArticleViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willMoveToParentViewController:", 0);

    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[NUArticleHostViewController contentTypeViewController](self, "contentTypeViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromParentViewController");

  }
  -[NUArticleHostViewController loadingView](self, "loadingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadingViewStartAnimating");

  objc_initWeak(&location, self);
  -[NUArticleHostViewController article](self, "article");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke;
  v10[3] = &unk_24D5A2D60;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "performBlockWhenFullyLoaded:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
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
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, void *);
  void *v54;
  id v55;
  id location;
  _QWORD v57[6];
  _QWORD v58[6];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = v9;
    if (v6)
    {
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_3;
      v58[3] = &unk_24D5A1D30;
      v58[4] = v9;
      v58[5] = v6;
      __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_3((uint64_t)v58);
    }
    else
    {
      objc_msgSend(v5, "headline");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v5, "headline");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "contentType");

        switch(v13)
        {
          case 0:
          case 1:
          case 3:
            v14 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v5, "headline");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "nu_errorArticleContentTypeUnsupported:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "multiLoadingDelegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "delegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "loadingDidFinishWithError:", v16);

            goto LABEL_11;
          case 2:
            objc_msgSend(v10, "articleViewControllerFactory");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "issue");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "articleContext");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "createArticleViewControllerWithArticle:issue:context:relativePriority:articleHostViewController:", v5, v20, v21, objc_msgSend(v10, "relativePriority"), v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "setContentTypeViewController:", v16);
            objc_msgSend(v16, "setDelegate:", v10);
            objc_msgSend(v10, "multiLoadingDelegate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setLoadingDelegate:", v23);

            objc_msgSend(v10, "contentSizeCategory");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setContentSizeCategory:", v24);

            objc_msgSend(v16, "setContentScale:", objc_msgSend(v10, "contentScale"));
            objc_msgSend(v16, "setAnalyticsReporting:", v10);
            objc_msgSend(v10, "articleViewStyler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(&location, v25);

            objc_msgSend(v16, "articleViewStyler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = MEMORY[0x24BDAC760];
            v52 = 3221225472;
            v53 = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_5;
            v54 = &unk_24D5A2D38;
            objc_copyWeak(&v55, &location);
            v27 = (id)objc_msgSend(v26, "observe:", &v51);

            objc_msgSend(v10, "articleViewStyler", v51, v52, v53, v54);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "articleViewStyler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "value");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "next:", v30);

            objc_msgSend(v16, "updateScrollPositionFromContext");
            objc_destroyWeak(&v55);
            objc_destroyWeak(&location);
LABEL_11:

            break;
          default:
            break;
        }
        objc_msgSend(v10, "contentTypeViewController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v10, "contentTypeViewController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addChildViewController:", v32);

          objc_msgSend(v10, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "bounds");
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v41 = v40;
          objc_msgSend(v10, "contentTypeViewController");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "view");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);

          objc_msgSend(v10, "loadingView");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "superview");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "view");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "contentTypeViewController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "view");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            objc_msgSend(v10, "loadingView");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "insertSubview:belowSubview:", v48, v49);

          }
          else
          {
            objc_msgSend(v46, "addSubview:", v48);
          }

          objc_msgSend(v10, "contentTypeViewController");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "didMoveToParentViewController:", v10);

        }
      }
      else
      {
        v57[0] = MEMORY[0x24BDAC760];
        v57[1] = 3221225472;
        v57[2] = __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_4;
        v57[3] = &unk_24D5A1D30;
        v57[4] = v5;
        v57[5] = v10;
        __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_4((uint64_t)v57);
      }
    }

  }
}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "multiLoadingDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadingDidFinishWithError:", *(_QWORD *)(a1 + 40));

}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "nu_errorArticleMissingHeadline:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "multiLoadingDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingDidFinishWithError:", v4);

}

void __71__NUArticleHostViewController_loadArticleAndEmbedArticleViewController__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "next:", v3);

}

- (id)loadingTextForArticle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v3 = a3;
  NUBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24D5A3F98, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
  objc_msgSend(v3, "headline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "role");

  if (v8 > 8)
    goto LABEL_10;
  if (((1 << v8) & 0x1AD) == 0)
  {
    NUBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (((1 << v8) & 0x42) != 0)
      v11 = CFSTR("LOADING STORY");
    else
      v11 = CFSTR("LOADING ADVERTISEMENT");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24D5A3F98, 0);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v8 = v5;
  }
LABEL_10:

  return (id)v8;
}

- (NSString)pageIdentifier
{
  return self->_pageIdentifier;
}

- (NULoadingDelegate)loadingDelegate
{
  return (NULoadingDelegate *)objc_loadWeakRetained((id *)&self->_loadingDelegate);
}

- (NUArticleHostViewControllerDelegate)delegate
{
  return (NUArticleHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FCObservable)articleViewStyler
{
  return self->_articleViewStyler;
}

- (NUArticleContext)articleContext
{
  return self->_articleContext;
}

- (void)setResponder:(id)a3
{
  objc_storeStrong((id *)&self->_responder, a3);
}

- (FCArticle)article
{
  return self->_article;
}

- (FCIssue)issue
{
  return self->_issue;
}

- (NUArticleViewControllerFactory)articleViewControllerFactory
{
  return self->_articleViewControllerFactory;
}

- (NUSettings)settings
{
  return self->_settings;
}

- (UIViewController)contentTypeViewController
{
  return self->_contentTypeViewController;
}

- (void)setContentTypeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentTypeViewController, a3);
}

- (NULoadingViewProviding)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (TFMultiDelegate)multiLoadingDelegate
{
  return self->_multiLoadingDelegate;
}

- (NUErrorMessageFactory)errorMessageFactory
{
  return self->_errorMessageFactory;
}

- (NUAnalyticsReporting)analyticsReporting
{
  return self->_analyticsReporting;
}

- (NUArticleContentSizeManager)contentSizeManager
{
  return self->_contentSizeManager;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeManager, 0);
  objc_storeStrong((id *)&self->_analyticsReporting, 0);
  objc_storeStrong((id *)&self->_errorMessageFactory, 0);
  objc_storeStrong((id *)&self->_multiLoadingDelegate, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_contentTypeViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_articleViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_issue, 0);
  objc_storeStrong((id *)&self->_article, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_articleContext, 0);
  objc_storeStrong((id *)&self->_articleViewStyler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_loadingDelegate);
  objc_storeStrong((id *)&self->_pageIdentifier, 0);
}

@end
