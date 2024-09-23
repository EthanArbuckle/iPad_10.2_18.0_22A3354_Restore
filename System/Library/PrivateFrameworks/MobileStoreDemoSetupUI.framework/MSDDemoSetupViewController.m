@implementation MSDDemoSetupViewController

- (MSDDemoSetupViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MSDDemoSetupViewController *v8;
  MSDDemoSetupViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DEMO_SETUP_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DEMO_SETUP_DESCRIPTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CONTINUE_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("NOT_A_DEMO_DEVICE_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("arrow.triangle.2.circlepath.circle.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)MSDDemoSetupViewController;
  v8 = -[MSDDemoSetupViewController initWithTitle:detailText:icon:](&v16, sel_initWithTitle_detailText_icon_, v3, v4, v7);
  v9 = v8;
  if (v8)
  {
    -[OBBaseWelcomeController navigationItem](v8, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidesBackButton:", 1);

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v5, 0);
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v9, sel__continueTapped_, 64);
    -[MSDDemoSetupViewController buttonTray](v9, "buttonTray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addButton:", v11);

    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:forState:", v6, 0);
    objc_msgSend(v13, "addTarget:action:forControlEvents:", v9, sel__skipTapped_, 64);
    -[MSDDemoSetupViewController buttonTray](v9, "buttonTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButton:", v13);

  }
  return v9;
}

- (void)_continueTapped:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  int v12;
  __objc2_class **v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543618;
    v20 = (id)objc_opt_class();
    v21 = 2114;
    v22 = v3;
    v5 = v20;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Continue button tapped from: %{public}@", (uint8_t *)&v19, 0x16u);

  }
  v6 = objc_alloc_init(MEMORY[0x24BDBFA88]);
  v7 = objc_msgSend(v6, "authorizationStatus");
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 < 3)
  {
    if (v9)
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      v16 = objc_msgSend(v6, "authorizationStatus");
      v19 = 138543618;
      v20 = v14;
      v21 = 1024;
      LODWORD(v22) = v16;
      _os_log_impl(&dword_22A6E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: location authorization status is %d; showing Location view",
        (uint8_t *)&v19,
        0x12u);

    }
    v13 = off_24F47CBE8;
  }
  else
  {
    if (v9)
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      v12 = objc_msgSend(v6, "authorizationStatus");
      v19 = 138543618;
      v20 = v10;
      v21 = 1024;
      LODWORD(v22) = v12;
      _os_log_impl(&dword_22A6E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: location is authorized: %d; showing Store Search view",
        (uint8_t *)&v19,
        0x12u);

    }
    v13 = off_24F47CC40;
  }

  v17 = objc_alloc_init(*v13);
  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pushViewController:andRemoveTopmostView:", v17, 0);

}

- (void)_skipTapped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_22A6E6000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Not a Demo Device button tapped from: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[MSDDemoSetupViewController _showEraseConfirmation](self, "_showEraseConfirmation");

}

- (void)_showEraseConfirmation
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MSDDemoSetupViewController__showEraseConfirmation__block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __52__MSDDemoSetupViewController__showEraseConfirmation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("EACS_MESSAGE"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("EACS_CONFIRM_OPTION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CANCEL_OPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v7, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v2, 2, &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v3, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v5);
  objc_msgSend(v4, "addAction:", v6);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);

}

void __52__MSDDemoSetupViewController__showEraseConfirmation__block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  defaultLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_22A6E6000, v0, OS_LOG_TYPE_DEFAULT, "EACS confirmed", v2, 2u);
  }

  +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markAsNotDemoAndEraseDataPlan:", 1);

}

@end
