@implementation DSReadOnlyResourceSharingController

- (DSReadOnlyResourceSharingController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DSReadOnlyResourceSharingController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  NSMutableSet *selectedPeople;
  NSMutableSet *v15;
  NSMutableSet *selectedTypes;
  objc_super v18;

  DSUILocStringForKey(CFSTR("READ_ONLY_SHARING_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("READ_ONLY_SHARING_BY_PEOPLE_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)DSReadOnlyResourceSharingController;
  v7 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v18, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v4, v6, 0, 1);

  if (v7)
  {
    DSUILocStringForKey(CFSTR("SKIP"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v7, v8, v7, sel_reviewReadOnlySharingCompleted);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](v7, "setBoldButton:", v9);

    DSUILocStringForKey(CFSTR("READ_ONLY_SHARING_REVIEW_ALL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v7, v11, v7, sel__reviewAllSharing);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](v7, "setLinkButton:", v12);

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    selectedPeople = v7->_selectedPeople;
    v7->_selectedPeople = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    selectedTypes = v7->_selectedTypes;
    v7->_selectedTypes = v15;

  }
  return v7;
}

- (BOOL)shouldShow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  -[DSReadOnlyResourceSharingController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "fetchedSharingPermissions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController setPermissions:](self, "setPermissions:", v4);

    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allReadOnlySharingTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = 1;
    }
    else
    {
      -[DSReadOnlyResourceSharingController permissions](self, "permissions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allReadOnlySharingPeople");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "count") != 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSReadOnlyResourceSharingController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DSReadOnlyResourceSharingController reloadTableViewData](self, "reloadTableViewData");
  -[DSReadOnlyResourceSharingController _updateButton](self, "_updateButton");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)DSReadOnlyResourceSharingController;
  -[DSTableWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("BY_PERSON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  DSUILocStringForKey(CFSTR("BY_TYPE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScopeButtonTitles:", v5);

  DSUILocStringForKey(CFSTR("SEARCH_SHARING_TYPE_PLACEHOLDER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholder:", v8);

}

- (void)_reviewAllSharing
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[DSReadOnlyResourceSharingController scope](self, "scope");
  -[DSReadOnlyResourceSharingController permissions](self, "permissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3 == 1)
  {
    objc_msgSend(v4, "allReadOnlySharingTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController _pushDetailPaneForSharingTypes:](self, "_pushDetailPaneForSharingTypes:", v5);
  }
  else
  {
    objc_msgSend(v4, "allReadOnlySharingPeople");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController _pushDetailPaneForSharingPeople:](self, "_pushDetailPaneForSharingPeople:", v5);
  }

}

- (void)_pushDetailPaneForSharingTypes:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    +[DSReadOnlyResourceSharingDetailController initWithSharingTypes:startingViewController:delegate:](DSReadOnlyResourceSharingDetailController, "initWithSharingTypes:startingViewController:delegate:", v6, self, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  }
}

- (void)_pushDetailPaneForSharingPeople:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    +[DSReadOnlyResourceSharingDetailController initWithSharingPeople:startingViewController:delegate:](DSReadOnlyResourceSharingDetailController, "initWithSharingPeople:startingViewController:delegate:", v6, self, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  }
}

- (void)_updateButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  -[DSTableWelcomeController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedScopeButtonIndex");

  if (v5)
    -[DSReadOnlyResourceSharingController selectedTypes](self, "selectedTypes");
  else
    -[DSReadOnlyResourceSharingController selectedPeople](self, "selectedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  if (v7)
  {
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("REVIEW_SHARING"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_reviewSelectedSharing, 64);
  }
  else
  {
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "readOnlySharingPeopleCountWithFilter:", 0))
      v13 = CFSTR("SKIP");
    else
      v13 = CFSTR("CONTINUE");
    DSUILocStringForKey(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v11, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel_reviewReadOnlySharingCompleted, 64);

  }
  -[DSTableWelcomeController hideButtonsIfSearching](self, "hideButtonsIfSearching");
}

