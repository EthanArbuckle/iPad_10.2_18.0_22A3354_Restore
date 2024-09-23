@implementation MSDSupportViewController

- (MSDSupportViewController)init
{
  MSDSupportViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MSDSupportViewController;
  v2 = -[MSDSupportViewController init](&v13, sel_init);
  if (v2)
  {
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("SUPPORT_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("phone.circle.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:", v3, 0, v4);
    -[MSDSupportViewController setContentViewController:](v2, "setContentViewController:", v5);

    -[MSDSupportViewController contentViewController](v2, "contentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:", 1);

    -[MSDSupportViewController contentViewController](v2, "contentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScrollingDisabled:", 1);

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("SUPPORT_HEADER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDSupportViewController setTitle:](v2, "setTitle:", v9);

    +[MSDLanguageAndRegionManager sharedInstance](MSDLanguageAndRegionManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getCurrentDeviceRegion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDSupportViewController setCountryCode:](v2, "setCountryCode:", v11);

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
  id v26;
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
  id v39;
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
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  objc_super v96;
  _QWORD v97[4];
  _QWORD v98[3];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[6];

  v101[4] = *MEMORY[0x24BDAC8D0];
  v96.receiver = self;
  v96.super_class = (Class)MSDSupportViewController;
  -[MSDSupportViewController viewDidLoad](&v96, sel_viewDidLoad);
  -[MSDSupportViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[MSDSupportViewController contentViewController](self, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController addChildViewController:](self, "addChildViewController:", v5);

  -[MSDSupportViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSDSupportViewController contentViewController](self, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDSupportViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  objc_msgSend(v7, "topAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController view](self, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "safeAreaLayoutGuide");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "topAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v85);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v83;
  objc_msgSend(v7, "bottomAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "safeAreaLayoutGuide");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v74);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v72;
  v95 = v7;
  objc_msgSend(v7, "leftAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "safeAreaLayoutGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v12;
  objc_msgSend(v7, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 4);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v93);
  -[MSDSupportViewController contentViewController](self, "contentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "didMoveToParentViewController:", self);

  -[MSDSupportViewController _currentCountryStackView](self, "_currentCountryStackView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v94, "addSubview:", v19);
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v22;
  v90 = v19;
  objc_msgSend(v19, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v92);
  v26 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v26, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v27);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 30.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFont:", v28);

  +[MSDStoreContactsModel sharedInstance](MSDStoreContactsModel, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController countryCode](self, "countryCode");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contactNumberForCountryCode:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v31);

  objc_msgSend(v26, "setLayoutMargins:", 30.0, 0.0, 30.0, 0.0);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v94, "addSubview:", v26);
  objc_msgSend(v26, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 30.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v34;
  v35 = v26;
  v86 = v26;
  objc_msgSend(v26, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 2);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v88);
  v39 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v39, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTextColor:", v40);

  objc_msgSend(v39, "setNumberOfLines:", 0);
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("SUPPORT_DESCRIPTION"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setText:", v41);

  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v94, "addSubview:", v39);
  objc_msgSend(v39, "topAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:constant:", v42, 30.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v43;
  v84 = v39;
  objc_msgSend(v39, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v46;
  objc_msgSend(v39, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 3);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v82);
  v50 = objc_alloc(MEMORY[0x24BDF6E58]);
  v51 = (void *)objc_msgSend(v50, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[MSDSupportViewController setOptionsTableView:](self, "setOptionsTableView:", v51);

  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setDelegate:", self);

  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setDataSource:", self);

  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setScrollEnabled:", 0);

  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "addSubview:", v56);

  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "bottomAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v75, -30.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v73;
  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "leadingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v58;
  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "trailingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v62;
  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "heightAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToConstant:", 180.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v65;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v67);
  -[MSDSupportViewController optionsTableView](self, "optionsTableView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SupportViewTableCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v4 = a4;
  if (objc_msgSend(v4, "row") <= 1)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("SupportViewTableCell"));
    objc_msgSend(v5, "setAccessoryType:", 1);
    objc_msgSend(v5, "setSelectionStyle:", 2);
    objc_msgSend(v5, "defaultContentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "row"))
    {
      if (objc_msgSend(v4, "row") != 1)
      {
LABEL_8:
        objc_msgSend(v5, "setContentConfiguration:", v6);

        goto LABEL_9;
      }
      v7 = CFSTR("PHONE_NUMBERS_OPTION");
    }
    else
    {
      v7 = CFSTR("DEVICE_DETAIL_OPTION");
    }
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v8);

    goto LABEL_8;
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4 <= 0)
  {
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("ADDITIONAL_INFORMATION_HEADER"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  __objc2_class **v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "row") <= 1)
  {
    if (objc_msgSend(v10, "row"))
    {
      if (objc_msgSend(v10, "row") != 1)
      {
LABEL_8:
        -[MSDSupportViewController optionsTableView](self, "optionsTableView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v10, 1);

        goto LABEL_9;
      }
      v5 = off_24F47CBA0;
    }
    else
    {
      v5 = &off_24F47CC58;
    }
    v6 = objc_alloc_init(*v5);
    if (v6)
    {
      v7 = v6;
      +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushViewController:andRemoveTopmostView:", v7, 0);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_currentCountryStackView
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
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
  void *v28;
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDSupportViewController countryCode](self, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForCountryCode:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v6 = *MEMORY[0x24BDBF090];
  v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
  objc_msgSend(v10, "setAxis:", 0);
  objc_msgSend(v10, "setDistribution:", 0);
  objc_msgSend(v10, "setAlignment:", 3);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setSpacing:", 10.0);
  v11 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("globe"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithImage:", v12);

  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v14);

  objc_msgSend(v13, "setContentMode:", 1);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v6, v7, v8, v9);
  objc_msgSend(v15, "setNumberOfLines:", 0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "setText:", v28);
  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 22.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  objc_msgSend(v10, "addArrangedSubview:", v13);
  objc_msgSend(v10, "addArrangedSubview:", v15);
  objc_msgSend(v13, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 35.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  objc_msgSend(v13, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:multiplier:", v20, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v22);
  objc_msgSend(v15, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v26);
  return v10;
}

- (OBWelcomeController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (UITableView)optionsTableView
{
  return self->_optionsTableView;
}

- (void)setOptionsTableView:(id)a3
{
  objc_storeStrong((id *)&self->_optionsTableView, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_optionsTableView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
