@implementation SUUIProductPageTableViewController

- (SUUIProductPageTableViewController)initWithInAppPurchases:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIProductPageTableViewController *v8;
  SUUIProductPageTableViewController *v9;
  id *p_clientContext;
  void *v11;
  SUUIProductPageTableInAppPurchasesSection *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUUIProductPageTableViewController;
  v8 = -[SUUIProductPageTableViewController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    p_clientContext = (id *)&v8->_clientContext;
    objc_storeStrong((id *)&v8->_clientContext, a4);
    if (*p_clientContext)
      objc_msgSend(*p_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), CFSTR("ProductPage"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_IN_APPS_TITLE"), 0, CFSTR("ProductPage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableViewController setTitle:](v9, "setTitle:", v11);

    v12 = -[SUUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:]([SUUIProductPageTableInAppPurchasesSection alloc], "initWithInAppPurchases:clientContext:", v6, v7);
    -[SUUIProductPageTableInAppPurchasesSection setExpanded:](v12, "setExpanded:", 1);
    -[SUUITableViewSection setHidesHeaderView:](v12, "setHidesHeaderView:", 1);
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIProductPageTableViewController setSections:](v9, "setSections:", v13);

  }
  return v9;
}

- (SUUIProductPageTableViewController)initWithReleaseNotes:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  SUUIProductPageTableViewController *v8;
  SUUIProductPageTableUpdateHistorySection *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  SUUILayoutCache *v21;
  SUUILayoutCache *textLayoutCache;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  SUUIProductPageTableUpdateHistorySection *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SUUIProductPageTableViewController;
  v8 = -[SUUIProductPageTableViewController init](&v31, sel_init);
  if (v8)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_storeStrong((id *)&v8->_clientContext, a4);
      if (v8->_clientContext)
        -[SUUIClientContext localizedStringForKey:inTable:](v8->_clientContext, "localizedStringForKey:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), CFSTR("ProductPage"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PRODUCT_PAGE_UPDATE_HISTORY_TITLE"), 0, CFSTR("ProductPage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableViewController setTitle:](v8, "setTitle:", v10, v7);

      v9 = -[SUUIProductPageTableUpdateHistorySection initWithClientContext:]([SUUIProductPageTableUpdateHistorySection alloc], "initWithClientContext:", v8->_clientContext);
      -[SUUIProductPageTableUpdateHistorySection setExpanded:](v9, "setExpanded:", 1);
      -[SUUITableViewSection setHidesHeaderView:](v9, "setHidesHeaderView:", 1);
      -[SUUIProductPageTableUpdateHistorySection setReleaseNotes:](v9, "setReleaseNotes:", v6);
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v26 = v6;
      v12 = v6;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "changeNotes");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v17;
            if (v17)
              v19 = (const __CFString *)v17;
            else
              v19 = &stru_2511FF0C8;
            -[SUUIProductPageTableViewController _textLayoutRequestWithText:](v8, "_textLayoutRequestWithText:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v14);
      }

      v21 = objc_alloc_init(SUUILayoutCache);
      textLayoutCache = v8->_textLayoutCache;
      v8->_textLayoutCache = v21;

      -[SUUILayoutCache populateCacheWithLayoutRequests:](v8->_textLayoutCache, "populateCacheWithLayoutRequests:", v11);
      -[SUUIProductPageTableUpdateHistorySection setTextLayoutCache:](v9, "setTextLayoutCache:", v8->_textLayoutCache);
      -[SUUIProductPageTableViewController setTextLayoutCache:](v8, "setTextLayoutCache:", v8->_textLayoutCache);
      v32 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableViewController setSections:](v8, "setSections:", v23);

      v7 = v25;
      v6 = v26;
    }
    else
    {
      v9 = (SUUIProductPageTableUpdateHistorySection *)v8;
      v8 = 0;
    }

  }
  return v8;
}

