@implementation RMInteractiveLegacyProfilesViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RMInteractiveLegacyProfilesViewController _processUserInfoDictionary](self, "_processUserInfoDictionary");
  v5.receiver = self;
  v5.super_class = (Class)RMInteractiveLegacyProfilesViewController;
  -[RMInteractiveLegacyProfilesViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[RMInteractiveLegacyProfilesViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  -[RMInteractiveLegacyProfilesViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMInteractiveLegacyProfilesViewController;
  -[RMInteractiveLegacyProfilesViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[RMInteractiveLegacyProfilesViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)-[RMInteractiveLegacyProfilesViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[RMInteractiveLegacyProfilesViewController _specifiersForProfile](self, "_specifiersForProfile");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_processUserInfoDictionary
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RMConfigurationViewModelKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMInteractiveLegacyProfilesViewController setProfileModel:](self, "setProfileModel:", v3);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RMConfigurationDataProviderKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMInteractiveLegacyProfilesViewController setRmDataProvider:](self, "setRmDataProvider:", v4);

}

- (id)_specifiersForProfile
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
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BE75590];
  -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel__activateProfile_specifier_, sel__isActivatedProfile_, 0, 6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v7);
  -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "toggleState");

  v10 = (void *)MEMORY[0x24BE75590];
  if ((_DWORD)v6)
  {
    -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactiveDetailsText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, objc_opt_class(), 2, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = CFSTR("RMConfigurationViewModelKey");
    -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInfo:", v15);
  }
  else
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupSpecifierWithID:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "footerViewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75A68]);

  }
  objc_msgSend(v3, "addObject:", v13);

  return v3;
}

- (id)_isActivatedProfile:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "toggleState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_activateProfile:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMInteractiveLegacyProfilesViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startAnimatingInNavItem:forIdentifier:", v9, CFSTR("com.apple.RemoteManagement.InteractiveLegacyProfilesViewController"));

  objc_initWeak(&location, self);
  -[RMInteractiveLegacyProfilesViewController rmDataProvider](self, "rmDataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "BOOLValue");
  -[RMInteractiveLegacyProfilesViewController profileModel](self, "profileModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__RMInteractiveLegacyProfilesViewController__activateProfile_specifier___block_invoke;
  v13[3] = &unk_24D52EFF0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "setConfigurationActivated:forViewModel:completionHandler:", v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __72__RMInteractiveLegacyProfilesViewController__activateProfile_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BE75558], "sharedSpinnerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimatingForIdentifier:", CFSTR("com.apple.RemoteManagement.InteractiveLegacyProfilesViewController"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
      objc_msgSend(WeakRetained, "_presentAlertForErrorModel:", v6);
    objc_msgSend(WeakRetained, "reloadSpecifiers");
  }

}

- (void)_presentAlertForErrorModel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDF67F0];
  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(v5, "okText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v10);

  -[RMInteractiveLegacyProfilesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (RMUIProfileViewModel)profileModel
{
  return self->_profileModel;
}

- (void)setProfileModel:(id)a3
{
  objc_storeStrong((id *)&self->_profileModel, a3);
}

- (RMConfigurationsDataProvider)rmDataProvider
{
  return self->_rmDataProvider;
}

- (void)setRmDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rmDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmDataProvider, 0);
  objc_storeStrong((id *)&self->_profileModel, 0);
}

@end
