@implementation MSDStoreInfoViewController

- (MSDStoreInfoViewController)initWithStoreInfo:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  MSDStoreInfoViewController *v8;
  MSDStoreInfoViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDStoreInfoViewController;
  v8 = -[MSDStoreInfoViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDStoreInfoViewController setDelegate:](v8, "setDelegate:", v7);
    -[MSDStoreInfoViewController setStoreInfo:](v9, "setStoreInfo:", v6);
  }

  return v9;
}

- (void)viewDidLoad
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  void *v56;
  _QWORD v57[6];

  v57[4] = *MEMORY[0x24BDAC8D0];
  v55.receiver = self;
  v55.super_class = (Class)MSDStoreInfoViewController;
  -[MSDStoreInfoViewController viewDidLoad](&v55, sel_viewDidLoad);
  -[MSDStoreInfoViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setAxis:", 1);
  objc_msgSend(v7, "setDistribution:", 3);
  objc_msgSend(v7, "setLayoutMargins:", 0.0, 20.0, 20.0, 20.0);
  objc_msgSend(v7, "setLayoutMarginsRelativeArrangement:", 1);
  -[MSDStoreInfoViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  objc_msgSend(v7, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "safeAreaLayoutGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v46;
  objc_msgSend(v7, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "safeAreaLayoutGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v41;
  objc_msgSend(v7, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v11;
  objc_msgSend(v7, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v54);
  -[MSDStoreInfoViewController _stackedCancelButton](self, "_stackedCancelButton");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addArrangedSubview:");
  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v17, "isHQ");

  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((_DWORD)v14)
  {
    objc_msgSend(v18, "companyName");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("building.2.crop.circle.fill");
  }
  else
  {
    objc_msgSend(v18, "storeName");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("mappin.circle.fill");
  }
  v49 = (void *)v20;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v21);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController _stackedStoreName:withIcon:andIconColor:](self, "_stackedStoreName:withIcon:andIconColor:", v20, v51, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addArrangedSubview:", v23);
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("APPLE_ID_TITLE"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController _stackedLabelWithTitle:andDescription:](self, "_stackedLabelWithTitle:andDescription:", v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addArrangedSubview:", v27);
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("ADDRESS_TITLE"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fullAddress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController _stackedLabelWithTitle:andDescription:](self, "_stackedLabelWithTitle:andDescription:", v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addArrangedSubview:", v31);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController _boldConfiguration](self, "_boldConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setConfiguration:", v33);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTintColor:", v34);

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("ASSIGN_TO_STORE_BUTTON"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:forState:", v35, 0);

  objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel__confirm_, 64);
  objc_msgSend(v32, "heightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToConstant:", 50.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v38);
  objc_msgSend(v7, "addArrangedSubview:", v32);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDStoreInfoViewController;
  -[MSDStoreInfoViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[MSDStoreInfoViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWillAppear:forStore:", self, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDStoreInfoViewController;
  -[MSDStoreInfoViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[MSDStoreInfoViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewWillClose:forStore:", self, v5);

}

- (void)_close:(id)a3
{
  id v3;
  id v4;

  -[MSDStoreInfoViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)_confirm:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "confirmStoreSelection");
    -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "confirmationCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v6;
    v17 = 1024;
    v18 = v8;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "User selected store %{public}@, confirmStoreSelection=%d, confirmationCode=%@", (uint8_t *)&v15, 0x1Cu);

  }
  -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "confirmStoreSelection");

  if (v12)
  {
    -[MSDStoreInfoViewController storeInfo](self, "storeInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "confirmationCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDStoreInfoViewController _showStoreConfirmationAlertWithCode:](self, "_showStoreConfirmationAlertWithCode:", v14);

  }
  else
  {
    -[MSDStoreInfoViewController _showConfirmationAlert](self, "_showConfirmationAlert");
  }
}

- (id)_stackedCancelButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setAlignment:", 4);
  objc_msgSend(v4, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v4, "setDirectionalLayoutMargins:", 15.0, 0.0, 0.0, 0.0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("xmark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v6, 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__close_, 64);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addArrangedSubview:", v5);

  return v4;
}

- (id)_stackedStoreName:(id)a3 withIcon:(id)a4 andIconColor:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v8 = (objc_class *)MEMORY[0x24BDF6DD0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  v13 = *MEMORY[0x24BDBF090];
  v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v17 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], v14, v15, v16);
  objc_msgSend(v17, "setAxis:", 0);
  objc_msgSend(v17, "setAlignment:", 1);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "setSpacing:", 10.0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v10);

  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setTintColor:", v9);

  objc_msgSend(v18, "setContentMode:", 1);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(v19, "setNumberOfLines:", 0);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "setText:", v11);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v20);

  objc_msgSend(v17, "addArrangedSubview:", v18);
  objc_msgSend(v17, "addArrangedSubview:", v19);
  -[MSDStoreInfoViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22 * 0.4 / 6.0;

  if (v23 > 60.0)
    v23 = 60.0;
  objc_msgSend(v18, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v25;
  objc_msgSend(v18, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v27, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v29);
  objc_msgSend(v19, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v33);
  return v17;
}

- (id)_stackedLabelWithTitle:(id)a3 andDescription:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = (objc_class *)MEMORY[0x24BDF6DD0];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v13 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], v10, v11, v12);
  objc_msgSend(v13, "setAxis:", 1);
  objc_msgSend(v13, "setAlignment:", 1);
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setText:", v7);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 14.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v15);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v9, v10, v11, v12);
  objc_msgSend(v16, "setNumberOfLines:", 0);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setText:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v17);

  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v13, "addArrangedSubview:", v14);
  objc_msgSend(v13, "addArrangedSubview:", v16);

  return v13;
}

- (id)_boldConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6888], "filledButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonSize:", 3);
  objc_msgSend(v2, "background");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRadius:", 14.0);

  return v2;
}

- (void)_showStoreConfirmationAlertWithCode:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  MSDStoreInfoViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke;
  v6[3] = &unk_24F47D350;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke(uint64_t a1)
{
  MSDCodeEntryAlertController *v2;
  uint64_t v3;
  MSDCodeEntryAlertController *v4;
  _QWORD v5[5];

  v2 = [MSDCodeEntryAlertController alloc];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke_2;
  v5[3] = &unk_24F47D378;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = -[MSDCodeEntryAlertController initWithVerificationCode:completion:](v2, "initWithVerificationCode:completion:", v3, v5);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0);

}

void __66__MSDStoreInfoViewController__showStoreConfirmationAlertWithCode___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "storeInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didConfirmStoreAssignment:", v3);

  }
}

- (void)_showConfirmationAlert
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(*(id *)(a1 + 32), "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHQ");

  objc_msgSend(*(id *)(a1 + 32), "storeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "companyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("ASSIGN_TO_COMPANY_TITLE");
  }
  else
  {
    objc_msgSend(v4, "storeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("ASSIGN_TO_STORE_TITLE");
  }
  +[MSDSetupUILocalization localizedStringForKey:withStringArgument:](MSDSetupUILocalization, "localizedStringForKey:withStringArgument:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("ASSIGN_TO_STORE_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CANCEL_OPTION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke_2;
  v14[3] = &unk_24F47D2E0;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v9, 0, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v10, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);
  objc_msgSend(v11, "addAction:", v13);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);

}

void __52__MSDStoreInfoViewController__showConfirmationAlert__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didConfirmStoreAssignment:", v2);

}

- (MSDStoreInfoViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (MSDStoreInfo)storeInfo
{
  return self->_storeInfo;
}

- (void)setStoreInfo:(id)a3
{
  objc_storeStrong((id *)&self->_storeInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
