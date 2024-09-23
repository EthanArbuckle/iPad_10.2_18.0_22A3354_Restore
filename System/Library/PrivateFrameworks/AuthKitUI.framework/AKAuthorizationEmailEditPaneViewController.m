@implementation AKAuthorizationEmailEditPaneViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)AKAuthorizationEmailEditPaneViewController;
  -[AKAuthorizationPaneViewController viewDidLoad](&v28, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_EMAIL_CONTACT"), &stru_1E7679C68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationEmailEditPaneViewController setTitle:](self, "setTitle:", v4);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationEmailAddressesTableViewCell"));

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AKAuthorizationEmailAnonymousTableViewCell"));

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", self);

  -[AKAuthorizationPaneViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  v9 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB538], 0x8000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 0);
  -[AKAuthorizationEmailEditPaneViewController applicationName](self, "applicationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_EMAIL_EDIT_INFO_FORMAT"), &stru_1E7679C68, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationEmailEditPaneViewController applicationName](self, "applicationName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_EMAIL_EDIT_INFO"), &stru_1E7679C68, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v15);
  }

  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addArrangedSubview:", v9);

  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v19, "addArrangedSubview:", v20);

  v21 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v9, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationPaneViewController paneHeaderStackView](self, "paneHeaderStackView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKAuthorizationPaneMetrics editPaneInfoLabelHorizontalPadding](AKAuthorizationPaneMetrics, "editPaneInfoLabelHorizontalPadding");
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, v25 * -2.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v27);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationEmailEditPaneViewController;
  -[AKAuthorizationEmailEditPaneViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[AKAuthorizationPaneViewController editableDataSources](self, "editableDataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditableScopeChoicesChanged:", 1);

}

- (AKAuthorizationScopeChoices)editableScopeChoices
{
  void *v2;
  void *v3;

  -[AKAuthorizationPaneViewController editableDataSources](self, "editableDataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableScopeChoices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AKAuthorizationScopeChoices *)v3;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v5 = a4;
  if (objc_msgSend(v5, "section") || objc_msgSend(v5, "row"))
  {
    if (objc_msgSend(v5, "section") == 1)
    {
      v6 = objc_msgSend(v5, "row");
      -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 < objc_msgSend(v7, "emailCount");

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "section");
  if (v8 == 1)
  {
    v10 = objc_msgSend(v6, "row");
    -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "emailCount");

    if (v10 < v12)
    {
      -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWantsPrivateEmail:", 0);

      v14 = objc_msgSend(v6, "row");
      -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject setIndexOfChosenEmail:](v9, "setIndexOfChosenEmail:", v14);
LABEL_12:

      goto LABEL_13;
    }
    _AKLogSiwa();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AKAuthorizationEmailEditPaneViewController tableView:didSelectRowAtIndexPath:].cold.2(v6, self);

  }
  else if (!v8)
  {
    if (objc_msgSend(v6, "row"))
    {
      _AKLogSiwa();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AKAuthorizationEmailEditPaneViewController tableView:didSelectRowAtIndexPath:].cold.1(v6, v9);
    }
    else
    {
      -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject setWantsPrivateEmail:](v9, "setWantsPrivateEmail:", 1);
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 0);
  objc_msgSend(v7, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_YOUR_EMAIL_ADDRESSES"), &stru_1E7679C68, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedUppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("\n\n"), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_PRIVATE_EMAIL_FOOTER"), &stru_1E7679C68, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (!a4)
    return 1;
  if (a4 != 1)
    return 0;
  -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "emailCount");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 1)
  {
    -[AKAuthorizationEmailEditPaneViewController tableView:emailCellForRow:](self, "tableView:emailCellForRow:", v6, objc_msgSend(v7, "row"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[AKAuthorizationEmailEditPaneViewController tableView:anonymousCellForRow:](self, "tableView:anonymousCellForRow:", v6, objc_msgSend(v7, "row"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (id)tableView:(id)a3 emailCellForRow:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;

  v6 = a3;
  -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "emailCount");

  if (v8 > a4)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationEmailAddressesTableViewCell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(v9, "setSelectionStyle:", 1);
    -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emailAtIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "indexOfChosenEmail") == a4)
    {
      -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "wantsPrivateEmail");

      if (!v16)
      {
        v17 = 3;
LABEL_10:
        objc_msgSend(v9, "setAccessoryType:", v17);
        goto LABEL_11;
      }
    }
    else
    {

    }
    v17 = 0;
    goto LABEL_10;
  }
  _AKLogSiwa();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[AKAuthorizationEmailEditPaneViewController tableView:emailCellForRow:].cold.1(a4, self);

  v9 = 0;
LABEL_11:

  return v9;
}

- (id)tableView:(id)a3 anonymousCellForRow:(unint64_t)a4
{
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
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AKAuthorizationEmailAnonymousTableViewCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_PRIVATE_EMAIL_TITLE"), &stru_1E7679C68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_FORWARDED_TO_FORMAT"), &stru_1E7679C68, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forwardingEmail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  if (a4
    || (-[AKAuthorizationEmailEditPaneViewController editableScopeChoices](self, "editableScopeChoices"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "wantsPrivateEmail"),
        v17,
        (v18 & 1) == 0))
  {
    v19 = 0;
  }
  else
  {
    v19 = 3;
  }
  objc_msgSend(v6, "setAccessoryType:", v19);
  return v6;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_storeStrong((id *)&self->_applicationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "unexpected row %@ selected in Anonymous Email section", (uint8_t *)&v4, 0xCu);

}

- (void)tableView:(void *)a1 didSelectRowAtIndexPath:(void *)a2 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "editableScopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "emailCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1BD795000, v7, v8, "row %@ selected >= %@ emails available", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

- (void)tableView:(uint64_t)a1 emailCellForRow:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "editableScopeChoices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "emailCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1BD795000, v7, v8, "cell row %@ >= %@ rows available", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_1_0();
}

@end
