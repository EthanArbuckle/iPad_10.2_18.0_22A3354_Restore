@implementation CKAppManagerViewController

- (void)viewDidLayoutSubviews
{
  UITableView *tableView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAppManagerViewController;
  -[CKAppManagerViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  tableView = self->_tableView;
  -[CKAppManagerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *dismissButton;
  UITableView *v16;
  UITableView *tableView;
  id v18;
  UITableView *v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKAppManagerViewController;
  -[CKAppManagerViewController viewDidLoad](&v22, sel_viewDidLoad);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MANAGE_STICKER_APPS"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppManagerViewController setTitle:](self, "setTitle:", v4);

  -[CKAppManagerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped_);
  dismissButton = self->_dismissButton;
  self->_dismissButton = v14;

  v16 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 2, v7, v9, v11, v13);
  tableView = self->_tableView;
  self->_tableView = v16;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setCellLayoutMarginsFollowReadableWidth:](self->_tableView, "setCellLayoutMarginsFollowReadableWidth:", 1);
  v18 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v18);

  -[UITableView _setAllowsReorderingWhenNotEditing:](self->_tableView, "_setAllowsReorderingWhenNotEditing:", 1);
  objc_msgSend(v5, "addSubview:", self->_tableView);
  v19 = self->_tableView;
  v20 = objc_opt_class();
  +[CKAppManagerAppTableViewCell reuseIdentifier](CKAppManagerAppTableViewCell, "reuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v19, "registerClass:forCellReuseIdentifier:", v20, v21);

  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableView, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("AppManagerSectionHeaderReuseIdentifier"));
  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableView, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("AppManagerSectionFooterReuseIdentifier"));
  -[CKAppManagerViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAppManagerViewController;
  -[CKAppManagerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CKAppManagerViewController updateEditDoneButton](self, "updateEditDoneButton");
  -[CKAppManagerViewController reloadPluginsImmediately](self, "reloadPluginsImmediately");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAppManagerViewController;
  -[CKAppManagerViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKAppManagerViewController setEditing:](self, "setEditing:", 0);
  -[CKAppManagerViewController reloadPluginsImmediately](self, "reloadPluginsImmediately");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)doneButtonTapped:(id)a3
{
  id v4;

  -[CKAppManagerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appManagerViewControllerDidFinish:", self);

}

- (void)updateEditDoneButton
{
  UIBarButtonItem *dismissButton;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((-[CKAppManagerViewController isEditing](self, "isEditing") & 1) != 0)
    dismissButton = 0;
  else
    dismissButton = self->_dismissButton;
  -[CKAppManagerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", dismissButton);

  -[CKAppManagerViewController editButtonItem](self, "editButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppManagerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  -[CKAppManagerViewController editButtonItem](self, "editButtonItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", -[CKAppManagerViewController _hasPluginsToHideOrDelete](self, "_hasPluginsToHideOrDelete"));

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  UIBarButtonItem *dismissButton;
  void *v8;
  _BOOL4 v9;
  UITableView *tableView;
  void *v11;
  void *v12;
  UITableView *v13;
  void *v14;
  _QWORD v15[5];
  objc_super v16;

  v4 = a4;
  v5 = a3;
  if (-[CKAppManagerViewController isEditing](self, "isEditing") != a3)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKAppManagerViewController;
    -[CKAppManagerViewController setEditing:animated:](&v16, sel_setEditing_animated_, v5, v4);
    -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", v5, 1);
    if (v5)
      dismissButton = 0;
    else
      dismissButton = self->_dismissButton;
    -[CKAppManagerViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", dismissButton);

    -[UITableView beginUpdates](self->_tableView, "beginUpdates");
    v9 = -[CKAppManagerViewController hasAppStore](self, "hasAppStore");
    tableView = self->_tableView;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v11, 100);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v12, 0);

      v13 = self->_tableView;
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[UITableView insertSections:withRowAnimation:](v13, "insertSections:withRowAnimation:", v11, 0);
      else
        -[UITableView deleteSections:withRowAnimation:](v13, "deleteSections:withRowAnimation:", v11, 0);
    }

    -[UITableView endUpdates](self->_tableView, "endUpdates");
    -[UITableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__CKAppManagerViewController_setEditing_animated___block_invoke;
    v15[3] = &unk_1E2756700;
    v15[4] = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

    -[UITableView _setAllowsReorderingWhenNotEditing:](self->_tableView, "_setAllowsReorderingWhenNotEditing:", -[CKAppManagerViewController isEditing](self, "isEditing") ^ 1);
  }
}

void __50__CKAppManagerViewController_setEditing_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "cellForRowAtIndexPath:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isEditing") & 1) != 0 || objc_msgSend(v5, "section"))
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "tableView:canMoveRowAtIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968), v5);
  objc_msgSend(v3, "setShowsReorderControl:", v4);

}

