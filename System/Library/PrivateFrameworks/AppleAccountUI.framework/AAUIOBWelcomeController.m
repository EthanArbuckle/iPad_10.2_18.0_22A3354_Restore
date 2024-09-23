@implementation AAUIOBWelcomeController

- (AAUIOBWelcomeController)initWithViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AAUIOBWelcomeController *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)AAUIOBWelcomeController;
  v8 = -[AAUIOBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v10, sel_initWithTitle_detailText_icon_contentLayout_, v5, v6, v7, objc_msgSend(v4, "contentViewLayout"));

  if (v8)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F031B4F0))
      -[AAUIOBWelcomeController _addBulletedListItems:](v8, "_addBulletedListItems:", v4);
    -[AAUIOBWelcomeController _addContentViewWithViewModel:](v8, "_addContentViewWithViewModel:", v4);
    -[AAUIOBWelcomeController _addSecondaryViewWithViewModel:](v8, "_addSecondaryViewWithViewModel:", v4);
    -[AAUIOBWelcomeController _addPrimaryButtonWithViewModel:](v8, "_addPrimaryButtonWithViewModel:", v4);
    -[AAUIOBWelcomeController _addSecondaryButtonWithViewModel:](v8, "_addSecondaryButtonWithViewModel:", v4);
    -[AAUIOBWelcomeController _addHelpLinkButtonWithViewModel:](v8, "_addHelpLinkButtonWithViewModel:", v4);
  }
  -[AAUIOBWelcomeController setModalInPresentation:](v8, "setModalInPresentation:", 1);

  return v8;
}

- (void)_addBulletedListItems:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "bullets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(v9, "symbolName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "systemImageNamed:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AAUIOBWelcomeController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v10, v11, v14);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)_addContentViewWithViewModel:(id)a3
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    v18 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController contentView](self, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(v6, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    objc_msgSend(v6, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v9, 20.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v10;
    objc_msgSend(v6, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v15);

  }
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
    -[AAUIOBWelcomeController secondaryContentView](self, "secondaryContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    v17 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController secondaryContentView](self, "secondaryContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    objc_msgSend(v6, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController secondaryContentView](self, "secondaryContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(v6, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBWelcomeController secondaryContentView](self, "secondaryContentView");
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

    -[OBTrayButton addTarget:action:forControlEvents:](self->_primaryButton, "addTarget:action:forControlEvents:", self, sel__delegate_welcomeViewControllerDidCompleteWithSuccess_error_, 64);
    -[AAUIOBWelcomeController buttonTray](self, "buttonTray");
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

    -[OBTrayButton addTarget:action:forControlEvents:](self->_secondaryButton, "addTarget:action:forControlEvents:", self, sel__delegate_welcomeViewControllerDidCompleteWithSuccess_error_, 64);
    -[AAUIOBWelcomeController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", self->_secondaryButton);

  }
}

- (void)_addHelpLinkButtonWithViewModel:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *helpLinkURL;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "helpLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "helpLinkURL");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    helpLinkURL = self->_helpLinkURL;
    self->_helpLinkURL = v5;

    objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "helpLinkTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v8, 0);

    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__openHelpLink, 64);
    -[AAUIOBWelcomeController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAccessoryButton:", v7);

  }
}

- (void)_openHelpLink
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_helpLinkURL);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], 0);

}

- (void)_delegate_welcomeViewControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIOBWelcomeController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "welcomeViewController:didCompleteWithSuccess:error:", self, 1, 0);

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

- (AAUIOBWelcomeControllerDelegate)delegate
{
  return (AAUIOBWelcomeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
}

@end
