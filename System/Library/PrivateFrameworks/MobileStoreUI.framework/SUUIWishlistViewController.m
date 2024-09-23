@implementation SUUIWishlistViewController

- (SUUIWishlistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIWishlistViewController *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIWishlistViewController;
  v4 = -[SUUIWishlistViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    if ((objc_msgSend(MEMORY[0x24BEBD3C8], "shouldMakeUIForDefaultPNG") & 1) == 0)
      -[SUUIWishlistViewController setTitle:](v4, "setTitle:", CFSTR("Wish List"));
    v4->_wishlistState = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__AccountsChanged, (CFStringRef)*MEMORY[0x24BEB2C48], 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__wishlistDidChangeNotification_, 0x251213DE8, 0);

  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BEB2C48], 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, 0x251213DE8, 0);
  -[SUUIItemListTableViewController setDelegate:](self->_itemListViewController, "setDelegate:", 0);

  v5.receiver = self;
  v5.super_class = (Class)SUUIWishlistViewController;
  -[SUUIViewController dealloc](&v5, sel_dealloc);
}

+ (id)wishlistBarButtonItemWithClientContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BEBD410]);
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:", CFSTR("WISH_LIST_BUTTON"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_BUTTON"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIButtonBarListIcon.png"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageFlippedForRightToLeftLayoutDirection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v7);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = 2.0;
  if (v9 == 1)
    v10 = 3.0;
  objc_msgSend(v4, "setImageInsets:", v10, 0.0, 0.0, 0.0);

  return v4;
}

- (void)setClientContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BEBD3C8], "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:", CFSTR("WISH_LIST_TAB_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_TAB_TITLE"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIWishlistViewController setTitle:](self, "setTitle:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIWishlistViewController;
  -[SUUIViewController setClientContext:](&v6, sel_setClientContext_, v4);

}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SUUIWishlistViewController _itemListViewController](self, "_itemListViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _UIBackdropView *backdropView;
  _UIBackdropView *v11;
  _UIBackdropView *v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceIdiom"))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v9 = SUUICompactThreshold();

    if (v8 > v9)
      goto LABEL_8;
  }
  else
  {

  }
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    v11 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 10060);
    v12 = self->_backdropView;
    self->_backdropView = v11;

    backdropView = self->_backdropView;
  }
  objc_msgSend(v13, "addSubview:", backdropView);