- (id)balloonPluginManager
{
  return +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
}

- (NSArray)plugins
{
  NSArray *plugins;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  plugins = self->_plugins;
  if (!plugins)
  {
    -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedCombinedStickerApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "mutableCopy");

    -[NSArray removeLastObject](v6, "removeLastObject");
    v7 = self->_plugins;
    self->_plugins = v6;

    plugins = self->_plugins;
  }
  return plugins;
}

- (NSArray)deletableIMessageApps
{
  NSArray *deletableIMessageApps;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[5];

  deletableIMessageApps = self->_deletableIMessageApps;
  if (!deletableIMessageApps)
  {
    -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allOrderedCombinedStickerApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeLastObject");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__CKAppManagerViewController_deletableIMessageApps__block_invoke;
    v10[3] = &unk_1E2750228;
    v10[4] = self;
    objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v10);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_deletableIMessageApps;
    self->_deletableIMessageApps = v7;

    deletableIMessageApps = self->_deletableIMessageApps;
  }
  return deletableIMessageApps;
}

uint64_t __51__CKAppManagerViewController_deletableIMessageApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_pluginIsStandaloneApp:", v3))
    v4 = objc_msgSend(*(id *)(a1 + 32), "_pluginIsSystemApp:", v3) ^ 1;
  else
    v4 = 0;

  return v4;
}

- (NSArray)appContainedPlugins
{
  NSArray *appContainedPlugins;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[5];

  appContainedPlugins = self->_appContainedPlugins;
  if (!appContainedPlugins)
  {
    -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allOrderedCombinedStickerApps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeLastObject");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__CKAppManagerViewController_appContainedPlugins__block_invoke;
    v11[3] = &unk_1E2750228;
    v11[4] = self;
    objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_181);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_appContainedPlugins;
    self->_appContainedPlugins = v8;

    appContainedPlugins = self->_appContainedPlugins;
  }
  return appContainedPlugins;
}

uint64_t __49__CKAppManagerViewController_appContainedPlugins__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_pluginIsStandaloneApp:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "_pluginIsSystemApp:", v3) ^ 1;

  return v4;
}

uint64_t __49__CKAppManagerViewController_appContainedPlugins__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "browserDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "browserDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)_pluginIsStandaloneApp:(id)a3
{
  return objc_msgSend(a3, "isLaunchProhibited");
}

- (BOOL)_pluginIsHidden:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPluginHiddenFromSendMenuAndStickers:", v4);

  return v6;
}

- (BOOL)_pluginIsSystemApp:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPluginSystemApp:", v4);

  return v6;
}

- (BOOL)_hasPluginsToHideOrDelete
{
  return -[NSArray count](self->_deletableIMessageApps, "count")
      || -[NSArray count](self->_appContainedPlugins, "count") != 0;
}

- (BOOL)hasAppStore
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAppStoreEnabled"))
  {
    -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pluginForIdentifier:", CFSTR("com.apple.appstore.MessagesProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)reloadPluginsImmediately
{
  -[CKAppManagerViewController setPlugins:](self, "setPlugins:", 0);
  -[CKAppManagerViewController setDeletableIMessageApps:](self, "setDeletableIMessageApps:", 0);
  -[CKAppManagerViewController setAppContainedPlugins:](self, "setAppContainedPlugins:", 0);
  -[CKAppManagerViewController plugins](self, "plugins");

  -[CKAppManagerViewController deletableIMessageApps](self, "deletableIMessageApps");
  -[CKAppManagerViewController appContainedPlugins](self, "appContainedPlugins");

  -[CKAppManagerViewController updateEditDoneButton](self, "updateEditDoneButton");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "row") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v7, 1);
  if ((-[CKAppManagerViewController isEditing](self, "isEditing") & 1) == 0 && objc_msgSend(v7, "section") == 1)
  {
    IMBalloonExtensionIDWithSuffix();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginForExtensionIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKAppManagerViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "browserAppManagerDidSelectPlugin:", v10);

    }
  }

}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a4;
  v6 = -[CKAppManagerViewController isEditing](self, "isEditing");
  v7 = objc_msgSend(v5, "section");
  if (v6)
  {
    if (!v7)
    {
      v10 = objc_msgSend(v5, "row");
      -[CKAppManagerViewController deletableIMessageApps](self, "deletableIMessageApps");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v10 >= v12)
        goto LABEL_5;
      -[CKAppManagerViewController deletableIMessageApps](self, "deletableIMessageApps");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v13, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      LOBYTE(v13) = objc_opt_isKindOfClass();

      if ((v13 & 1) == 0)
        goto LABEL_5;
    }
    v7 = objc_msgSend(v5, "section");
  }
  if (v7 != 1)
  {
    v8 = 1;
    goto LABEL_7;
  }
