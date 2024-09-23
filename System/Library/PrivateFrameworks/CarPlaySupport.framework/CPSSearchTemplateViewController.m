@implementation CPSSearchTemplateViewController

- (CPSSearchTemplateViewController)initWithSearchTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5 interactionModel:(unint64_t)a6
{
  id v6;
  CPSListTemplateViewController *v7;
  CPSSearchTemplateViewController *v8;
  uint64_t v9;
  NAFuture *templateProviderFuture;
  CPSSearchTemplateViewController *v12;
  CPSSearchTemplateViewController *v13;
  UISearchController *v14;
  CPSSearchTemplateViewController *v15;
  UISearchController *v16;
  UISearchController *v17;
  id v21;
  id v22;
  id v23[2];
  id v24;
  id v25;
  id location[2];
  CPSSearchTemplateViewController *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23[1] = (id)a6;
  v6 = objc_alloc(MEMORY[0x24BDB79F8]);
  v23[0] = (id)objc_msgSend(v6, "initWithTitle:sections:", 0, MEMORY[0x24BDBD1A8]);
  v7 = [CPSListTemplateViewController alloc];
  v22 = -[CPSListTemplateViewController initWithListTemplate:templateDelegate:templateEnvironment:](v7, "initWithListTemplate:templateDelegate:templateEnvironment:", v23[0], v23[0], v24);
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D68]), "initWithSearchResultsController:", v22);
  objc_msgSend(v21, "_setRequestedInteractionModel:", a6);
  v8 = v27;
  v27 = 0;
  v27 = -[UISearchContainerViewController initWithSearchController:](v8, "initWithSearchController:", v21);
  objc_storeStrong((id *)&v27, v27);
  if (v27)
  {
    objc_storeStrong((id *)&v27->_templateDelegate, v25);
    objc_storeStrong((id *)&v27->_associatedTemplate, location[0]);
    v9 = objc_opt_new();
    templateProviderFuture = v27->_templateProviderFuture;
    v27->_templateProviderFuture = (NAFuture *)v9;

    objc_msgSend(v23[0], "connectTemplateProvider:", v22);
    objc_msgSend(v23[0], "setDelegate:", v27);
    objc_storeStrong((id *)&v27->_listTemplate, v23[0]);
    v13 = v27;
    v14 = -[UISearchContainerViewController searchController](v27, "searchController");
    -[UISearchController setDelegate:](v14, "setDelegate:", v13);

    v15 = v27;
    v16 = -[UISearchContainerViewController searchController](v27, "searchController");
    -[UISearchController setSearchResultsUpdater:](v16, "setSearchResultsUpdater:", v15);

    v17 = -[UISearchContainerViewController searchController](v27, "searchController");
    -[UISearchController setHidesNavigationBarDuringPresentation:](v17, "setHidesNavigationBarDuringPresentation:", 0);

  }
  v12 = v27;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v27, 0);
  return v12;
}

