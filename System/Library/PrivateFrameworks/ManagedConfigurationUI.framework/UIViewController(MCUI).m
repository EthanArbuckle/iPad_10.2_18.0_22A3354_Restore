@implementation UIViewController(MCUI)

- (void)MCUIShowProgressInNavBar
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "MCMakeUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  viewControllerPointerToIdentifierMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v2);

  objc_msgSend(MEMORY[0x1E0D804D0], "sharedSpinnerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimatingInNavItem:forIdentifier:hideBackButton:", v5, v7, 1);

  objc_msgSend(a1, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

}

- (void)MCUIHideProgressInNavBarShowBackButton:()MCUI
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  viewControllerPointerToIdentifierMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    viewControllerPointerToIdentifierMap();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v11);

    objc_msgSend(MEMORY[0x1E0D804D0], "sharedSpinnerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAnimatingForIdentifier:", v6);

    if (a3)
    {
      objc_msgSend(a1, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidesBackButton:animated:", 0, 1);

    }
  }
  objc_msgSend(a1, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

}

- (BOOL)MCUIIsShowingProgress
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  viewControllerPointerToIdentifierMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)MCUIIsVisibleViewController
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "visibleViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == a1)
      v4 = 1;
  }

  return v4;
}

- (id)MCUITopViewController
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIViewController _MCUIUnwrapViewController:](MCUIViewController, "_MCUIUnwrapViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)MCUIPresentViewController:()MCUI
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "pushViewController:animated:", v6, 1);
    else
      objc_msgSend(a1, "presentViewController:animated:completion:", v6, 1, 0);
  }

}

- (void)MCUIReturnToSender:()MCUI returnToAccountSettings:viewControllerDismissalBlock:
{
  void (**v6)(id, uint64_t);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  +[MCURLListenerListController originalURLSender](MCURLListenerListController, "originalURLSender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCURLListenerListController setOriginalURLSender:](MCURLListenerListController, "setOriginalURLSender:", 0);
  if (objc_msgSend(v7, "length")
    && objc_msgSend(v7, "rangeOfString:", CFSTR("com.apple.Preferences")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.springboard"));
    v6[2](v6, v8);
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __98__UIViewController_MCUI__MCUIReturnToSender_returnToAccountSettings_viewControllerDismissalBlock___block_invoke;
      v12[3] = &unk_1EA2B65E8;
      v13 = v7;
      objc_msgSend(v9, "openApplication:withOptions:completion:", v13, 0, v12);

      goto LABEL_8;
    }
  }
  else
  {
    v6[2](v6, 1);
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCOUNT_SETTINGS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openSensitiveURL:withOptions:", v11, 0);

  }
LABEL_8:

}

+ (id)_MCUIUnwrapViewController:()MCUI
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "visibleViewController"), (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v3, "selectedViewController"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
  }
  else
  {
    objc_msgSend(v3, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = v3;
      goto LABEL_9;
    }
    objc_msgSend(v3, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[UIViewController _MCUIUnwrapViewController:](MCUIViewController, "_MCUIUnwrapViewController:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v7;
}

@end
