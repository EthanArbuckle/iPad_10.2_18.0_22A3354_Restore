@implementation ACUISetupViewController

- (void)controller:(id)a3 didFinishSettingUpAccount:(id)a4
{
  id v4;
  const __CFString *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  Class v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  os_log_t oslog;
  id v22;
  id v23;
  id v24;
  id v25;
  os_log_type_t v26;
  id v27;
  Class v28;
  id v29;
  id v30;
  char v31;
  os_log_type_t v32;
  id v33;
  id v34;
  id location[2];
  ACUISetupViewController *v36;
  uint8_t v37[32];
  uint8_t v38[48];
  uint8_t v39[40];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = _ACUILogSystem();
  v32 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_opt_class();
    v19 = (id)objc_msgSend(v34, "username");
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v39, (uint64_t)"-[ACUISetupViewController controller:didFinishSettingUpAccount:]", 52, v18, (uint64_t)v19);
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)v33, v32, "%s (%d) \"Controller %@ reports being finished with setting up account %@.\", v39, 0x26u);

  }
  objc_storeStrong(&v33, 0);
  v31 = 0;
  if (!v36->_didAttemptDataclassSetup)
  {
    v36->_didAttemptDataclassSetup = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (id)objc_msgSend(location[0], "specifier");
      v30 = (id)objc_msgSend(v15, "userInfo");

      v16 = (id)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ACUIForceMailSetupKey"));
      v17 = (objc_msgSend(v16, "BOOLValue") & 1) != 1;

      if (!v17)
        v36->_shouldForceMailSetup = 1;
      objc_storeStrong(&v30, 0);
    }
    v29 = +[ACUIAccountViewProvidersManager sharedInstance](ACUIAccountViewProvidersManager, "sharedInstance");
    v28 = (Class)objc_msgSend(v29, "viewControllerClassForViewingAccount:", v34);
    v27 = _ACUILogSystem();
    v26 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
    {
      v14 = (id)objc_msgSend(v34, "username");
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v38, (uint64_t)"-[ACUISetupViewController controller:didFinishSettingUpAccount:]", 73, (uint64_t)v14, (uint64_t)v28);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v27, v26, "%s (%d) \"Dataclass configuration VC class for account %@ identified as %@\", v38, 0x26u);

    }
    objc_storeStrong(&v27, 0);
    if ((-[objc_class isSubclassOfClass:](v28, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      v25 = (id)-[ACUISetupViewController topViewController](v36, "topViewController");
      v11 = v28;
      v13 = (id)objc_msgSend(v25, "specifier");
      v12 = (id)objc_msgSend(v13, "name");
      v24 = +[ACUISetupViewController _specifierForDataclassEditControllerClass:withName:account:](ACUISetupViewController, "_specifierForDataclassEditControllerClass:withName:account:", v11);

      v23 = objc_alloc_init(v28);
      objc_msgSend(v23, "setFirstTimeSetup:", 1);
      if (v36->_shouldForceMailSetup)
        objc_msgSend(v23, "forceMailSetup");
      v9 = (id)objc_msgSend(location[0], "specifier");
      v22 = (id)objc_msgSend(v9, "userInfo");

      v4 = (id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ACUIPreEnabledDataclasses"));
      v10 = v4 == 0;

      if (!v10)
      {
        v8 = (id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ACUIPreEnabledDataclasses"));
        objc_msgSend(v23, "setPreEnabledDataclasses:");

      }
      objc_msgSend(v23, "setParentController:", v25);
      v6 = v23;
      v7 = -[PSRootController rootController](v36, "rootController");
      objc_msgSend(v6, "setRootController:");

      objc_msgSend(v23, "setSpecifier:", v24);
      objc_msgSend(v25, "pushController:", v23);
      v31 = 1;
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v29, 0);
  }
  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    if ((v31 & 1) != 0)
      v5 = CFSTR("NO");
    else
      v5 = CFSTR("YES");
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v37, (uint64_t)"-[ACUISetupViewController controller:didFinishSettingUpAccount:]", 107, (uint64_t)v5);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"Deciding wether to dismiss self: %@\", v37, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((v31 & 1) == 0)
    -[ACUISetupViewController _dismissAndNotifyParent](v36, "_dismissAndNotifyParent");
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
}

+ (void)showAlternateCreationControllerForAccountType:(id)a3 username:(id)a4 fromViewController:(id)a5 specifier:(id)a6 completion:(id)a7
{
  id v7;
  NSString *v8;
  id v9;
  void *v10;
  id v11;
  id v16;
  Class v17;
  ACUIAccountViewProvidersManager *v18;
  id v19;
  id v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location[3];
  uint8_t v28[40];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = 0;
  objc_storeStrong(&v24, a6);
  v23 = 0;
  objc_storeStrong(&v23, a7);
  v22 = _ACUILogSystem();
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v28, (uint64_t)"+[ACUISetupViewController showAlternateCreationControllerForAccountType:username:fromViewController:specifier:completion:]", 115, (uint64_t)location[0]);
    _os_log_impl(&dword_1D573D000, (os_log_t)v22, v21, "%s (%d) \"Showing Alternate Creation Controller for '%{public}@'\", v28, 0x1Cu);
  }
  objc_storeStrong(&v22, 0);
  v9 = (id)objc_msgSend(v24, "userInfo");
  v20 = (id)objc_msgSend(v9, "mutableCopy");

  objc_storeStrong(location, (id)*MEMORY[0x1E0C8F0D0]);
  v10 = (void *)MEMORY[0x1E0D804E8];
  v11 = (id)objc_msgSend(v24, "name");
  v19 = (id)objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, 0, 0, 0, objc_opt_class(), 10, 0);

  objc_msgSend(v20, "setValue:forKey:", CFSTR("YahooAccount"), CFSTR("specifierAccount"));
  objc_msgSend(v20, "setValue:forKey:", getIMAPAccountClass(), CFSTR("class"));
  if (v26)
    objc_msgSend(v20, "setValue:forKey:", v26, CFSTR("Username"));
  objc_msgSend(v19, "setUserInfo:", v20);
  v18 = +[ACUIAccountViewProvidersManager sharedInstance](ACUIAccountViewProvidersManager, "sharedInstance");
  v17 = 0;
  v17 = -[ACUIAccountViewProvidersManager viewControllerClassForCreatingAccountWithType:](v18, "viewControllerClassForCreatingAccountWithType:", location[0]);
  v7 = v19;
  v8 = NSStringFromClass(v17);
  objc_msgSend(v7, "setProperty:forKey:");

  v16 = (id)objc_msgSend(v25, "controllerForSpecifier:", v19);
  objc_msgSend(v25, "showController:", v16);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

