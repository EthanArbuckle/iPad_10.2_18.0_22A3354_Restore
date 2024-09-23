@implementation CDPUIManualAccessCodeEntryViewController

- (CDPUIManualAccessCodeEntryViewController)init
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CDPUIManualAccessCodeEntryViewController *v10;
  CDPUIManualAccessCodeEntryViewController *v11;
  objc_super v13;

  v3 = +[CDPUIAccessCodeEntryTextField accessKeyCharacterCount](CDPUIAccessCodeEntryTextField, "accessKeyCharacterCount");
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryAccountFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CDPLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%d %@"), 0, v3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)CDPUIManualAccessCodeEntryViewController;
  v10 = -[CDPUIManualAccessCodeEntryViewController initWithTitle:detailText:icon:contentLayout:](&v13, sel_initWithTitle_detailText_icon_contentLayout_, v6, v9, 0, 3);
  v11 = v10;
  if (v10)
    -[CDPUIManualAccessCodeEntryViewController _setupView](v10, "_setupView");

  return v11;
}

- (void)_setupView
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  -[CDPUIManualAccessCodeEntryViewController _contentStackView](self, "_contentStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIManualAccessCodeEntryViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v15 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIManualAccessCodeEntryViewController contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(v3, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIManualAccessCodeEntryViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(v3, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIManualAccessCodeEntryViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  objc_msgSend(v3, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIManualAccessCodeEntryViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v13);

}

- (id)_contentStackView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CDPUIManualAccessCodeEntryViewController _accessCodeEntryStackView](self, "_accessCodeEntryStackView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController _errorLabelView](self, "_errorLabelView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BEBD978]);
    v14[0] = v4;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArrangedSubviews:", v7);
    -[CDPUIManualAccessCodeEntryViewController setContentStackView:](self, "setContentStackView:", v8);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAxis:", 1);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlignment:", 0);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDistribution:", 0);

  }
  -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessCodeEntryStackView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CDPUIManualAccessCodeEntryViewController _labelView](self, "_labelView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController _manualAccessCodeTextView](self, "_manualAccessCodeTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BEBD978]);
    v14[0] = v4;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArrangedSubviews:", v7);
    -[CDPUIManualAccessCodeEntryViewController setContentStackView:](self, "setContentStackView:", v8);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAxis:", 0);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlignment:", 2);

    -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDistribution:", 0);

  }
  -[CDPUIManualAccessCodeEntryViewController contentStackView](self, "contentStackView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_manualAccessCodeTextView
{
  void *v3;
  CDPUIAccessCodeEntryTextField *v4;
  CDPUIAccessCodeEntryTextField *v5;
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
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [CDPUIAccessCodeEntryTextField alloc];
    v5 = -[CDPUIAccessCodeEntryTextField initWithFrame:textContainer:](v4, "initWithFrame:textContainer:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[CDPUIManualAccessCodeEntryViewController setEntryTextView:](self, "setEntryTextView:", v5);

    -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    CDPLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlaceholder:", v7);

    -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessCodeInputDelegate:", self);

    objc_msgSend(MEMORY[0x24BEBB520], "monospacedSystemFontOfSize:weight:", 16.0, *MEMORY[0x24BEBB600]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    v12 = (void *)MEMORY[0x24BDD1628];
    -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 96.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v16);

  }
  -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_labelView
{
  void *v3;
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
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDA88]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:textContainer:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[CDPUIManualAccessCodeEntryViewController setPrefixView:](self, "setPrefixView:", v5);

    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR("LC:"));

    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", 2);

    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEditable:", 0);

    objc_msgSend(MEMORY[0x24BEBB520], "monospacedSystemFontOfSize:weight:", 16.0, *MEMORY[0x24BEBB600]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    v16 = (void *)MEMORY[0x24BDD1628];
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 96.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToConstant:", 40.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v23);

  }
  -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_errorLabelView
{
  void *v3;
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
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD708]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[CDPUIManualAccessCodeEntryViewController setErrorLabelView:](self, "setErrorLabelView:", v5);

    -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 1);

    v8 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB520], "smallSystemFontSize");
    objc_msgSend(v8, "systemFontOfSize:weight:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v15 = (void *)MEMORY[0x24BDD1628];
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 96.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    -[CDPUIManualAccessCodeEntryViewController prefixView](self, "prefixView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 40.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v22);

  }
  -[CDPUIManualAccessCodeEntryViewController errorLabelView](self, "errorLabelView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDPUIManualAccessCodeEntryViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDPUIManualAccessCodeEntryViewController;
  -[CDPUIManualAccessCodeEntryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[CDPUIManualAccessCodeEntryViewController entryTextView](self, "entryTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)accessCodeEntryTextFieldDidUpdate:(id)a3
{
  id v3;

  -[CDPUIManualAccessCodeEntryViewController _errorLabelView](self, "_errorLabelView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_24C857A78);

}

- (void)accessCodeEntryTextFieldDidReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIManualAccessCodeEntryViewController _wrappingKeySubstringFromAccessKey:](self, "_wrappingKeySubstringFromAccessKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length")
    && (-[CDPUIManualAccessCodeEntryViewController delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "manualAccessCodeEntry:shouldFinishWithAccessCode:", self, v6),
        v7,
        v8))
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20DC8F000, v9, OS_LOG_TYPE_DEFAULT, "\"User successfully entered the access key.\", v12, 2u);
    }
  }
  else
  {
    -[CDPUIManualAccessCodeEntryViewController _errorLabelView](self, "_errorLabelView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CDPUIManualAccessCodeEntryViewController accessCodeEntryTextFieldDidReturn:].cold.1(v4, v9);
  }

}

- (id)_wrappingKeySubstringFromAccessKey:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4 <= +[CDPUIAccessCodeEntryTextField wrappingKeyCharacterCount](CDPUIAccessCodeEntryTextField, "wrappingKeyCharacterCount")+ 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length")+ ~+[CDPUIAccessCodeEntryTextField wrappingKeyCharacterCount](CDPUIAccessCodeEntryTextField, "wrappingKeyCharacterCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (CDPUIManualAccessCodeEntryViewControllerDelegate)delegate
{
  return (CDPUIManualAccessCodeEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITextView)prefixView
{
  return self->_prefixView;
}

- (void)setPrefixView:(id)a3
{
  objc_storeStrong((id *)&self->_prefixView, a3);
}

- (CDPUIAccessCodeEntryTextField)entryTextView
{
  return self->_entryTextView;
}

- (void)setEntryTextView:(id)a3
{
  objc_storeStrong((id *)&self->_entryTextView, a3);
}

- (UILabel)errorLabelView
{
  return self->_errorLabelView;
}

- (void)setErrorLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabelView, a3);
}

- (UIStackView)contentStackView
{
  return self->_contentStackView;
}

- (void)setContentStackView:(id)a3
{
  objc_storeStrong((id *)&self->_contentStackView, a3);
}

- (UIStackView)codeEntryStackView
{
  return self->_codeEntryStackView;
}

- (void)setCodeEntryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_codeEntryStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeEntryStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_errorLabelView, 0);
  objc_storeStrong((id *)&self->_entryTextView, 0);
  objc_storeStrong((id *)&self->_prefixView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)accessCodeEntryTextFieldDidReturn:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138477827;
  v5 = v3;
  _os_log_error_impl(&dword_20DC8F000, a2, OS_LOG_TYPE_ERROR, "\"User entered an invalid access key: %{private}@\", (uint8_t *)&v4, 0xCu);

}

@end