- (SUUIProductPageTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIProductPageTableViewController *v4;
  uint64_t v5;
  UIColor *color;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIProductPageTableViewController;
  v4 = -[SUUIProductPageTableViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
    v5 = objc_claimAutoreleasedReturnValue();
    color = v4->_color;
    v4->_color = (UIColor *)v5;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIProductPageTableView setDataSource:](self->_tableView, "setDataSource:", 0);
  -[SUUIProductPageTableView setDelegate:](self->_tableView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageTableViewController;
  -[SUUIProductPageTableViewController dealloc](&v3, sel_dealloc);
}

- (void)scrollToView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v4 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "topContentOffset");
    v9 = v8;
    v11 = v10;

    objc_msgSend(v13, "bounds");
    objc_msgSend(v13, "convertPoint:toView:", self->_tableView);
    -[SUUIProductPageTableView setContentOffset:animated:](self->_tableView, "setContentOffset:animated:", v4, v9, v11 + v12);
  }

}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  void *v7;
  void *v8;
  SUUIProductPageTableView *tableView;
  void *v10;
  void *v11;
  SUUIColorScheme *v12;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    -[SUUIColorScheme backgroundColor](*p_colorScheme, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_color, v8);
    if (!v7)

    tableView = self->_tableView;
    -[SUUIColorScheme backgroundColor](*p_colorScheme, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SUUIProductPageTableView setBackgroundColor:](tableView, "setBackgroundColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableView setBackgroundColor:](tableView, "setBackgroundColor:", v11);

    }
    v5 = v12;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    if (self->_tableView)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_loadWeakRetained((id *)&self->_delegateSender);
      objc_msgSend(v6, "productPageChildViewControllerDidLoadScrollView:", v7);

      v5 = obj;
    }
  }

}

- (void)setHeaderViewController:(id)a3
{
  SUUIProductPageHeaderViewController **p_headerViewController;
  void *v6;
  SUUIProductPageHeaderViewController *v7;

  p_headerViewController = &self->_headerViewController;
  v7 = (SUUIProductPageHeaderViewController *)a3;
  if (*p_headerViewController != v7)
  {
    -[SUUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", 0);
    -[SUUIProductPageHeaderViewController view](*p_headerViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[SUUIProductPageHeaderViewController removeFromParentViewController](*p_headerViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_headerViewController, a3);
    if (*p_headerViewController)
    {
      -[SUUIProductPageTableViewController addChildViewController:](self, "addChildViewController:");
      if (self->_tableView)
        -[SUUIProductPageTableViewController _addHeaderView](self, "_addHeaderView");
    }
  }

}

- (void)setSections:(id)a3
{
  NSArray *v4;
  NSArray *sections;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_sections != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    sections = self->_sections;
    self->_sections = v4;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_sections;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setClientContext:", self->_clientContext, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)loadView
{
  id v3;

  -[SUUIProductPageTableViewController _tableView](self, "_tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageTableViewController setView:](self, "setView:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SUUIProductPageTableView indexPathForSelectedRow](self->_tableView, "indexPathForSelectedRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[SUUIProductPageTableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v5, v3);
  v6.receiver = self;
  v6.super_class = (Class)SUUIProductPageTableViewController;
  -[SUUIProductPageTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_loadWeakRetained((id *)&self->_delegateSender);
  objc_msgSend(WeakRetained, "productPageChildViewControllerDidScroll:", v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v6;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableViewCellForTableView:indexPath:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInSection");

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SUUIProductPageChildViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SUUIProductPageChildViewControllerDelegate **v20;
  id v21;
  char v22;
  SUUIProductPageChildViewControllerDelegate **v23;
  id v24;
  char v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionActionForTableView:indexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    switch(objc_msgSend(v9, "actionType"))
    {
      case 0:
        v26[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 100);

        break;
      case 1:
      case 2:
        objc_msgSend(v10, "URL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_16;
        p_delegate = &self->_delegate;
        WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) == 0)
          goto LABEL_16;
        v15 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v10, "viewControllerBlock");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        v18 = v11;
        goto LABEL_14;
      case 3:
        -[SUUIProductPageTableViewController navigationController](self, "navigationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "viewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "pushViewController:animated:", v15, 1);
        }
        else
        {
          v23 = &self->_delegate;
          v24 = objc_loadWeakRetained((id *)v23);
          v25 = objc_opt_respondsToSelector();

          if ((v25 & 1) == 0)
            goto LABEL_16;
          v15 = objc_loadWeakRetained((id *)v23);
          objc_msgSend(v10, "viewControllerBlock");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v15;
          v18 = 0;
LABEL_14:
          objc_msgSend(v17, "productPageChildOpenURL:viewControllerBlock:", v18, v16);

        }
LABEL_15:

LABEL_16:
        objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

        break;
      case 4:
        objc_msgSend(v10, "item");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_16;
        v20 = &self->_delegate;
        v21 = objc_loadWeakRetained((id *)v20);
        v22 = objc_opt_respondsToSelector();

        if ((v22 & 1) == 0)
          goto LABEL_16;
        v15 = objc_loadWeakRetained((id *)v20);
        objc_msgSend(v15, "productPageChildOpenItem:", v11);
        goto LABEL_15;
      default:
        break;
    }
  }

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  NSArray *sections;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "footerViewForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  NSArray *sections;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "headerViewForTableView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "frame");
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  sections = self->_sections;
  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "heightForCellInTableView:indexPath:", v7, v6);
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NSArray *sections;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "footerViewForTableView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setBackgroundColor:", self->_color);

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  NSArray *sections;
  id v7;
  void *v8;
  void *v9;

  sections = self->_sections;
  v7 = a3;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerViewForTableView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "setBackgroundColor:", self->_color);

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setBackgroundColor:", self->_color);
}

