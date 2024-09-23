@implementation HSPCGuestAccessViewController

- (HSPCGuestAccessViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  HSPCGuestAccessTableViewController *v9;
  id v10;
  void *v11;
  id v12;
  HSPCGuestAccessViewController *v13;
  HSPCGuestAccessViewController *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v9 = -[HSPCGuestAccessTableViewController initWithCoordinator:config:]([HSPCGuestAccessTableViewController alloc], "initWithCoordinator:config:", v7, v8);
  -[HSPCGuestAccessViewController setGuestsTableVC:](self, "setGuestsTableVC:", v9);
  v10 = objc_alloc((Class)PRXScrollableContentView);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessTableViewController tableView](v9, "tableView"));
  v12 = objc_msgSend(v10, "initWithCardStyle:scrollView:", 0, v11);

  v25.receiver = self;
  v25.super_class = (Class)HSPCGuestAccessViewController;
  v13 = -[HSPCGuestAccessViewController initWithContentView:](&v25, "initWithContentView:", v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    objc_storeStrong((id *)&v14->_coordinator, a3);
    v15 = sub_1000593D8(CFSTR("HSProximityCardGuestAccessTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[HSPCGuestAccessViewController setTitle:](v14, "setTitle:", v16);

    v17 = sub_1000593D8(CFSTR("HSProximityCardGuestAccessSubitle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[HSPCGuestAccessViewController setSubtitle:](v14, "setSubtitle:", v18);

    v19 = sub_1000593D8(CFSTR("HSProximityCardGuestAccessFooter"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[HSPCGuestAccessViewController setBottomTrayTitle:](v14, "setBottomTrayTitle:", v20);

    v21 = HULocalizedString(CFSTR("HUContinueTitle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = -[HSPCGuestAccessViewController addProminentButtonWithTitleKey:target:futureSelector:](v14, "addProminentButtonWithTitleKey:target:futureSelector:", v22, v14, "commitConfiguration");

  }
  return v14;
}

- (id)commitConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commitConfiguration"));

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCGuestAccessViewController;
  -[HSPCGuestAccessViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  -[HSPCGuestAccessViewController addChildViewController:](self, "addChildViewController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  objc_msgSend(v7, "didMoveToParentViewController:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[4];

  v38.receiver = self;
  v38.super_class = (Class)HSPCGuestAccessViewController;
  -[HSPCGuestAccessViewController viewWillAppear:](&v38, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController contentView](self, "contentView"));
  objc_msgSend(v6, "setNeedsUpdateConstraints");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionButtons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_firstObjectPassingTest:", &stru_1000A2408));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mainContentGuide"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v33 = v11;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v39[0] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v39[1] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = v9;
  v27 = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  v39[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  v39[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessViewController guestsTableVC](self, "guestsTableVC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hu_preloadContent"));

  return v3;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HSPCGuestAccessTableViewController)guestsTableVC
{
  return self->_guestsTableVC;
}

- (void)setGuestsTableVC:(id)a3
{
  objc_storeStrong((id *)&self->_guestsTableVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guestsTableVC, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
