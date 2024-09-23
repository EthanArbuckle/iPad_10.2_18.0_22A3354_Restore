@implementation DownloadsActivity

- (DownloadsActivity)init
{
  DownloadsActivity *v2;
  void *v3;
  DownloadsActivity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DownloadsActivity;
  v2 = -[UIActivity init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__downloadsDidChange, *MEMORY[0x1E0CD58B8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__downloadsDidChange, *MEMORY[0x1E0CD5890], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__downloadsDidChange, *MEMORY[0x1E0CD5898], 0);
    v4 = v2;

  }
  return v2;
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("square.and.arrow.down");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0CD5818];
}

- (id)_activityBadgeText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "runningDownloadsCount");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_activityBadgeTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (id)_activityBadgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "sf_colorNamed:", CFSTR("shareSheetBadgeBackgroundColor"));
}

- (int64_t)actionType
{
  return 10;
}

- (BOOL)canPerformOnNewTabPage
{
  return 1;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)_navigationController
{
  UINavigationController *navigationController;
  UINavigationController *v3;
  id WeakRetained;
  void *v6;
  UINavigationController *v7;
  UINavigationController *v8;

  navigationController = self->_navigationController;
  if (navigationController)
  {
    v3 = navigationController;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_msgSend(WeakRetained, "downloadsViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
    v8 = self->_navigationController;
    self->_navigationController = v7;

    v3 = self->_navigationController;
  }
  return v3;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
  objc_msgSend(v4, "browserController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "viewControllerToPresentFrom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DownloadsActivity _navigationController](self, "_navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_downloadsDidChange
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(WeakRetained, "isBeingDismissed") & 1) == 0)
    objc_msgSend(WeakRetained, "_reloadActivity:", self);
  objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (ActionPanel)parentViewController
{
  return (ActionPanel *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
