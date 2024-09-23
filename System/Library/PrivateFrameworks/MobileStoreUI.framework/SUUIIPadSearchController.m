@implementation SUUIIPadSearchController

- (SUUIIPadSearchController)initWithParentViewController:(id)a3
{
  SUUIIPadSearchController *v4;
  id v5;
  void *v6;
  objc_super v8;
  id location;

  objc_initWeak(&location, a3);
  v8.receiver = self;
  v8.super_class = (Class)SUUIIPadSearchController;
  v4 = -[SUUIIPadSearchController init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_parentViewController, v5);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__termDidChangeNotification_, CFSTR("SUUIIPadSearchControllerTermDidChangeNotification"), 0);

  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUUIIPadSearchControllerTermDidChangeNotification"), 0);
  -[SUUISearchFieldController setDelegate:](self->_searchFieldController, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIIPadSearchController;
  -[SUUIIPadSearchController dealloc](&v4, sel_dealloc);
}

- (void)setClientContext:(id)a3
{
  SUUIClientContext *v5;
  SUUIClientContext *v6;

  v5 = (SUUIClientContext *)a3;
  if (self->_clientContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_clientContext, a3);
    -[SUUISearchFieldController setClientContext:](self->_searchFieldController, "setClientContext:", self->_clientContext);
    v5 = v6;
  }

}

- (void)setSearchFieldPlaceholderText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SUUIIPadSearchController _searchFieldController](self, "_searchFieldController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPlaceholder:", v4);
}

- (void)setSearchFieldText:(id)a3
{
  -[SUUISearchFieldController setSearchTerm:](self->_searchFieldController, "setSearchTerm:", a3);
}

- (id)newSearchFieldBarItem
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIIPadSearchController _searchFieldController](self, "_searchFieldController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v3);

  return v4;
}

- (void)reloadSearchField
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "lastSearchTerm");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIIPadSearchController setSearchFieldText:](self, "setSearchFieldText:", v3);

}

- (void)setNumberOfSearchResults:(int64_t)a3
{
  id v4;

  -[SUUIIPadSearchController _searchFieldController](self, "_searchFieldController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfSearchResults:", a3);

}

+ (void)setLastSearchTerm:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_LastSearchTerm;
  _LastSearchTerm = v3;

}

+ (NSString)lastSearchTerm
{
  return (NSString *)(id)_LastSearchTerm;
}

- (void)searchFieldController:(id)a3 requestSearch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a4)
  {
    v5 = a4;
    v6 = (void *)objc_opt_class();
    objc_msgSend(v5, "term");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastSearchTerm:", v7);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("SUUIIPadSearchControllerTermDidChangeNotification"), self);

    objc_msgSend(v5, "term");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIXEventSearchDictionary(v9, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    -[SUUIIPadSearchController clientContext](self, "clientContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendOnXEventWithDictionary:completionBlock:", v13, 0);

  }
}

- (void)_termDidChangeNotification:(id)a3
{
  SUUIIPadSearchController *v4;

  objc_msgSend(a3, "object");
  v4 = (SUUIIPadSearchController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[SUUIIPadSearchController reloadSearchField](self, "reloadSearchField");
}

- (id)_searchFieldController
{
  SUUISearchFieldController *searchFieldController;
  SUUISearchFieldController *v4;
  void *v5;
  SUUISearchFieldController *v6;
  SUUISearchFieldController *v7;

  searchFieldController = self->_searchFieldController;
  if (!searchFieldController)
  {
    v4 = [SUUISearchFieldController alloc];
    -[SUUIIPadSearchController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUISearchFieldController initWithContentsController:clientContext:](v4, "initWithContentsController:clientContext:", v5, self->_clientContext);
    v7 = self->_searchFieldController;
    self->_searchFieldController = v6;

    -[SUUISearchFieldController setDelegate:](self->_searchFieldController, "setDelegate:", self);
    -[SUUISearchFieldController setShowsResultsForEmptyField:](self->_searchFieldController, "setShowsResultsForEmptyField:", 1);
    -[SUUIIPadSearchController reloadSearchField](self, "reloadSearchField");
    searchFieldController = self->_searchFieldController;
  }
  return searchFieldController;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_searchFieldController, 0);
}

@end
