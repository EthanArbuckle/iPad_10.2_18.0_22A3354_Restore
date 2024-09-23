@implementation HistoryLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v4);

  if (-[HistoryLibraryItemController _showsProfile](self, "_showsProfile"))
  {
    -[LibraryItemController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tabGroupProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

  }
  else
  {
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v7);
  }

}

- (id)viewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFHistoryViewController *historyViewController;
  void *v15;
  SFHistoryViewController *v16;
  SFHistoryViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SFHistoryViewController *v23;

  -[LibraryItemController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linkPreviewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LibraryItemController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationIntentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[LibraryItemController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabGroupProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "activeProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[Application sharedApplication](Application, "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "historyController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "historyForProfileIdentifier:loadIfNeeded:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  historyViewController = self->_historyViewController;
  if (!historyViewController
    || (-[SFHistoryViewController history](historyViewController, "history"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15 != v13))
  {
    v16 = -[SFHistoryViewController initWithHistory:]([SFHistoryViewController alloc], "initWithHistory:", v13);
    v17 = self->_historyViewController;
    self->_historyViewController = v16;

    -[SFHistoryViewController setLinkPreviewProvider:](self->_historyViewController, "setLinkPreviewProvider:", v4);
    -[SFHistoryViewController setNavigationIntentHandler:](self->_historyViewController, "setNavigationIntentHandler:", v6);
    -[SFHistoryViewController setTabGroupProvider:](self->_historyViewController, "setTabGroupProvider:", v8);
    -[SFHistoryViewController setDelegate:](self->_historyViewController, "setDelegate:", self);
    -[SFHistoryViewController navigationItem](self->_historyViewController, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLargeTitleDisplayMode:", 2);

  }
  if (-[HistoryLibraryItemController _showsProfile](self, "_showsProfile"))
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFHistoryViewController setTitle:](self->_historyViewController, "setTitle:", v22);

  }
  v23 = self->_historyViewController;

  return v23;
}

- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3
{
  return 1;
}

- (BOOL)panelViewControllerShouldTranslucentAppearance:(id)a3
{
  return 0;
}

- (BOOL)selectionFollowsFocus
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return CFSTR("HistoryLibraryItem");
}

- (BOOL)_showsProfile
{
  void *v2;
  void *v3;
  char v4;

  -[LibraryItemController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabGroupProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasMultipleProfiles");

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyViewController, 0);
}

@end
