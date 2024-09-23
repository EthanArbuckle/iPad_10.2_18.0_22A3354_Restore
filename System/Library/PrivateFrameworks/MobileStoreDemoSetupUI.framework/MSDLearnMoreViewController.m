@implementation MSDLearnMoreViewController

- (MSDLearnMoreViewController)init
{
  MSDLearnMoreViewController *v2;
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
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MSDLearnMoreViewController;
  v2 = -[MSDLearnMoreViewController init](&v19, sel_init);
  if (v2)
  {
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("LEARN_MORE_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.triangle.2.circlepath.doc.on.clipboard"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:", v18, 0, v17);
    -[MSDLearnMoreViewController setContentViewController:](v2, "setContentViewController:", v3);

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("LATEST_APP_BULLET"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("REMOTE_MANAGEMENT_BULLET"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("PROGRAMS_BULLET"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("app.badge.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("rectangle.inset.filled.and.person.filled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("plus.circle.fill"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDLearnMoreViewController contentViewController](v2, "contentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addBulletedListItemWithTitle:description:image:", v4, &stru_24F47DB30, v7);

    -[MSDLearnMoreViewController contentViewController](v2, "contentViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addBulletedListItemWithTitle:description:image:", v5, &stru_24F47DB30, v8);

    -[MSDLearnMoreViewController contentViewController](v2, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBulletedListItemWithTitle:description:image:", v6, &stru_24F47DB30, v9);

    -[MSDLearnMoreViewController contentViewController](v2, "contentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidesBackButton:", 1);

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("LEARN_MORE_HEADER"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDLearnMoreViewController setTitle:](v2, "setTitle:", v15);

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
  v29.super_class = (Class)MSDLearnMoreViewController;
  -[MSDLearnMoreViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[MSDLearnMoreViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDLearnMoreViewController addChildViewController:](self, "addChildViewController:", v3);

  -[MSDLearnMoreViewController contentViewController](self, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDLearnMoreViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  objc_msgSend(v5, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDLearnMoreViewController view](self, "view");
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
  -[MSDLearnMoreViewController view](self, "view");
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
  -[MSDLearnMoreViewController view](self, "view");
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
  -[MSDLearnMoreViewController view](self, "view");
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
  -[MSDLearnMoreViewController contentViewController](self, "contentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didMoveToParentViewController:", self);

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
