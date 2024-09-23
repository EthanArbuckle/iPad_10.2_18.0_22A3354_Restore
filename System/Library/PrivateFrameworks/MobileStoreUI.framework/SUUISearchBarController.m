@implementation SUUISearchBarController

- (SUUISearchBarController)initWithSearchBarViewElement:(id)a3
{
  id v5;
  SUUISearchBarController *v6;
  SUUISearchBarController *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUISearchBarController;
  v6 = -[SUUISearchBarController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewElement, a3);
    -[SUUISearchBarViewElement searchHintsURLString](v7->_viewElement, "searchHintsURLString");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SUUISearchBarViewElement trendingSearchURLString](v7->_viewElement, "trendingSearchURLString");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 | v9)
      v7->_usesSearchFieldController = 1;

  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  v3 = 48;
  if (!self->_usesSearchFieldController)
    v3 = 40;
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "setDelegate:", 0);
  -[SUUIFocusedTouchGestureRecognizer removeTarget:action:](self->_cancelTouchGestureRecognizer, "removeTarget:action:", self, 0);
  v4.receiver = self;
  v4.super_class = (Class)SUUISearchBarController;
  -[SUUISearchBarController dealloc](&v4, sel_dealloc);
}

- (void)reloadAfterDocumentUpdate
{
  id v3;

  if (self->_searchFieldController)
  {
    -[SUUISearchBarController _customizeSearchFieldController:](self, "_customizeSearchFieldController:");
    -[SUUISearchFieldController searchBar](self->_searchFieldController, "searchBar");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUISearchBarController _customizeSearchBar:](self, "_customizeSearchBar:", v3);

  }
}

- (BOOL)canBecomeActive
{
  return -[SUUISearchFieldController canBecomeActive](self->_searchFieldController, "canBecomeActive");
}

- (void)becomeActive
{
  -[SUUISearchFieldController becomeActive](self->_searchFieldController, "becomeActive");
}

- (void)resignActive:(BOOL)a3
{
  -[SUUISearchFieldController resignActive:](self->_searchFieldController, "resignActive:", a3);
}

- (UISearchBar)searchBar
{
  id v3;
  UISearchBar *v4;
  UISearchBar *searchBar;
  UISearchBar *v6;
  UISearchBar *v7;

  if (!self->_searchBar)
  {
    if (self->_usesSearchFieldController)
    {
      -[SUUISearchBarController _searchFieldController](self, "_searchFieldController");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "searchBar");
      v4 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
      searchBar = self->_searchBar;
      self->_searchBar = v4;

    }
    else
    {
      v3 = -[SUUISearchBarController _newSearchFieldController](self, "_newSearchFieldController");
      objc_msgSend(v3, "searchBar");
      v6 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
      v7 = self->_searchBar;
      self->_searchBar = v6;

      -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
    }

  }
  return self->_searchBar;
}

- (void)setDisplaysSearchBarInNavigationBar:(BOOL)a3
{
  if (self->_displaysSearchBarInNavigationBar != a3)
  {
    self->_displaysSearchBarInNavigationBar = a3;
    -[SUUISearchFieldController setDisplaysSearchBarInNavigationBar:](self->_searchFieldController, "setDisplaysSearchBarInNavigationBar:");
  }
}

- (void)setSearchBarViewElement:(id)a3
{
  SUUISearchBarViewElement *v5;
  SUUISearchBarViewElement *v6;

  v5 = (SUUISearchBarViewElement *)a3;
  if (self->_viewElement != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewElement, a3);
    -[SUUISearchBarController reloadAfterDocumentUpdate](self, "reloadAfterDocumentUpdate");
    v5 = v6;
  }

}

- (void)searchFieldController:(id)a3 requestSearch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "term");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUIIPadSearchController setLastSearchTerm:](SUUIIPadSearchController, "setLastSearchTerm:", v6);

  objc_msgSend(v5, "term");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchHintOriginalTerm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchHintIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUISearchBarController _dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:](self, "_dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:", v10, v7, v8, v9);
}

