@implementation RMLegacyProfilesViewController

- (RMLegacyProfilesViewController)init
{
  void *v3;
  RMLegacyProfilesViewController *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)RMLegacyProfilesViewController;
  v4 = -[RMLegacyProfilesViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, v3);

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DMCProfileViewController *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  -[RMLegacyProfilesViewController _processUserInfoDictionary](self, "_processUserInfoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)RMLegacyProfilesViewController;
  -[RMLegacyProfilesViewController viewDidLoad](&v20, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedProfileWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[DMCProfileViewController initWithProfile:viewMode:]([DMCProfileViewController alloc], "initWithProfile:viewMode:", v6, 0);
  -[RMLegacyProfilesViewController addChildViewController:](self, "addChildViewController:", v7);
  -[RMLegacyProfilesViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[DMCProfileViewController view](v7, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[RMLegacyProfilesViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileViewController view](v7, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  -[DMCProfileViewController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
}

- (id)_processUserInfoDictionary
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RMConfigurationViewModelKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
