@implementation VOTQuickSettingsViewController

- (VOTQuickSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  VOTQuickSettingsViewController *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;
  id v12;

  v11.receiver = self;
  v11.super_class = (Class)VOTQuickSettingsViewController;
  v4 = -[VOTQuickSettingsViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  if (v4)
  {
    v5 = sub_10000DC74(CFSTR("VoiceOverQuickSettings.title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[VOTQuickSettingsViewController setTitle:](v4, "setTitle:", v6);

    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v4, "_handleDoneButtonTap:");
    v12 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController navigationItem](v4, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItems:", v8);

  }
  return v4;
}

- (void)viewDidLoad
{
  VOTQuickSettingsListViewController *v3;
  VOTQuickSettingsListViewController *settingsListViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VOTQuickSettingsViewController;
  -[VOTQuickSettingsViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = objc_alloc_init(VOTQuickSettingsListViewController);
  settingsListViewController = self->_settingsListViewController;
  self->_settingsListViewController = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController data](self, "data"));
  -[VOTQuickSettingsListViewController setData:](self->_settingsListViewController, "setData:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController view](self->_settingsListViewController, "view"));
  -[VOTQuickSettingsViewController addChildViewController:](self, "addChildViewController:", self->_settingsListViewController);
  objc_msgSend(v6, "addSubview:", v7);
  objc_msgSend(v6, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  -[VOTQuickSettingsListViewController didMoveToParentViewController:](self->_settingsListViewController, "didMoveToParentViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsListViewController searchController](self->_settingsListViewController, "searchController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setSearchController:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VOTQuickSettingsViewController;
  -[VOTQuickSettingsViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesSearchBarWhenScrolling:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VOTQuickSettingsViewController;
  -[VOTQuickSettingsViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = UIAccessibilityLayoutChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController navigationController](self, "navigationController"));
  UIAccessibilityPostNotification(v4, v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[VOTQuickSettingsViewController _dismissQuickSettings](self, "_dismissQuickSettings", a3);
}

- (void)_handleDoneButtonTap:(id)a3
{
  -[VOTQuickSettingsViewController _dismissQuickSettings](self, "_dismissQuickSettings", a3);
}

- (void)_dismissQuickSettings
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController delegate](self, "delegate"));
  objc_msgSend(v3, "quickSettingsViewControllerWasDismissed:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VOTQuickSettingsViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (VOTQuickSettingsViewControllerDelegate)delegate
{
  return (VOTQuickSettingsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXQuickSettingsData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (VOTQuickSettingsListViewController)settingsListViewController
{
  return self->_settingsListViewController;
}

- (void)setSettingsListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsListViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsListViewController, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
