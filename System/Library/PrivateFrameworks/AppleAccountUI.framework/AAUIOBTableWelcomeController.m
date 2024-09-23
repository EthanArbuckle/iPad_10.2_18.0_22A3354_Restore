@implementation AAUIOBTableWelcomeController

- (AAUIOBTableWelcomeController)initWithViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  AAUIOBTableWelcomeController *v9;
  objc_super v11;

  objc_storeStrong((id *)&self->_viewModel, a3);
  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)AAUIOBTableWelcomeController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v11, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v6, v7, v8, objc_msgSend(v5, "adoptTableViewScrollView"));

  -[AAUIOBTableWelcomeController _addSecondaryViewWithViewModel:](v9, "_addSecondaryViewWithViewModel:", v9->_viewModel);
  -[AAUIOBTableWelcomeController _addPrimaryButtonWithViewModel:](v9, "_addPrimaryButtonWithViewModel:", v9->_viewModel);
  -[AAUIOBTableWelcomeController _addSecondaryButtonWithViewModel:](v9, "_addSecondaryButtonWithViewModel:", v9->_viewModel);

  -[AAUIOBTableWelcomeController setModalInPresentation:](v9, "setModalInPresentation:", 1);
  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIOBTableWelcomeController;
  -[OBTableWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[AAUIOBTableWelcomeController _setupTableViewWithViewModel:](self, "_setupTableViewWithViewModel:", self->_viewModel);
}

- (void)_setupTableViewWithViewModel:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v5 = -[AAUIOBTableWelcomeControllerViewModelProtocol tableViewStyle](self->_viewModel, "tableViewStyle");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v6);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = *MEMORY[0x1E0DC53D8];
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRowHeight:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

}

- (void)_addSecondaryViewWithViewModel:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "secondaryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "secondaryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBTableWelcomeController secondaryContentView](self, "secondaryContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    v17 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBTableWelcomeController secondaryContentView](self, "secondaryContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    objc_msgSend(v6, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBTableWelcomeController secondaryContentView](self, "secondaryContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(v6, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBTableWelcomeController secondaryContentView](self, "secondaryContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 20.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

  }
}

- (void)_addPrimaryButtonWithViewModel:(id)a3
{
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *primaryButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "primaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    v7 = self->_primaryButton;
    objc_msgSend(v10, "primaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__delegate_tableWelcomeViewControllerDidTapPrimaryButton, 64);
    -[AAUIOBTableWelcomeController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", self->_primaryButton);

  }
}

- (void)_addSecondaryButtonWithViewModel:(id)a3
{
  void *v4;
  OBTrayButton *v5;
  OBTrayButton *secondaryButton;
  OBTrayButton *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "secondaryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v5 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    v7 = self->_secondaryButton;
    objc_msgSend(v10, "secondaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__delegate_tableViewControllerDidTapSecondaryButton, 64);
    -[AAUIOBTableWelcomeController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", self->_secondaryButton);

  }
}

- (void)_delegate_tableWelcomeViewControllerDidTapPrimaryButton
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIOBTableWelcomeController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "tableWelcomeViewControllerDidTapPrimaryButton");

}

- (void)_delegate_tableViewControllerDidTapSecondaryButton
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIOBTableWelcomeController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "tableWelcomeViewControllerDidTapSecondaryButton");

}

- (id)_helpLinkFooterView
{
  UIView *helpLinkFooterView;
  UIView *v4;
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  helpLinkFooterView = self->_helpLinkFooterView;
  if (!helpLinkFooterView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_helpLinkFooterView;
    self->_helpLinkFooterView = v4;

    objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBTableWelcomeControllerViewModelProtocol helpLinkTitle](self->_viewModel, "helpLinkTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v7, 0);

    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__openHelpLink, 64);
    -[UIView addSubview:](self->_helpLinkFooterView, "addSubview:", v6);
    objc_msgSend(v6, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_helpLinkFooterView, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(v6, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](self->_helpLinkFooterView, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
    helpLinkFooterView = self->_helpLinkFooterView;
  }
  return helpLinkFooterView;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[OBTableWelcomeController tableView](self, "tableView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSections");

  if (v7 - 1 == a4
    && (-[AAUIOBTableWelcomeControllerViewModelProtocol helpLinkTitle](self->_viewModel, "helpLinkTitle"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[AAUIOBTableWelcomeController _helpLinkFooterView](self, "_helpLinkFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 40.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void)_openHelpLink
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[AAUIOBTableWelcomeControllerViewModelProtocol helpLinkURL](self->_viewModel, "helpLinkURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Help link was tapped, URL is: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[AAUIOBTableWelcomeControllerViewModelProtocol helpLinkURL](self->_viewModel, "helpLinkURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:withCompletionHandler:", v8, 0);

}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (AAUIOBTableWelcomeControllerDelegate)delegate
{
  return (AAUIOBTableWelcomeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_helpLinkFooterView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