- (void)reviewSelectedSharing
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[DSReadOnlyResourceSharingController scope](self, "scope");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 1)
  {
    v32 = 0uLL;
    v33 = 0uLL;
    v30 = 0uLL;
    v31 = 0uLL;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[DSReadOnlyResourceSharingController permissions](self, "permissions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "readOnlySharingType:withFilter:", objc_msgSend(v13, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v7, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    -[DSReadOnlyResourceSharingController _pushDetailPaneForSharingTypes:](self, "_pushDetailPaneForSharingTypes:", v7);
  }
  else
  {
    v28 = 0uLL;
    v29 = 0uLL;
    v26 = 0uLL;
    v27 = 0uLL;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          -[DSReadOnlyResourceSharingController permissions](self, "permissions", (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "readOnlySharingPerson:withFilter:", objc_msgSend(v21, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v7, "addObject:", v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    -[DSReadOnlyResourceSharingController _pushDetailPaneForSharingPeople:](self, "_pushDetailPaneForSharingPeople:", v7);
  }

  -[DSReadOnlyResourceSharingController selectedTypes](self, "selectedTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  -[DSReadOnlyResourceSharingController selectedPeople](self, "selectedPeople");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAllObjects");

  -[DSReadOnlyResourceSharingController _updateButton](self, "_updateButton");
}

uint64_t __60__DSReadOnlyResourceSharingController_reviewSelectedSharing__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "row");
  if (v6 >= objc_msgSend(v5, "row"))
  {
    v8 = objc_msgSend(v4, "row");
    v7 = v8 > objc_msgSend(v5, "row");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "searchBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSReadOnlyResourceSharingController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v4, objc_msgSend(v6, "selectedScopeButtonIndex"));

}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  -[DSReadOnlyResourceSharingController setScope:](self, "setScope:", a4);
  -[DSReadOnlyResourceSharingController _updateButton](self, "_updateButton");
  -[DSTableWelcomeController searchController](self, "searchController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSReadOnlyResourceSharingController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v7, a4);

}

- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4
{
  uint64_t v5;
  unint64_t scope;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("displayName contains[c] %@"), a4, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  scope = self->_scope;
  v11 = (id)v5;
  if (!scope)
  {
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterReadOnlySharingPeopleWithPredicate:", v11);
    goto LABEL_5;
  }
  if (scope == 1)
  {
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterReadOnlySharingTypesWithPredicate:", v11);
LABEL_5:

  }
  -[DSReadOnlyResourceSharingController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", &stru_24EFF4790);

  -[DSReadOnlyResourceSharingController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetailText:", &stru_24EFF4790);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a4;
  v6 = -[DSReadOnlyResourceSharingController scope](self, "scope");
  if (!v6)
  {
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "readOnlySharingPerson:withFilter:", objc_msgSend(v5, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconForTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController selectedPeople](self, "selectedPeople");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v8);

    if (!v15)
      goto LABEL_7;
LABEL_6:
    -[OBTableWelcomeController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectRowAtIndexPath:animated:scrollPosition:", v5, 1, 0);

    goto LABEL_7;
  }
  if (v6 != 1)
  {
    v10 = 0;
    v9 = 0;
    goto LABEL_9;
  }
  -[DSReadOnlyResourceSharingController permissions](self, "permissions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readOnlySharingType:withFilter:", objc_msgSend(v5, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconForTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSReadOnlyResourceSharingController selectedTypes](self, "selectedTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if ((v12 & 1) != 0)
    goto LABEL_6;
LABEL_7:

LABEL_9:
  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v17, v9, &stru_24EFF4790, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setAccessoryType:", 0);
  return v18;
}

- (void)reloadTableViewData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DSReadOnlyResourceSharingController permissions](self, "permissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sort");

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSections:withRowAnimation:", v5, 100);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;

  v5 = -[DSReadOnlyResourceSharingController scope](self, "scope", a3, a4);
  -[DSReadOnlyResourceSharingController permissions](self, "permissions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DSTableWelcomeController isFiltering](self, "isFiltering");
  if (v5 == 1)
    v8 = objc_msgSend(v6, "readOnlySharingTypesCountWithFilter:", v7);
  else
    v8 = objc_msgSend(v6, "readOnlySharingPeopleCountWithFilter:", v7);
  v9 = v8;

  if (!-[DSTableWelcomeController isFiltering](self, "isFiltering"))
  {
    if (v9)
    {
      -[DSTableWelcomeController hideNoSharingView](self, "hideNoSharingView");
      -[DSReadOnlyResourceSharingController headerView](self, "headerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      DSUILocStringForKey(CFSTR("READ_ONLY_SHARING_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", v12);

      -[DSReadOnlyResourceSharingController headerView](self, "headerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[DSReadOnlyResourceSharingController scope](self, "scope") == 1)
        v14 = CFSTR("READ_ONLY_SHARING_BY_TYPE_DETAIL");
      else
        v14 = CFSTR("READ_ONLY_SHARING_BY_PEOPLE_DETAIL");
      DSUILocStringForKey(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDetailText:", v16);

      goto LABEL_18;
    }
    if (-[DSReadOnlyResourceSharingController scope](self, "scope") == 1)
      v19 = CFSTR("READ_ONLY_NO_SHARING_TYPE");
    else
      v19 = CFSTR("READ_ONLY_NO_SHARING_PEOPLE");
    DSUILocStringForKey(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("app.3.stack.3d.fill"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController showNoSharingViewWithText:image:](self, "showNoSharingViewWithText:image:", v13, v17);
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  if (!v9)
  {
    -[DSTableWelcomeController searchController](self, "searchController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController showNoResultsViewWithSearchText:](self, "showNoResultsViewWithSearchText:", v18);

    goto LABEL_17;
  }
  -[DSTableWelcomeController hideNoResultsView](self, "hideNoResultsView");
LABEL_19:
  -[DSReadOnlyResourceSharingController _updateButton](self, "_updateButton");
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedScopeButtonIndex");

  if (v8)
  {
    -[DSReadOnlyResourceSharingController selectedTypes](self, "selectedTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "row");

    objc_msgSend(v10, "readOnlySharingType:withFilter:", v11, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  }
  else
  {
    -[DSReadOnlyResourceSharingController selectedPeople](self, "selectedPeople");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "row");

    objc_msgSend(v10, "readOnlySharingPerson:withFilter:", v12, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

  -[DSReadOnlyResourceSharingController _updateButton](self, "_updateButton");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedScopeButtonIndex");

  if (v8)
  {
    -[DSReadOnlyResourceSharingController selectedTypes](self, "selectedTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "row");

    objc_msgSend(v10, "readOnlySharingType:withFilter:", v11, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  }
  else
  {
    -[DSReadOnlyResourceSharingController selectedPeople](self, "selectedPeople");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSReadOnlyResourceSharingController permissions](self, "permissions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "row");

    objc_msgSend(v10, "readOnlySharingPerson:withFilter:", v12, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v13);

  -[DSReadOnlyResourceSharingController _updateButton](self, "_updateButton");
}

- (void)reviewReadOnlySharingCompleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[DSReadOnlyResourceSharingController selectedTypes](self, "selectedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[DSReadOnlyResourceSharingController selectedPeople](self, "selectedPeople");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
        -[OBTableWelcomeController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v11, 0);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  -[DSReadOnlyResourceSharingController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushPaneAfterPaneType:", objc_opt_class());

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[DSReadOnlyResourceSharingController navigationController](self, "navigationController", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewControllers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v14, "addObject:", v21);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  -[DSReadOnlyResourceSharingController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setViewControllers:", v14);

}

- (void)learnMorePressedForSharingType:(id)a3
{
  void *v4;
  id v5;

  DSUILocStringForKey(CFSTR("NAVIGATION_LEARN_MORE_URL"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSReadOnlyResourceSharingController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "learnMorePressedForController:withURL:", self, v5);

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_permissions, a3);
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (NSMutableSet)selectedPeople
{
  return self->_selectedPeople;
}

- (void)setSelectedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPeople, a3);
}

- (NSMutableSet)selectedTypes
{
  return self->_selectedTypes;
}

- (void)setSelectedTypes:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTypes, 0);
  objc_storeStrong((id *)&self->_selectedPeople, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
