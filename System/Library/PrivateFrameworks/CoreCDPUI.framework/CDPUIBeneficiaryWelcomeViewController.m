@implementation CDPUIBeneficiaryWelcomeViewController

- (CDPUIBeneficiaryWelcomeViewController)init
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
  CDPUIBeneficiaryWelcomeViewController *v13;
  CDPUIBeneficiaryWelcomeViewController *v14;
  objc_super v16;

  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryAccountFirstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  CDPLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@"), 0, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  CDPLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%1$@ %2$@"), 0, v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)CDPUIBeneficiaryWelcomeViewController;
  v13 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v16, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v9, v12, 0, 1);
  v14 = v13;
  if (v13)
    -[CDPUIBeneficiaryWelcomeViewController _setupViews](v13, "_setupViews");

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPUIBeneficiaryWelcomeViewController;
  -[OBTableWelcomeController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackBarButtonItem:", v3);

  -[CDPUIBeneficiaryWelcomeViewController _setupTableView](self, "_setupTableView");
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, 2000000000);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__CDPUIBeneficiaryWelcomeViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_24C8546D8;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__CDPUIBeneficiaryWelcomeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)_setupViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  CDPLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v3, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_okTapped_, 64);
  -[CDPUIBeneficiaryWelcomeViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton:", v8);

  if ((_BYSetupAssistantNeedsToRun() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel_learnMoreTapped_, 64);
    -[CDPUIBeneficiaryWelcomeViewController buttonTray](self, "buttonTray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addButton:", v5);

  }
}

- (void)_setupTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", 62.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", self);

  -[CDPUIBeneficiaryWelcomeViewController _setupAppOptions](self, "_setupAppOptions");
}

- (void)_setupAppOptions
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke;
  v3[3] = &unk_24C8546D8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  CDPUIInheritanceAppAccessDetails *v3;
  CDPUIInheritanceAppAccessDetails *v4;
  CDPUIInheritanceAppAccessDetails *v5;
  CDPUIInheritanceAppAccessDetails *v6;
  uint64_t v7;
  void *v8;
  CDPUIInheritanceAppAccessDetails *v9;
  CDPUIInheritanceAppAccessDetails *v10;
  CDPUIInheritanceAppAccessDetails *v11;
  CDPUIInheritanceAppAccessDetails *v12;
  uint64_t v13;
  void *v14;
  CDPUIInheritanceAppAccessDetails *v15;
  CDPUIInheritanceAppAccessDetails *v16;
  CDPUIInheritanceAppAccessDetails *v17;
  CDPUIInheritanceAppAccessDetails *v18;
  CDPUIInheritanceAppAccessDetails *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  _QWORD *v26;
  _QWORD v27[4];
  _QWORD v28[10];

  v28[8] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CDPLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.mobileslideshow"), v24);
    v18 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.mobilenotes"), v24);
    v17 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.mobilemail"), v2);
    v16 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.MobileSMS"), v2);
    v15 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.mobilephone"), v23);
    v3 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.VoiceMemos"), v22);
    v4 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.Home"), v21);
    v5 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:accessString:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:accessString:", CFSTR("com.apple.AppStore"), v20);
    v28[0] = v19;
    v28[1] = v18;
    v28[2] = v17;
    v28[3] = v16;
    v28[4] = v15;
    v28[5] = v3;
    v6 = v3;
    v28[6] = v4;
    v28[7] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 8);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)WeakRetained[153];
    WeakRetained[153] = v7;

    v9 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:", CFSTR("com.apple.Music"));
    v10 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:", CFSTR("com.apple.tv"));
    v11 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:", CFSTR("com.apple.iBooks"));
    v12 = -[CDPUIInheritanceAppAccessDetails initWithBundleID:]([CDPUIInheritanceAppAccessDetails alloc], "initWithBundleID:", CFSTR("com.apple.AppStore"));
    v27[0] = v9;
    v27[1] = v10;
    v27[2] = v11;
    v27[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)WeakRetained[154];
    WeakRetained[154] = v13;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke_2;
    block[3] = &unk_24C8541C0;
    v26 = WeakRetained;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __57__CDPUIBeneficiaryWelcomeViewController__setupAppOptions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int *v4;

  v4 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__restrictedAppsDetails;
  if (!a4)
    v4 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__accessibleAppsDetails;
  return objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + *v4), "count", a3);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BeneficiaryWelcomeAppCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("BeneficiaryWelcomeAppCell"));
  -[CDPUIBeneficiaryWelcomeViewController _configurationForIndexPath:](self, "_configurationForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentConfiguration:", v8);
  v9 = objc_msgSend(v6, "row");

  if (v9)
  {
    objc_msgSend(v7, "setSeparatorInset:", 0.0, 1.79769313e308, 0.0, 0.0);
  }
  else
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutMargins");
    objc_msgSend(v7, "setSeparatorInset:", 0.0);

  }
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  CDPLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_configurationForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  int *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__restrictedAppsDetails;
  if (!v5)
    v6 = &OBJC_IVAR___CDPUIBeneficiaryWelcomeViewController__accessibleAppsDetails;
  v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + *v6);
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD728], "cellConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE220], *MEMORY[0x24BEBB600]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v9, "appName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BEBB360];
  v29 = *MEMORY[0x24BEBB360];
  v30[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v15);

  objc_msgSend(v10, "setAttributedText:", v16);
  objc_msgSend(v9, "accessString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v9, "accessString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v14;
    v28[0] = v22;
    v28[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v20, "initWithString:attributes:", v21, v23);

    objc_msgSend(v10, "setSecondaryAttributedText:", v24);
  }
  objc_msgSend(v9, "appIcon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v25);

  return v10;
}

- (void)okTapped:(id)a3
{
  id v4;

  -[CDPUIBeneficiaryWelcomeViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "welcomeViewController:didCompleteWithError:", self, 0);

}

- (void)cancelTapped:(id)a3
{
  void *v4;
  id v5;

  -[CDPUIBeneficiaryWelcomeViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:", -5307);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "welcomeViewController:didCompleteWithError:", self, v4);

}

- (void)learnMoreTapped:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20DC8F000, v3, OS_LOG_TYPE_DEFAULT, "\"Learn more was tapped\", v6, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212361"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:options:completionHandler:", v4, MEMORY[0x24BDBD1B8], 0);

}

- (CDPUIBeneficiaryWelcomeViewControllerDelegate)delegate
{
  return (CDPUIBeneficiaryWelcomeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_restrictedAppsDetails, 0);
  objc_storeStrong((id *)&self->_accessibleAppsDetails, 0);
}

@end
