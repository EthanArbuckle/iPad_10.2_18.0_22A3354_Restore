@implementation FPUIAuthenticationTableViewController

- (FPUIAuthenticationTableViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationTableViewController;
  return -[FPUIAuthenticationTableViewController initWithStyle:](&v3, sel_initWithStyle_, 2);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FPUIAuthenticationTableViewController;
  -[FPUIAuthenticationTableViewController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  -[FPUIAuthenticationTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTableFooterView:", v3);

  v5 = *MEMORY[0x24BDF7DE0];
  -[FPUIAuthenticationTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", v5);

  -[FPUIAuthenticationTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", 44.0);

  -[FPUIAuthenticationTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionHeaderTopPadding:", 0.0);

  -[FPUIAuthenticationTableViewController defaultLeftBarButtonItem](self, "defaultLeftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  -[FPUIAuthenticationTableViewController _stateDidChange](self, "_stateDidChange");
  objc_msgSend((id)objc_opt_class(), "defaultTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setTitle:](self, "setTitle:", v11);

  -[FPUIAuthenticationTableViewController setupTableViewSections](self, "setupTableViewSections");
}

- (BOOL)isTransitioning
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (void)setTransitioning:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  -[FPUIAuthenticationTableViewController _setState:](self, "_setState:", self->_state & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)canTransitionToNextStep
{
  return self->_state & 1;
}

- (void)setCanTransitionToNextStep:(BOOL)a3
{
  -[FPUIAuthenticationTableViewController _setState:](self, "_setState:", self->_state & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)_setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[FPUIAuthenticationTableViewController _stateDidChange](self, "_stateDidChange");
  }
}

- (void)_stateDidChange
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (-[FPUIAuthenticationTableViewController isTransitioning](self, "isTransitioning"))
  {
    -[FPUIAuthenticationTableViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", 0);
  }
  else
  {
    -[FPUIAuthenticationTableViewController defaultRightBarButtonItem](self, "defaultRightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPUIAuthenticationTableViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

    v6 = -[FPUIAuthenticationTableViewController canTransitionToNextStep](self, "canTransitionToNextStep");
    -[FPUIAuthenticationTableViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v6);

  }
  v8 = -[FPUIAuthenticationTableViewController isTransitioning](self, "isTransitioning") ^ 1;
  -[FPUIAuthenticationTableViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", v8);

}

- (id)defaultLeftBarButtonItem
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  FPUILoc(CFSTR("CANCEL_NAV_BAR_BUTTON_TITLE"), v4, v5, v6, v7, v8, v9, v10, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v11, 0, self, sel__cancel_);

  return v12;
}

- (id)defaultRightBarButtonItem
{
  return 0;
}

+ (id)defaultTitle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return FPUILoc(CFSTR("CONNECT_TO_SERVER"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPUIAuthenticationTableViewController;
  v4 = a3;
  -[FPUIAuthenticationTableViewController setTitle:](&v6, sel_setTitle_, v4);
  -[FPUIAuthenticationTableViewController _titleView](self, "_titleView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (id)_titleView
{
  void *v4;
  void *v5;
  void *v6;

  -[FPUIAuthenticationTableViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = (void *)objc_opt_new();
    -[FPUIAuthenticationTableViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleView:", v5);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationTableViewController.m"), 143, CFSTR("bad titleView type"));
LABEL_5:

  }
  return v5;
}

- (void)setNavBarActivityIndicatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[FPUIAuthenticationTableViewController _titleView](self, "_titleView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivityIndicatorHidden:", v3);

}

- (void)selectTextFieldAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FPUIAuthenticationTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
}

- (void)_cancel:(id)a3
{
  id v3;

  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAuthenticationSession");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionDescriptors, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  int64_t v9;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if (!v7)
    return 0;
  -[FPUIAuthenticationTableViewController _rowDescriptorsForSection:](self, "_rowDescriptorsForSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)_rowDescriptorsForSection:(int64_t)a3
{
  NSDictionary *rowDescriptors;
  void *v6;
  void *v7;
  void *v9;

  rowDescriptors = self->_rowDescriptors;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](rowDescriptors, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationTableViewController.m"), 195, CFSTR("nil row descriptors"));

  }
  return v7;
}

- (id)_rowDescriptorForIndexPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v5 = a3;
  -[FPUIAuthenticationTableViewController _rowDescriptorsForSection:](self, "_rowDescriptorsForSection:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationTableViewController.m"), 203, CFSTR("nil row descriptor"));

  }
  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowHeight");
  v6 = v5;

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  v5 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldHighlightRows"))
  {
    -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shouldHighlight");
    v9 = v8 != 0.0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  double v7;
  void *v8;
  double v9;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (objc_msgSend(v6, "isActive"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headerHeight");
    v7 = v9;

  }
  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray lastObject](self->_sectionDescriptors, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    objc_msgSend(v5, "footerHeight");
    v10 = v9;

    if (v10 == 0.0)
    {
      v7 = 35.0;
      goto LABEL_7;
    }
  }
  else
  {

  }
  v7 = 0.0;
  if (objc_msgSend(v5, "isActive"))
  {
    objc_msgSend(v5, "footerHeight");
    v7 = v8;
  }
LABEL_7:

  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryButtonTapHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionHandler");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isActive"))
  {
    objc_msgSend(v4, "headerTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isActive"))
  {
    objc_msgSend(v4, "footerTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_tableView:(id)a3 viewOfType:(unint64_t)a4 inSection:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;

  v8 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_sectionDescriptors, "objectAtIndexedSubscript:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isActive"))
  {
    v10 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    v10 = (void *)objc_msgSend(v9, "footerViewClass");
    if (!v10)
      goto LABEL_14;
    objc_msgSend(v9, "footerViewReuseIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)objc_msgSend(v9, "headerViewClass");
    if (!v10)
      goto LABEL_14;
    objc_msgSend(v9, "headerViewReuseIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  objc_msgSend(v8, "registerClass:forHeaderFooterViewReuseIdentifier:", v10, v11);
  objc_msgSend(v8, "dequeueReusableHeaderFooterViewWithIdentifier:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_msgSend(v9, "footerViewCustomizationBlock");
  else
    objc_msgSend(v9, "headerViewCustomizationBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E29FB2C]();

  if (v14)
    ((void (**)(_QWORD, void *))v14)[2](v14, v10);
  objc_msgSend(v8, "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

LABEL_14:
  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return -[FPUIAuthenticationTableViewController _tableView:viewOfType:inSection:](self, "_tableView:viewOfType:inSection:", a3, 0, a4);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return -[FPUIAuthenticationTableViewController _tableView:viewOfType:inSection:](self, "_tableView:viewOfType:inSection:", a3, 1, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  NSArray *sectionDescriptors;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;

  v7 = a4;
  sectionDescriptors = self->_sectionDescriptors;
  v9 = a3;
  -[NSArray objectAtIndexedSubscript:](sectionDescriptors, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "rowCellClass");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v10, "rowCellReuseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_6;
  }
  else
  {
    v13 = objc_msgSend(v11, "cellClass");
    objc_msgSend(v11, "cellReuseIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v15;
    if (v13)
    {
      if (v15)
        goto LABEL_6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationTableViewController.m"), 337, CFSTR("nil cell class"));

      v13 = 0;
      if (v14)
        goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationTableViewController.m"), 338, CFSTR("nil cell reuse identifier"));

LABEL_6:
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", v13, v14);
  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setSelectionStyle:", objc_msgSend(v11, "cellSelectionStyle"));
  objc_msgSend(v11, "cellCustomizationHandler");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v16, v7);

  return v16;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[FPUIAuthenticationTableViewController _rowDescriptorForIndexPath:](self, "_rowDescriptorForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellWillDisplayHandler");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v11, v7);

}

- (void)authenticationDelegate:(id)a3 didReceiveCredentialDescriptors:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  FPUIAuthenticationCredentialsViewController *v8;

  v5 = a4;
  v8 = -[FPUIAuthenticationCredentialsViewController initWithCredentialDescriptors:]([FPUIAuthenticationCredentialsViewController alloc], "initWithCredentialDescriptors:", v5);

  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setAuthenticationDelegate:](v8, "setAuthenticationDelegate:", v6);

  -[FPUIAuthenticationTableViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

  -[FPUIAuthenticationTableViewController setNavBarActivityIndicatorHidden:](self, "setNavBarActivityIndicatorHidden:", 1);
}

- (void)authenticationDelegate:(id)a3 didReceiveVolumeMountRepresentations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  FPUIAuthenticationTableViewController *v10;

  v5 = a4;
  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke;
  v8[3] = &unk_24EFEE3F8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  objc_msgSend(v6, "mountedVolumeIdentifiersWithCompletionHandler:", v8);

}

void __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke_2;
  block[3] = &unk_24EFEE120;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __101__FPUIAuthenticationTableViewController_authenticationDelegate_didReceiveVolumeMountRepresentations___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  FPUIAuthenticationVolumeMountViewController *v4;

  v4 = -[FPUIAuthenticationVolumeMountViewController initWithVolumes:mountedVolumeIdentifiers:]([FPUIAuthenticationVolumeMountViewController alloc], "initWithVolumes:mountedVolumeIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "authenticationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setAuthenticationDelegate:](v4, "setAuthenticationDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

  objc_msgSend(*(id *)(a1 + 48), "setNavBarActivityIndicatorHidden:", 1);
}

- (void)authenticationDelegate:(id)a3 didEncounterError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD block[5];

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationTableViewController.m"), 392, CFSTR("got nil error"));

  }
  objc_msgSend(v7, "didEncounterError:completionHandler:", v8, &__block_literal_global_6);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__FPUIAuthenticationTableViewController_authenticationDelegate_didEncounterError___block_invoke_2;
  block[3] = &unk_24EFEDFA0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __82__FPUIAuthenticationTableViewController_authenticationDelegate_didEncounterError___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNavBarActivityIndicatorHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 0);
}

- (void)authenticationDelegate:(id)a3 didFinishWithError:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __101__FPUIAuthenticationTableViewController_authenticationDelegate_didFinishWithError_completionHandler___block_invoke;
  block[3] = &unk_24EFEDFC8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __101__FPUIAuthenticationTableViewController_authenticationDelegate_didFinishWithError_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setNavBarActivityIndicatorHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setTransitioning:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationDelegate");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didEncounterError:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (FPUIAuthenticationDelegate)authenticationDelegate
{
  return (FPUIAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_authenticationDelegate);
}

- (void)setAuthenticationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_authenticationDelegate, a3);
}

- (NSArray)sectionDescriptors
{
  return self->_sectionDescriptors;
}

- (void)setSectionDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (NSDictionary)rowDescriptors
{
  return self->_rowDescriptors;
}

- (void)setRowDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowDescriptors, 0);
  objc_storeStrong((id *)&self->_sectionDescriptors, 0);
  objc_destroyWeak((id *)&self->_authenticationDelegate);
}

@end
