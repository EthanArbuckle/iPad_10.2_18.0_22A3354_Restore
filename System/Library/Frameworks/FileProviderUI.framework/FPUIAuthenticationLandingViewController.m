@implementation FPUIAuthenticationLandingViewController

- (FPUIAuthenticationLandingViewController)initWithURL:(id)a3
{
  id v4;
  FPUIAuthenticationLandingViewController *v5;
  uint64_t v6;
  NSURL *initialURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationLandingViewController;
  v5 = -[FPUIAuthenticationTableViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    initialURL = v5->_initialURL;
    v5->_initialURL = (NSURL *)v6;

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)FPUIAuthenticationLandingViewController;
  -[FPUIAuthenticationTableViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[FPUIAuthenticationLandingViewController _disectURLToComponents:](self, "_disectURLToComponents:", self->_initialURL);
  -[NSURL absoluteString](self->_sanitizedURL, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_serverInputTextField, "setText:", v3);

  -[FPUIAuthenticationLandingViewController _updateNextStep](self, "_updateNextStep");
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)-[FPUIAuthenticationLandingViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v5, &__block_literal_global_4);

}

uint64_t __54__FPUIAuthenticationLandingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateForChangedContentSizeCategory");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FPUIAuthenticationLandingViewController;
  -[FPUIAuthenticationLandingViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UITextField becomeFirstResponder](self->_serverInputTextField, "becomeFirstResponder");
}

- (id)defaultRightBarButtonItem
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
  FPUILoc(CFSTR("CONNECT"), v4, v5, v6, v7, v8, v9, v10, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v11, 2, self, sel__connect_);

  return v12;
}

- (void)setupTableViewSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  FPUIAuthenticationSectionDescriptor *v6;
  FPUIAuthenticationSectionDescriptor *recentServersSection;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *v17;
  NSMutableArray *recentServersRowDescriptors;
  FPUIAuthenticationSectionDescriptor *v19;
  FPUIAuthenticationSectionDescriptor *recentServersExtraTopPaddingSection;
  FPUIAuthenticationSectionDescriptor *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setCellReuseIdentifier:", CFSTR("ServerAddressCellReuseIdentifier"));
  objc_msgSend(v4, "setCellClass:", objc_opt_class());
  v5 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke;
  v28[3] = &unk_24EFEE280;
  v28[4] = self;
  objc_msgSend(v4, "setCellCustomizationHandler:", v28);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2;
  v27[3] = &unk_24EFEE1D0;
  v27[4] = self;
  objc_msgSend(v4, "setSelectionHandler:", v27);
  v6 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  recentServersSection = self->_recentServersSection;
  self->_recentServersSection = v6;

  -[FPUIAuthenticationSectionDescriptor setHeaderHeight:](self->_recentServersSection, "setHeaderHeight:", *MEMORY[0x24BDF7DE0]);
  FPUILoc(CFSTR("RECENT_SERVERS"), v8, v9, v10, v11, v12, v13, v14, v26[0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationSectionDescriptor setHeaderTitle:](self->_recentServersSection, "setHeaderTitle:", v15);

  -[FPUIAuthenticationSectionDescriptor setActive:](self->_recentServersSection, "setActive:", 0);
  v16 = MEMORY[0x24BDBD1A8];
  v17 = (NSMutableArray *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  recentServersRowDescriptors = self->_recentServersRowDescriptors;
  self->_recentServersRowDescriptors = v17;

  v19 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  recentServersExtraTopPaddingSection = self->_recentServersExtraTopPaddingSection;
  self->_recentServersExtraTopPaddingSection = v19;

  -[FPUIAuthenticationSectionDescriptor setHeaderHeight:](self->_recentServersExtraTopPaddingSection, "setHeaderHeight:", 12.0);
  -[FPUIAuthenticationSectionDescriptor setHeaderTitle:](self->_recentServersExtraTopPaddingSection, "setHeaderTitle:", &stru_24EFEE558);
  -[FPUIAuthenticationSectionDescriptor setActive:](self->_recentServersExtraTopPaddingSection, "setActive:", 0);
  v21 = self->_recentServersExtraTopPaddingSection;
  v32[0] = v3;
  v32[1] = v21;
  v32[2] = self->_recentServersSection;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setSectionDescriptors:](self, "setSectionDescriptors:", v22);

  v29 = v4;
  v30[0] = &unk_24EFF27A8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v23;
  v31[1] = v16;
  v30[1] = &unk_24EFF27C0;
  v30[2] = &unk_24EFF27D8;
  v31[2] = self->_recentServersRowDescriptors;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setRowDescriptors:](self, "setRowDescriptors:", v24);

  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = (uint64_t)__65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_35;
  v26[3] = (uint64_t)&unk_24EFEE2A8;
  v26[4] = (uint64_t)self;
  objc_msgSend(v25, "recentServerRepresentationsWithCompletionHandler:", v26);

}