+ (void)showDataclassConfigurationControllerForAccount:(id)a3 name:(id)a4 fromViewController:(id)a5 specifier:(id)a6 completion:(id)a7
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  id v19;
  BOOL v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  os_log_type_t v29;
  id v30;
  Class v31;
  id v32;
  id v33;
  BOOL v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location[3];
  uint8_t v40[40];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = 0;
  objc_storeStrong(&v36, a6);
  v35 = 0;
  objc_storeStrong(&v35, a7);
  v33 = (id)objc_msgSend(v36, "userInfo");
  v19 = (id)objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ACUIForceMailSetupKey"));
  v20 = (objc_msgSend(v19, "BOOLValue") & 1) != 1;

  v34 = !v20;
  v32 = +[ACUIAccountViewProvidersManager sharedInstance](ACUIAccountViewProvidersManager, "sharedInstance");
  v31 = (Class)objc_msgSend(v32, "viewControllerClassForViewingAccount:", location[0]);
  v30 = _ACUILogSystem();
  v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
  {
    v14 = (id)objc_msgSend(location[0], "username");
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v40, (uint64_t)"+[ACUISetupViewController showDataclassConfigurationControllerForAccount:name:fromViewController:specifier:completion:]", 160, (uint64_t)v14, (uint64_t)v31);
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)v30, v29, "%s (%d) \"Dataclass configuration VC class for account %@ identified as %@\", v40, 0x26u);

  }
  objc_storeStrong(&v30, 0);
  if ((-[objc_class isSubclassOfClass:](v31, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v28 = (id)objc_msgSend((id)objc_opt_class(), "_specifierForDataclassEditControllerClass:withName:account:", v31, v38, location[0]);
    v27 = objc_alloc_init(v31);
    objc_msgSend(v27, "setFirstTimeSetup:", 1);
    if (v34)
      objc_msgSend(v27, "forceMailSetup");
    v7 = (id)objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ACUIPreEnabledDataclasses"));
    v13 = v7 == 0;

    if (!v13)
    {
      v12 = (id)objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ACUIPreEnabledDataclasses"));
      objc_msgSend(v27, "setPreEnabledDataclasses:");

    }
    v21 = MEMORY[0x1E0C809B0];
    v22 = -1073741824;
    v23 = 0;
    v24 = __119__ACUISetupViewController_showDataclassConfigurationControllerForAccount_name_fromViewController_specifier_completion___block_invoke;
    v25 = &unk_1E9A15708;
    v26 = v35;
    objc_msgSend(v27, "setConfigurationCompletion:", &v21);
    v8 = v27;
    v9 = (id)objc_msgSend(v37, "parentController");
    objc_msgSend(v8, "setParentController:");

    v10 = v27;
    v11 = (id)objc_msgSend(v37, "rootController");
    objc_msgSend(v10, "setRootController:");

    objc_msgSend(v27, "setSpecifier:", v28);
    objc_msgSend(v37, "pushController:", v27);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  else
  {
    (*((void (**)(id, _QWORD))v35 + 2))(v35, 0);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

uint64_t __119__ACUISetupViewController_showDataclassConfigurationControllerForAccount_name_fromViewController_specifier_completion___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ACUIAccountSetupDidFinish"), 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)finishedAccountSetup
{
  -[ACUISetupViewController _dismissAndNotifyParent](self, "_dismissAndNotifyParent", a2, self);
}

- (void)_dismissAndNotifyParent
{
  id v2;
  id WeakRetained;
  char v4;
  id v5;

  v5 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ACUIAccountSetupDidFinish"), 0);

  if (!self->_shouldForceMailSetup)
    -[PSSetupController dismissAnimated:](self, "dismissAnimated:", 1);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E0D805A8]));
  v4 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EFF64078);

  if ((v4 & 1) != 0)
  {
    v2 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D805A8]));
    objc_msgSend(v2, "setupViewControllerDidDismiss:", self);

  }
}