- (void)setDidPop:(BOOL)a3
{
  if (self->_didPop != a3)
  {
    self->_didPop = a3;
    if (a3 && -[CPSSearchTemplateViewController didDisappear](self, "didDisappear"))
      -[CPSSearchTemplateViewController _cleanup](self, "_cleanup");
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  if (self->_didDisappear != a3)
  {
    self->_didDisappear = a3;
    if (a3 && -[CPSSearchTemplateViewController didPop](self, "didPop"))
      -[CPSSearchTemplateViewController _cleanup](self, "_cleanup");
  }
}

- (void)removeFromParentViewController
{
  objc_super v2;
  SEL v3;
  CPSSearchTemplateViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSSearchTemplateViewController;
  -[CPSSearchTemplateViewController removeFromParentViewController](&v2, sel_removeFromParentViewController);
  -[CPSSearchTemplateViewController _cleanup](v4, "_cleanup");
}

- (void)_cleanup
{
  UISearchController *v2;
  CPSTemplateViewControllerDelegate *v3;

  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  v2 = -[UISearchContainerViewController searchController](self, "searchController");
  -[UISearchController setActive:](v2, "setActive:", 0);

  v3 = -[CPSSearchTemplateViewController viewControllerDelegate](self, "viewControllerDelegate");
  -[CPSTemplateViewControllerDelegate templateViewControllerDidPop:](v3, "templateViewControllerDidPop:", self);

}

- (void)viewDidLoad
{
  CPSSearchTemplateViewController *v2;
  UISearchBar *v3;
  UISearchController *v4;
  UISearchBar *v5;
  UISearchController *v6;
  UISearchBar *v7;
  UISearchController *v8;
  id v9;
  id v10;
  id v11;
  UISearchBar *v12;
  UISearchController *v13;
  id v14;
  NAFuture *v15;
  objc_super v16;
  SEL v17;
  CPSSearchTemplateViewController *v18;

  v18 = self;
  v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)CPSSearchTemplateViewController;
  -[UISearchContainerViewController viewDidLoad](&v16, sel_viewDidLoad);
  v2 = v18;
  v4 = -[UISearchContainerViewController searchController](v18, "searchController");
  v3 = -[UISearchController searchBar](v4, "searchBar");
  -[UISearchBar setDelegate:](v3, "setDelegate:", v2);

  v6 = -[UISearchContainerViewController searchController](v18, "searchController");
  v5 = -[UISearchController searchBar](v6, "searchBar");
  -[UISearchBar setShowsCancelButton:](v5, "setShowsCancelButton:", 1);

  v8 = -[UISearchContainerViewController searchController](v18, "searchController");
  v7 = -[UISearchController searchBar](v8, "searchBar");
  -[UISearchBar setSearchBarStyle:](v7, "setSearchBarStyle:");

  v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v9 = (id)-[CPSSearchTemplateViewController view](v18, "view");
  objc_msgSend(v9, "setBackgroundColor:", v10);

  v13 = -[UISearchContainerViewController searchController](v18, "searchController");
  v12 = -[UISearchController searchBar](v13, "searchBar");
  v11 = (id)-[CPSSearchTemplateViewController navigationItem](v18, "navigationItem");
  objc_msgSend(v11, "setTitleView:", v12);

  v14 = (id)-[CPSSearchTemplateViewController navigationItem](v18, "navigationItem");
  objc_msgSend(v14, "setHidesBackButton:", 1);

  -[CPSSearchTemplateViewController setDefinesPresentationContext:](v18, "setDefinesPresentationContext:", 1);
  -[CPSSearchTemplateViewController setExtendedLayoutIncludesOpaqueBars:](v18, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[CPSSearchTemplateViewController setEdgesForExtendedLayout:](v18, "setEdgesForExtendedLayout:", 1);
  v15 = -[CPSSearchTemplateViewController templateProviderFuture](v18, "templateProviderFuture");
  -[NAFuture finishWithResult:](v15, "finishWithResult:", v18);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSSearchTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  -[CPSSearchTemplateViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[CPSSearchTemplateViewController setDidPop:](v11, "setDidPop:", 0);
  -[CPSSearchTemplateViewController setDidDisappear:](v11, "setDidDisappear:", 0);
  v6 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSSearchTemplateViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateWillAppearWithIdentifier:animated:](v5, "templateWillAppearWithIdentifier:animated:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSSearchTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  -[UISearchContainerViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v6 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSSearchTemplateViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateDidAppearWithIdentifier:animated:](v5, "templateDidAppearWithIdentifier:animated:");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSSearchTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  -[CPSSearchTemplateViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  v6 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSSearchTemplateViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateWillDisappearWithIdentifier:animated:](v5, "templateWillDisappearWithIdentifier:animated:");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSSearchTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSSearchTemplateViewController;
  -[UISearchContainerViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  v6 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSSearchTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSSearchTemplateViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateDidDisappearWithIdentifier:animated:](v5, "templateDidDisappearWithIdentifier:animated:");

  }
  -[CPSSearchTemplateViewController setDidDisappear:](v11, "setDidDisappear:", 1);
}

- (CPSearchTemplate)searchTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSSearchTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_14(v3, v4);

  return (CPSearchTemplate *)v5;
}

