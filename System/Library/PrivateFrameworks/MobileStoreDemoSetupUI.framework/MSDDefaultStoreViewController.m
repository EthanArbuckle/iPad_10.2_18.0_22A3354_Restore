@implementation MSDDefaultStoreViewController

- (MSDDefaultStoreViewController)init
{
  MSDDefaultStoreViewController *v2;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MSDDefaultStoreViewController;
  v2 = -[MSDDefaultStoreViewController init](&v15, sel_init);
  if (v2)
  {
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DEFAULT_STORE_VIEW_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DEFAULT_STORE_VIEW_DESCRIPTION"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("COMPLETE_SETUP_BUTTON"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("building.2.crop.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:", v3, v4, v6);
    -[MSDDefaultStoreViewController setContentViewController:](v2, "setContentViewController:", v7);

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:forState:", v5, 0);
    objc_msgSend(v8, "addTarget:action:forControlEvents:", v2, sel__completeSetupTapped_, 64);
    -[MSDDefaultStoreViewController contentViewController](v2, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buttonTray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addButton:", v8);

    -[MSDDefaultStoreViewController contentViewController](v2, "contentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidesBackButton:", 1);

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CANNOT_FIND_STORE_HEADER"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDDefaultStoreViewController setTitle:](v2, "setTitle:", v13);

  }
  return v2;
}

- (void)viewDidLoad
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[6];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)MSDDefaultStoreViewController;
  -[MSDDefaultStoreViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[MSDDefaultStoreViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDefaultStoreViewController addChildViewController:](self, "addChildViewController:", v3);

  -[MSDDefaultStoreViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDDefaultStoreViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(v5, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDefaultStoreViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaLayoutGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  objc_msgSend(v5, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDefaultStoreViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v19;
  objc_msgSend(v5, "leftAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDefaultStoreViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v9;
  objc_msgSend(v5, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDDefaultStoreViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v17);
  -[MSDDefaultStoreViewController contentViewController](self, "contentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didMoveToParentViewController:", self);

}

- (void)_completeSetupTapped:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v5 = v8;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Complete setup button tapped from: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setupCompleteWithStoreID:", 0);

}

- (OBWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