+ (id)_specifierForDataclassEditControllerClass:(Class)a3 withName:(id)a4 account:(id)a5
{
  id v5;
  id v6;
  id obj;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  id *v12;
  id v13;
  id *v14;
  id *v15;
  id *p_location;
  id v17;
  id v18;
  id v19;
  id v20;
  id location;
  Class v22;
  SEL v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  obj = a5;
  v26[2] = *MEMORY[0x1E0C80C00];
  v24 = a1;
  v23 = a2;
  v22 = a3;
  p_location = &location;
  v17 = 0;
  location = 0;
  objc_storeStrong(&location, a4);
  v15 = &v20;
  v20 = 0;
  objc_storeStrong(&v20, obj);
  v5 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", location, 0, 0, 0, v22, 1, 0);
  v14 = &v19;
  v19 = v5;
  v10 = v25;
  v25[0] = CFSTR("account");
  v9 = v26;
  v26[0] = v20;
  v25[1] = CFSTR("ACUISpecifierAccountIdentifier");
  v11 = (id)objc_msgSend(v20, "identifier");
  v26[1] = v11;
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v10, 2);
  v12 = &v18;
  v18 = v6;

  objc_msgSend(v19, "setUserInfo:", v18);
  v13 = v19;
  objc_storeStrong(v12, v17);
  objc_storeStrong(v14, v17);
  objc_storeStrong(v15, v17);
  objc_storeStrong(p_location, v17);
  return v13;
}

@end
