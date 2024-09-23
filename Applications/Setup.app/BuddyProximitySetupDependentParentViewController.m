@implementation BuddyProximitySetupDependentParentViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyProximitySetupDependentParentViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyProximitySetupDependentParentViewController;
  -[BuddyProximitySetupDependentParentViewController viewDidLoad](&v3, "viewDidLoad");
  v2 = -[BuddyProximitySetupDependentParentViewController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

}

@end
