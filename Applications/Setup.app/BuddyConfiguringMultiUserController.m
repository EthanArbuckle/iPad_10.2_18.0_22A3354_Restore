@implementation BuddyConfiguringMultiUserController

- (BuddyConfiguringMultiUserController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddyConfiguringMultiUserController *v5;
  objc_super v7;
  SEL v8;
  id location;

  v8 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MULTI_USER_TIME_IPAD"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v7.receiver = self;
  v7.super_class = (Class)BuddyConfiguringMultiUserController;
  location = -[BuddyConfiguringMultiUserController initWithSpinnerText:](&v7, "initWithSpinnerText:", v4);
  v5 = (BuddyConfiguringMultiUserController *)location;

  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  UIApplication *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyConfiguringMultiUserController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyConfiguringMultiUserController;
  -[BuddyConfiguringMultiUserController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v3 = -[BuddyConfiguringMultiUserController navigationItem](v8, "navigationItem");
  objc_msgSend(v3, "setHidesBackButton:", 1);

  v4 = +[UIApplication sharedApplication](UIApplication, "sharedApplication");
  -[UIApplication setIdleTimerDisabled:](v4, "setIdleTimerDisabled:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyConfiguringMultiUserController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyConfiguringMultiUserController;
  -[BuddyConfiguringMultiUserController viewDidAppear:](&v3, "viewDidAppear:", a3);
  -[BuddyConfiguringMultiUserController provisionDeviceForMultiUserAndSwitchToLoginWindow](v6, "provisionDeviceForMultiUserAndSwitchToLoginWindow");
}

- (void)provisionDeviceForMultiUserAndSwitchToLoginWindow
{
  NSObject *v2;
  void **block;
  int v4;
  int v5;
  void (*v6);
  void *v7;
  id v8[2];
  BuddyConfiguringMultiUserController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10011C650;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_showConfigurationFailedForError:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  BuddyConfiguringMultiUserController *v10;
  id location[2];
  BuddyConfiguringMultiUserController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10011C9DC;
  v8 = &unk_100280D00;
  v9 = location[0];
  v10 = v12;
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  MCProfileConnection *v2;
  unsigned int v3;
  char v4;
  char v6;
  MCProfileConnection *v7;
  char v9;

  v2 = -[BuddyConfiguringMultiUserController managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection userMode](v2, "userMode");
  v6 = 0;
  v4 = 0;
  if (v3 == 1)
  {
    v7 = -[BuddyConfiguringMultiUserController managedConfiguration](self, "managedConfiguration");
    v6 = 1;
    v4 = -[MCProfileConnection isEphemeralMultiUser](v7, "isEphemeralMultiUser") ^ 1;
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_mdmReturnToServiceController, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
