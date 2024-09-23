@implementation SUUISettingsDocumentViewController

- (SUUISettingsDocumentViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUISettingsDocumentViewController *v9;
  SUUISettingsDocumentViewController *v10;
  SUUISettingsContext *v11;
  SUUISettingsContext *settingsContext;
  uint64_t v13;
  SUUISettingsGroupsDescription *settingsGroupsDescription;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUUISettingsDocumentViewController;
  v9 = -[SUUISettingsDocumentViewController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    -[SUUIViewController setClientContext:](v9, "setClientContext:", v8);
    v11 = -[SUUISettingsContext initWithClientContext:]([SUUISettingsContext alloc], "initWithClientContext:", v8);
    settingsContext = v10->_settingsContext;
    v10->_settingsContext = v11;

    objc_storeStrong((id *)&v10->_templateElement, a3);
    objc_msgSend((id)objc_opt_class(), "_settingsGroupsFromTemplateElement:withDelegate:settingsContext:", v10->_templateElement, v10, v10->_settingsContext);
    v13 = objc_claimAutoreleasedReturnValue();
    settingsGroupsDescription = v10->_settingsGroupsDescription;
    v10->_settingsGroupsDescription = (SUUISettingsGroupsDescription *)v13;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v10, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);
    -[SUUISettingsDocumentViewController _reloadData](v10, "_reloadData");
    -[SUUISettingsDocumentViewController _invalidateLayout](v10, "_invalidateLayout");

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUISettingsDocumentViewController;
  -[SUUIViewController dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[SUUISettingsGroupsDescription numberOfGroups](self->_settingsGroupsDescription, "numberOfGroups", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double Width;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CGRect v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v15);
  -[SUUISettingsGroupsDescription settingDescriptionAtIndexPath:](self->_settingsGroupsDescription, "settingDescriptionAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(+[SUUISettingDescription viewClassForSettingDescription:](SUUISettingDescription, "viewClassForSettingDescription:", v9));
  -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadWithSettingDescription:width:context:", v9, v11, Width);

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("SUUISettingsTableViewCellReuseIdentifier"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "displaySettingDescriptionView:", v10);
  if (objc_msgSend(v9, "allowsSelection"))
    v13 = 3;
  else
    v13 = 0;
  objc_msgSend(v12, "setSelectionStyle:", v13);

  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[SUUISettingsGroupsDescription numberOfSettingsInGroupAtIndex:](self->_settingsGroupsDescription, "numberOfSettingsInGroupAtIndex:", a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SUUISettingsGroupsDescription settingDescriptionAtIndexPath:](self->_settingsGroupsDescription, "settingDescriptionAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "allowsSelection"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __72__SUUISettingsDocumentViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v10[3] = &unk_2511F53F8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v9, "handleSelectionOnCompletion:", v10);
    objc_destroyWeak(&v11);
  }
  else
  {
    -[SUUISettingsDocumentViewController _deselectItemsAnimated:](self, "_deselectItemsAnimated:", 1);
  }

  objc_destroyWeak(&location);
}

void __72__SUUISettingsDocumentViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_deselectItemsAnimated:", 1);

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  SUUISettingsGroupsDescription *settingsGroupsDescription;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  void *v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  CGRect v26;

  settingsGroupsDescription = self->_settingsGroupsDescription;
  v7 = a3;
  -[SUUISettingsGroupsDescription footerDescriptionForGroupAtIndex:](settingsGroupsDescription, "footerDescriptionForGroupAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  Width = CGRectGetWidth(v26);
  -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_heightThatFitsWidth:withSettingsHeaderFooterDescription:context:", v8, v19, Width);
  v21 = v20;

  if (-[SUUISettingsGroupsDescription numberOfGroups](self->_settingsGroupsDescription, "numberOfGroups") - 1 == a4)
  {
    v22 = 36.0;
  }
  else
  {
    v23 = -[SUUISettingsGroupsDescription shouldShowHeaderForGroupAtIndex:](self->_settingsGroupsDescription, "shouldShowHeaderForGroupAtIndex:", a4 + 1);
    v22 = 36.0;
    if (v23)
      v22 = 2.22044605e-16;
  }
  v24 = v21 + v22;

  return v24;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  SUUISettingsGroupsDescription *settingsGroupsDescription;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double Width;
  void *v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  CGRect v26;

  settingsGroupsDescription = self->_settingsGroupsDescription;
  v7 = a3;
  -[SUUISettingsGroupsDescription headerDescriptionForGroupAtIndex:](settingsGroupsDescription, "headerDescriptionForGroupAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  Width = CGRectGetWidth(v26);
  -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_heightThatFitsWidth:withSettingsHeaderFooterDescription:context:", v8, v19, Width);
  v21 = v20;

  if (a4)
  {
    v22 = -[SUUISettingsGroupsDescription shouldShowHeaderForGroupAtIndex:](self->_settingsGroupsDescription, "shouldShowHeaderForGroupAtIndex:", a4);
    v23 = 2.22044605e-16;
    if (v22)
      v23 = 36.0;
  }
  else
  {
    v23 = 16.0;
  }
  v24 = v21 + v23;

  return v24;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double Width;
  void *v8;
  objc_class *v9;
  void *v10;
  double v11;
  double v12;
  CGRect v14;

  v6 = a4;
  objc_msgSend(a3, "bounds");
  Width = CGRectGetWidth(v14);
  -[SUUISettingsGroupsDescription settingDescriptionAtIndexPath:](self->_settingsGroupsDescription, "settingDescriptionAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[SUUISettingDescription viewClassForSettingDescription:](SUUISettingDescription, "viewClassForSettingDescription:", v8);
  -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class sizeThatFitsWidth:settingDescription:context:](v9, "sizeThatFitsWidth:settingDescription:context:", v8, v10, Width);
  v12 = v11;

  return fmax(v12, 48.0);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;

  if (-[SUUISettingsGroupsDescription shouldShowFooterForGroupAtIndex:](self->_settingsGroupsDescription, "shouldShowFooterForGroupAtIndex:", a4))
  {
    -[SUUISettingsGroupsDescription footerDescriptionForGroupAtIndex:](self->_settingsGroupsDescription, "footerDescriptionForGroupAtIndex:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsDocumentViewController _viewForSettingsHeaderFooterDescription:](self, "_viewForSettingsHeaderFooterDescription:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self->_tableView, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("SUUISettingsTableViewEmptyHeaderFooterViewReuseIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;

  if (-[SUUISettingsGroupsDescription shouldShowHeaderForGroupAtIndex:](self->_settingsGroupsDescription, "shouldShowHeaderForGroupAtIndex:", a4))
  {
    -[SUUISettingsGroupsDescription headerDescriptionForGroupAtIndex:](self->_settingsGroupsDescription, "headerDescriptionForGroupAtIndex:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsDocumentViewController _viewForSettingsHeaderFooterDescription:](self, "_viewForSettingsHeaderFooterDescription:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self->_tableView, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("SUUISettingsTableViewEmptyHeaderFooterViewReuseIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)loadView
{
  void *v3;
  uint64_t v4;
  SUUISettingsDocumentView *v5;

  v5 = objc_alloc_init(SUUISettingsDocumentView);
  -[SUUISettingsDocumentView setDelegate:](v5, "setDelegate:", self);
  -[SUUISettingsDocumentViewController _tableView](self, "_tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (storeShouldReverseLayoutDirection())
    v4 = 4;
  else
    v4 = 3;
  objc_msgSend(v3, "setSemanticContentAttribute:", v4);
  -[SUUISettingsDocumentView addSubview:](v5, "addSubview:", v3);
  -[SUUISettingsDocumentViewController setView:](self, "setView:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUISettingsDocumentViewController;
  -[SUUISettingsDocumentViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[SUUIResourceLoader enterForeground](self->_resourceLoader, "enterForeground");
  if (-[SUUISettingsGroupsDescription hasEditableSettingDescriptions](self->_settingsGroupsDescription, "hasEditableSettingDescriptions"))
  {
    -[SUUISettingsDocumentViewController _showEditBarButtonItemAnimated:](self, "_showEditBarButtonItemAnimated:", v3);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUISettingsDocumentViewController;
  -[SUUIViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SUUISettingsDocumentViewController _reloadData](self, "_reloadData");
  -[SUUISettingsDocumentViewController _invalidateLayout](self, "_invalidateLayout");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUISettingsDocumentViewController;
  -[SUUISettingsDocumentViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[SUUISettingsDocumentViewController _invalidateLayout](self, "_invalidateLayout");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUISettingsDocumentViewController;
  -[SUUISettingsDocumentViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SUUIResourceLoader enterBackground](self->_resourceLoader, "enterBackground");
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[UITableView visibleCells](self->_tableView, "visibleCells", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
      -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend(v13, "setImage:forArtworkRequest:context:", v7, v6, v14);

      if ((v13 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)documentDidUpdate:(id)a3
{
  SUUISettingsGroupsDescription *settingsGroupsDescription;
  SUUISettingsGroupsDescription *v5;
  SUUISettingsTemplateViewElement *v6;
  SUUISettingsTemplateViewElement *templateElement;
  SUUISettingsGroupsDescription *v8;
  SUUISettingsGroupsDescription *v9;
  id v10;

  v10 = a3;
  settingsGroupsDescription = self->_settingsGroupsDescription;
  if (settingsGroupsDescription)
  {
    -[SUUISettingsGroupsDescription recycle](settingsGroupsDescription, "recycle");
    v5 = self->_settingsGroupsDescription;
    self->_settingsGroupsDescription = 0;

  }
  objc_msgSend(v10, "templateElement");
  v6 = (SUUISettingsTemplateViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  self->_templateElement = v6;

  objc_msgSend((id)objc_opt_class(), "_settingsGroupsFromTemplateElement:withDelegate:settingsContext:", self->_templateElement, self, self->_settingsContext);
  v8 = (SUUISettingsGroupsDescription *)objc_claimAutoreleasedReturnValue();
  v9 = self->_settingsGroupsDescription;
  self->_settingsGroupsDescription = v8;

  if (-[SUUISettingsGroupsDescription hasEditableSettingDescriptions](self->_settingsGroupsDescription, "hasEditableSettingDescriptions"))
  {
    -[SUUISettingsDocumentViewController _showEditBarButtonItemAnimated:](self, "_showEditBarButtonItemAnimated:", 1);
  }
  -[SUUISettingsDocumentViewController _reloadData](self, "_reloadData");
  -[SUUISettingsDocumentViewController _invalidateLayout](self, "_invalidateLayout");

}

- (void)settingsDocumentViewDidChangeTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTintColor:", v6);
  -[SUUISettingsDocumentViewController _invalidateLayout](self, "_invalidateLayout");
}

- (void)settingsEditTransactionDidCompleteTransaction:(id)a3
{
  -[SUUISettingsDocumentViewController _showEditBarButtonItemAnimated:](self, "_showEditBarButtonItemAnimated:", 1);
}

- (void)settingsEditTransactionDidFailTransaction:(id)a3
{
  id v3;

  -[SUUISettingsDocumentViewController _barButtonItemDone](self, "_barButtonItemDone", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

}

- (void)settingsEditTransactionWillBeginTransaction:(id)a3
{
  -[SUUISettingsDocumentViewController _showEditingBarButtonItemsEnabled:animated:](self, "_showEditingBarButtonItemsEnabled:animated:", objc_msgSend(a3, "isValid"), 1);
}

- (void)settingsEditTransactionWillCommitTransaction:(id)a3
{
  id v3;

  -[SUUISettingsDocumentViewController _barButtonItemDone](self, "_barButtonItemDone", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

}

- (void)settingsEditTransaction:(id)a3 isValid:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[SUUISettingsDocumentViewController _barButtonItemDone](self, "_barButtonItemDone", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)settingsGroupsDescription:(id)a3 deletedSettingAtIndexPath:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x24BDBCE30];
  v6 = a4;
  v7 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v6, 0);

  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](self->_tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 0);
}

- (void)settingsGroupsDescription:(id)a3 deletedSettingsGroupAtIndex:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndex:", a4);
  -[UITableView deleteSections:withRowAnimation:](self->_tableView, "deleteSections:withRowAnimation:", v5, 0);

}

- (void)settingsGroupsDescription:(id)a3 didUpdateSettingsDescription:(id)a4
{
  UITableView *tableView;
  void *v7;
  UITableView *v8;
  UITableView *v9;
  UITableView *v10;
  UITableView *v11;
  UITableView *v12;
  id v13;

  v13 = a4;
  switch(objc_msgSend(v13, "updateType"))
  {
    case 0:
      tableView = self->_tableView;
      objc_msgSend(v13, "indexSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView deleteSections:withRowAnimation:](tableView, "deleteSections:withRowAnimation:", v7, 0);
      break;
    case 1:
      v8 = self->_tableView;
      objc_msgSend(v13, "indexSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView insertSections:withRowAnimation:](v8, "insertSections:withRowAnimation:", v7, 0);
      break;
    case 2:
      v9 = self->_tableView;
      objc_msgSend(v13, "indexSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView reloadSections:withRowAnimation:](v9, "reloadSections:withRowAnimation:", v7, 0);
      break;
    case 3:
      v10 = self->_tableView;
      objc_msgSend(v13, "indexPaths");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](v10, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 0);
      break;
    case 4:
      v11 = self->_tableView;
      objc_msgSend(v13, "indexPaths");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView insertRowsAtIndexPaths:withRowAnimation:](v11, "insertRowsAtIndexPaths:withRowAnimation:", v7, 0);
      break;
    case 5:
      v12 = self->_tableView;
      objc_msgSend(v13, "indexPaths");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](v12, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 5);
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingsDocumentViewController.m"), 374, CFSTR("Hit unhandled update type."));
      break;
  }

}

- (void)settingsGroupsDescription:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v7 = a5;
  v16 = a4;
  v10 = a6;
  -[SUUISettingsDocumentViewController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v16);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingsDocumentViewController.m"), 383, CFSTR("Cannot dismiss view controller as it is not the view controller currently presented."));

  }
  -[SUUISettingsDocumentViewController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v16);

  if (v14)
    -[SUUISettingsDocumentViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v7, v10);

}

- (void)settingsGroupsDescription:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v14 = a4;
  v10 = a6;
  -[SUUISettingsDocumentViewController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUUISettingsDocumentViewController.m"), 393, CFSTR("Already presenting a view controller."));

  }
  -[SUUISettingsDocumentViewController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    -[SUUISettingsDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, v7, v10);

}

- (id)settingsGroupsDescription:(id)a3 viewForSettingAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingDescriptionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)settingsGroupsDescriptionDidUpdateValidity:(id)a3
{
  if (self->_editTransaction)
    -[UIBarButtonItem setEnabled:](self->_barButtonItemDone, "setEnabled:", -[SUUISettingsEditTransaction isValid](self->_editTransaction, "isValid", a3));
}

- (void)_cancelButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SUUISettingsEditTransaction *editTransaction;

  if (-[SUUISettingsEditTransaction isCommiting](self->_editTransaction, "isCommiting", a3))
  {
    -[SUUISettingsEditTransaction cancelTransaction](self->_editTransaction, "cancelTransaction");
  }
  else
  {
    -[SUUISettingsDocumentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

    -[SUUISettingsEditTransaction rollbackTransaction](self->_editTransaction, "rollbackTransaction");
    editTransaction = self->_editTransaction;
    self->_editTransaction = 0;

  }
}

- (void)_doneButtonAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SUUISettingsDocumentViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  -[SUUISettingsEditTransaction commitTransaction](self->_editTransaction, "commitTransaction");
}

- (void)_editButtonAction:(id)a3
{
  SUUISettingsEditTransaction *v4;
  SUUISettingsEditTransaction *editTransaction;

  -[SUUISettingsGroupsDescription createEditTransaction](self->_settingsGroupsDescription, "createEditTransaction", a3);
  v4 = (SUUISettingsEditTransaction *)objc_claimAutoreleasedReturnValue();
  editTransaction = self->_editTransaction;
  self->_editTransaction = v4;

  -[SUUISettingsEditTransaction setDelegate:](self->_editTransaction, "setDelegate:", self);
  -[SUUISettingsEditTransaction beginTransaction](self->_editTransaction, "beginTransaction");
}

+ (double)_heightThatFitsWidth:(double)a3 withSettingsHeaderFooterDescription:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;

  if (!a4)
    return 0.0;
  v7 = a5;
  v8 = a4;
  -[objc_class sizeThatFitsWidth:settingsHeaderFooterDescription:context:](+[SUUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:](SUUISettingsHeaderFooterDescription, "viewClassForSettingsHeaderFooterDescription:", v8), "sizeThatFitsWidth:settingsHeaderFooterDescription:context:", v8, v7, a3);
  v10 = v9;

  return v10;
}

+ (id)_settingsGroupsFromTemplateElement:(id)a3 withDelegate:(id)a4 settingsContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  SUUISettingsGroupsDescription *v10;
  SUUISettingsGroupsDescription *v11;
  _QWORD v13[4];
  SUUISettingsGroupsDescription *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SUUISettingsGroupsDescription initWithDelegate:settingsContext:]([SUUISettingsGroupsDescription alloc], "initWithDelegate:settingsContext:", v8, v7);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __102__SUUISettingsDocumentViewController__settingsGroupsFromTemplateElement_withDelegate_settingsContext___block_invoke;
  v13[3] = &unk_2511F46F8;
  v11 = v10;
  v14 = v11;
  objc_msgSend(v9, "enumerateChildrenUsingBlock:", v13);

  return v11;
}

void __102__SUUISettingsDocumentViewController__settingsGroupsFromTemplateElement_withDelegate_settingsContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 46)
    objc_msgSend(*(id *)(a1 + 32), "addSettingsGroupWithViewElement:", v3);

}

- (id)_barButtonItemCancel
{
  UIBarButtonItem *barButtonItemCancel;
  void *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  barButtonItemCancel = self->_barButtonItemCancel;
  if (!barButtonItemCancel)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("SETTINGS_NAVIGATION_CANCEL"), CFSTR("Settings"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_NAVIGATION_CANCEL"), 0, CFSTR("Settings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v6, 0, self, sel__cancelButtonAction_);
    v8 = self->_barButtonItemCancel;
    self->_barButtonItemCancel = v7;

    barButtonItemCancel = self->_barButtonItemCancel;
  }
  return barButtonItemCancel;
}

- (id)_barButtonItemDone
{
  UIBarButtonItem *barButtonItemDone;
  void *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  barButtonItemDone = self->_barButtonItemDone;
  if (!barButtonItemDone)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("SETTINGS_NAVIGATION_DONE"), CFSTR("Settings"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_NAVIGATION_DONE"), 0, CFSTR("Settings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v6, 2, self, sel__doneButtonAction_);
    v8 = self->_barButtonItemDone;
    self->_barButtonItemDone = v7;

    barButtonItemDone = self->_barButtonItemDone;
  }
  return barButtonItemDone;
}

- (id)_barButtonItemEdit
{
  UIBarButtonItem *barButtonItemEdit;
  void *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  barButtonItemEdit = self->_barButtonItemEdit;
  if (!barButtonItemEdit)
  {
    -[SUUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("SETTINGS_NAVIGATION_EDIT"), CFSTR("Settings"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("SETTINGS_NAVIGATION_EDIT"), 0, CFSTR("Settings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v6, 0, self, sel__editButtonAction_);
    v8 = self->_barButtonItemEdit;
    self->_barButtonItemEdit = v7;

    barButtonItemEdit = self->_barButtonItemEdit;
  }
  return barButtonItemEdit;
}

- (id)_dequeueHeaderFooterViewWithReuseIdentifier:(id)a3
{
  void *v4;

  -[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self->_tableView, "dequeueReusableHeaderFooterViewWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView layoutMargins](self->_tableView, "layoutMargins");
  objc_msgSend(v4, "setLayoutMargins:");
  return v4;
}

- (void)_deselectItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  -[UITableView indexPathsForSelectedRows](self->_tableView, "indexPathsForSelectedRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_invalidateLayout
{
  SUUISettingsGroupsDescription *settingsGroupsDescription;
  double Width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITableView *tableView;
  void *v11;
  id v12;
  CGRect v13;

  if (-[SUUISettingsDocumentViewController isViewLoaded](self, "isViewLoaded"))
  {
    settingsGroupsDescription = self->_settingsGroupsDescription;
    -[UITableView bounds](self->_tableView, "bounds");
    Width = CGRectGetWidth(v13);
    -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUISettingsGroupsDescription requestLayoutForWidth:context:](settingsGroupsDescription, "requestLayoutForWidth:context:", v5, Width);

    -[SUUISettingsDocumentViewController _textLayoutCache](self, "_textLayoutCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commitLayoutRequests");

    -[SUUISettingsTemplateViewElement style](self->_templateElement, "style");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForStyle:", *MEMORY[0x24BE518A0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      tableView = self->_tableView;
      objc_msgSend(v8, "color");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView setBackgroundColor:](tableView, "setBackgroundColor:", v11);

    }
    -[UITableView reloadData](self->_tableView, "reloadData");

  }
}

- (id)_layoutContext
{
  SUUIViewElementLayoutContext *layoutContext;
  SUUIViewElementLayoutContext *v4;
  SUUIViewElementLayoutContext *v5;
  SUUIViewElementLayoutContext *v6;
  void *v7;
  SUUIViewElementLayoutContext *v8;
  void *v9;
  SUUIViewElementLayoutContext *v10;
  void *v11;
  SUUIViewElementLayoutContext *v12;
  void *v13;
  void *v14;

  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    v5 = self->_layoutContext;
    self->_layoutContext = v4;

    -[SUUIViewElementLayoutContext setArtworkRequestDelegate:](self->_layoutContext, "setArtworkRequestDelegate:", self);
    v6 = self->_layoutContext;
    -[SUUISettingsDocumentViewController _textLayoutCache](self, "_textLayoutCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setLabelLayoutCache:](v6, "setLabelLayoutCache:", v7);

    v8 = self->_layoutContext;
    -[SUUISettingsDocumentViewController _resourceLoader](self, "_resourceLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setResourceLoader:](v8, "setResourceLoader:", v9);

    v10 = self->_layoutContext;
    -[SUUIViewController clientContext](self, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setClientContext:](v10, "setClientContext:", v11);

    v12 = self->_layoutContext;
    -[SUUISettingsDocumentViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElementLayoutContext setTintColor:](v12, "setTintColor:", v14);

    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_reloadData
{
  -[SUUISettingsGroupsDescription reloadData](self->_settingsGroupsDescription, "reloadData");
}

- (id)_resourceLoader
{
  SUUIResourceLoader *resourceLoader;
  SUUIResourceLoader *v4;
  void *v5;
  SUUIResourceLoader *v6;
  SUUIResourceLoader *v7;
  SUUIResourceLoader *v8;
  void *v9;

  resourceLoader = self->_resourceLoader;
  if (!resourceLoader)
  {
    v4 = [SUUIResourceLoader alloc];
    -[SUUIViewController clientContext](self, "clientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUUIResourceLoader initWithClientContext:](v4, "initWithClientContext:", v5);
    v7 = self->_resourceLoader;
    self->_resourceLoader = v6;

    v8 = self->_resourceLoader;
    SUUIResourceLoaderGetNameForObject(self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIResourceLoader setName:](v8, "setName:", v9);

    resourceLoader = self->_resourceLoader;
  }
  return resourceLoader;
}

- (void)_showBarItemLeft:(id)a3 right:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  -[SUUISettingsDocumentViewController parentViewController](self, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "setHidesBackButton:animated:", 1, v5);
    v11 = v10;
    v12 = v13;
  }
  else
  {
    objc_msgSend(v10, "setHidesBackButton:animated:", 0, v5);
    v11 = v10;
    v12 = 0;
  }
  objc_msgSend(v11, "setLeftBarButtonItem:animated:", v12, v5);
  objc_msgSend(v10, "setRightBarButtonItem:animated:", v8, v5);

}

- (void)_showEditBarButtonItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SUUISettingsDocumentViewController _barButtonItemEdit](self, "_barButtonItemEdit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsDocumentViewController _showBarItemLeft:right:animated:](self, "_showBarItemLeft:right:animated:", 0, v5, v3);

}

- (void)_showEditingBarButtonItemsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  -[SUUISettingsDocumentViewController _barButtonItemDone](self, "_barButtonItemDone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  -[SUUISettingsDocumentViewController _barButtonItemCancel](self, "_barButtonItemCancel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsDocumentViewController _barButtonItemDone](self, "_barButtonItemDone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsDocumentViewController _showBarItemLeft:right:animated:](self, "_showBarItemLeft:right:animated:", v9, v8, v4);

}

- (id)_textLayoutCache
{
  SUUIViewElementTextLayoutCache *textLayoutCache;
  SUUILayoutCache *v4;
  SUUIViewElementTextLayoutCache *v5;
  SUUIViewElementTextLayoutCache *v6;

  textLayoutCache = self->_textLayoutCache;
  if (!textLayoutCache)
  {
    v4 = objc_alloc_init(SUUILayoutCache);
    v5 = -[SUUIViewElementTextLayoutCache initWithLayoutCache:]([SUUIViewElementTextLayoutCache alloc], "initWithLayoutCache:", v4);
    v6 = self->_textLayoutCache;
    self->_textLayoutCache = v5;

    textLayoutCache = self->_textLayoutCache;
  }
  return textLayoutCache;
}

- (id)_tableView
{
  UITableView *tableView;
  id v4;
  UITableView *v5;
  UITableView *v6;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_tableView;
    self->_tableView = v5;

    -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SUUISettingsTableViewCellReuseIdentifier"));
    -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableView, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("SUUISettingsTableViewEmptyHeaderFooterViewReuseIdentifier"));
    -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self->_tableView, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("SUUISettingsTableViewHeaderFooterViewReuseIdentifier"));
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_viewForSettingsHeaderFooterDescription:(id)a3
{
  id v4;
  id v5;
  double Width;
  void *v7;
  void *v8;
  CGRect v10;

  v4 = a3;
  v5 = objc_alloc_init(+[SUUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:](SUUISettingsHeaderFooterDescription, "viewClassForSettingsHeaderFooterDescription:", v4));
  -[UITableView bounds](self->_tableView, "bounds");
  Width = CGRectGetWidth(v10);
  -[SUUISettingsDocumentViewController _layoutContext](self, "_layoutContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadWithSettingsHeaderFooterDescription:width:context:", v4, v7, Width);

  -[SUUISettingsDocumentViewController _dequeueHeaderFooterViewWithReuseIdentifier:](self, "_dequeueHeaderFooterViewWithReuseIdentifier:", CFSTR("SUUISettingsTableViewHeaderFooterViewReuseIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displaySettingsHeaderFooterDescriptionView:", v5);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_settingsGroupsDescription, 0);
  objc_storeStrong((id *)&self->_settingsContext, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editTransaction, 0);
  objc_storeStrong((id *)&self->_barButtonItemEdit, 0);
  objc_storeStrong((id *)&self->_barButtonItemDone, 0);
  objc_storeStrong((id *)&self->_barButtonItemCancel, 0);
}

@end
