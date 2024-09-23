@implementation SUUISearchFieldController

- (SUUISearchFieldController)initWithContentsController:(id)a3 clientContext:(id)a4
{
  id v6;
  SUUISearchFieldController *v7;
  NSOperationQueue *v8;
  NSOperationQueue *operationQueue;
  id v10;
  SUUISearchFieldTableView *v11;
  SUUISearchFieldTableView *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  UITableViewController *searchResultsController;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SUUISearchController *v22;
  SUUISearchController *searchController;
  SUUISearchController *v24;
  SUUISearchController *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  objc_super v34;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SUUISearchFieldController;
  v7 = -[SUUISearchFieldController init](&v34, sel_init);
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_contentsController, v10);

    v11 = [SUUISearchFieldTableView alloc];
    v12 = -[SUUISearchFieldTableView initWithFrame:style:](v11, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[SUUISearchFieldTableView setTrendingSearchDelegate:](v12, "setTrendingSearchDelegate:", v7);
    objc_msgSend(v6, "trendingSearchProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISearchFieldTableView setTrendingSearchProvider:](v12, "setTrendingSearchProvider:", v13);

    v14 = -[SUUISearchFieldController _presentsInPopover:](v7, "_presentsInPopover:", v6);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDA00]), "initWithStyle:", 0);
    searchResultsController = v7->_searchResultsController;
    v7->_searchResultsController = (UITableViewController *)v15;

    -[UITableViewController setTableView:](v7->_searchResultsController, "setTableView:", v12);
    -[UITableViewController tableView](v7->_searchResultsController, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDataSource:", v7);

    -[UITableViewController tableView](v7->_searchResultsController, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v7);

    -[UITableViewController tableView](v7->_searchResultsController, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v20);

    if (v14)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v7->_searchResultsController);
      v22 = -[SUUISearchController initWithSearchResultsController:]([SUUISearchController alloc], "initWithSearchResultsController:", v21);
      searchController = v7->_searchController;
      v7->_searchController = v22;

    }
    else
    {
      v24 = -[SUUISearchController initWithSearchResultsController:]([SUUISearchController alloc], "initWithSearchResultsController:", v7->_searchResultsController);
      v25 = v7->_searchController;
      v7->_searchController = v24;

      -[UITableViewController setAutomaticallyAdjustsScrollViewInsets:](v7->_searchResultsController, "setAutomaticallyAdjustsScrollViewInsets:", 0);
      -[UITableViewController tableView](v7->_searchResultsController, "tableView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setContentInsetAdjustmentBehavior:", 101);
    }

    -[SUUISearchController setHidesNavigationBarDuringPresentation:](v7->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
    -[SUUISearchController setDelegate:](v7->_searchController, "setDelegate:", v7);
    -[SUUISearchController setSearchResultsUpdater:](v7->_searchController, "setSearchResultsUpdater:", v7);
    -[SUUISearchController searchBar](v7->_searchController, "searchBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDrawsBackground:", 0);
    objc_msgSend(v26, "setAutocapitalizationType:", 0);
    objc_msgSend(v26, "setAutocorrectionType:", 1);
    objc_msgSend(v26, "setDelegate:", v7);
    objc_msgSend(v26, "setSearchBarStyle:", 2);
    v27 = objc_loadWeakRetained(&location);
    objc_msgSend(v27, "navigationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationBar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "barStyle");

    if (v30 == 1)
    {
      objc_msgSend(v26, "searchField");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTextColor:", v32);

    }
    if (v6)
      -[SUUISearchFieldController setClientContext:](v7, "setClientContext:", v6);

  }
  objc_destroyWeak(&location);
  return v7;
}

- (SUUISearchFieldController)initWithContentsController:(id)a3
{
  id v4;
  SUUISearchFieldController *v5;

  v4 = a3;
  v5 = -[SUUISearchFieldController initWithContentsController:clientContext:](self, "initWithContentsController:clientContext:", v4, 0);

  return v5;
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return -[SUUISearchController hidesNavigationBarDuringPresentation](self->_searchController, "hidesNavigationBarDuringPresentation") ^ 1;
}

- (BOOL)canBecomeActive
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[SUUISearchController isActive](self->_searchController, "isActive") & 1) != 0)
    return 0;
  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (void)becomeActive
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SUUISearchController transitionCoordinator](self->_searchController, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__SUUISearchFieldController_becomeActive__block_invoke;
    v6[3] = &unk_2511F4640;
    v6[4] = self;
    objc_msgSend(v3, "animateAlongsideTransition:completion:", 0, v6);
  }
  else
  {
    -[SUUISearchController searchBar](self->_searchController, "searchBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

void __41__SUUISearchFieldController_becomeActive__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "searchBar");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)resignActive:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[SUUISearchController isActive](self->_searchController, "isActive"))
  {
    if (v3)
    {
      -[SUUISearchController setActive:](self->_searchController, "setActive:", 0);
    }
    else
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __42__SUUISearchFieldController_resignActive___block_invoke;
      v5[3] = &unk_2511F47C0;
      v5[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v5);
    }
  }
}

