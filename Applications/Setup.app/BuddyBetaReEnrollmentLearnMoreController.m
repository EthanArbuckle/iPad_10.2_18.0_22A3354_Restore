@implementation BuddyBetaReEnrollmentLearnMoreController

- (BuddyBetaReEnrollmentLearnMoreController)init
{
  NSBundle *v2;
  NSBundle *v3;
  id v4;
  BuddyBetaReEnrollmentLearnMoreController *v5;
  objc_super v7;
  id v8;
  id v9[2];
  id location;

  location = self;
  v9[1] = (id)a2;
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9[0] = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("ABOUT_APPLE_SOFTWARE_BETA_PROGRAM_TITLE"), &stru_100284738, CFSTR("BetaReEnrollment"));

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v8 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("ABOUT_APPLE_SOFTWARE_BETA_PROGRAM_DETAIL"), &stru_100284738, CFSTR("BetaReEnrollment"));

  v4 = location;
  location = 0;
  v7.receiver = v4;
  v7.super_class = (Class)BuddyBetaReEnrollmentLearnMoreController;
  location = -[BuddyBetaReEnrollmentLearnMoreController initWithTitle:detailText:icon:](&v7, "initWithTitle:detailText:icon:", v9[0], v8, 0);
  objc_storeStrong(&location, location);
  v5 = (BuddyBetaReEnrollmentLearnMoreController *)location;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

- (void)viewDidLoad
{
  id v2;
  NSBundle *v3;
  NSString *v4;
  id v5;
  id v6;
  objc_super v7;
  SEL v8;
  BuddyBetaReEnrollmentLearnMoreController *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyBetaReEnrollmentLearnMoreController;
  -[BuddyBetaReEnrollmentLearnMoreController viewDidLoad](&v7, "viewDidLoad");
  v2 = objc_alloc((Class)UIBarButtonItem);
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_100284738, CFSTR("Localizable"));
  v5 = objc_msgSend(v2, "initWithTitle:style:target:action:", v4, 2, v9, "_doneTapped:");
  v6 = -[BuddyBetaReEnrollmentLearnMoreController navigationItem](v9, "navigationItem");
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

}

- (void)_doneTapped:(id)a3
{
  id v3;
  id location[2];
  BuddyBetaReEnrollmentLearnMoreController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyBetaReEnrollmentLearnMoreController presentingViewController](v5, "presentingViewController");
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_storeStrong(location, 0);
}

@end