- (void)searchFieldController:(id)a3 searchBarDidChangeText:(id)a4
{
  id v5;

  v5 = a4;
  +[SUUIIPadSearchController setLastSearchTerm:](SUUIIPadSearchController, "setLastSearchTerm:", v5);
  -[SUUISearchBarController _dispatchChangeEventWithText:](self, "_dispatchChangeEventWithText:", v5);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  SUUIFocusedTouchGestureRecognizer *cancelTouchGestureRecognizer;
  void *v5;
  SUUIFocusedTouchGestureRecognizer *v6;
  SUUIFocusedTouchGestureRecognizer *v7;
  SUUIFocusedTouchGestureRecognizer *v8;
  SUUIFocusedTouchGestureRecognizer *v9;
  void *v10;
  id v11;

  v11 = a3;
  cancelTouchGestureRecognizer = self->_cancelTouchGestureRecognizer;
  if (cancelTouchGestureRecognizer)
  {
    -[SUUIFocusedTouchGestureRecognizer removeTarget:action:](cancelTouchGestureRecognizer, "removeTarget:action:", self, 0);
    -[SUUIFocusedTouchGestureRecognizer view](self->_cancelTouchGestureRecognizer, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", self->_cancelTouchGestureRecognizer);

    v6 = self->_cancelTouchGestureRecognizer;
    self->_cancelTouchGestureRecognizer = 0;

  }
  v7 = [SUUIFocusedTouchGestureRecognizer alloc];
  v8 = -[SUUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  v9 = self->_cancelTouchGestureRecognizer;
  self->_cancelTouchGestureRecognizer = v8;

  -[SUUIFocusedTouchGestureRecognizer addTarget:action:](self->_cancelTouchGestureRecognizer, "addTarget:action:", self, sel__cancelGestureAction_);
  objc_msgSend(v11, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", self->_cancelTouchGestureRecognizer);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[SUUISearchBarController _dispatchChangeEventWithText:](self, "_dispatchChangeEventWithText:", a4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "resignFirstResponder");
  objc_msgSend(v4, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUISearchBarController _dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:](self, "_dispatchSubmitEventWithText:URL:searchHintOriginalTerm:searchHintIndex:", v5, 0, 0, 0);
}

- (void)_cancelGestureAction:(id)a3
{
  if (self->_cancelTouchGestureRecognizer == a3)
  {
    -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
    -[SUUISearchBarController _removeCancelTouchGestureRecognizer](self, "_removeCancelTouchGestureRecognizer");
  }
}

- (void)_customizeSearchBar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "searchField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchBarViewElement style](self->_viewElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "setTextColor:", v6);
  if ((objc_msgSend(v10, "isFirstResponder") & 1) == 0)
  {
    -[SUUISearchBarViewElement defaultText](self->_viewElement, "defaultText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v8);

  }
  -[SUUISearchBarViewElement placeholderString](self->_viewElement, "placeholderString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v9);

}

- (void)_customizeSearchFieldController:(id)a3
{
  SUUISearchBarViewElement *viewElement;
  id v5;
  void *v6;
  void *v7;
  id v8;

  viewElement = self->_viewElement;
  v5 = a3;
  -[SUUISearchBarViewElement accessoryText](viewElement, "accessoryText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchBarAccessoryText:", v6);

  -[SUUISearchBarViewElement searchHintsURLString](self->_viewElement, "searchHintsURLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchHintsURLString:", v7);

  -[SUUISearchBarViewElement trendingSearchURLString](self->_viewElement, "trendingSearchURLString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrendingSearchURLString:", v8);

}

- (void)_dispatchChangeEventWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BDBCE70];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithObjectsAndKeys:", v5, CFSTR("term"), 0);

  -[SUUISearchBarViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v6, 0);
}

- (void)_dispatchSubmitEventWithText:(id)a3 URL:(id)a4 searchHintOriginalTerm:(id)a5 searchHintIndex:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = v13;
  if (v16)
    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("term"));
  if (v10)
  {
    objc_msgSend(v10, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("url"));

  }
  if (v11)
    objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("searchHintOriginalTerm"));
  if (v12)
    objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("searchHintIndex"));
  if (objc_msgSend(v14, "count"))
    -[SUUISearchBarViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 14, 1, 1, v14, 0);

}

- (id)_newSearchFieldController
{
  SUUISearchFieldController *v3;
  id WeakRetained;
  SUUISearchFieldController *v5;
  void *v6;

  v3 = [SUUISearchFieldController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v5 = -[SUUISearchFieldController initWithContentsController:clientContext:](v3, "initWithContentsController:clientContext:", WeakRetained, self->_clientContext);

  -[SUUISearchBarController _customizeSearchFieldController:](self, "_customizeSearchFieldController:", v5);
  if (self->_displaysSearchBarInNavigationBar)
    -[SUUISearchFieldController setDisplaysSearchBarInNavigationBar:](v5, "setDisplaysSearchBarInNavigationBar:", 1);
  if (self->_showsResultsForEmptyField)
    -[SUUISearchFieldController setShowsResultsForEmptyField:](v5, "setShowsResultsForEmptyField:", 1);
  -[SUUISearchFieldController searchBar](v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISearchBarController _customizeSearchBar:](self, "_customizeSearchBar:", v6);

  return v5;
}

- (void)_removeCancelTouchGestureRecognizer
{
  void *v3;
  SUUIFocusedTouchGestureRecognizer *cancelTouchGestureRecognizer;

  -[SUUIFocusedTouchGestureRecognizer removeTarget:action:](self->_cancelTouchGestureRecognizer, "removeTarget:action:", self, 0);
  -[SUUIFocusedTouchGestureRecognizer view](self->_cancelTouchGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_cancelTouchGestureRecognizer);

  cancelTouchGestureRecognizer = self->_cancelTouchGestureRecognizer;
  self->_cancelTouchGestureRecognizer = 0;

}

- (id)_searchFieldController
{
  SUUISearchFieldController *searchFieldController;
  SUUISearchFieldController *v4;
  SUUISearchFieldController *v5;

  searchFieldController = self->_searchFieldController;
  if (!searchFieldController)
  {
    v4 = -[SUUISearchBarController _newSearchFieldController](self, "_newSearchFieldController");
    v5 = self->_searchFieldController;
    self->_searchFieldController = v4;

    -[SUUISearchFieldController setDelegate:](self->_searchFieldController, "setDelegate:", self);
    searchFieldController = self->_searchFieldController;
  }
  return searchFieldController;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (BOOL)displaysSearchBarInNavigationBar
{
  return self->_displaysSearchBarInNavigationBar;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (SUUISearchBarViewElement)searchBarViewElement
{
  return self->_viewElement;
}

- (BOOL)showsResultsForEmptyField
{
  return self->_showsResultsForEmptyField;
}

- (void)setShowsResultsForEmptyField:(BOOL)a3
{
  self->_showsResultsForEmptyField = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_searchFieldController, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_cancelTouchGestureRecognizer, 0);
}

@end