uint64_t __42__SUUISearchFieldController_resignActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setActive:", 0);
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)-[SUUISearchController searchBar](self->_searchController, "searchBar");
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3
{
  -[SUUISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", !a3);
}

- (void)setNumberOfSearchResults:(int64_t)a3
{
  SUUIClientContext *clientContext;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_numberOfSearchResults != a3)
  {
    self->_numberOfSearchResults = a3;
    if (a3)
    {
      clientContext = self->_clientContext;
      if (a3 == 1)
        v5 = CFSTR("SEARCH_FIELD_ONE_RESULT");
      else
        v5 = CFSTR("SEARCH_FIELD_PLURAL_RESULTS");
      if (clientContext)
        -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", v5);
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_numberOfSearchResults);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[SUUISearchController _setSuffix:](self->_searchController, "_setSuffix:", v9);
    }
    else
    {
      v9 = 0;
      -[SUUISearchController _setSuffix:](self->_searchController, "_setSuffix:", 0);
    }

  }
}

- (void)setClientContext:(id)a3
{
  UITableViewController *searchResultsController;
  SUUIClientContext *clientContext;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_clientContext, a3);
  searchResultsController = self->_searchResultsController;
  clientContext = self->_clientContext;
  if (clientContext)
    -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("SEARCH_SUGGESTIONS"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("SEARCH_SUGGESTIONS"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController setTitle:](searchResultsController, "setTitle:", v7);

  -[SUUISearchFieldController _reloadTrendingVisibility](self, "_reloadTrendingVisibility");
}

- (void)setSearchBarAccessoryText:(id)a3
{
  NSString *v4;
  NSString *searchBarAccessoryText;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_searchBarAccessoryText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    searchBarAccessoryText = self->_searchBarAccessoryText;
    self->_searchBarAccessoryText = v4;

    -[SUUISearchController _setSuffix:](self->_searchController, "_setSuffix:", self->_searchBarAccessoryText);
  }

}

- (void)setSearchTerm:(id)a3
{
  SUUISearchController *searchController;
  id v5;
  void *v6;
  void *v7;

  searchController = self->_searchController;
  v5 = a3;
  -[SUUISearchController searchBar](searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  -[SUUISearchFieldController _reloadTrendingVisibility](self, "_reloadTrendingVisibility");
}

- (void)setShowsResultsForEmptyField:(BOOL)a3
{
  -[SUUISearchController _setShowResultsForEmptySearch:](self->_searchController, "_setShowResultsForEmptySearch:", a3);
}

- (void)setDelegate:(id)a3
{
  SUUISearchFieldDelegate **p_delegate;
  id v5;
  char v6;
  char v7;
  char v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v6;
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v8;
}

- (BOOL)showsResultsForEmptyField
{
  return -[SUUISearchController _showResultsForEmptySearch](self->_searchController, "_showResultsForEmptySearch");
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  void *v5;
  SUUISearchRequest *v6;

  v4 = a3;
  v6 = objc_alloc_init(SUUISearchRequest);
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchRequest setTerm:](v6, "setTerm:", v5);

  -[SUUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", v6);
  objc_msgSend(v4, "resignFirstResponder");

  -[SUUISearchController setActive:](self->_searchController, "setActive:", 0);
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  char v4;
  id WeakRetained;
  void *v6;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_msgSend(WeakRetained, "searchFieldControllerShouldBeginEditing:", self);

  }
  else
  {
    v4 = 1;
  }
  -[UITableViewController tableView](self->_searchResultsController, "tableView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchFieldController _adjustInsetsForResultsTableView:](self, "_adjustInsetsForResultsTableView:", v6);

  return v4;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  SUUISearchFieldDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "searchFieldController:searchBarDidChangeText:", self, v6);

  }
}

- (BOOL)searchBarShouldClear:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isFirstResponder") & 1) != 0
    || -[SUUISearchFieldController _presentsInPopover:](self, "_presentsInPopover:", self->_clientContext))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "setText:", 0);
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISearchFieldController searchBar:textDidChange:](self, "searchBar:textDidChange:", v4, v6);

    -[SUUISearchFieldController becomeActive](self, "becomeActive");
    v5 = 0;
  }

  return v5;
}

- (void)willPresentSearchController:(id)a3
{
  void *v4;

  -[UITableViewController tableView](self->_searchResultsController, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchFieldController _adjustInsetsForResultsTableView:](self, "_adjustInsetsForResultsTableView:", v4);

  -[SUUISearchFieldController _reloadData](self, "_reloadData");
}

