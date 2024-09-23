@implementation FTRegUtilities

+ (id)serviceWithType:(int64_t)a3
{
  void *v3;
  void *v4;

  FTCServiceNameForServiceType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE50370], "serviceWithInternalName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)standaloneAuthorizationControllerWithRegController:(id)a3 authID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNFRegAccountAuthorizationController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CNFRegAccountAuthorizationController initWithRegController:authID:token:]([CNFRegAccountAuthorizationController alloc], "initWithRegController:authID:token:", v10, v9, v8);

  -[CNFRegAccountAuthorizationController setDelegate:](v11, "setDelegate:", a1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v11);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModalPresentationStyle:", objc_msgSend(v13, "modalPresentationStyle"));
  v14 = objc_msgSend(v13, "navigationBarStyle");
  objc_msgSend(v12, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBarStyle:", v14);

  v16 = objc_msgSend(v13, "navigationBarIsTranslucent");
  objc_msgSend(v12, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslucent:", v16);

  return v12;
}

+ (id)standaloneNewPasswordControllerWithRegController:(id)a3 appleID:(id)a4
{
  id v6;
  id v7;
  CNFRegChangeAccountPasswordController *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = -[CNFRegChangeAccountPasswordController initWithRegController:appleID:]([CNFRegChangeAccountPasswordController alloc], "initWithRegController:appleID:", v7, v6);

  -[CNFRegChangeAccountPasswordController setDelegate:](v8, "setDelegate:", a1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModalPresentationStyle:", objc_msgSend(v10, "modalPresentationStyle"));
  v11 = objc_msgSend(v10, "navigationBarStyle");
  objc_msgSend(v9, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBarStyle:", v11);

  v13 = objc_msgSend(v10, "navigationBarIsTranslucent");
  objc_msgSend(v9, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslucent:", v13);

  return v9;
}

+ (void)changePasswordControllerDidCancel:(id)a3
{
  id v3;

  objc_msgSend(a3, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (void)changePasswordControllerDidFinish:(id)a3 withAppleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v9;
    objc_msgSend(v9, "regController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appleIDAccounts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v19, "loginDisplayString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v10);

          if (v21)
            objc_msgSend(v19, "updateAuthorizationCredentials:token:", v11, v12);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v16);
    }

    v9 = v23;
  }
  objc_msgSend(v9, "presentingViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 1, 0);

}

+ (void)authorizationController:(id)a3 authorizedAccount:(BOOL)a4
{
  id v4;

  objc_msgSend(a3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