- (CPSearchClientTemplateDelegate)searchTemplateDelegate
{
  return -[CPSSearchTemplateViewController templateDelegate](self, "templateDelegate", a2, self);
}

- (void)_cps_viewControllerWasPopped
{
  CPSTemplateViewControllerDelegate *v2;
  void *v3;
  UIViewController *v4;
  UISearchController *v5;
  id location[2];
  CPSSearchTemplateViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  v3 = (void *)objc_opt_class();
  v5 = -[UISearchContainerViewController searchController](v7, "searchController");
  v4 = -[UISearchController searchResultsController](v5, "searchResultsController");
  location[0] = CPSSafeCast_14(v3, v4);

  if (location[0])
  {
    v2 = -[CPSSearchTemplateViewController viewControllerDelegate](v7, "viewControllerDelegate");
    -[CPSTemplateViewControllerDelegate templateViewControllerDidPop:](v2, "templateViewControllerDidPop:", location[0]);

  }
  -[CPSSearchTemplateViewController setDidPop:](v7, "setDidPop:", 1);
  objc_storeStrong(location, 0);
}

- (void)listTemplate:(id)a3 didSelectListItem:(id)a4 completionHandler:(id)a5
{
  id v5;
  id v6;
  CPSearchTemplate *v7;
  CPSearchClientTemplateDelegate *v8;
  CPSearchClientTemplateDelegate *v11;
  char v12;
  id v13;
  id v14;
  id location[2];
  CPSSearchTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v11 = -[CPSSearchTemplateViewController searchTemplateDelegate](v16, "searchTemplateDelegate");
  v12 = -[CPSearchClientTemplateDelegate conformsToProtocol:](v11, "conformsToProtocol:", &unk_255452270);

  if ((v12 & 1) != 0)
  {
    v8 = -[CPSSearchTemplateViewController searchTemplateDelegate](v16, "searchTemplateDelegate");
    v7 = -[CPSSearchTemplateViewController searchTemplate](v16, "searchTemplate");
    v6 = (id)-[CPSearchTemplate identifier](v7, "identifier");
    v5 = (id)objc_msgSend(v14, "identifier");
    -[CPSearchClientTemplateDelegate searchTemplateWithIdentifier:selectedResultWithIdentifier:completionHandler:](v8, "searchTemplateWithIdentifier:selectedResultWithIdentifier:completionHandler:", v6);

  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;
  CPSearchTemplate *v4;
  CPSearchClientTemplateDelegate *v5;
  CPSearchClientTemplateDelegate *v6;
  char v7;
  id location[2];
  CPSSearchTemplateViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSSearchTemplateViewController searchTemplateDelegate](v9, "searchTemplateDelegate");
  v7 = -[CPSearchClientTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_255452270);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSSearchTemplateViewController searchTemplateDelegate](v9, "searchTemplateDelegate");
    v4 = -[CPSSearchTemplateViewController searchTemplate](v9, "searchTemplate");
    v3 = (id)-[CPSearchTemplate identifier](v4, "identifier");
    -[CPSearchClientTemplateDelegate searchTemplateSearchButtonPressedWithIdentifier:](v5, "searchTemplateSearchButtonPressedWithIdentifier:");

  }
  objc_storeStrong(location, 0);
}

- (BOOL)searchBarShouldEndEditing:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v8;
  UIViewController *v9;
  UISearchController *v10;
  char v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id location[2];
  CPSSearchTemplateViewController *v17;
  BOOL v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (void *)objc_opt_class();
  v10 = -[UISearchContainerViewController searchController](v17, "searchController");
  v9 = -[UISearchController searchResultsController](v10, "searchResultsController");
  v8 = CPSSafeCast_14(v7, v9);
  objc_initWeak(&v15, v8);

  v13 = 0;
  v11 = 0;
  v6 = (id)-[CPSSearchTemplateViewController viewIfLoaded](v17, "viewIfLoaded");
  v4 = (id)objc_msgSend(v6, "window");
  v5 = 1;
  if (v4)
  {
    v14 = objc_loadWeakRetained(&v15);
    v13 = 1;
    v12 = (id)objc_msgSend(v14, "dataSource");
    v11 = 1;
    v5 = 1;
    if (objc_msgSend(v12, "numberOfItems") <= 0)
    {
      v5 = 1;
      if (-[CPSSearchTemplateViewController _isSceneActive](v17, "_isSceneActive"))
        v5 = -[CPSSearchTemplateViewController _appearState](v17, "_appearState") != 2;
    }
  }
  v18 = v5;
  if ((v11 & 1) != 0)

  if ((v13 & 1) != 0)
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
  return v18;
}

