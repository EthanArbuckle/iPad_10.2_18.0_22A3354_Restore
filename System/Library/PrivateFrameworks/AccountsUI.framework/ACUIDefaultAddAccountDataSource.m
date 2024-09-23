@implementation ACUIDefaultAddAccountDataSource

- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (Class)viewControllerClassForCreatingOtherAccountTypes
{
  return (Class)objc_opt_class();
}

- (void)configureSpecifierForOtherAccountSpecifier:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4
{
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(v7, "viewControllerClassForCreatingAccountWithType:", location[0]);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return (Class)v6;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3 withViewProviderManager:(id)a4
{
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(v7, "controllerClassForCreatingAccountWithType:", location[0]);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return (Class)v6;
}

- (void)hasAccountWithType:(id)a3 accountStore:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(_QWORD *, void *, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  v8 = v16;
  v7 = location[0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __78__ACUIDefaultAddAccountDataSource_hasAccountWithType_accountStore_completion___block_invoke;
  v13 = &unk_1E9A15388;
  v14 = v15;
  objc_msgSend(v8, "accountsWithAccountType:completion:", v7);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __78__ACUIDefaultAddAccountDataSource_hasAccountWithType_accountStore_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v5 = a1[4];
  v6 = (id)objc_msgSend(location[0], "firstObject");
  (*(void (**)(void))(v5 + 16))();

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)configureAccountCreationController:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)accountControllerCompletedWithAccount:(id)a3 action:(int64_t)a4 data:(id)a5 specifier:(id)a6 viewController:(id)a7 completion:(id)a8
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int64_t v22;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  objc_storeStrong(&v19, a7);
  v18 = 0;
  objc_storeStrong(&v18, a8);
  if (location[0] && v22 == 1)
  {
    v10 = location[0];
    v11 = (id)objc_msgSend(v20, "name");
    +[ACUISetupViewController showDataclassConfigurationControllerForAccount:name:fromViewController:specifier:completion:](ACUISetupViewController, "showDataclassConfigurationControllerForAccount:name:fromViewController:specifier:completion:", v10);

  }
  else if (!location[0] && v22 == 2)
  {
    v17 = (id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Username"));
    v9 = (id)objc_msgSend(location[0], "accountType");
    v8 = (id)objc_msgSend(v9, "identifier");
    +[ACUISetupViewController showAlternateCreationControllerForAccountType:username:fromViewController:specifier:completion:](ACUISetupViewController, "showAlternateCreationControllerForAccountType:username:fromViewController:specifier:completion:");

    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end