LABEL_8:
  -[SUUIWishlistViewController setView:](self, "setView:", v13);
  -[SUUIWishlistViewController _reloadChildView](self, "_reloadChildView");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  _UIBackdropView *v4;
  _UIBackdropView *backdropView;
  objc_super v6;

  if (!self->_backdropView)
  {
    -[SUUIWishlistViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIPopoverBackdropViewForView(v3);
    v4 = (_UIBackdropView *)objc_claimAutoreleasedReturnValue();
    backdropView = self->_backdropView;
    self->_backdropView = v4;

  }
  v6.receiver = self;
  v6.super_class = (Class)SUUIWishlistViewController;
  -[SUUIWishlistViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if ((unint64_t)(-[SUUIWishlistViewController _wishlistState](self, "_wishlistState") - 3) <= 1)
    -[SUUIWishlistViewController _syncWishlist](self, "_syncWishlist");
  if (self->_reloadOnNextAppear)
  {
    self->_reloadOnNextAppear = 0;
    -[SUUIWishlistViewController _reloadWishlist](self, "_reloadWishlist");
  }
  -[SUUIWishlistViewController _reloadNavigationBarAnimated:](self, "_reloadNavigationBarAnimated:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SUUIWishlistViewController;
  -[SUUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x24BEBD4B8];
  v8 = a4;
  objc_msgSend(v7, "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIWishlistViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[_UIBackdropView setHidden:](self->_backdropView, "setHidden:", 1);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__SUUIWishlistViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_2511F4640;
  v12[4] = self;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", &__block_literal_global_68, v12);
  v11.receiver = self;
  v11.super_class = (Class)SUUIWishlistViewController;
  -[SUUIWishlistViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

void __81__SUUIWishlistViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setHidden:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

- (void)itemList:(id)a3 didDeselectItem:(id)a4 atIndexPath:(id)a5
{
  if (self->_editing)
    -[SUUIWishlistViewController _updateDeleteButton](self, "_updateDeleteButton", a3, a4, a5);
}

- (void)itemList:(id)a3 didRemoveItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIWishlistViewController _deleteItemsAtIndexPaths:](self, "_deleteItemsAtIndexPaths:", v7, v8, v9);
}

- (void)itemList:(id)a3 didSelectItem:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id WeakRetained;
  char v9;
  SUUIIPhoneProductPageViewController *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  if (self->_editing)
  {
    -[SUUIWishlistViewController _updateDeleteButton](self, "_updateDeleteButton");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = (SUUIIPhoneProductPageViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      -[SUUIViewController wishlist:didSelectItem:atIndexPath:](v10, "wishlist:didSelectItem:atIndexPath:", self, v13, v7);
    }
    else
    {
      v10 = -[SUUIIPhoneProductPageViewController initWithItem:]([SUUIIPhoneProductPageViewController alloc], "initWithItem:", v13);
      -[SUUIViewController clientContext](self, "clientContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController setClientContext:](v10, "setClientContext:", v11);

      -[SUUIWishlistViewController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pushViewController:animated:", v10, 1);

    }
  }

}

- (void)_wishlistDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SUUIWishlistViewController _wishlist](self, "_wishlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    if (SUUIViewControllerIsVisible(self))
    {
      -[SUUIWishlistViewController _reloadWishlist](self, "_reloadWishlist");
    }
    else
    {
      if (self->_reloadOnNextAppear)
        v7 = 1;
      else
        v7 = -[SUUIWishlistViewController isViewLoaded](self, "isViewLoaded");
      self->_reloadOnNextAppear = v7;
    }
  }
}

- (void)_deleteAction:(id)a3
{
  void *v4;
  id v5;

  -[SUUIItemListTableViewController tableView](self->_itemListViewController, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedRows");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SUUIWishlistViewController _deleteItemsAtIndexPaths:](self, "_deleteItemsAtIndexPaths:", v5);
  -[SUUIWishlistViewController _setEditing:animated:](self, "_setEditing:animated:", 0, 1);

}

- (void)_doneAction:(id)a3
{
  -[SUUIWishlistViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_signInAction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "setEnabled:", 0);
  v5 = objc_alloc(MEMORY[0x24BEB1F28]);
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithAccount:", v7);

  objc_msgSend(v8, "setPromptStyle:", 1);
  objc_initWeak(&location, self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__SUUIWishlistViewController__signInAction___block_invoke;
  v10[3] = &unk_2511FA7D0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "startWithAuthenticateResponseBlock:", v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __44__SUUIWishlistViewController__signInAction___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __44__SUUIWishlistViewController__signInAction___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __44__SUUIWishlistViewController__signInAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishSignInWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_toggleEditAction:(id)a3
{
  -[SUUIWishlistViewController _setEditing:animated:](self, "_setEditing:animated:", !self->_editing, 1);
}

- (void)_deleteItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SUUIWishlistViewController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = self;
  -[SUUIWishlist items](self->_wishlist, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "row");
        objc_msgSend(v6, "addIndex:", v13);
        objc_msgSend(v5, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v14, "itemIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  -[SUUIWishlist removeItemsWithItemIdentifiers:](v18->_wishlist, "removeItemsWithItemIdentifiers:", v7);
  -[SUUIItemListTableViewController deleteRowsAtIndexPaths:](v18->_itemListViewController, "deleteRowsAtIndexPaths:", v8);
  -[SUUIWishlist items](v18->_wishlist, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17)
    -[SUUIWishlistViewController _reloadChildView](v18, "_reloadChildView");

}

- (void)_destroyEmptyWishlistView
{
  _UIContentUnavailableView *emptyWishlistView;

  -[_UIContentUnavailableView removeFromSuperview](self->_emptyWishlistView, "removeFromSuperview");
  emptyWishlistView = self->_emptyWishlistView;
  self->_emptyWishlistView = 0;

}

- (id)_emptyWishlistView
{
  _UIContentUnavailableView *emptyWishlistView;
  id v4;
  _UIContentUnavailableView *v5;
  _UIContentUnavailableView *v6;
  _UIContentUnavailableView *v7;
  _QWORD v9[4];
  id v10;
  id location;

  emptyWishlistView = self->_emptyWishlistView;
  if (!emptyWishlistView)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x24BEBDBB0]);
    v5 = (_UIContentUnavailableView *)objc_msgSend(v4, "initWithFrame:title:style:", 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_emptyWishlistView;
    self->_emptyWishlistView = v5;

    v7 = self->_emptyWishlistView;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__SUUIWishlistViewController__emptyWishlistView__block_invoke;
    v9[3] = &unk_2511F53F8;
    objc_copyWeak(&v10, &location);
    -[_UIContentUnavailableView setButtonAction:](v7, "setButtonAction:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    emptyWishlistView = self->_emptyWishlistView;
  }
  return emptyWishlistView;
}

void __48__SUUIWishlistViewController__emptyWishlistView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signInAction:", 0);

}

- (void)_finishSignInWithResponse:(id)a3 error:(id)a4
{
  if (objc_msgSend(a3, "authenticateResponseType") == 4)
  {
    self->_wishlistState = 4;
    -[SUUIWishlistViewController _reloadChildView](self, "_reloadChildView");
    -[SUUIWishlistViewController _syncWishlist](self, "_syncWishlist");
  }
}

- (void)_finishSyncWithResult:(BOOL)a3 didChange:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  SUUISyncWishlistOperation *syncOperation;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v12 = a5;
  -[SUUISyncWishlistOperation setResultBlock:](self->_syncOperation, "setResultBlock:", 0);
  syncOperation = self->_syncOperation;
  self->_syncOperation = 0;

  if (v6)
  {
    self->_wishlistState = 2;
    if (v5)
      -[SUUIWishlist postChangeNotification](self->_wishlist, "postChangeNotification");
    goto LABEL_8;
  }
  v9 = v12;
  if (self->_wishlistState == 4)
  {
    if (objc_msgSend(v12, "code") != 1
      || (objc_msgSend(v12, "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB2BC8]),
          v10,
          !v11))
    {
      -[SUUIViewController showError:](self, "showError:", v12);
      goto LABEL_10;
    }
    self->_wishlistState = 1;
LABEL_8:
    -[SUUIWishlistViewController _reloadChildView](self, "_reloadChildView");
LABEL_10:
    v9 = v12;
  }

}

- (BOOL)_isEditingEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SUUIWishlistViewController _wishlist](self, "_wishlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_itemListViewController
{
  SUUIItemListTableViewController *itemListViewController;
  SUUIItemListTableViewController *v4;
  SUUIItemListTableViewController *v5;
  SUUIItemListTableViewController *v6;
  void *v7;
  void *v8;
  SUUIItemListTableViewController *v9;
  void *v10;
  void *v11;

  itemListViewController = self->_itemListViewController;
  if (!itemListViewController)
  {
    v4 = objc_alloc_init(SUUIItemListTableViewController);
    v5 = self->_itemListViewController;
    self->_itemListViewController = v4;

    v6 = self->_itemListViewController;
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemListTableViewController setClientContext:](v6, "setClientContext:", v7);

    -[SUUIItemListTableViewController setDelegate:](self->_itemListViewController, "setDelegate:", self);
    -[SUUIItemListTableViewController setRowHeight:](self->_itemListViewController, "setRowHeight:", 84.0);
    -[SUUIItemListTableViewController setSelectionStyle:](self->_itemListViewController, "setSelectionStyle:", 1);
    +[SUUIItemArtworkContext wishlistContext](SUUIItemArtworkContext, "wishlistContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIItemListTableViewController setArtworkContext:](self->_itemListViewController, "setArtworkContext:", v8);
    v9 = self->_itemListViewController;
    objc_msgSend(v8, "imageSizeForItem:", 0);
    -[SUUIItemListTableViewController setImageBoundingSize:](v9, "setImageBoundingSize:");
    -[SUUIItemListTableViewController setItemCellClass:](self->_itemListViewController, "setItemCellClass:", objc_opt_class());
    -[SUUIWishlistViewController addChildViewController:](self, "addChildViewController:", self->_itemListViewController);
    -[SUUIItemListTableViewController tableView](self->_itemListViewController, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsMultipleSelectionDuringEditing:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    objc_msgSend(v10, "setSeparatorStyle:", 0);
    itemListViewController = self->_itemListViewController;
  }
  return itemListViewController;
}

- (void)_reloadChildView
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  SUUIItemList *v7;
  void *v8;
  _UIContentUnavailableView *v9;
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
  id v20;
  _UIContentUnavailableView *v21;

  v3 = -[SUUIWishlistViewController _wishlistState](self, "_wishlistState");
  if ((unint64_t)(v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      v9 = 0;
      goto LABEL_25;
    }
    -[SUUIViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIWishlistViewController _emptyWishlistView](self, "_emptyWishlistView");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("EMPTY_WISHLIST_SIGN_IN_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("EMPTY_WISHLIST_SIGN_IN_TITLE"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:", v12);

    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("EMPTY_WISHLIST_SIGN_IN_MESSAGE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("EMPTY_WISHLIST_SIGN_IN_MESSAGE"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMessage:", v13);

    if (v5)
      objc_msgSend(v5, "localizedStringForKey:", CFSTR("EMPTY_WISHLIST_SIGN_IN_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("EMPTY_WISHLIST_SIGN_IN_BUTTON"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setButtonTitle:", v6);
  }
  else
  {
    -[SUUIWishlistViewController _wishlist](self, "_wishlist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "count"))
    {
      -[SUUIWishlistViewController _emptyWishlistView](self, "_emptyWishlistView");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[SUUIViewController clientContext](self, "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:", CFSTR("EMPTY_WISHLIST_TITLE"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("EMPTY_WISHLIST_TITLE"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTitle:", v14);

      -[SUUIViewController clientContext](self, "clientContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "localizedStringForKey:", CFSTR("EMPTY_WISHLIST_MESSAGE"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("EMPTY_WISHLIST_MESSAGE"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMessage:", v17);

      objc_msgSend(v20, "setButtonTitle:", 0);
      goto LABEL_24;
    }
    -[SUUIWishlistViewController _itemListViewController](self, "_itemListViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(SUUIItemList);
    -[SUUIItemList setItems:](v7, "setItems:", v5);
    objc_msgSend(v6, "artworkContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "largestImageSizeForItems:", v5);
    objc_msgSend(v6, "setImageBoundingSize:");

    objc_msgSend(v6, "setItemList:", v7);
    objc_msgSend(v6, "view");
    v20 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_24:

  v9 = (_UIContentUnavailableView *)v20;
LABEL_25:
  v21 = v9;
  if (v9 != self->_emptyWishlistView)
  {
    -[SUUIWishlistViewController _destroyEmptyWishlistView](self, "_destroyEmptyWishlistView");
    v9 = v21;
  }
  if (v9)
  {
    -[SUUIWishlistViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContentUnavailableView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
    objc_msgSend(v18, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContentUnavailableView setBackgroundColor:](v21, "setBackgroundColor:", v19);

    objc_msgSend(v18, "bounds");
    -[_UIContentUnavailableView setFrame:](v21, "setFrame:");
    objc_msgSend(v18, "addSubview:", v21);

    v9 = v21;
  }

}

- (void)_reloadForAccountsChanged
{
  SUUIWishlist *v3;
  SUUIWishlist *wishlist;
  BOOL v5;
  int64_t v6;
  SUUIWishlist *obj;

  +[SUUIWishlist activeWishlist](SUUIWishlist, "activeWishlist");
  v3 = (SUUIWishlist *)objc_claimAutoreleasedReturnValue();
  wishlist = self->_wishlist;
  if (wishlist != v3)
  {
    obj = v3;
    v5 = -[SUUIWishlist isEqual:](wishlist, "isEqual:", v3);
    v3 = obj;
    if (!v5)
    {
      objc_storeStrong((id *)&self->_wishlist, obj);
      -[SUUIWishlistViewController _destroyEmptyWishlistView](self, "_destroyEmptyWishlistView");
      self->_wishlistState = 0;
      -[SUUIWishlistViewController _reloadWishlist](self, "_reloadWishlist");
      v6 = -[SUUIWishlistViewController _wishlistState](self, "_wishlistState");
      v3 = obj;
      if ((unint64_t)(v6 - 3) <= 1)
      {
        -[SUUIWishlistViewController _syncWishlist](self, "_syncWishlist");
        v3 = obj;
      }
    }
  }

}

- (void)_reloadNavigationBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *deleteButton;
  UIBarButtonItem *v8;
  id v9;
  void *v10;
  UIBarButtonItem *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v3 = a3;
  -[SUUIViewController clientContext](self, "clientContext");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIWishlistViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(-[SUUIWishlistViewController _wishlistState](self, "_wishlistState") - 4) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (self->_editing)
    {
      if (!self->_deleteButton)
      {
        v6 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x24BEBD410]);
        deleteButton = self->_deleteButton;
        self->_deleteButton = v6;

        -[UIBarButtonItem setAction:](self->_deleteButton, "setAction:", sel__deleteAction_);
        -[UIBarButtonItem setEnabled:](self->_deleteButton, "setEnabled:", 0);
        -[UIBarButtonItem setTarget:](self->_deleteButton, "setTarget:", self);
        v8 = self->_deleteButton;
        if (v33)
          objc_msgSend(v33, "localizedStringForKey:", CFSTR("WISH_LIST_DELETE_BUTTON"));
        else
          +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_DELETE_BUTTON"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIBarButtonItem setTitle:](v8, "setTitle:", v12);

        v13 = objc_alloc(MEMORY[0x24BDBCE70]);
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *MEMORY[0x24BEBB368];
        v16 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v14, *MEMORY[0x24BEBB368], 0);

        -[UIBarButtonItem setTitleTextAttributes:forState:](self->_deleteButton, "setTitleTextAttributes:forState:", v16, 0);
        v17 = objc_alloc(MEMORY[0x24BDBCE70]);
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v18, v15, 0);

        -[UIBarButtonItem setTitleTextAttributes:forState:](self->_deleteButton, "setTitleTextAttributes:forState:", v19, 2);
      }
      v9 = objc_alloc_init(MEMORY[0x24BEBD410]);
      objc_msgSend(v9, "setAction:", sel__toggleEditAction_);
      objc_msgSend(v9, "setStyle:", 2);
      objc_msgSend(v9, "setTarget:", self);
      if (v33)
        objc_msgSend(v33, "localizedStringForKey:", CFSTR("WISH_LIST_CANCEL_BUTTON"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_CANCEL_BUTTON"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v20);

      objc_msgSend(v5, "setLeftBarButtonItem:animated:", self->_deleteButton, v3);
      objc_msgSend(v5, "setRightBarButtonItem:animated:", v9, v3);
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x24BEBD410]);
      objc_msgSend(v9, "setAction:", sel__toggleEditAction_);
      objc_msgSend(v9, "setEnabled:", -[SUUIWishlistViewController _isEditingEnabled](self, "_isEditingEnabled"));
      objc_msgSend(v9, "setTarget:", self);
      if (v33)
        objc_msgSend(v33, "localizedStringForKey:", CFSTR("WISH_LIST_EDIT_BUTTON"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_EDIT_BUTTON"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v10);

      objc_msgSend(v5, "setLeftBarButtonItem:animated:", v9, v3);
      objc_msgSend(v5, "setRightBarButtonItem:animated:", 0, v3);
      v11 = self->_deleteButton;
      self->_deleteButton = 0;

    }
  }
  else
  {
    objc_msgSend(v5, "setLeftBarButtonItem:", 0);
    objc_msgSend(v5, "setRightBarButtonItem:", 0);
  }
  if (!self->_editing)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "userInterfaceIdiom"))
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "keyWindow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v25 = v24;
      v26 = SUUICompactThreshold();

      if (v25 > v26)
        goto LABEL_27;
    }
    else
    {

    }
    v27 = objc_alloc_init(MEMORY[0x24BEBD410]);
    objc_msgSend(v27, "setAction:", sel__doneAction_);
    objc_msgSend(v27, "setStyle:", 2);
    objc_msgSend(v27, "setTarget:", self);
    if (v33)
      objc_msgSend(v33, "localizedStringForKey:", CFSTR("WISH_LIST_DONE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_DONE_BUTTON"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitle:", v28);

    objc_msgSend(v5, "setRightBarButtonItem:animated:", v27, v3);
  }
LABEL_27:
  -[SUUIWishlistViewController navigationController](self, "navigationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSemanticContentAttribute:", storeSemanticContentAttribute());

  -[SUUIWishlistViewController navigationController](self, "navigationController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "navigationBar");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSemanticContentAttribute:", storeSemanticContentAttribute());

}

- (void)_reloadWishlist
{
  -[SUUIWishlistViewController _reloadChildView](self, "_reloadChildView");
  -[SUUIWishlistViewController _reloadNavigationBarAnimated:](self, "_reloadNavigationBarAnimated:", 0);
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  if (self->_editing != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_editing = a3;
    -[SUUIWishlistViewController _itemListViewController](self, "_itemListViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsMultipleSelectionDuringEditing:", v5);

    objc_msgSend(v8, "setEditing:animated:", v5, v4);
    -[SUUIWishlistViewController _reloadNavigationBarAnimated:](self, "_reloadNavigationBarAnimated:", v4);

  }
}

- (void)_syncWishlist
{
  SUUISyncWishlistOperation *v3;
  void *v4;
  SUUISyncWishlistOperation *v5;
  SUUISyncWishlistOperation *syncOperation;
  SUUISyncWishlistOperation *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, char, char, void *);
  void *v12;
  id v13;
  id location;

  if (!self->_syncOperation)
  {
    v3 = [SUUISyncWishlistOperation alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUUISyncWishlistOperation initWithClientContext:](v3, "initWithClientContext:", v4);
    syncOperation = self->_syncOperation;
    self->_syncOperation = v5;

    objc_initWeak(&location, self);
    v7 = self->_syncOperation;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __43__SUUIWishlistViewController__syncWishlist__block_invoke;
    v12 = &unk_2511F7A68;
    objc_copyWeak(&v13, &location);
    -[SUUISyncWishlistOperation setResultBlock:](v7, "setResultBlock:", &v9);
    SUUIWishlistOperationQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", self->_syncOperation, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __43__SUUIWishlistViewController__syncWishlist__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;
  char v13;

  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUUIWishlistViewController__syncWishlist__block_invoke_2;
  block[3] = &unk_2511F7130;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v12 = a2;
  v13 = a3;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v11);
}

void __43__SUUIWishlistViewController__syncWishlist__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishSyncWithResult:didChange:error:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 32));

}

- (void)_updateDeleteButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  void *v10;
  void *v11;
  UIBarButtonItem *deleteButton;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[SUUIItemListTableViewController tableView](self->_itemListViewController, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 0);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v6, "setNumberStyle:", 1);
    -[SUUIViewController clientContext](self, "clientContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "localizedStringForKey:", CFSTR("WISH_LIST_DELETE_BUTTON_SELECTED"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_DELETE_BUTTON_SELECTED"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIBarButtonItem setEnabled:](self->_deleteButton, "setEnabled:", 1);
    deleteButton = self->_deleteButton;
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringFromNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](deleteButton, "setTitle:", v16);

  }
  else
  {
    -[UIBarButtonItem setEnabled:](self->_deleteButton, "setEnabled:", 0);
    v9 = self->_deleteButton;
    -[SUUIViewController clientContext](self, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v10)
      objc_msgSend(v10, "localizedStringForKey:", CFSTR("WISH_LIST_DELETE_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("WISH_LIST_DELETE_BUTTON"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](v9, "setTitle:", v11);
  }

  objc_msgSend(MEMORY[0x24BEBDB00], "setAnimationsEnabled:", 1);
}

- (id)_wishlist
{
  SUUIWishlist *wishlist;
  SUUIWishlist *v4;
  SUUIWishlist *v5;

  wishlist = self->_wishlist;
  if (!wishlist)
  {
    +[SUUIWishlist activeWishlist](SUUIWishlist, "activeWishlist");
    v4 = (SUUIWishlist *)objc_claimAutoreleasedReturnValue();
    v5 = self->_wishlist;
    self->_wishlist = v4;

    wishlist = self->_wishlist;
  }
  return wishlist;
}

- (int64_t)_wishlistState
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;

  result = self->_wishlistState;
  if (!result)
  {
    objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "longLongValue");

      if ((objc_msgSend(MEMORY[0x24BEB20C8], "existsForAccountIdentifier:", v7) & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB20C8]), "initWithAccountIdentifier:", v7);
        objc_msgSend(v8, "lastSyncTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = 3;
        if (!v9)
          v10 = 4;
        self->_wishlistState = v10;

        goto LABEL_10;
      }
      v11 = 4;
    }
    else
    {
      v11 = 1;
    }
    self->_wishlistState = v11;
LABEL_10:

    return self->_wishlistState;
  }
  return result;
}

- (SUUIWishlistDelegate)delegate
{
  return (SUUIWishlistDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wishlist, 0);
  objc_storeStrong((id *)&self->_syncOperation, 0);
  objc_storeStrong((id *)&self->_itemListViewController, 0);
  objc_storeStrong((id *)&self->_emptyWishlistView, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
