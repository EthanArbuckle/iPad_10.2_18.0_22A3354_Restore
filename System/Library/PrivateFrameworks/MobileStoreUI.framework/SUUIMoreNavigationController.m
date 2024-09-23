@implementation SUUIMoreNavigationController

- (void)setStoreKitDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_storeKitDelegate, a3);
}

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIViewController *v10;
  UIViewController *firstActualViewController;
  UIViewController *v12;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "viewControllers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    -[SUUIMoreNavigationController setDisplayedViewController:](self, "setDisplayedViewController:", v6);
  }
  else
  {
    if (!self->_firstActualViewController && self->_displayedViewController)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "viewControllers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (UIViewController *)objc_claimAutoreleasedReturnValue();
        firstActualViewController = self->_firstActualViewController;
        self->_firstActualViewController = v10;

      }
      else
      {
        v12 = (UIViewController *)v6;
        v9 = self->_firstActualViewController;
        self->_firstActualViewController = v12;
      }

    }
    v13.receiver = self;
    v13.super_class = (Class)SUUIMoreNavigationController;
    -[UIMoreNavigationController pushViewController:animated:](&v13, sel_pushViewController_animated_, v6, v4);
  }

}

- (id)displayedViewController
{
  UINavigationController *displayedViewController;
  objc_super v4;

  displayedViewController = self->_displayedViewController;
  if (displayedViewController)
    return displayedViewController;
  v4.receiver = self;
  v4.super_class = (Class)SUUIMoreNavigationController;
  -[UIMoreNavigationController displayedViewController](&v4, sel_displayedViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDisplayedViewController:(id)a3
{
  UINavigationController *v4;
  UINavigationController *v5;
  UINavigationController *displayedViewController;
  void *v7;
  uint64_t v8;
  UINavigationController *v9;
  UINavigationController *v10;
  objc_super v11;

  v4 = (UINavigationController *)a3;
  -[SUUIMoreNavigationController displayedViewController](self, "displayedViewController");
  v5 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    displayedViewController = self->_displayedViewController;
    self->_displayedViewController = 0;

    v4 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[UINavigationController viewControllers](v4, "viewControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
LABEL_7:
        v11.receiver = self;
        v11.super_class = (Class)SUUIMoreNavigationController;
        -[UIMoreNavigationController setDisplayedViewController:](&v11, sel_setDisplayedViewController_, v4);
        goto LABEL_8;
      }
      v9 = 0;
      v10 = self->_displayedViewController;
      self->_displayedViewController = v4;
      v4 = v10;
    }
    else
    {
      v9 = v4;
    }

    v4 = v9;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  UINavigationController *displayedViewController;
  void *v9;
  UIViewController *firstActualViewController;
  UINavigationController *v11;
  objc_super v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[UIMoreNavigationController moreListController](self, "moreListController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if (self->_firstActualViewController)
    {
      displayedViewController = self->_displayedViewController;
      v13[0] = self->_firstActualViewController;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UINavigationController setViewControllers:animated:](displayedViewController, "setViewControllers:animated:", v9, 0);

      firstActualViewController = self->_firstActualViewController;
      self->_firstActualViewController = 0;

    }
    v11 = self->_displayedViewController;
    self->_displayedViewController = 0;

  }
  v12.receiver = self;
  v12.super_class = (Class)SUUIMoreNavigationController;
  -[UIMoreNavigationController didShowViewController:animated:](&v12, sel_didShowViewController_animated_, v6, v4);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  -[SUUIMoreNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "supportedInterfaceOrientations");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      v4 = 30;
    }
    else if (SUUIAllowsLandscapePhone())
    {
      v4 = 26;
    }
    else
    {
      v4 = 2;
    }
  }

  return v4;
}

- (SUUIMoreNavigationControllerDelegate)storeKitDelegate
{
  return (SUUIMoreNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_storeKitDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storeKitDelegate);
  objc_storeStrong((id *)&self->_firstActualViewController, 0);
  objc_storeStrong((id *)&self->_displayedViewController, 0);
}

@end
