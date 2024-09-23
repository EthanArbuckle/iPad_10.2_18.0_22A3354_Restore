@implementation UINavigationController(HUPreloadingNavigationPresentation)

- (id)hu_preloadContent
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToProtocol:", &unk_1EF230988);

  if (v3)
  {
    objc_msgSend(a1, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hu_preloadContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)hu_pushPreloadableViewController:()HUPreloadingNavigationPresentation animated:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF230988))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "needsToWaitForPreload");
  else
    v9 = 0;
  objc_msgSend(a1, "hu_pushPreloadableViewController:animated:waitForPreload:", v6, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hu_pushPreloadableViewController:()HUPreloadingNavigationPresentation animated:waitForPreload:
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  char v14;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke;
  v12[3] = &unk_1E6F4D650;
  v12[4] = a1;
  v13 = v8;
  v14 = a4;
  v9 = v8;
  _HUPreloadViewController(v9, a5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