LABEL_5:
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (-[CKAppManagerViewController isEditing](self, "isEditing") && !objc_msgSend(v5, "section"))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAA28], "configurationWithActions:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  CKAppManagerViewController *v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a5;
  if (-[CKAppManagerViewController isEditing](self, "isEditing"))
  {
    v10 = objc_msgSend(v9, "section");
    if (a4 == 1 && !v10)
    {
      -[CKAppManagerViewController deletableIMessageApps](self, "deletableIMessageApps");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      location = 0;
      objc_initWeak(&location, self);
      -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__CKAppManagerViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
      v16[3] = &unk_1E2757920;
      objc_copyWeak(&v21, &location);
      v15 = v14;
      v17 = v15;
      v18 = v8;
      v19 = v9;
      v20 = self;
      objc_msgSend(v15, "deleteAppWithIdentifier:completion:", v13, v16);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

    }
  }

}

void __77__CKAppManagerViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "refreshPlugins");
      objc_msgSend(*(id *)(a1 + 32), "saveWithNotification:", 1);
      objc_msgSend(*(id *)(a1 + 32), "saveCombinedAppsWithNotification:", 1);
      objc_msgSend(WeakRetained, "reloadPluginsImmediately");
      v5 = *(void **)(a1 + 40);
      v7[0] = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v6, 100);

      if ((objc_msgSend(*(id *)(a1 + 56), "_hasPluginsToHideOrDelete") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 56), "setEditing:animated:", 0, 1);
    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ((-[CKAppManagerViewController isEditing](self, "isEditing", a3) & 1) != 0)
    return 2;
  if (-[CKAppManagerViewController hasAppStore](self, "hasAppStore"))
    return 2;
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;

  if (-[CKAppManagerViewController isEditing](self, "isEditing", a3))
  {
    if (a4 == 1)
    {
      v6 = 1016;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "count");
    }
    if (!a4)
    {
      v6 = 1008;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "count");
    }
    return 0;
  }
  if (a4 != 1)
  {
    if (!a4)
    {
      v6 = 1000;
      return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "count");
    }
    return 0;
  }
  return -[CKAppManagerViewController hasAppStore](self, "hasAppStore");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[CKAppManagerViewController isEditing](self, "isEditing");
  v9 = objc_msgSend(v7, "section");
  if (v8)
  {
    if (v9 == 1)
    {
      +[CKAppManagerAppTableViewCell reuseIdentifier](CKAppManagerAppTableViewCell, "reuseIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 1016;
    }
    else
    {
      if (v9)
      {
        v14 = 0;
        v11 = 0;
        goto LABEL_11;
      }
      +[CKAppManagerAppTableViewCell reuseIdentifier](CKAppManagerAppTableViewCell, "reuseIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = 1008;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v12), "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateCellWithPluginInfo:", v14);
    objc_msgSend(v11, "setDelegate:", self);
LABEL_11:
    objc_msgSend(v11, "setToggleVisible:editable:isOn:", objc_msgSend(v7, "section") == 1, 1, -[CKAppManagerViewController _pluginIsHidden:](self, "_pluginIsHidden:", v14) ^ 1);
LABEL_15:
    v16 = v11;

    goto LABEL_16;
  }
  if (v9 != 1)
  {
    if (v9)
    {
      v14 = 0;
      v11 = 0;
    }
    else
    {
      +[CKAppManagerAppTableViewCell reuseIdentifier](CKAppManagerAppTableViewCell, "reuseIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray objectAtIndexedSubscript:](self->_plugins, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateCellWithPluginInfo:", v14);
      objc_msgSend(v11, "setDelegate:", self);
    }
    goto LABEL_15;
  }
  if (-[CKAppManagerViewController hasAppStore](self, "hasAppStore"))
  {
    -[CKAppManagerViewController getStickersOnAppStoreTableViewCell](self, "getStickersOnAppStoreTableViewCell");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_16:

  return v16;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  double result;

  v4 = -[CKAppManagerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3, a4);
  result = *MEMORY[0x1E0CEBC10];
  if (v4 <= 0)
    return 0.0;
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  double result;

  v4 = -[CKAppManagerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3, a4);
  result = *MEMORY[0x1E0CEBC10];
  if (v4 <= 0)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (-[CKAppManagerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4) < 1)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_12;
  }
  if (!-[CKAppManagerViewController isEditing](self, "isEditing"))
  {
    if (!a4)
    {
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("AppManagerSectionHeaderReuseIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("STICKER_APPS"), &stru_1E276D870, CFSTR("ChatKit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v11);
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("AppManagerSectionHeaderReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("APPS_WITH_STICKER_APPS_SECTION_HEADER");
    goto LABEL_9;
  }
  if (!a4)
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("STICKERS_ONLY_APPS_SECTION_HEADER");
LABEL_9:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedUppercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

LABEL_11:
  }
LABEL_12:

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = -[CKAppManagerViewController isEditing](self, "isEditing");
  v8 = 0;
  if (a4 == 1 && v7)
  {
    if (-[CKAppManagerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, 1) < 1)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("AppManagerSectionFooterReuseIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APPS_WITH_STICKER_APPS_SECTION_FOOTER"), &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v10);

    }
  }

  return v8;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = (-[CKAppManagerViewController isEditing](self, "isEditing") & 1) == 0 && objc_msgSend(v5, "section") == 0;

  return v6;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  if ((-[CKAppManagerViewController isEditing](self, "isEditing") & 1) == 0
    && !objc_msgSend(v14, "section")
    && !objc_msgSend(v7, "section"))
  {
    v8 = objc_msgSend(v14, "row");
    -[CKAppManagerViewController plugins](self, "plugins");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 < v10)
    {
      -[CKAppManagerViewController plugins](self, "plugins");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateIndexPath:forCombinedStickerApp:", v7, v12);

      -[CKAppManagerViewController reloadPluginsImmediately](self, "reloadPluginsImmediately");
    }
  }

}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[CKAppManagerViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, 0)- 1, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;

  return v10;
}

- (id)getStickersOnAppStoreTableViewCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, 0);
  objc_msgSend(v2, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GET_STICKER_APPS"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  objc_msgSend(v2, "setContentConfiguration:", v3);
  return v2;
}

- (void)appCell:(id)a3 wasToggledOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[UITableView indexPathForCell:](self->_tableView, "indexPathForCell:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CKAppManagerViewController isEditing](self, "isEditing") && objc_msgSend(v6, "section") == 1)
    -[CKAppManagerViewController togglePluginAtIndex:enabled:](self, "togglePluginAtIndex:enabled:", objc_msgSend(v6, "row"), v4);

}

- (BOOL)allowEnablingDisabledApps
{
  void *v2;
  char v3;

  -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppInstallationEnabled");

  return v3;
}

- (BOOL)togglePluginAtIndex:(unint64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  -[CKAppManagerViewController appContainedPlugins](self, "appContainedPlugins");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = v8 > a3;
  if (v8 <= a3)
  {
    if (_IMWillLog())
    {
      -[CKAppManagerViewController plugins](self, "plugins");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "count");
      _IMAlwaysLog();
      goto LABEL_8;
    }
    return 0;
  }
  if (v4 && !-[CKAppManagerViewController allowEnablingDisabledApps](self, "allowEnablingDisabledApps"))
    return 0;
  -[CKAppManagerViewController appContainedPlugins](self, "appContainedPlugins");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAppManagerViewController balloonPluginManager](self, "balloonPluginManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlugin:hiddenInSendMenuAndStickers:", v11, v4);
  -[CKAppManagerViewController reloadPluginsImmediately](self, "reloadPluginsImmediately");
  objc_msgSend(v12, "saveCombinedAppsWithNotification:", 1);

LABEL_8:
  return v9;
}

- (BOOL)isManagingStickers
{
  return self->_isManagingStickers;
}

- (void)setIsManagingStickers:(BOOL)a3
{
  self->_isManagingStickers = a3;
}

- (CKAppManagerViewControllerDelegate)delegate
{
  return (CKAppManagerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_plugins, a3);
}

- (void)setDeletableIMessageApps:(id)a3
{
  objc_storeStrong((id *)&self->_deletableIMessageApps, a3);
}

- (void)setAppContainedPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_appContainedPlugins, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContainedPlugins, 0);
  objc_storeStrong((id *)&self->_deletableIMessageApps, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
