@implementation UIViewController(_QLUtilities)

- (void)QL_disableChromelessBarsUI
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(a1, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEdgeAppearance:", v5);

  if (!v4)
  objc_msgSend(a1, "tabBarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "standardAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v10 = objc_alloc_init(MEMORY[0x24BEBD9D8]);
  objc_msgSend(a1, "tabBarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScrollEdgeAppearance:", v10);

  if (!v9)
  objc_msgSend(a1, "navigationController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "toolbar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "standardAppearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v14 = objc_alloc_init(MEMORY[0x24BEBDA98]);
  objc_msgSend(a1, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toolbar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setScrollEdgeAppearance:", v14);

  if (!v13)
}

- (void)QL_enableChromelessBarsUI
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScrollEdgeAppearance:", 0);

  objc_msgSend(a1, "tabBarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEdgeAppearance:", 0);

  objc_msgSend(a1, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEdgeAppearance:", 0);

}

@end