- (void)_addHeaderView
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[SUUIProductPageHeaderViewController view](self->_headerViewController, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  objc_msgSend(v8, "frame");
  v4 = v3;
  -[SUUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, v4);
  -[SUUIProductPageTableView _addContentSubview:atBack:](self->_tableView, "_addContentSubview:atBack:", v8, 0);
  -[SUUIProductPageHeaderViewController floatingView](self->_headerViewController, "floatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v5, "frame");
  v7 = v6;
  -[SUUIProductPageTableView bounds](self->_tableView, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v7);
  -[SUUIProductPageTableView setProductPageHeaderView:](self->_tableView, "setProductPageHeaderView:", v5);

}

- (id)_tableView
{
  SUUIProductPageTableView *tableView;
  SUUIProductPageTableView *v4;
  SUUIProductPageTableView *v5;
  SUUIProductPageTableView *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc_init(SUUIProductPageTableView);
    v5 = self->_tableView;
    self->_tableView = v4;

    v6 = self->_tableView;
    -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SUUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIProductPageTableView setBackgroundColor:](v6, "setBackgroundColor:", v8);

    }
    -[SUUIProductPageTableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[SUUIProductPageTableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[SUUIProductPageTableView _setHeaderAndFooterViewsFloat:](self->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[SUUIProductPageTableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    if (self->_headerViewController)
      -[SUUIProductPageTableViewController _addHeaderView](self, "_addHeaderView");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_loadWeakRetained((id *)&self->_delegateSender);
    objc_msgSend(WeakRetained, "productPageChildViewControllerDidLoadScrollView:", v10);

    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_textLayoutRequestWithText:(id)a3
{
  id v4;
  SUUITextLayoutRequest *v5;
  double v6;

  v4 = a3;
  v5 = objc_alloc_init(SUUITextLayoutRequest);
  -[SUUITextLayoutRequest setNumberOfLines:](v5, "setNumberOfLines:", 5);
  -[SUUITextLayoutRequest setText:](v5, "setText:", v4);

  +[SUUIProductPageDetailsViewController defaultPageWidthForUserInterfaceIdiom:](SUUIProductPageDetailsViewController, "defaultPageWidthForUserInterfaceIdiom:", SUUIUserInterfaceIdiom(self->_clientContext));
  -[SUUITextLayoutRequest setWidth:](v5, "setWidth:", v6 + -30.0);
  return v5;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SUUIProductPageChildViewController)delegateSender
{
  return (SUUIProductPageChildViewController *)objc_loadWeakRetained((id *)&self->_delegateSender);
}

- (void)setDelegateSender:(id)a3
{
  objc_storeWeak((id *)&self->_delegateSender, a3);
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (SUUIProductPageChildViewControllerDelegate)delegate
{
  return (SUUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (NSArray)sections
{
  return self->_sections;
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_evenColor, 0);
  objc_destroyWeak((id *)&self->_delegateSender);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
