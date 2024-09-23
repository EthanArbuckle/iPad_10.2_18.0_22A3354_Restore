@implementation BuddyActivationBasebandDeadController

- (BuddyActivationBasebandDeadController)init
{
  NSBundle *v2;
  id v3;
  id v4;
  NSBundle *v5;
  NSString *v6;
  UIImage *v7;
  BuddyActivationBasebandDeadController *v8;
  objc_super v10;
  id location[2];
  id v12;

  v12 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyActivationBasebandDeadController));
  v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ACTIVATION_ERROR_BASEBAND_DEAD_DETAIL"));
  location[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", v3, &stru_100284738, CFSTR("Localizable"));

  v4 = v12;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyActivationBasebandDeadController));
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_ERROR_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v7 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Alert Icon"));
  v12 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)BuddyActivationBasebandDeadController;
  v12 = -[BuddyActivationBasebandDeadController initWithTitle:detailText:icon:](&v10, "initWithTitle:detailText:icon:", v6, location[0], v7);
  v8 = (BuddyActivationBasebandDeadController *)v12;

  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v8;
}

- (void)viewDidLoad
{
  id v2;
  UIColor *v3;
  id v4;
  BuddyActivationBasebandDeadController *v5;
  NSBundle *v6;
  NSString *v7;
  objc_super v8;
  SEL v9;
  BuddyActivationBasebandDeadController *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)BuddyActivationBasebandDeadController;
  -[BuddyActivationBasebandDeadController viewDidLoad](&v8, "viewDidLoad");
  v2 = -[BuddyActivationBasebandDeadController headerView](v10, "headerView");
  objc_msgSend(v2, "setIconInheritsTint:", 1);

  v3 = +[UIColor redColor](UIColor, "redColor");
  v4 = -[BuddyActivationBasebandDeadController headerView](v10, "headerView");
  objc_msgSend(v4, "setTintColor:", v3);

  v5 = v10;
  v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(BuddyActivationBasebandDeadController));
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("SHUTDOWN"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v5, "addBoldButton:action:", v7, "_shutdownTapped:");

}

- (void)_shutdownTapped:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _WORD v6[7];
  os_log_type_t v7;
  os_log_t oslog;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v7;
    sub_100038C3C(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "User requests shutdown UI on baseband dead pane...", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  SBSPresentPowerDownUI();
  objc_storeStrong(location, 0);
}

+ (BOOL)controllerNeedsToRun
{
  NSObject *IsDead;
  os_log_t oslog[2];
  uint64_t v5;
  char v6;
  SEL v7;
  id v8;
  uint8_t buf[24];

  v8 = a1;
  v7 = a2;
  v6 = 0;
  v5 = _CTServerConnectionCreateWithIdentifier(kCFAllocatorDefault, 0, 0, 0);
  memset(&oslog[1], 0, sizeof(os_log_t));
  IsDead = _CTServerConnectionGetRadioModuleIsDead(v5, &v6);
  oslog[1] = IsDead;
  if (!(_DWORD)IsDead)
    return v6 != 0;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(IsDead);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
  {
    sub_10003CBAC((uint64_t)buf, (int)oslog[1], SHIDWORD(oslog[1]));
    _os_log_error_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_ERROR, "Unable to check baseband status for signs of life: %d - %d", buf, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
  return 0;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

@end