- (void)presentSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  if (-[SUUISearchFieldController _presentsInPopover:](self, "_presentsInPopover:", self->_clientContext))
  {
    objc_msgSend(v4, "setModalPresentationStyle:", 7);
    objc_msgSend(v4, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

  }
  -[SUUISearchFieldController contentsController](self, "contentsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefinesPresentationContext:", 1);

  -[SUUISearchFieldController contentsController](self, "contentsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SUUISearchFieldController_presentSearchController___block_invoke;
  v8[3] = &unk_2511F47C0;
  v8[4] = self;
  objc_msgSend(v7, "presentViewController:animated:completion:", v4, 1, v8);

}

void __53__SUUISearchFieldController_presentSearchController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "searchBar");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "autoresizingMask");

    if ((v4 & 2) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "searchBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)willDismissSearchController:(id)a3
{
  id v3;

  -[SUUISearchFieldController contentsController](self, "contentsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefinesPresentationContext:", 0);

}

- (void)searchControllerWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __92__SUUISearchFieldController_searchControllerWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_2511F4640;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v4);
}

void __92__SUUISearchFieldController_searchControllerWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[4], "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_adjustInsetsForResultsTableView:", v2);

}

- (id)searchControllerClientContext:(id)a3
{
  return self->_clientContext;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setPermittedArrowDirections:", 1);
  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", v5);

  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v4, "setSourceRect:");

  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassthroughViews:", v8);

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v3;

  -[SUUISearchFieldController contentsController](self, "contentsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefinesPresentationContext:", 0);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("a"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("a"));
  -[SUUICompletionList completions](self->_completionList, "completions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alternateTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v10, "alternateTitle");
  else
    objc_msgSend(v10, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13);

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SUUICompletionList completions](self->_completionList, "completions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SUUISearchRequest *v22;

  v5 = a4;
  v22 = objc_alloc_init(SUUISearchRequest);
  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchRequest setSearchHintOriginalTerm:](v22, "setSearchHintOriginalTerm:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchRequest setSearchHintIndex:](v22, "setSearchHintIndex:", v8);

  -[SUUICompletionList completions](self->_completionList, "completions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchRequest setTerm:](v22, "setTerm:", v12);
  v13 = objc_alloc(MEMORY[0x24BDBCF48]);
  objc_msgSend(v11, "URLString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

  -[SUUISearchRequest setURL:](v22, "setURL:", v15);
  objc_msgSend(v11, "alternateTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v16)
    v20 = v16;
  else
    v20 = v12;
  objc_msgSend(v18, "setText:", v20);

  -[SUUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", v22);
  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resignFirstResponder");

  -[SUUISearchController setActive:](self->_searchController, "setActive:", 0);
}

- (void)trendingSearchPageView:(id)a3 didSelectSearch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUISearchRequest *v12;

  v5 = a4;
  v12 = objc_alloc_init(SUUISearchRequest);
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchRequest setURL:](v12, "setURL:", v8);

  objc_msgSend(v5, "term");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUISearchRequest setTerm:](v12, "setTerm:", v9);
  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  -[SUUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", v12);
  -[SUUISearchController setActive:](self->_searchController, "setActive:", 0);

}

- (id)URLForTrendingSearchPageView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF48];
  -[SUUISearchFieldController trendingSearchURLString](self, "trendingSearchURLString", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_presentsInPopover:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  int v7;

  v3 = a3;
  if (SUUIUserInterfaceIdiom(v3) == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v6 <= SUUICompactThreshold())
      LOBYTE(v7) = 0;
    else
      v7 = objc_msgSend(v3, "shouldForceTransientSearchControllerBahavior") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_adjustInsetsForResultsTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
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
  double v23;
  double v24;
  id v25;

  v25 = a3;
  -[SUUISearchFieldController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (SUUIUserInterfaceIdiom(v4) == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    if (v7 > SUUICompactThreshold())
    {
      v8 = -[SUUIClientContext shouldForceTransientSearchControllerBahavior](self->_clientContext, "shouldForceTransientSearchControllerBahavior");

      if (!v8)
        goto LABEL_9;
      goto LABEL_7;
    }

  }
LABEL_7:
  objc_msgSend(v25, "contentInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v25, "contentOffset");
  v18 = v17;
  v20 = v19;
  -[SUUISearchFieldController contentsController](self, "contentsController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "length");
  v24 = v23;

  if (v24 != v10)
  {
    objc_msgSend(v25, "setContentInset:", v24, v12, v14, v16);
    objc_msgSend(v25, "setScrollIndicatorInsets:", v24, v12, v14, v16);
    objc_msgSend(v25, "setContentOffset:", v18, v20 - (v24 - v10));
  }
LABEL_9:

}

- (void)_loadResultsForSearchRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  -[SUUISearchFieldController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    objc_msgSend(v4, "searchFieldController:requestSearch:", self, v12);
  }
  else
  {
    objc_msgSend(v12, "term");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v6 || v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v11, "searchFieldController:requestSearchWithURL:metricsEvent:", self, v8, 0);

      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "searchFieldController:requestSearchWithSearchTerm:metricsEvent:", self, v6, 0);
    }

  }
}

