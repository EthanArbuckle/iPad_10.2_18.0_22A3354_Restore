@implementation SUUIGiftContactSearchController

- (void)dealloc
{
  objc_super v3;

  if (self->_searchTaskIdentifier)
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
  -[CNAutocompleteResultsTableViewController setDelegate:](self->_searchResultsViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIGiftContactSearchController;
  -[SUUIGiftContactSearchController dealloc](&v3, sel_dealloc);
}

- (BOOL)cancelSearch
{
  NSNumber *searchTaskIdentifier;
  NSNumber *v4;

  searchTaskIdentifier = self->_searchTaskIdentifier;
  if (searchTaskIdentifier)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:", searchTaskIdentifier);
    v4 = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = 0;

  }
  return searchTaskIdentifier != 0;
}

- (int64_t)numberOfResults
{
  return -[NSArray count](self->_results, "count");
}

- (void)resetSearch
{
  -[SUUIGiftContactSearchController cancelSearch](self, "cancelSearch");
  -[SUUIGiftContactSearchController _setResults:](self, "_setResults:", 0);
}

- (void)searchForText:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *autocompleteSearchResults;
  CNAutocompleteSearchManager *searchManager;
  uint64_t v7;
  CNAutocompleteSearchManager *v8;
  CNAutocompleteSearchManager *v9;
  NSNumber *v10;
  NSNumber *searchTaskIdentifier;
  id v12;

  v12 = a3;
  if (!self->_autocompleteSearchResults)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    autocompleteSearchResults = self->_autocompleteSearchResults;
    self->_autocompleteSearchResults = v4;

  }
  -[SUUIGiftContactSearchController cancelSearch](self, "cancelSearch");
  -[NSMutableArray removeAllObjects](self->_autocompleteSearchResults, "removeAllObjects");
  if (objc_msgSend(v12, "length"))
  {
    searchManager = self->_searchManager;
    if (!searchManager)
    {
      v7 = SUUIContactsAutocompleteUIFramework();
      v8 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("CNAutocompleteSearchManager"), v7)), "initWithAutocompleteSearchType:", 0);
      v9 = self->_searchManager;
      self->_searchManager = v8;

      -[CNAutocompleteSearchManager setSearchTypes:](self->_searchManager, "setSearchTypes:", 3);
      searchManager = self->_searchManager;
    }
    -[CNAutocompleteSearchManager searchForText:withAutocompleteFetchContext:consumer:](searchManager, "searchForText:withAutocompleteFetchContext:consumer:", v12, 0, self);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    searchTaskIdentifier = self->_searchTaskIdentifier;
    self->_searchTaskIdentifier = v10;

  }
  else
  {
    -[SUUIGiftContactSearchController _finishSearchWithResults:](self, "_finishSearchWithResults:", 0);
  }

}

- (UIView)searchResultsView
{
  UIView *searchResultsView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  UIView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  searchResultsView = self->_searchResultsView;
  if (!searchResultsView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    v5 = self->_searchResultsView;
    self->_searchResultsView = v4;

    -[SUUIGiftContactSearchController searchResultsViewController](self, "searchResultsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = self->_searchResultsView;
    objc_msgSend(v7, "frame");
    -[UIView setFrame:](v8, "setFrame:");
    -[UIView bounds](self->_searchResultsView, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    objc_msgSend(v7, "setFrame:", v10, v12, v14, v16);
    -[UIView addSubview:](self->_searchResultsView, "addSubview:", v7);

    searchResultsView = self->_searchResultsView;
  }
  return searchResultsView;
}

- (CNAutocompleteResultsTableViewController)searchResultsViewController
{
  CNAutocompleteResultsTableViewController *searchResultsViewController;
  CNAutocompleteResultsTableViewController *v4;
  CNAutocompleteResultsTableViewController *v5;

  searchResultsViewController = self->_searchResultsViewController;
  if (!searchResultsViewController)
  {
    v4 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x24BE19138]);
    v5 = self->_searchResultsViewController;
    self->_searchResultsViewController = v4;

    -[CNAutocompleteResultsTableViewController setDelegate:](self->_searchResultsViewController, "setDelegate:", self);
    searchResultsViewController = self->_searchResultsViewController;
  }
  return searchResultsViewController;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToNumber:", self->_searchTaskIdentifier))
    -[NSMutableArray addObjectsFromArray:](self->_autocompleteSearchResults, "addObjectsFromArray:", v6);

}

- (void)finishedSearchingForAutocompleteResults
{
  -[SUUIGiftContactSearchController _finishSearchWithResults:](self, "_finishSearchWithResults:", self->_autocompleteSearchResults);
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id WeakRetained;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "searchController:didSelectRecipient:", self, v8);
  }
  else
  {
    objc_msgSend(v13, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v12, 1);

  }
}

- (void)_finishSearchWithResults:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[SUUIGiftContactSearchController _setResults:](self, "_setResults:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "searchControllerDidFinishSearch:", self);

  }
}

- (void)_setResults:(id)a3
{
  NSArray *v4;
  NSArray *results;
  NSArray *v6;
  void *v7;
  id v8;

  if (self->_results != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    results = self->_results;
    self->_results = v4;

    v6 = self->_results;
    -[SUUIGiftContactSearchController searchResultsViewController](self, "searchResultsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRecipients:", v6);

    -[CNAutocompleteResultsTableViewController tableView](self->_searchResultsViewController, "tableView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (SUUIGiftContactSearchDelegate)delegate
{
  return (SUUIGiftContactSearchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchResultsViewController, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
}

@end
