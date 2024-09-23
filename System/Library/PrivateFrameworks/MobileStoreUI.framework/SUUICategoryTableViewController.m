@implementation SUUICategoryTableViewController

- (void)dealloc
{
  objc_super v3;

  -[SUUICategoryArtworkLoader removeObserver:](self->_artworkLoader, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUUICategoryTableViewController;
  -[SUUICategoryTableViewController dealloc](&v3, sel_dealloc);
}

- (void)setArtworkLoader:(id)a3
{
  SUUICategoryArtworkLoader *v5;
  SUUICategoryArtworkLoader *artworkLoader;
  SUUICategoryArtworkLoader *v7;

  v5 = (SUUICategoryArtworkLoader *)a3;
  artworkLoader = self->_artworkLoader;
  if (artworkLoader != v5)
  {
    v7 = v5;
    -[SUUICategoryArtworkLoader removeObserver:](artworkLoader, "removeObserver:", self);
    objc_storeStrong((id *)&self->_artworkLoader, a3);
    -[SUUICategoryArtworkLoader addObserver:](self->_artworkLoader, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setCategory:(id)a3
{
  SUUICategory *v5;
  SUUICategory **p_category;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (SUUICategory *)a3;
  p_category = &self->_category;
  if (self->_category != v5)
  {
    objc_storeStrong((id *)&self->_category, a3);
    self->_childrenHaveArtwork = 0;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SUUICategory children](*p_category, "children", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "artworkProvider");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            self->_childrenHaveArtwork = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

    if (-[SUUICategoryTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SUUICategoryTableViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadData");

    }
    -[SUUICategory name](*p_category, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICategoryTableViewController setTitle:](self, "setTitle:", v14);

  }
}

- (void)setNumberOfHiddenRows:(int64_t)a3
{
  id v3;

  if (self->_numberOfHiddenRows != a3)
  {
    self->_numberOfHiddenRows = a3;
    -[SUUICategoryTableViewController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUICategoryTableViewController;
  -[SUUICategoryTableViewController loadView](&v7, sel_loadView);
  -[SUUICategoryTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("a"));
  objc_msgSend(v3, "setSeparatorStyle:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SUUIClientContext *clientContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  -[SUUICategoryTableViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("CATEGORY_SHEET_CANCEL_BUTTON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CATEGORY_SHEET_CANCEL_BUTTON"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v7, 2, self, sel__doneButtonAction_);
    -[SUUICategoryTableViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
  -[SUUICategoryTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForSelectedRow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SUUICategoryTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v11, 1);

  }
  v13.receiver = self;
  v13.super_class = (Class)SUUICategoryTableViewController;
  -[SUUICategoryTableViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);

}

- (void)categoryArtworkLoader:(id)a3 didLoadImage:(id)a4 forCategory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[SUUICategoryTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPathsForVisibleRows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[SUUICategoryTableViewController _categoryAtIndexPath:](self, "_categoryAtIndexPath:", v16, (_QWORD)v21);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17 == v8)
        {
          -[SUUICategoryTableViewController tableView](self, "tableView");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "cellForRowAtIndexPath:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "imageView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setImage:", v7);

          goto LABEL_11;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)categoryTableView:(id)a3 didSelectCategory:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "categoryTableView:didSelectCategory:", self, v8);

  }
}

- (id)metricsPageContextForCategoryTableView:(id)a3
{
  SUUICategoryTableViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "metricsPageContextForCategoryTableView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  SUUICategory *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 childrenHaveArtwork;
  void *v20;
  SUUICategoryArtworkLoader *artworkLoader;
  void *v22;
  void *v23;
  char v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("a"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICategoryTableViewController _categoryAtIndexPath:](self, "_categoryAtIndexPath:", v6);
  v8 = (SUUICategory *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "section"))
    -[SUUICategory name](v8, "name");
  else
    -[SUUICategory parentLabel](v8, "parentLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  if (objc_msgSend(v6, "section") == 1)
  {
    -[SUUICategory children](v8, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = 1;
      goto LABEL_14;
    }
  }
  -[SUUICategory URL](v8, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", self->_selectedURL) & 1) != 0)
  {

LABEL_9:
    v13 = 3;
    goto LABEL_14;
  }
  if (self->_isRoot && v8 == self->_category)
  {
    v24 = -[NSURL isEqual:](self->_defaultURL, "isEqual:", self->_selectedURL);

    if ((v24 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  v13 = 0;
LABEL_14:
  objc_msgSend(v7, "setAccessoryType:", v13);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "userInterfaceIdiom"))
  {

LABEL_16:
    v16 = *MEMORY[0x24BDBF148];
    v17 = *(double *)(MEMORY[0x24BDBF148] + 8);
LABEL_17:
    objc_msgSend(v7, "setExpectedImageSize:", v16, v17);
    goto LABEL_18;
  }
  childrenHaveArtwork = self->_childrenHaveArtwork;

  if (!childrenHaveArtwork)
    goto LABEL_16;
  -[SUUICategory artworkProvider](v8, "artworkProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  artworkLoader = self->_artworkLoader;
  if (!v20)
  {
    -[SUUICategoryArtworkLoader imageSize](artworkLoader, "imageSize");
    goto LABEL_17;
  }
  -[SUUICategoryArtworkLoader cachedImageForCategory:](artworkLoader, "cachedImageForCategory:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    -[SUUICategoryArtworkLoader loadImageForCategory:reason:](self->_artworkLoader, "loadImageForCategory:reason:", v8, 1);
    -[SUUICategoryArtworkLoader placeholderImage](self->_artworkLoader, "placeholderImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setImage:", v22);

LABEL_18:
  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  int64_t numberOfHiddenRows;
  int64_t v8;
  int64_t v9;

  if (!a4)
    return self->_numberOfHiddenRows == 0;
  -[SUUICategory children](self->_category, "children", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  numberOfHiddenRows = self->_numberOfHiddenRows;
  if (numberOfHiddenRows)
    v8 = 1 - numberOfHiddenRows;
  else
    v8 = 0;
  v9 = v8 + v6;

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  SUUICategoryTableViewController *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;

  v13 = a4;
  -[SUUICategoryTableViewController _categoryAtIndexPath:](self, "_categoryAtIndexPath:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "section") == 1)
  {
    objc_msgSend(v5, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[SUUICategoryTableViewController _recordClickEventForIndexPath:category:actionType:](self, "_recordClickEventForIndexPath:category:actionType:", v13, v5, *MEMORY[0x24BEB28F8]);
      v8 = objc_alloc_init(SUUICategoryTableViewController);
      -[SUUICategoryTableViewController setArtworkLoader:](v8, "setArtworkLoader:", self->_artworkLoader);
      -[SUUICategoryTableViewController setCategory:](v8, "setCategory:", v5);
      -[SUUICategoryTableViewController setClientContext:](v8, "setClientContext:", self->_clientContext);
      -[SUUICategoryTableViewController preferredContentSize](self, "preferredContentSize");
      -[SUUICategoryTableViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
      -[SUUICategoryTableViewController _metricsLocationsToPushIndexPath:](self, "_metricsLocationsToPushIndexPath:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUICategoryTableViewController setMetricsLocations:](v8, "setMetricsLocations:", v9);

      -[SUUICategoryTableViewController setDelegate:](v8, "setDelegate:", self);
      -[SUUICategoryTableViewController setSelectedURL:](v8, "setSelectedURL:", self->_selectedURL);
      -[SUUICategoryTableViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pushViewController:animated:", v8, 1);

LABEL_6:
      goto LABEL_7;
    }
  }
  -[SUUICategoryTableViewController _recordClickEventForIndexPath:category:actionType:](self, "_recordClickEventForIndexPath:category:actionType:", v13, v5, *MEMORY[0x24BEB28F0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v8 = (SUUICategoryTableViewController *)objc_loadWeakRetained((id *)&self->_delegate);
    -[SUUICategoryTableViewController categoryTableView:didSelectCategory:](v8, "categoryTableView:didSelectCategory:", self, v5);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BEBD4B8];
  v6 = a4;
  objc_msgSend(v5, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.756, 1.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectionTintColor:", v8);

}

- (void)_doneButtonAction:(id)a3
{
  -[SUUICategoryTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_categoryAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  SUUICategory *category;
  void *v7;
  uint64_t v8;
  int64_t numberOfHiddenRows;
  BOOL v10;
  int64_t v11;
  SUUICategory *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  category = self->_category;
  if (v5)
  {
    -[SUUICategory children](category, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "row");
    numberOfHiddenRows = self->_numberOfHiddenRows;
    v10 = numberOfHiddenRows != 0;
    v11 = numberOfHiddenRows - 1;
    if (!v10)
      v11 = 0;
    objc_msgSend(v7, "objectAtIndex:", v11 + v8);
    v12 = (SUUICategory *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = category;
  }

  return v12;
}

- (int64_t)_metricsLocationPostionForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 1 && !self->_numberOfHiddenRows)
    ++v5;
  return v5;
}

- (id)_metricsLocationsToPushIndexPath:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BEB1EF0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = -[SUUICategoryTableViewController _metricsLocationPostionForIndexPath:](self, "_metricsLocationPostionForIndexPath:", v5);

  objc_msgSend(v6, "setLocationPosition:", v7);
  objc_msgSend(v6, "setLocationType:", *MEMORY[0x24BEB2980]);
  v8 = (void *)-[NSArray mutableCopy](self->_metricsLocations, "mutableCopy");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "insertObject:atIndex:", v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_recordClickEventForIndexPath:(id)a3 category:(id)a4 actionType:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  SUUICategoryTableViewController *v25;
  uint64_t v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_msgSend(v10, "row");
  v12 = objc_msgSend(v10, "section");

  if (v12 == 1 && !self->_numberOfHiddenRows)
    ++v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "metricsPageContextForCategoryTableView:", self);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  -[SUUICategoryTableViewController clientContext](self, "clientContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __85__SUUICategoryTableViewController__recordClickEventForIndexPath_category_actionType___block_invoke;
  v21[3] = &unk_2511FB978;
  v22 = v9;
  v23 = v16;
  v25 = self;
  v26 = v11;
  v24 = v8;
  v18 = v8;
  v19 = v16;
  v20 = v9;
  objc_msgSend(v17, "getDefaultMetricsControllerWithCompletionBlock:", v21);

}

void __85__SUUICategoryTableViewController__recordClickEventForIndexPath_category_actionType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "canRecordEventWithType:", *MEMORY[0x24BEB2910]))
  {
    v4 = objc_alloc_init(MEMORY[0x24BEB1EC8]);
    objc_msgSend(v4, "setActionType:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setPageContext:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(*(id *)(a1 + 48), "categoryIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetIdentifier:", v5);

    v6 = *MEMORY[0x24BEB2988];
    objc_msgSend(v4, "setTargetType:", *MEMORY[0x24BEB2988]);
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetURL:", v8);

    objc_msgSend(v3, "locationWithPosition:type:fieldData:", *(_QWORD *)(a1 + 64), v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 56) + 1048);
      if (v10)
      {
        v11 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v11, "insertObject:atIndex:", v9, 0);
      }
      else
      {
        v12[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setLocationWithEventLocations:", v11);

    }
    objc_msgSend(v3, "recordEvent:", v4);

  }
}

- (SUUICategoryArtworkLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SUUICategory)category
{
  return self->_category;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (void)setDefaultURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultURL, a3);
}

- (SUUICategoryTableViewControllerDelegate)delegate
{
  return (SUUICategoryTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)metricsLocations
{
  return self->_metricsLocations;
}

- (void)setMetricsLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (int64_t)numberOfHiddenRows
{
  return self->_numberOfHiddenRows;
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (NSURL)selectedURL
{
  return self->_selectedURL;
}

- (void)setSelectedURL:(id)a3
{
  objc_storeStrong((id *)&self->_selectedURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_selectedURL, 0);
  objc_storeStrong((id *)&self->_metricsLocations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end
