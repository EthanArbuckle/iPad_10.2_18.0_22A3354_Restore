@implementation NSSArticleViewControllerInternal

- (NSSArticleViewControllerInternal)initWithArticle:(id)a3
{
  id v4;
  NSSArticleViewControllerInternal *v5;
  NSSArticleViewControllerInternal *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NSSArticleViewControllerInternal;
  v5 = -[NSSArticleViewControllerInternal initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[NSSArticleViewControllerInternal setArticle:](v5, "setArticle:", v4);

  return v6;
}

- (NSSArticleViewControllerInternal)initWithNotification:(id)a3
{
  id v4;
  NSSArticleViewControllerInternal *v5;
  NSSArticleViewControllerInternal *v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSSArticleViewControllerInternal;
  v5 = -[NSSArticleViewControllerInternal initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_articleLoading = v4 != 0;
    objc_initWeak(&location, v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__NSSArticleViewControllerInternal_initWithNotification___block_invoke;
    v8[3] = &unk_1E9BDCEE8;
    objc_copyWeak(&v9, &location);
    +[NSSArticleInternal articleFromNotification:completion:](NSSArticleInternal, "articleFromNotification:completion:", v4, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __57__NSSArticleViewControllerInternal_initWithNotification___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "setArticle:", v4);
  objc_msgSend(WeakRetained, "setArticleLoading:", 0);

}

- (NSSArticleViewControllerInternal)initWithSpotlightIdentifier:(id)a3
{
  id v4;
  NSSArticleViewControllerInternal *v5;
  NSSArticleViewControllerInternal *v6;
  NSSArticleViewControllerInternal *v7;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v4 = a3;
  if (+[NSSArticleInternal coreSpotlightIdentifierRepresentsArticleIdentifier:](NSSArticleInternal, "coreSpotlightIdentifierRepresentsArticleIdentifier:", v4))
  {
    v12.receiver = self;
    v12.super_class = (Class)NSSArticleViewControllerInternal;
    v5 = -[NSSArticleViewControllerInternal initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
    v6 = v5;
    if (v5)
    {
      v5->_articleLoading = v4 != 0;
      objc_initWeak(&location, v5);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64__NSSArticleViewControllerInternal_initWithSpotlightIdentifier___block_invoke;
      v9[3] = &unk_1E9BDCEE8;
      objc_copyWeak(&v10, &location);
      +[NSSArticleInternal articleFromCoreSpotlightIdentifier:completion:](NSSArticleInternal, "articleFromCoreSpotlightIdentifier:completion:", v4, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __64__NSSArticleViewControllerInternal_initWithSpotlightIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "setArticle:", v4);
  objc_msgSend(WeakRetained, "setArticleLoading:", 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSArticleView *v7;
  NSSArticleView *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSSArticleViewControllerInternal;
  -[NSSArticleViewControllerInternal viewDidLoad](&v11, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  -[NSSArticleViewControllerInternal setSpinner:](self, "setSpinner:", v3);

  -[NSSArticleViewControllerInternal spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesWhenStopped:", 1);

  -[NSSArticleViewControllerInternal view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSArticleViewControllerInternal spinner](self, "spinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v7 = [NSSArticleView alloc];
  v8 = -[NSSArticleView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NSSArticleViewControllerInternal setArticleView:](self, "setArticleView:", v8);

  -[NSSArticleViewControllerInternal view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSArticleViewControllerInternal articleView](self, "articleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSSArticleViewControllerInternal;
  -[NSSArticleViewControllerInternal viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[NSSArticleViewControllerInternal _tickleSpinner](self, "_tickleSpinner");
  -[NSSArticleViewControllerInternal _tickleArticleView](self, "_tickleArticleView");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double MidX;
  void *v5;
  double MidY;
  void *v7;
  void *v8;
  double Width;
  void *v10;
  double Height;
  void *v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v13.receiver = self;
  v13.super_class = (Class)NSSArticleViewControllerInternal;
  -[NSSArticleViewControllerInternal viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[NSSArticleViewControllerInternal view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v14);
  -[NSSArticleViewControllerInternal view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  MidY = CGRectGetMidY(v15);
  -[NSSArticleViewControllerInternal spinner](self, "spinner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", MidX, MidY);

  -[NSSArticleViewControllerInternal view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v16);
  -[NSSArticleViewControllerInternal view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  Height = CGRectGetHeight(v17);
  -[NSSArticleViewControllerInternal articleView](self, "articleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, Height);

}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)setArticleLoading:(BOOL)a3
{
  if (self->_articleLoading != a3)
  {
    self->_articleLoading = a3;
    -[NSSArticleViewControllerInternal _tickleSpinner](self, "_tickleSpinner");
  }
}

- (void)setArticle:(id)a3
{
  NSSArticleInternal *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSSArticleInternal *v11;

  v5 = (NSSArticleInternal *)a3;
  if (self->_article != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_article, a3);
    -[NSSArticleViewControllerInternal _tickleArticleView](self, "_tickleArticleView");
    -[NSSArticleViewControllerInternal articleView](self, "articleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredSize");
    v8 = v7;
    v10 = v9;

    -[NSSArticleViewControllerInternal setPreferredContentSize:](self, "setPreferredContentSize:", v8, v10);
    v5 = v11;
  }

}

- (void)presentArticle:(id)a3 completion:(id)a4
{
  void (**v7)(_QWORD, double, double);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSSArticleInternal *v13;

  v13 = (NSSArticleInternal *)a3;
  v7 = (void (**)(_QWORD, double, double))a4;
  if (self->_article != v13)
  {
    objc_storeStrong((id *)&self->_article, a3);
    -[NSSArticleViewControllerInternal _tickleArticleView](self, "_tickleArticleView");
    if (v7)
    {
      -[NSSArticleViewControllerInternal articleView](self, "articleView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredSize");
      v10 = v9;
      v12 = v11;

      v7[2](v7, v10, v12);
    }
    -[NSSArticleViewControllerInternal _tickleSpinner](self, "_tickleSpinner");
  }

}

- (void)_tickleSpinner
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (-[NSSArticleViewControllerInternal isViewLoaded](self, "isViewLoaded"))
  {
    v3 = -[NSSArticleViewControllerInternal articleLoading](self, "articleLoading");
    -[NSSArticleViewControllerInternal spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "startAnimating");
    else
      objc_msgSend(v4, "stopAnimating");

  }
}

- (void)_tickleArticleView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[NSSArticleViewControllerInternal isViewLoaded](self, "isViewLoaded"))
  {
    -[NSSArticleViewControllerInternal article](self, "article");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSArticleViewControllerInternal articleView](self, "articleView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArticle:", v3);

    -[NSSArticleViewControllerInternal article](self, "article");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSSArticleViewControllerInternal articleView](self, "articleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v6 == 0);

  }
}

- (NSSArticleInternal)article
{
  return self->_article;
}

- (NSSArticleView)articleView
{
  return self->_articleView;
}

- (void)setArticleView:(id)a3
{
  objc_storeStrong((id *)&self->_articleView, a3);
}

- (BOOL)articleLoading
{
  return self->_articleLoading;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_articleView, 0);
  objc_storeStrong((id *)&self->_article, 0);
}

@end
