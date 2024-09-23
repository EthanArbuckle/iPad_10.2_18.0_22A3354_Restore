@implementation UINavigationController(GKCrossFade)

- (void)_gkReplaceTopViewControllerWithViewController:()GKCrossFade transition:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeLastObject");
  objc_msgSend(v9, "addObject:", v7);

  objc_msgSend(a1, "_gkSetViewControllers:transition:", v9, v6);
}

- (void)_gkSetViewControllers:()GKCrossFade transition:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(a1, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    objc_msgSend(a1, "setViewControllers:animated:", v13, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28D0], "animation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDuration:", 0.300000012);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimingFunction:", v10);

    objc_msgSend(v9, "setType:", v6);
    objc_msgSend(a1, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAnimation:forKey:", v9, 0);

    objc_msgSend(a1, "setViewControllers:animated:", v13, 0);
  }

}

@end