void __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a2;
  FPUILoc(CFSTR("SERVER"), v3, v4, v5, v6, v7, v8, v9, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "label");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "setText:", v10);

  objc_msgSend(v29, "textField");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 1072);
  *(_QWORD *)(v13 + 1072) = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setAutocapitalizationType:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setAutocorrectionType:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setKeyboardType:", 3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_textFieldDidChange_, 0x20000);
  FPUILoc(CFSTR("SERVER_ADDRESS_ACCESSIBILITY_LABEL"), v15, v16, v17, v18, v19, v20, v21, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setAccessibilityLabel:", v22);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setAccessibilityIdentifier:", CFSTR("ServerAddressTextField"));
  objc_msgSend(*(id *)(a1 + 32), "authenticationDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "serverAddressPlaceholder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textField");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setPlaceholder:", v25);

  }
}

uint64_t __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectTextFieldAtIndexPath:", a2);
}

void __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2_36;
  v5[3] = &unk_24EFEDF00;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __65__FPUIAuthenticationLandingViewController_setupTableViewSections__block_invoke_2_36(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1104), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_showRecentServersSectionWithRecentServers:rowAnimation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104), 3);
}

- (void)_showRecentServersSectionWithRecentServers:(id)a3 rowAnimation:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[5];
  id v17;
  id location;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSMutableArray removeAllObjects](self->_recentServersRowDescriptors, "removeAllObjects");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        objc_initWeak(&location, self);
        v16[0] = v8;
        v16[1] = 3221225472;
        v16[2] = __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke;
        v16[3] = &unk_24EFEE2D0;
        v16[4] = v10;
        objc_copyWeak(&v17, &location);
        objc_msgSend(v11, "setCellCustomizationHandler:", v16);
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_2;
        v15[3] = &unk_24EFEE2F8;
        v15[4] = v10;
        v15[5] = self;
        objc_msgSend(v11, "setAccessoryButtonTapHandler:", v15);
        v14[0] = v8;
        v14[1] = 3221225472;
        v14[2] = __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_3;
        v14[3] = &unk_24EFEE2F8;
        v14[4] = self;
        v14[5] = v10;
        objc_msgSend(v11, "setSelectionHandler:", v14);
        objc_msgSend(v11, "setCellSelectionStyle:", 2);
        -[NSMutableArray addObject:](self->_recentServersRowDescriptors, "addObject:", v11);
        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  -[FPUIAuthenticationLandingViewController _updateRecentServerSectionVisibilityWithRowAnimation:forceReload:](self, "_updateRecentServerSectionVisibilityWithRowAnimation:forceReload:", a4, 1);
}

void __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "setAccessoryType:", 4);
  FPUITableCellServerIcon();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  objc_msgSend(v4, "setLayoutMargins:");

}

void __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  FPUIAuthenticationServerInfoViewController *v4;

  v4 = -[FPUIAuthenticationServerInfoViewController initWithServerRepresentation:]([FPUIAuthenticationServerInfoViewController alloc], "initWithServerRepresentation:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "authenticationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setAuthenticationDelegate:](v4, "setAuthenticationDelegate:", v2);

  -[FPUIAuthenticationServerInfoViewController setServerInfoDelegate:](v4, "setServerInfoDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:animated:", v4, 1);

}

uint64_t __99__FPUIAuthenticationLandingViewController__showRecentServersSectionWithRecentServers_rowAnimation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToServer:", *(_QWORD *)(a1 + 40));
}

- (void)updateForChangedContentSizeCategory
{
  -[FPUIAuthenticationLandingViewController _updateRecentServerSectionVisibilityWithRowAnimation:forceReload:](self, "_updateRecentServerSectionVisibilityWithRowAnimation:forceReload:", 5, 0);
}

- (void)_updateRecentServerSectionVisibilityWithRowAnimation:(int64_t)a3 forceReload:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  NSString *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v7 = -[NSMutableArray count](self->_recentServersRowDescriptors, "count");
  if (v7)
  {
    -[FPUIAuthenticationLandingViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = !UIContentSizeCategoryIsAccessibilityCategory(v9);

  }
  else
  {
    v10 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x24BDD1698]);
  if ((v7 != 0) != -[FPUIAuthenticationSectionDescriptor isActive](self->_recentServersSection, "isActive"))
  {
    -[FPUIAuthenticationSectionDescriptor setActive:](self->_recentServersSection, "setActive:", v7 != 0);
    -[FPUIAuthenticationTableViewController sectionDescriptors](self, "sectionDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIndex:", objc_msgSend(v11, "indexOfObject:", self->_recentServersSection));

  }
  if (v4)
  {
    -[FPUIAuthenticationTableViewController sectionDescriptors](self, "sectionDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIndex:", objc_msgSend(v12, "indexOfObject:", self->_recentServersSection));

  }
  if (v10 != -[FPUIAuthenticationSectionDescriptor isActive](self->_recentServersExtraTopPaddingSection, "isActive"))
  {
    -[FPUIAuthenticationSectionDescriptor setActive:](self->_recentServersExtraTopPaddingSection, "setActive:", v10);
    -[FPUIAuthenticationTableViewController sectionDescriptors](self, "sectionDescriptors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addIndex:", objc_msgSend(v13, "indexOfObject:", self->_recentServersExtraTopPaddingSection));

  }
  if (objc_msgSend(v15, "count"))
  {
    -[FPUIAuthenticationLandingViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reloadSections:withRowAnimation:", v15, a3);

  }
}