- (BOOL)_isSceneActive
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;

  v5 = (id)-[CPSSearchTemplateViewController view](self, "view");
  v4 = (id)objc_msgSend(v5, "window");
  v3 = (id)objc_msgSend(v4, "windowScene");
  v6 = objc_msgSend(v3, "activationState");

  v7 = 1;
  if (v6)
    return v6 == 1;
  return v7;
}

- (void)didDismissSearchController:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  char isKindOfClass;
  id location[2];
  CPSSearchTemplateViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)-[CPSSearchTemplateViewController navigationController](v9, "navigationController");
  v5 = (id)objc_msgSend(v6, "topViewController");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v4 = (id)-[CPSSearchTemplateViewController navigationController](v9, "navigationController");
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
  objc_storeStrong(location, 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v3;
  id v4;
  CPSearchClientTemplateDelegate *v5;
  id v6;
  CPSearchClientTemplateDelegate *v7;
  char v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(id *, void *);
  void *v13;
  id v14;
  id from;
  id v16;
  id v17;
  id location[2];
  CPSSearchTemplateViewController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[CPSSearchTemplateViewController searchTemplateDelegate](v19, "searchTemplateDelegate");
  v8 = -[CPSearchClientTemplateDelegate conformsToProtocol:](v7, "conformsToProtocol:", &unk_255452270);

  if ((v8 & 1) != 0)
  {
    v17 = -[CPSSearchTemplateViewController searchTemplate](v19, "searchTemplate");
    v6 = (id)objc_msgSend(location[0], "searchBar");
    v16 = (id)objc_msgSend(v6, "text");

    objc_initWeak(&from, v19);
    v5 = -[CPSSearchTemplateViewController searchTemplateDelegate](v19, "searchTemplateDelegate");
    v3 = (id)objc_msgSend(v17, "identifier");
    v4 = v16;
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __74__CPSSearchTemplateViewController_updateSearchResultsForSearchController___block_invoke;
    v13 = &unk_24E270948;
    objc_copyWeak(&v14, &from);
    -[CPSearchClientTemplateDelegate searchTemplateWithIdentifier:updateSearchResultsForSearchText:completionResults:](v5, "searchTemplateWithIdentifier:updateSearchResultsForSearchText:completionResults:", v3, v4, &v9);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(location, 0);
}

void __74__CPSSearchTemplateViewController_updateSearchResultsForSearchController___block_invoke(id *a1, void *a2)
{
  id v2;
  id v4;
  id v5;
  id WeakRetained;
  id v7[2];
  id location[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  v2 = objc_alloc(MEMORY[0x24BDB79F0]);
  v7[0] = (id)objc_msgSend(v2, "initWithItems:", location[0]);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v5 = (id)objc_msgSend(WeakRetained, "listTemplate");
  v9[0] = v7[0];
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  objc_msgSend(v5, "updateSections:");

  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (CPSTemplateViewControllerDelegate)viewControllerDelegate
{
  return (CPSTemplateViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (void)setViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerDelegate, a3);
}

- (CPTemplate)associatedTemplate
{
  return self->_associatedTemplate;
}

- (void)setAssociatedTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_associatedTemplate, a3);
}

- (CPTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_templateDelegate, a3);
}

- (CPListTemplate)listTemplate
{
  return self->_listTemplate;
}

- (void)setListTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_listTemplate, a3);
}

- (BOOL)didPop
{
  return self->_didPop;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listTemplate, 0);
  objc_storeStrong((id *)&self->_templateDelegate, 0);
  objc_storeStrong((id *)&self->_associatedTemplate, 0);
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
}

@end
