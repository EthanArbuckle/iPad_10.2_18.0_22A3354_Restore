@implementation DSTableWelcomeController

- (DSTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 shouldShowSearchBar:(BOOL)a6
{
  DSTableWelcomeController *v7;
  DSTableWelcomeController *v8;
  uint64_t v9;
  UIActivityIndicatorView *spinner;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DSTableWelcomeController;
  v7 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v12, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, a3, a4, a5, 1);
  v8 = v7;
  if (v7)
  {
    v7->_shouldShowSearchBar = a6;
    -[DSTableWelcomeController setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:](v7, "setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:", 0);
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinner = v8->_spinner;
  v8->_spinner = (UIActivityIndicatorView *)v9;

  v8->_isSpinnerActive = 0;
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DSTableWelcomeController;
  -[OBTableWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  if (-[DSTableWelcomeController shouldShowSearchBar](self, "shouldShowSearchBar"))
    -[DSTableWelcomeController setupSearchBar](self, "setupSearchBar");
  -[DSTableWelcomeController setupTableView](self, "setupTableView");
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("header"));

}

- (void)setupTableView
{
  DSTableView *v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(DSTableView);
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v3);

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

}

- (void)setupSearchBar
{
  UISearchController *v3;
  UISearchController *searchController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
  searchController = self->_searchController;
  self->_searchController = v3;

  -[DSTableWelcomeController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchResultsUpdater:", self);

  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObscuresBackgroundDuringPresentation:", 0);

  -[DSTableWelcomeController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholder:", &stru_24EFF4790);

  -[DSTableWelcomeController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[DSTableWelcomeController searchController](self, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[DSTableWelcomeController searchController](self, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsScopeBar:", 1);

  -[DSTableWelcomeController searchController](self, "searchController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[DSTableWelcomeController searchController](self, "searchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSearchController:", v14);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidesSearchBarWhenScrolling:", 0);

}

- (BOOL)isSearchBarEmpty
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[DSTableWelcomeController searchController](self, "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;

  return v5;
}

- (BOOL)isFiltering
{
  void *v4;
  char v5;

  if (-[DSTableWelcomeController isSearchBarEmpty](self, "isSearchBarEmpty"))
    return 0;
  -[DSTableWelcomeController searchController](self, "searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive");

  return v5;
}

- (BOOL)isKeyboardActive
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[DSTableWelcomeController searchController](self, "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  return v5;
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 continueHandler:(id)a5 tryAgainHandler:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v10 = (void *)MEMORY[0x24BEBD3B0];
  v11 = a6;
  v12 = a5;
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("TRY_AGAIN"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addAction:", v15);
  objc_msgSend(v19, "addAction:", v18);
  -[DSTableWelcomeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

}

- (void)presentErrorAlertController:(id)a3
{
  -[DSTableWelcomeController presentErrorAlertController:okHandler:](self, "presentErrorAlertController:okHandler:", a3, &__block_literal_global_17);
}

- (void)presentErrorAlertController:(id)a3 okHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BEBD3A8];
  v7 = a4;
  v8 = a3;
  DSUILocStringForKey(CFSTR("OK"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v9, 0, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v10);
  -[DSTableWelcomeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)hideKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[DSTableWelcomeController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[DSTableWelcomeController linkButton](self, "linkButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", -[DSTableWelcomeController isModelEmpty](self, "isModelEmpty"));

}

- (void)willPresentSearchController:(id)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *tapGesture;
  void *v6;
  void *v7;
  id v8;

  v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_hideKeyboard);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v4;

  -[DSTableWelcomeController tapGesture](self, "tapGesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCancelsTouchesInView:", 0);

  -[DSTableWelcomeController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController tapGesture](self, "tapGesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", v7);

}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  id v5;

  -[OBTableWelcomeController tableView](self, "tableView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController tapGesture](self, "tapGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", v4);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("DSCell"), a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x24BEBD9F8]);
  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;

  if (a4)
  {
    v4 = 0;
  }
  else if (-[DSTableWelcomeController isSpinnerActive](self, "isSpinnerActive", a3))
  {
    -[DSTableWelcomeController spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 3;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHighlighted:", 0);
}

- (void)startContentSpinner
{
  void *v3;
  void *v4;
  id v5;

  -[DSTableWelcomeController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

  -[DSTableWelcomeController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesWhenStopped:", 1);

  -[DSTableWelcomeController setIsSpinnerActive:](self, "setIsSpinnerActive:", 1);
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)stopContentSpinner
{
  void *v3;
  id v4;

  -[DSTableWelcomeController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  -[DSTableWelcomeController setIsSpinnerActive:](self, "setIsSpinnerActive:", 0);
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)addBorderedIcon:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = (objc_class *)MEMORY[0x24BEBD668];
  v5 = a3;
  v28 = (id)objc_msgSend([v4 alloc], "initWithImage:", v5);

  objc_msgSend(v28, "_setCornerRadius:", 13.0);
  objc_msgSend(v28, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v7 != 2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemLightGrayColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "CGColor");
    objc_msgSend(v28, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", v9);

    objc_msgSend(v28, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 1.0);

  }
  -[DSTableWelcomeController headerView](self, "headerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customIconContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v28);

  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v28, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 60.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v28, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 60.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  objc_msgSend(v28, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController headerView](self, "headerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "customIconContainerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  objc_msgSend(v28, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController headerView](self, "headerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "customIconContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

}

- (void)showNoSharingViewWithText:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[DSTableWelcomeController setIsShowingNoSharingView:](self, "setIsShowingNoSharingView:", 1);
  -[DSTableWelcomeController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", &stru_24EFF4790);

  -[DSTableWelcomeController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetailText:", &stru_24EFF4790);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecondaryText:", v7);

  objc_msgSend(v11, "setImage:", v6);
  -[DSTableWelcomeController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v11);

}

- (void)hideNoSharingView
{
  id v3;

  -[DSTableWelcomeController setIsShowingNoSharingView:](self, "setIsShowingNoSharingView:", 0);
  -[DSTableWelcomeController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)showNoResultsViewWithSearchText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[DSTableWelcomeController setIsShowingNoResultsView:](self, "setIsShowingNoResultsView:", 1);
  if (-[DSTableWelcomeController isShowingNoSharingView](self, "isShowingNoSharingView"))
    -[DSTableWelcomeController hideNoSharingView](self, "hideNoSharingView");
  objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("NO_RESULTS_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v5);

  v6 = (void *)MEMORY[0x24BDD17C8];
  DSUILocStringForKey(CFSTR("NO_RESULTS_SECONDARY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSecondaryText:", v8);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("magnifyingglass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  -[DSTableWelcomeController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v10);
}

- (void)hideNoResultsView
{
  -[DSTableWelcomeController setIsShowingNoResultsView:](self, "setIsShowingNoResultsView:", 0);
  -[DSTableWelcomeController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DSTableWelcomeController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v19, sel_viewDidLayoutSubviews);
  if (-[DSTableWelcomeController isShowingNoSharingView](self, "isShowingNoSharingView"))
  {
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v5 = v4;

    -[DSTableWelcomeController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMargins");
    v8 = v7;
    -[DSTableWelcomeController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMargins");
    v11 = v10;
    -[OBTableWelcomeController scrollView](self, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentInset");
    v14 = v5 + v13;
    -[DSTableWelcomeController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutMargins");
    v17 = v16;
    -[DSTableWelcomeController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLayoutMargins:", v8, v11, v14, v17);

  }
}

- (void)hideButtonsIfSearching
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  if (-[DSTableWelcomeController isKeyboardActive](self, "isKeyboardActive"))
  {
    -[DSTableWelcomeController headerView](self, "headerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", &stru_24EFF4790);

    -[DSTableWelcomeController headerView](self, "headerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetailText:", &stru_24EFF4790);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    -[DSTableWelcomeController linkButton](self, "linkButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    v7 = 1;
  }
  else
  {
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[DSTableWelcomeController linkButton](self, "linkButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[DSTableWelcomeController isModelEmpty](self, "isModelEmpty");
    v6 = v9;
  }
  objc_msgSend(v6, "setHidden:", v7);

}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
  objc_storeStrong((id *)&self->_boldButton, a3);
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (BOOL)shouldShowSearchBar
{
  return self->_shouldShowSearchBar;
}

- (void)setShouldShowSearchBar:(BOOL)a3
{
  self->_shouldShowSearchBar = a3;
}

- (void)setIsFiltering:(BOOL)a3
{
  self->_isFiltering = a3;
}

- (BOOL)isModelEmpty
{
  return self->_isModelEmpty;
}

- (void)setIsModelEmpty:(BOOL)a3
{
  self->_isModelEmpty = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIBarButtonItem)quickExitButton
{
  return self->_quickExitButton;
}

- (void)setQuickExitButton:(id)a3
{
  objc_storeStrong((id *)&self->_quickExitButton, a3);
}

- (BOOL)isShowingNoSharingView
{
  return self->_isShowingNoSharingView;
}

- (void)setIsShowingNoSharingView:(BOOL)a3
{
  self->_isShowingNoSharingView = a3;
}

- (BOOL)isShowingNoResultsView
{
  return self->_isShowingNoResultsView;
}

- (void)setIsShowingNoResultsView:(BOOL)a3
{
  self->_isShowingNoResultsView = a3;
}

- (BOOL)isSpinnerActive
{
  return self->_isSpinnerActive;
}

- (void)setIsSpinnerActive:(BOOL)a3
{
  self->_isSpinnerActive = a3;
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_quickExitButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
}

@end
