@implementation SUUISearchFieldTableView

- (void)setTrendingSearchProvider:(id)a3
{
  SUUITrendingSearchProvider *v5;
  SUUITrendingSearchProvider *v6;

  v5 = (SUUITrendingSearchProvider *)a3;
  if (self->_trendingSearchProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_trendingSearchProvider, a3);
    v5 = v6;
    if (self->_trendingSearchesVisible && !self->_page)
    {
      -[SUUISearchFieldTableView _reloadData](self, "_reloadData");
      v5 = v6;
    }
  }

}

- (void)setTrendingSearchDelegate:(id)a3
{
  SUUITrendingSearchPageViewDelegate **p_trendingSearchDelegate;
  id v5;
  id v6;

  p_trendingSearchDelegate = &self->_trendingSearchDelegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_trendingSearchDelegate, v6);
  -[SUUITrendingSearchPageView setDelegate:](self->_pageView, "setDelegate:", v6);

}

- (void)setTrendingSearchesVisible:(BOOL)a3
{
  if (self->_trendingSearchesVisible != a3)
  {
    self->_trendingSearchesVisible = a3;
    if (a3 && !self->_page)
      -[SUUISearchFieldTableView _reloadData](self, "_reloadData");
    else
      -[SUUISearchFieldTableView _reloadView](self, "_reloadView");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUISearchFieldTableView;
  -[SUUISearchFieldTableView layoutSubviews](&v3, sel_layoutSubviews);
  -[SUUISearchFieldTableView bounds](self, "bounds");
  -[SUUITrendingSearchPageView setFrame:](self->_pageView, "setFrame:", 0.0, 0.0);
}

- (void)_reloadData
{
  SUUITrendingSearchPageViewDelegate **p_trendingSearchDelegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_trendingSearchProvider)
  {
    p_trendingSearchDelegate = &self->_trendingSearchDelegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)p_trendingSearchDelegate);
      objc_msgSend(v6, "URLForTrendingSearchPageView:", self->_pageView);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_initWeak(&location, self);
    -[SUUISearchFieldTableView trendingSearchProvider](self, "trendingSearchProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__SUUISearchFieldTableView__reloadData__block_invoke;
    v9[3] = &unk_2511FC160;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "trendingSearchPageWithURL:completionBlock:", v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __39__SUUISearchFieldTableView__reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setTrendingResponse:error:", v6, v5);

}

- (void)_setTrendingResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&self->_page, a3);
    -[SUUISearchFieldTableView _reloadView](self, "_reloadView");
    v6 = v7;
  }

}

- (void)_reloadView
{
  _BOOL4 trendingSearchesVisible;
  SUUITrendingSearchPageView *pageView;
  SUUITrendingSearchPageView *v5;
  SUUITrendingSearchPageView *v6;
  id WeakRetained;
  double v8;
  double v9;
  id v10;
  id v11;

  trendingSearchesVisible = self->_trendingSearchesVisible;
  pageView = self->_pageView;
  if (trendingSearchesVisible)
  {
    if (!pageView)
    {
      if (self->_page)
      {
        v5 = objc_alloc_init(SUUITrendingSearchPageView);
        v6 = self->_pageView;
        self->_pageView = v5;

        WeakRetained = objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
        -[SUUITrendingSearchPageView setDelegate:](self->_pageView, "setDelegate:", WeakRetained);

        -[SUUISearchFieldTableView addSubview:](self, "addSubview:", self->_pageView);
      }
    }
    v8 = *MEMORY[0x24BDBEFB0];
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[SUUISearchFieldTableView frame](self, "frame");
    -[SUUITrendingSearchPageView setFrame:](self->_pageView, "setFrame:", v8, v9);
    -[SUUITrendingSearchPageView setPage:](self->_pageView, "setPage:", self->_page);
    -[SUUITrendingSearchPageView setHidden:](self->_pageView, "setHidden:", 0);
    v10 = objc_alloc(MEMORY[0x24BEBDB00]);
    v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[SUUISearchFieldTableView setTableFooterView:](self, "setTableFooterView:", v11);

  }
  else
  {
    -[SUUITrendingSearchPageView setHidden:](pageView, "setHidden:", 1);
    -[SUUISearchFieldTableView setTableFooterView:](self, "setTableFooterView:", 0);
  }
}

- (SUUITrendingSearchProvider)trendingSearchProvider
{
  return self->_trendingSearchProvider;
}

- (SUUITrendingSearchPageViewDelegate)trendingSearchDelegate
{
  return (SUUITrendingSearchPageViewDelegate *)objc_loadWeakRetained((id *)&self->_trendingSearchDelegate);
}

- (BOOL)trendingSearchesVisible
{
  return self->_trendingSearchesVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_trendingSearchDelegate);
  objc_storeStrong((id *)&self->_trendingSearchProvider, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_page, 0);
}

@end
