@implementation BuddyUpdateFinishedAutoUpdateController

- (void)viewDidLoad
{
  id v2;
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  id v6;
  NSString *v7;
  UIDevice *v8;
  NSString *v9;
  NSBundle *v10;
  NSString *v11;
  id v12;
  id v13;
  id v14;
  id location;
  objc_super v16;
  SEL v17;
  BuddyUpdateFinishedAutoUpdateController *v18;

  v18 = self;
  v17 = a2;
  v16.receiver = self;
  v16.super_class = (Class)BuddyUpdateFinishedAutoUpdateController;
  -[BuddyAutoUpdateController viewDidLoad](&v16, "viewDidLoad");
  v2 = -[BuddyUpdateFinishedAutoUpdateController headerView](v18, "headerView");
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_COMPLETE_TITLE"), &stru_100284738, CFSTR("Localizable"));
  objc_msgSend(v2, "setTitle:", v4);

  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SOFTWARE_UPDATE_COMPLETE_DETAIL"));
  v7 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("Localizable"));
  v8 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = -[UIDevice systemVersion](v8, "systemVersion");
  location = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);

  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v11 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", CFSTR("AUTO_UPDATE_DESCRIPTION"), &stru_100284738, CFSTR("Localizable"));
  v12 = objc_msgSend(location, "stringByAppendingFormat:", CFSTR("\n\n%@"), v11);
  v13 = location;
  location = v12;

  v14 = -[BuddyUpdateFinishedAutoUpdateController headerView](v18, "headerView");
  objc_msgSend(v14, "setDetailText:", location);

  objc_storeStrong(&location, 0);
}

@end
