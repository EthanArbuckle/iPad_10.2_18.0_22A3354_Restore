@implementation GKLocalPlayer(iOSAuthenticationUI)

- (id)activeViewController
{
  return (id)sActiveViewController;
}

- (void)setActiveViewController:()iOSAuthenticationUI
{
  objc_storeStrong((id *)&sActiveViewController, obj);
}

- (id)rootViewController
{
  return (id)sRootViewController;
}

- (void)setRootViewController:()iOSAuthenticationUI
{
  objc_storeStrong((id *)&sRootViewController, obj);
}

- (id)signInViewController
{
  return (id)sSignInViewController;
}

- (void)setSignInViewController:()iOSAuthenticationUI
{
  objc_storeStrong((id *)&sSignInViewController, obj);
}

- (void)showViewController:()iOSAuthenticationUI usingPresentingViewController:wrapInNavController:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v8);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 == 1)
    {
      if (*MEMORY[0x24BE3A2C0])
        v13 = _GKIsRemoteUIUsingPadIdiom == 0;
      else
        v13 = 0;
      if (!v13)
      {
        objc_msgSend(v10, "setModalPresentationStyle:", 16);
        +[GKUITheme sharedTheme](GKUITheme, "sharedTheme");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "formSheetSize");
        objc_msgSend(v10, "setFormSheetSize:");

      }
    }
    objc_msgSend(v10, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKUITheme sharedTheme](GKUITheme, "sharedTheme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_gkApplyTheme:navbarStyle:", v16, 1);

  }
  else
  {
    v10 = v8;
  }
  objc_msgSend(a1, "setActiveViewController:", v10);
  if (!v9)
  {
    objc_msgSend(a1, "authenticateHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x24BE3A260], "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isAccountModificationRestricted"))
    {
      v21 = objc_msgSend(MEMORY[0x24BE3A1A0], "isGameCenter");

      if ((v21 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "userErrorForCode:underlyingError:", 4, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
LABEL_20:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __107__GKLocalPlayer_iOSAuthenticationUI__showViewController_usingPresentingViewController_wrapInNavController___block_invoke;
        block[3] = &unk_24DC27658;
        block[4] = a1;
        v27 = v23;
        v28 = v22;
        v24 = v22;
        v25 = v23;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        goto LABEL_21;
      }
    }
    else
    {

    }
    v23 = v10;
    v22 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v9, "presentedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v9, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    objc_msgSend(v9, "presentViewController:animated:completion:", v10, 1, 0);
  }
LABEL_21:

}

- (void)removeActiveViewControllerAnimated:()iOSAuthenticationUI completionHandler:
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD);

  v6 = a4;
  objc_msgSend(a1, "activeViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setActiveViewController:", 0);
  objc_msgSend(a1, "rootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __91__GKLocalPlayer_iOSAuthenticationUI__removeActiveViewControllerAnimated_completionHandler___block_invoke;
    v12[3] = &unk_24DC27910;
    v14 = v6;
    v13 = v7;
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", a3, v12);

  }
  else
  {
    objc_msgSend(v7, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", a3, v6);
    }
    else if (v6)
    {
      v6[2](v6);
    }

  }
}

@end
