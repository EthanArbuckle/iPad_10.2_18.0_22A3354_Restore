@implementation BuddyRestoreFinishedController

- (BuddyRestoreFinishedController)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  BuddyRestoreFinishedController *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("RESTORE_COMPLETED_TITLE"), &stru_100284738, CFSTR("Localizable"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("RESTORE_COMPLETED_DETAIL"), &stru_100284738, CFSTR("Localizable"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyRestoreFinishedController;
  location = -[BuddyRestoreFinishedController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", v4, v6, 0);
  v7 = (BuddyRestoreFinishedController *)location;

  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  id v2;
  double v3;
  BuddyRestoreFinishedController *v4;
  NSBundle *v5;
  NSString *v6;
  objc_super v7;
  SEL v8;
  BuddyRestoreFinishedController *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyRestoreFinishedController;
  -[BuddyRestoreFinishedController viewDidLoad](&v7, "viewDidLoad");
  v2 = -[BuddyRestoreFinishedController headerView](v9, "headerView");
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setTitleHyphenationFactor:", v3);

  v4 = v9;
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v4, "addBoldButton:action:", v6, "_continuePressed:");

}

- (void)_continuePressed:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyRestoreFinishedController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyWelcomeController delegate](v5, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v3, "flowItemDone:", v5);

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupRestoreCompleted;
}

+ (unint64_t)applicableDispositions
{
  return 0;
}

@end