- (void)authenticationDelegate:(id)a3 didEncounterError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setTitle:](self, "setTitle:", v8);

  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationLandingViewController;
  -[FPUIAuthenticationTableViewController authenticationDelegate:didEncounterError:](&v9, sel_authenticationDelegate_didEncounterError_, v7, v6);

}

- (void)_transitionUIStateToConnecting
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;

  FPUILoc(CFSTR("CONNECTING"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setTitle:](self, "setTitle:", v9);

  -[FPUIAuthenticationTableViewController setNavBarActivityIndicatorHidden:](self, "setNavBarActivityIndicatorHidden:", 0);
  -[FPUIAuthenticationTableViewController setTransitioning:](self, "setTransitioning:", 1);
}

- (void)_updateNextStep
{
  -[FPUIAuthenticationTableViewController setCanTransitionToNextStep:](self, "setCanTransitionToNextStep:", -[FPUIAuthenticationLandingViewController _canMoveToNextStep](self, "_canMoveToNextStep"));
}

- (void)setInitialConnectionURL:(id)a3
{
  NSURL *v5;
  void *v6;
  NSURL *v7;

  v5 = (NSURL *)a3;
  if (self->_initialURL != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_initialURL, a3);
    -[FPUIAuthenticationLandingViewController _disectURLToComponents:](self, "_disectURLToComponents:", self->_initialURL);
    -[NSURL absoluteString](self->_sanitizedURL, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](self->_serverInputTextField, "setText:", v6);

    -[FPUIAuthenticationLandingViewController _updateNextStep](self, "_updateNextStep");
    v5 = v7;
  }

}

- (void)_disectURLToComponents:(id)a3
{
  void *v4;
  NSURL *v5;
  NSURL *initialUsername;
  void *v7;
  NSURL *v8;
  NSURL *sanitizedURL;
  id v10;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSURL *)objc_msgSend(v4, "copy");
    initialUsername = self->_initialUsername;
    self->_initialUsername = v5;

    objc_msgSend(v10, "setPassword:", 0);
    objc_msgSend(v10, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSURL *)objc_msgSend(v7, "copy");
    sanitizedURL = self->_sanitizedURL;
    self->_sanitizedURL = v8;

  }
}

- (void)_connect:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[FPUIAuthenticationLandingViewController _transitionUIStateToConnecting](self, "_transitionUIStateToConnecting", a3);
  -[UITextField text](self->_serverInputTextField, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationLandingViewController.m"), 263, CFSTR("connecting to server with empty address text"));

  }
  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField text](self->_serverInputTextField, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connectToServerAtAddress:connectionFlowDelegate:", v7, self);

}

- (void)_connectToServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FPUIAuthenticationLandingViewController _transitionUIStateToConnecting](self, "_transitionUIStateToConnecting");
  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectToServerAtAddress:connectionFlowDelegate:", v6, self);

}

- (BOOL)_canMoveToNextStep
{
  void *v2;
  BOOL v3;

  -[UITextField text](self->_serverInputTextField, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  _BOOL4 v4;

  v4 = -[FPUIAuthenticationLandingViewController _canMoveToNextStep](self, "_canMoveToNextStep", a3);
  if (v4)
    -[FPUIAuthenticationLandingViewController _connect:](self, "_connect:", self);
  return !v4;
}

- (void)removeServerWithRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  FPUIAuthenticationLandingViewController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_recentServers, "count") - 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = 1104;
  v18 = self;
  v6 = self->_recentServers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "identifier", v17, v18, (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = *(Class *)((char *)&v18->super.super.super.super.super.isa + v17);
  *(Class *)((char *)&v18->super.super.super.super.super.isa + v17) = (Class)v5;
  v16 = v5;

  -[FPUIAuthenticationLandingViewController _showRecentServersSectionWithRecentServers:rowAnimation:](v18, "_showRecentServersSectionWithRecentServers:rowAnimation:", *(Class *)((char *)&v18->super.super.super.super.super.isa + v17), 5);
}

- (NSURL)initialConnectionURL
{
  return self->_initialConnectionURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialConnectionURL, 0);
  objc_storeStrong((id *)&self->_recentServers, 0);
  objc_storeStrong((id *)&self->_initialUsername, 0);
  objc_storeStrong((id *)&self->_sanitizedURL, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_serverInputTextField, 0);
  objc_storeStrong((id *)&self->_recentServersRowDescriptors, 0);
  objc_storeStrong((id *)&self->_recentServersExtraTopPaddingSection, 0);
  objc_storeStrong((id *)&self->_recentServersSection, 0);
}

@end