- (void)_reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v12;
  void *v13;
  SSVLoadURLOperation *v14;
  void *v15;
  SSVLoadURLOperation *v16;
  SUUICompletionList *completionList;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  -[SUUISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    -[SUUISearchFieldController searchHintsURLString](self, "searchHintsURLString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(&location, self);
      -[SUUIClientContext URLBag](self->_clientContext, "URLBag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __40__SUUISearchFieldController__reloadData__block_invoke;
      v21[3] = &unk_2511F6248;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v18, "loadValueForKey:completionBlock:", CFSTR("searchHints"), v21);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
    -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
    -[SSVLoadURLOperation cancel](self->_loadOperation, "cancel");
    v6 = (void *)MEMORY[0x24BDBCF48];
    -[SUUISearchFieldController searchHintsURLString](self, "searchHintsURLString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingQueryParameter:value:", CFSTR("term"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", v9);
    loadOperation = self->_loadOperation;
    self->_loadOperation = v10;

    v12 = self->_loadOperation;
    +[SSVURLDataConsumer consumer](SUUICompletionDataConsumer, "consumer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setDataConsumer:](v12, "setDataConsumer:", v13);

    v14 = self->_loadOperation;
    -[SUUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVLoadURLOperation setStoreFrontSuffix:](v14, "setStoreFrontSuffix:", v15);

    objc_initWeak(&location, self);
    v16 = self->_loadOperation;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __40__SUUISearchFieldController__reloadData__block_invoke_3;
    v19[3] = &unk_2511F6270;
    objc_copyWeak(&v20, &location);
    -[SSVLoadURLOperation setOutputBlock:](v16, "setOutputBlock:", v19);
    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", self->_loadOperation);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SUUISearchFieldController _setResponse:error:](self, "_setResponse:error:", 0, 0);
    -[SUUISearchFieldController _loadResultsForSearchRequest:](self, "_loadResultsForSearchRequest:", 0);
    completionList = self->_completionList;
    self->_completionList = 0;

    -[UITableViewController tableView](self->_searchResultsController, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");
  }

LABEL_7:
  -[SUUISearchFieldController _reloadTrendingVisibility](self, "_reloadTrendingVisibility");

}

void __40__SUUISearchFieldController__reloadData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __40__SUUISearchFieldController__reloadData__block_invoke_2;
    v4[3] = &unk_2511F6220;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    v5 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }

}

void __40__SUUISearchFieldController__reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setSearchHintsURLString:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_reloadData");
    WeakRetained = v3;
  }

}

void __40__SUUISearchFieldController__reloadData__block_invoke_3(uint64_t a1, void *a2, void *a3)
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
  block[2] = __40__SUUISearchFieldController__reloadData__block_invoke_4;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __40__SUUISearchFieldController__reloadData__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_reloadTrendingVisibility
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    if (v6 <= SUUICompactThreshold())
    {

    }
    else
    {
      v7 = -[SUUIClientContext shouldForceTransientSearchControllerBahavior](self->_clientContext, "shouldForceTransientSearchControllerBahavior");

      if (v7)
        return;
      -[UITableViewController tableView](self->_searchResultsController, "tableView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIClientContext trendingSearchProvider](self->_clientContext, "trendingSearchProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTrendingSearchProvider:", v8);

      v9 = -[SUUISearchController isActive](self->_searchController, "isActive");
      -[SUUISearchController searchBar](self->_searchController, "searchBar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
        v13 = 0;
      else
        v13 = v9;
      objc_msgSend(v14, "setTrendingSearchesVisible:", v13);
    }

  }
}

- (void)_setResponse:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    -[SUUISearchController searchBar](self->_searchController, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      objc_storeStrong((id *)&self->_completionList, a3);
      -[UITableViewController tableView](self->_searchResultsController, "tableView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

    }
  }

}

- (UIViewController)contentsController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_contentsController);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUISearchFieldDelegate)delegate
{
  return (SUUISearchFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)searchBarAccessoryText
{
  return self->_searchBarAccessoryText;
}

- (NSString)searchHintsURLString
{
  return self->_searchHintsURLString;
}

- (void)setSearchHintsURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)trendingSearchURLString
{
  return self->_trendingSearchURLString;
}

- (void)setTrendingSearchURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)numberOfSearchResults
{
  return self->_numberOfSearchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchURLString, 0);
  objc_storeStrong((id *)&self->_searchHintsURLString, 0);
  objc_storeStrong((id *)&self->_searchBarAccessoryText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_contentsController);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_completionList, 0);
}

@end
