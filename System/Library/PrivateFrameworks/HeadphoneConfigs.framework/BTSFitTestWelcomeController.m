@implementation BTSFitTestWelcomeController

- (BTSFitTestWelcomeController)init
{
  BTSFitTestWelcomeController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  if (!self)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)BTSFitTestWelcomeController;
  v2 = -[BTSFitTestWelcomeController init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_deviceDisconnectedHandler_, *MEMORY[0x1E0D033C0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_powerChangedHandler_, *MEMORY[0x1E0D03390], 0);

  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTSFitTestWelcomeController;
  -[BTSFitTestWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  -[BTSFitTestWelcomeController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
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
  void *v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)BTSFitTestWelcomeController;
  -[BTSFitTestWelcomeController loadView](&v56, sel_loadView);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BTSFitTestWelcomeController currentDevice](self, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "productId");

  if (v7 == 8210)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B494"));
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  -[BTSFitTestWelcomeController currentDevice](self, "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "classicDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "productId");

  if (v12 == 8221)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig-B498-v2"));
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v14;
  }
  v54 = v4;
  v15 = objc_alloc(MEMORY[0x1E0D651B8]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_HEADER"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithTitle:detailText:icon:", v17, v4, 0);

  -[BTSFitTestWelcomeController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v18, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  objc_msgSend(v18, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAutoresizingMask:", 18);

  -[BTSFitTestWelcomeController traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "userInterfaceStyle");

  if (v31 == 2)
    v32 = "dark";
  else
    v32 = "light";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bullet-AudioQuality-%s"), v32);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "imageNamed:inBundle:compatibleWithTraitCollection:", v55, v34, 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_BULLET1_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_BULLET1_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addBulletedListItemWithTitle:description:image:", v36, v38, v53);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bullet-ANC-%s"), v32);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "imageNamed:inBundle:compatibleWithTraitCollection:", v39, v41, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_BULLET2_HEADER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("FIT_TEST_WELCOME_BULLET2_DETAIL"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addBulletedListItemWithTitle:description:image:", v44, v46, v42);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTitle:forState:", v49, 0);

  objc_msgSend(v47, "addTarget:action:forControlEvents:", self, sel_continueToFitTest, 64);
  objc_msgSend(v18, "buttonTray");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addButton:", v47);

  -[BTSFitTestWelcomeController addChildViewController:](self, "addChildViewController:", v18);
  -[BTSFitTestWelcomeController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSubview:", v52);

}

- (void)cancelFitTest
{
  -[BTSFitTestWelcomeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_3);
}

- (void)continueToFitTest
{
  BTSFitTestController *v3;
  void *v4;
  void *v5;
  BTSFitTestController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelFitTest);
  v3 = [BTSFitTestController alloc];
  -[BTSFitTestWelcomeController currentDevice](self, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classicDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BTSFitTestController initWithDevice:](v3, "initWithDevice:", v5);

  -[BTSFitTestController navigationItem](v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v11);

  -[BTSFitTestController navigationController](v6, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesBackButton:", 1);

  -[BTSFitTestWelcomeController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v6, 1);

}

- (void)deviceDisconnectedHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSFitTestWelcomeController currentDevice](self, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[BTSFitTestWelcomeController cancelFitTest](self, "cancelFitTest");

}

- (BTSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
}

@end
