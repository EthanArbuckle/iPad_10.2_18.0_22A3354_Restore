@implementation BuddyAwaitUserConfigurationController

+ (BOOL)controllerNeedsToRun
{
  return +[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession", a2, a1) & 1;
}

- (id)viewController
{
  BuddyAwaitUserConfigurationViewController *v2;
  MCProfileConnection *v3;
  BuddyAwaitUserConfigurationViewController *v4;
  NSBundle *v5;
  NSString *v6;
  NSString *v7;
  id location;
  id v10;
  id v11[2];
  BuddyAwaitUserConfigurationController *v12;
  BuddyAwaitUserConfigurationViewController *v13;

  v12 = self;
  v11[1] = (id)a2;
  if ((+[DMCMultiUserModeUtilities awaitUserConfigurationEnabled](DMCMultiUserModeUtilities, "awaitUserConfigurationEnabled") & 1) != 0)
  {
    v2 = -[BuddyAwaitUserConfigurationController awaitUserConfigurationViewController](v12, "awaitUserConfigurationViewController");

    if (!v2)
    {
      v3 = -[BuddyAwaitUserConfigurationController managedConfiguration](v12, "managedConfiguration");
      v11[0] = -[MCProfileConnection cloudConfigurationDetails](v3, "cloudConfigurationDetails");

      v10 = objc_msgSend(v11[0], "objectForKeyedSubscript:", kMCCCOrganizationNameKey);
      v4 = [BuddyAwaitUserConfigurationViewController alloc];
      v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CLOUD_CONFIG_GETTING_CONFIGURATION_DESCRIPTION_%@"), &stru_100284738, CFSTR("Localizable"));
      v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v10);
      location = -[BuddyAwaitUserConfigurationViewController initWithSpinnerText:](v4, "initWithSpinnerText:", v7);

      objc_msgSend(location, "setAwaitUserConfigurationController:", v12);
      -[BuddyAwaitUserConfigurationController setAwaitUserConfigurationViewController:](v12, "setAwaitUserConfigurationViewController:", location);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v10, 0);
      objc_storeStrong(v11, 0);
    }
    v13 = -[BuddyAwaitUserConfigurationController awaitUserConfigurationViewController](v12, "awaitUserConfigurationViewController");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)setDelegate:(id)a3
{
  id location[2];
  BuddyAwaitUserConfigurationController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_delegate, location[0]);
  objc_storeStrong(location, 0);
}

- (void)startFlowItem:(BOOL)a3
{
  -[BuddyAwaitUserConfigurationController controllerDone](self, "controllerDone");
}

- (void)controllerDone
{
  BFFFlowItemDelegate *v2;

  v2 = -[BuddyAwaitUserConfigurationController delegate](self, "delegate", a2);
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v2, "flowItemDone:nextItemClass:", self, objc_opt_class(BuddyFinishedController));

}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BuddyAwaitUserConfigurationViewController)awaitUserConfigurationViewController
{
  return self->_awaitUserConfigurationViewController;
}

- (void)setAwaitUserConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_awaitUserConfigurationViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awaitUserConfigurationViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
