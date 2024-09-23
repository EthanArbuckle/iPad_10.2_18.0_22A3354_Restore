@implementation SUUIProductPagePlaceholderViewController

- (SUUIProductPagePlaceholderViewController)initWithStyle:(int64_t)a3
{
  SUUIProductPagePlaceholderViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPagePlaceholderViewController;
  result = -[SUUIProductPagePlaceholderViewController init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (void)loadView
{
  void *v3;

  -[SUUIProductPagePlaceholderViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPagePlaceholderViewController setView:](self, "setView:", v3);

  -[SUUIProductPagePlaceholderViewController _addHeaderView](self, "_addHeaderView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPagePlaceholderViewController;
  -[SUUIProductPagePlaceholderViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPagePlaceholderViewController;
  -[SUUIProductPagePlaceholderViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[UIActivityIndicatorView stopAnimating](self->_indicator, "stopAnimating");
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", self);

}

- (UIScrollView)scrollView
{
  SUUIProductPagePlaceholderScrollView *scrollView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *indicator;
  UIActivityIndicatorView *v6;
  double v7;
  SUUIClientContext *clientContext;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIProductPagePlaceholderScrollView *v13;
  SUUIProductPagePlaceholderScrollView *v14;
  SUUIProductPagePlaceholderScrollView *v15;
  void *v16;
  void *v17;
  id WeakRetained;

  scrollView = self->_scrollView;
  if (!scrollView)
  {
    if (self->_style)
    {
      v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 2);
      indicator = self->_indicator;
      self->_indicator = v4;

      -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
      v6 = self->_indicator;
      v7 = 40.0;
    }
    else
    {
      clientContext = self->_clientContext;
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_NO_RELATED_CONTENT"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_NO_RELATED_CONTENT"), 0, CFSTR("ProductPage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SUUIProductPagePlaceholderView initWithPlaceholderString:isPad:]([SUUIProductPagePlaceholderView alloc], "initWithPlaceholderString:isPad:", v9, SUUIUserInterfaceIdiom(self->_clientContext) == 1);
      -[SUUIColorScheme secondaryTextColor](self->_colorScheme, "secondaryTextColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView setTextColor:](v6, "setTextColor:", v10);

      -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[UIActivityIndicatorView setBackgroundColor:](v6, "setBackgroundColor:", v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIActivityIndicatorView setBackgroundColor:](v6, "setBackgroundColor:", v12);

      }
      v7 = 0.0;
    }
    v13 = objc_alloc_init(SUUIProductPagePlaceholderScrollView);
    v14 = self->_scrollView;
    self->_scrollView = v13;

    -[SUUIProductPagePlaceholderScrollView setIsPad:](self->_scrollView, "setIsPad:", SUUIUserInterfaceIdiom(self->_clientContext) == 1);
    -[SUUIProductPagePlaceholderScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
    v15 = self->_scrollView;
    -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[SUUIProductPagePlaceholderScrollView setBackgroundColor:](v15, "setBackgroundColor:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPagePlaceholderScrollView setBackgroundColor:](v15, "setBackgroundColor:", v17);

    }
    -[SUUIProductPagePlaceholderScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
    -[SUUIProductPagePlaceholderScrollView setOffset:](self->_scrollView, "setOffset:", v7);
    -[SUUIProductPagePlaceholderScrollView setPlaceholderView:](self->_scrollView, "setPlaceholderView:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", self);

    scrollView = self->_scrollView;
  }
  return (UIScrollView *)scrollView;
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
    -[SUUIProductPageHeaderViewController view](headerViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[SUUIProductPageHeaderViewController floatingView](*p_headerViewController, "floatingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[SUUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUIProductPagePlaceholderViewController addChildViewController:](self, "addChildViewController:");
      if (-[SUUIProductPagePlaceholderViewController isViewLoaded](self, "isViewLoaded"))
        -[SUUIProductPagePlaceholderViewController _addHeaderView](self, "_addHeaderView");
    }
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
  -[SUUIProductPagePlaceholderScrollView bounds](self->_scrollView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[SUUIProductPagePlaceholderScrollView addSubview:](self->_scrollView, "addSubview:", v8);
  -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SUUIProductPagePlaceholderScrollView bounds](self->_scrollView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[SUUIProductPagePlaceholderScrollView addSubview:](self->_scrollView, "addSubview:", v5);

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_colorScheme, a3);
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  return (SUUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
