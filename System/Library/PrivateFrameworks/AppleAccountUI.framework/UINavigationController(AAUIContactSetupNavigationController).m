@implementation UINavigationController(AAUIContactSetupNavigationController)

- (void)aaui_showActivityIndicator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "_aaui_activityIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(a1, "_aaui_setActivityIndicatorView:", v3);

    objc_msgSend(a1, "_aaui_activityIndicatorView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidesWhenStopped:", 1);

  }
  objc_msgSend(a1, "_aaui_activityIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(a1, "_aaui_activityIndicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v6, "initWithCustomView:", v7);

  objc_msgSend(a1, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_aaui_setCurrentRightBarButtonItems:", v10);

  objc_msgSend(a1, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightBarButtonItem:", v13);

}

- (uint64_t)aaui_hideActivityIndicator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_aaui_activityIndicatorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

  objc_msgSend(a1, "_aaui_currentRightBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_aaui_currentRightBarButtonItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItems:", v6);

  }
  return objc_msgSend(a1, "_aaui_setCurrentRightBarButtonItems:", 0);
}

- (id)_aaui_activityIndicatorView
{
  return objc_getAssociatedObject(a1, sel__aaui_activityIndicatorView);
}

- (void)_aaui_setActivityIndicatorView:()AAUIContactSetupNavigationController
{
  objc_setAssociatedObject(a1, sel__aaui_activityIndicatorView, a3, (void *)1);
}

- (id)_aaui_currentRightBarButtonItems
{
  return objc_getAssociatedObject(a1, sel__aaui_currentRightBarButtonItems);
}

- (void)_aaui_setCurrentRightBarButtonItems:()AAUIContactSetupNavigationController
{
  objc_setAssociatedObject(a1, sel__aaui_currentRightBarButtonItems, a3, (void *)1);
}

@end
