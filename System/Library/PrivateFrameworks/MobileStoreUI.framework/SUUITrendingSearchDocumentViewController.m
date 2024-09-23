@implementation SUUITrendingSearchDocumentViewController

- (SUUITrendingSearchDocumentViewController)initWithTemplateElement:(id)a3
{
  id v4;
  SUUITrendingSearchDocumentViewController *v5;
  SUUITrendingSearchDocumentViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUITrendingSearchDocumentViewController;
  v5 = -[SUUITrendingSearchDocumentViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SUUITrendingSearchDocumentViewController setTemplate:](v5, "setTemplate:", v4);

  return v6;
}

- (void)documentDidUpdate:(id)a3
{
  void *v4;

  objc_msgSend(a3, "templateElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchDocumentViewController setTemplate:](self, "setTemplate:", v4);

  -[SUUITrendingSearchDocumentViewController _reloadResultsView](self, "_reloadResultsView");
}

- (id)impressionableViewElements
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)loadView
{
  id v3;

  -[SUUITrendingSearchDocumentViewController _reloadResultsView](self, "_reloadResultsView");
  -[SUUITrendingSearchDocumentViewController resultsView](self, "resultsView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchDocumentViewController setView:](self, "setView:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUITrendingSearchDocumentViewController;
  -[SUUITrendingSearchDocumentViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  -[SUUITrendingSearchDocumentViewController resultsView](self, "resultsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchDocumentViewController _resultsViewContentInset](self, "_resultsViewContentInset");
  objc_msgSend(v3, "setLayoutMargins:");

  v4.receiver = self;
  v4.super_class = (Class)SUUITrendingSearchDocumentViewController;
  -[SUUITrendingSearchDocumentViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (SUUITrendingSearchView)resultsView
{
  SUUITrendingSearchView *resultsView;
  SUUITrendingSearchView *v3;
  SUUITrendingSearchView *v5;
  SUUITrendingSearchView *v6;
  SUUITrendingSearchView *v7;
  void *v8;
  void *v9;

  resultsView = self->_resultsView;
  if (resultsView)
  {
    v3 = resultsView;
  }
  else
  {
    v5 = objc_alloc_init(SUUITrendingSearchView);
    v6 = self->_resultsView;
    self->_resultsView = v5;

    v7 = self->_resultsView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUITrendingSearchView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_resultsViewTapRecognized_);
    -[SUUITrendingSearchView addGestureRecognizer:](self->_resultsView, "addGestureRecognizer:", v9);
    v3 = self->_resultsView;

  }
  return v3;
}

- (void)resultsViewTapRecognized:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:to:from:forEvent:", sel_resignFirstResponder, 0, 0, 0);

}

- (void)searchResultButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SUUITrendingSearchDocumentViewController template](self, "template");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttons");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUITrendingSearchDocumentViewController resultsView](self, "resultsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trendingSearchViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v4);

  if (v8 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);

  }
}

- (void)_reloadResultsView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[SUUITrendingSearchDocumentViewController template](self, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v4 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v4;
  objc_msgSend(MEMORY[0x24BEBD708], "SUUITrending_titleLabelWithElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchDocumentViewController resultsView](self, "resultsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTrendingTitleView:", v5);

  -[SUUITrendingSearchDocumentViewController template](self, "template");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x24BEBD430], "SUUITrending_searchButtonWithElement:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_searchResultButtonTapped_, 64);
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[SUUITrendingSearchDocumentViewController resultsView](self, "resultsView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTrendingSearchViews:", v9);

  -[SUUITrendingSearchDocumentViewController resultsView](self, "resultsView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUITrendingSearchDocumentViewController _resultsViewContentInset](self, "_resultsViewContentInset");
  objc_msgSend(v17, "setLayoutMargins:");

}

- (UIEdgeInsets)_resultsViewContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 50.0;
  v3 = 40.0;
  v4 = 50.0;
  v5 = 40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setResultsView:(id)a3
{
  objc_storeStrong((id *)&self->_resultsView, a3);
}

- (SUUITrendingSearchTemplateElement)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_template, a3);
}

- (UIViewController)privacyViewController
{
  return self->_privacyViewController;
}

- (void)setPrivacyViewController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyViewController, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_resultsView, 0);
}

@end
