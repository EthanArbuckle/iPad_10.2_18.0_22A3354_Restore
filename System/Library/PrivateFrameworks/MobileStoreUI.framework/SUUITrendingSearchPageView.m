@implementation SUUITrendingSearchPageView

- (SUUITrendingSearchPageView)initWithFrame:(CGRect)a3
{
  SUUITrendingSearchPageView *v3;
  SUUITrendingSearchView *v4;
  uint64_t v5;
  SUUITrendingSearchView *trendingSearchView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUITrendingSearchPageView;
  v3 = -[SUUITrendingSearchPageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUITrendingSearchView alloc];
    -[SUUITrendingSearchPageView bounds](v3, "bounds");
    v5 = -[SUUITrendingSearchView initWithFrame:](v4, "initWithFrame:");
    trendingSearchView = v3->_trendingSearchView;
    v3->_trendingSearchView = (SUUITrendingSearchView *)v5;

    -[SUUITrendingSearchView setAutoresizingMask:](v3->_trendingSearchView, "setAutoresizingMask:", 18);
    -[SUUITrendingSearchPageView addSubview:](v3, "addSubview:", v3->_trendingSearchView);
  }
  return v3;
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[SUUITrendingSearchView layoutMargins](self->_trendingSearchView, "layoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SUUITrendingSearchView setLayoutMargins:](self->_trendingSearchView, "setLayoutMargins:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)setPage:(id)a3
{
  SUUITrendingSearchPage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  SUUITrendingSearchPage *v15;
  _QWORD v16[5];
  id v17;

  v5 = (SUUITrendingSearchPage *)a3;
  if (self->_page != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_page, a3);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
    {
      v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x24BEBD708];
      -[SUUITrendingSearchPageView page](self, "page");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "SUUITrending_defaultLabelWithText:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[SUUITrendingSearchView setTrendingTitleView:](self->_trendingSearchView, "setTrendingTitleView:", v8);
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SUUITrendingSearchPage searches](self->_page, "searches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __38__SUUITrendingSearchPageView_setPage___block_invoke;
    v16[3] = &unk_2511FC3D0;
    v16[4] = self;
    v17 = v12;
    v14 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

    -[SUUITrendingSearchView setTrendingSearchViews:](self->_trendingSearchView, "setTrendingSearchViews:", v14);
    v5 = v15;
  }

}

void __38__SUUITrendingSearchPageView_setPage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BEBD430];
  objc_msgSend(a2, "term");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "SUUITrending_searchButtonWithTitle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__buttonAction_, 64);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void)setBackgroundColor:(id)a3
{
  SUUITrendingSearchView *trendingSearchView;
  id v5;
  objc_super v6;

  trendingSearchView = self->_trendingSearchView;
  v5 = a3;
  -[SUUITrendingSearchView setBackgroundColor:](trendingSearchView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUITrendingSearchPageView;
  -[SUUITrendingSearchPageView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SUUITrendingSearchView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_trendingSearchView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_buttonAction:(id)a3
{
  SUUITrendingSearchPage *page;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;

  page = self->_page;
  v5 = a3;
  -[SUUITrendingSearchPage searches](page, "searches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchView trendingSearchViews](self->_trendingSearchView, "trendingSearchViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);

  objc_msgSend(v6, "objectAtIndex:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "trendingSearchPageView:didSelectSearch:", self, v10);

}

- (SUUITrendingSearchPageViewDelegate)delegate
{
  return (SUUITrendingSearchPageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUITrendingSearchPage)page
{
  return self->_page;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchView, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
