@implementation CKAppSearchResultsTableViewController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKAppSearchResultsTableViewController;
  -[CKAppSearchResultsTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CKAppSearchResultsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[CKAppManagerAppTableViewCell reuseIdentifier](CKAppManagerAppTableViewCell, "reuseIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  -[CKAppSearchResultsTableViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 0);
  -[CKAppSearchResultsTableViewController editButtonItem](self, "editButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppSearchResultsTableViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

}

- (void)searchEnded
{
  id v3;

  -[CKAppSearchResultsTableViewController setSearchResults:](self, "setSearchResults:", 0);
  -[CKAppSearchResultsTableViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CKAppSearchResultsTableViewController searchResults](self, "searchResults", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  CKAppManagerAppTableViewCell *v8;
  void *v9;
  CKAppManagerAppTableViewCell *v10;

  v5 = objc_msgSend(a4, "row", a3);
  -[CKAppSearchResultsTableViewController searchResults](self, "searchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [CKAppManagerAppTableViewCell alloc];
    +[CKAppManagerAppTableViewCell reuseIdentifier](CKAppManagerAppTableViewCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKAppManagerAppTableViewCell initWithStyle:reuseIdentifier:](v8, "initWithStyle:reuseIdentifier:", 0, v9);

    -[CKAppManagerAppTableViewCell updateCellWithPluginInfo:](v10, "updateCellWithPluginInfo:", v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "row") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKAppSearchResultsTableViewController searchResults](self, "searchResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "visibleDrawerPlugins");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v9);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v9, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateInteractionTimeForPlugin:", v13);

        objc_msgSend(v10, "commitInteractionTimeOrderingChanges");
      }
      -[CKAppSearchResultsTableViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "browserAppManagerDidSelectPlugin:", v9);

    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }

  }
  -[CKAppSearchResultsTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("browserDisplayName contains[cd] %@"), v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppSearchResultsTableViewController allPlugins](self, "allPlugins");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAppSearchResultsTableViewController setSearchResults:](self, "setSearchResults:", v7);
    -[CKAppSearchResultsTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
  else
  {
    -[CKAppSearchResultsTableViewController setSearchResults:](self, "setSearchResults:", 0);
    -[CKAppSearchResultsTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");
  }

}

- (NSArray)allPlugins
{
  return self->_allPlugins;
}

- (void)setAllPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_allPlugins, a3);
}

- (CKBrowserAppManagerViewControllerDelegate)delegate
{
  return (CKBrowserAppManagerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allPlugins, 0);
}

@end
