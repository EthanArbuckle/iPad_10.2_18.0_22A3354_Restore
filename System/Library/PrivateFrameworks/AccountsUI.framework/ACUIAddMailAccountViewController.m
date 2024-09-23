@implementation ACUIAddMailAccountViewController

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  ACUIAddMailAccountViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ACUIAddMailAccountViewController;
  -[ACUIAddAccountViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v5 = (id)-[ACUIAddMailAccountViewController navigationItem](v9, "navigationItem");
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WELCOME_TO_MAIL"), &stru_1E9A15E98, CFSTR("Localizable"));
    objc_msgSend(v5, "setTitle:");

  }
}

- (id)giantSpecifierWithName:(id)a3 forAccountTypeID:(id)a4
{
  id v5;
  id v7;
  id v8;
  objc_super v9;
  id v10;
  id v11;
  id location[2];
  ACUIAddMailAccountViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v9.receiver = v13;
  v9.super_class = (Class)ACUIAddMailAccountViewController;
  v10 = -[ACUIAddAccountViewController giantSpecifierWithName:forAccountTypeID:](&v9, sel_giantSpecifierWithName_forAccountTypeID_, location[0], v11);
  v7 = (id)objc_msgSend(v10, "userInfo");
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);

  }
  objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("ACUIForceMailSetupKey"));
  objc_msgSend(v10, "setUserInfo:", v8);
  v5 = v10;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)specifierForOtherAccounts
{
  id v3;
  void *v4;
  id v5;
  id v6;
  ACUIAccountViewProvidersManager *v7;
  _QWORD *v8;
  ACUIAccountViewProvidersManager *v9;
  NSString *v10;
  id location;
  Class v12;
  id v13[2];
  ACUIAddMailAccountViewController *v14;

  v14 = self;
  v13[1] = (id)a2;
  v4 = (void *)MEMORY[0x1E0D804E8];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OTHER"), &stru_1E9A15E98, CFSTR("Localizable"));
  v13[0] = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, v14, 0, 0, objc_opt_class(), 11, 0);

  v12 = 0;
  v7 = -[ACUIAddAccountViewController viewProvidersManager](v14, "viewProvidersManager");
  v8 = (_QWORD *)MEMORY[0x1E0C8F0D0];
  v12 = -[ACUIAccountViewProvidersManager viewControllerClassForCreatingAccountWithType:](v7, "viewControllerClassForCreatingAccountWithType:", *MEMORY[0x1E0C8F0D0]);

  v9 = -[ACUIAddAccountViewController viewProvidersManager](v14, "viewProvidersManager");
  location = -[ACUIAccountViewProvidersManager configurationInfoForCreatingAccountWithType:](v9, "configurationInfoForCreatingAccountWithType:", *v8);

  v10 = NSStringFromClass(v12);
  objc_msgSend(v13[0], "setProperty:forKey:");

  if (location)
    objc_msgSend(v13[0], "setUserInfo:", location);
  v3 = v13[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v3;
}

- (void)nonModalDataclassConfigurationControllerDidCompleteWithSuccess:(BOOL)a3
{
  id v3;
  id v4;

  if (!a3)
  {
    v4 = (id)-[ACUIAddMailAccountViewController navigationController](self, "navigationController");
    v3 = (id)objc_msgSend(v4, "popToViewController:animated:", self, 1);

  }
}

@end
