@implementation BuddyPasscodeMesaController

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  BYCapabilities *v4;
  BYCapabilities *v5;
  unsigned __int8 v6;
  BYCapabilities *v7;
  char v8;
  char v10;
  MCProfileConnection *v11;
  char v12;
  BOOL v14;

  v12 = 0;
  v2 = -[BuddyPasscodeController capabilities](self, "capabilities");
  v3 = -[BYCapabilities supportsTouchID](v2, "supportsTouchID");

  if ((v3 & 1) != 0)
  {
    v4 = -[BuddyPasscodeController capabilities](self, "capabilities");
    v12 = -[BYCapabilities isTouchIDEnrolled](v4, "isTouchIDEnrolled") & 1;

  }
  else
  {
    v5 = -[BuddyPasscodeController capabilities](self, "capabilities");
    v6 = -[BYCapabilities supportsPearl](v5, "supportsPearl");

    if ((v6 & 1) != 0)
    {
      v7 = -[BuddyPasscodeController capabilities](self, "capabilities");
      v12 = -[BYCapabilities isPearlEnrolled](v7, "isPearlEnrolled") & 1;

    }
  }
  v10 = 0;
  v8 = 0;
  if ((v12 & 1) != 0)
  {
    v11 = -[BuddyPasscodeController managedConfiguration](self, "managedConfiguration");
    v10 = 1;
    v8 = -[MCProfileConnection isPasscodeSet](v11, "isPasscodeSet") ^ 1;
  }
  v14 = v8 & 1;
  if ((v10 & 1) != 0)

  return v14;
}

- (BOOL)allowsSkip
{
  return 0;
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  BYCapabilities *v3;
  unsigned __int8 v4;
  NSBundle *v5;
  id location[2];
  BuddyPasscodeMesaController *v8;
  NSString *v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyPasscodeController capabilities](v8, "capabilities");
  v4 = -[BYCapabilities supportsPearl](v3, "supportsPearl");

  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BFFPasscodeCreationManager));
  if ((v4 & 1) != 0)
    v9 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSCODE_SUBTITLE_FACEID"), &stru_100284738, CFSTR("Localizable"));
  else
    v9 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSCODE_SUBTITLE_TOUCHID"), &stru_100284738, CFSTR("Localizable"));

  objc_storeStrong(location, 0);
  return v9;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  MCProfileConnection *v5;
  objc_super v6;
  id v7;
  id location[2];
  BuddyPasscodeMesaController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = -[BuddyPasscodeController managedConfiguration](v9, "managedConfiguration");
  -[MCProfileConnection setFingerprintUnlockAllowed:passcode:completion:](v5, "setFingerprintUnlockAllowed:passcode:completion:", 1, v7, 0);

  v6.receiver = v9;
  v6.super_class = (Class)BuddyPasscodeMesaController;
  -[BuddyPasscodeController passcodeViewController:didFinishWithPasscodeCreation:](&v6, "passcodeViewController:didFinishWithPasscodeCreation:", location[0], v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

@end
