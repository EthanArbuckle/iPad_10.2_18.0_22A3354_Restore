@implementation HKViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  -[HKViewController navigationController](self, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HKViewController tabBarController](self, "tabBarController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "setNavigationBarHidden:animated:", v5, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setTabBarControlsHidden:animated:", v5, v4);
  }
  else
  {
    objc_msgSend(v7, "tabBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v5);

  }
}

@end
