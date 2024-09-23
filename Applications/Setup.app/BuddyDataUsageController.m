@implementation BuddyDataUsageController

- (void)viewDidLoad
{
  BuddyDataUsageController *v2;
  NSBundle *v3;
  NSString *v4;
  objc_super v5;
  SEL v6;
  BuddyDataUsageController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyDataUsageController;
  -[BuddyDataUsageController viewDidLoad](&v5, "viewDidLoad");
  v2 = v7;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_100284738, CFSTR("Localizable"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "continueTapped:");

}

- (void)continueTapped:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyDataUsageController *v5;

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
  return kMCCCSkipSetupiMessageAndFaceTime;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)controllerNeedsToRun
{
  BYCapabilities *v2;
  unsigned __int8 v3;
  char v4;
  char v6;
  BYRunState *v7;
  char v9;

  v2 = -[BuddyDataUsageController capabilities](self, "capabilities");
  v3 = -[BYCapabilities mgHasGreenTea](v2, "mgHasGreenTea");
  v6 = 0;
  v4 = 0;
  if ((v3 & 1) != 0)
  {
    v7 = -[BuddyDataUsageController runState](self, "runState");
    v6 = 1;
    v4 = -[BYRunState hasCompletedInitialRun](v7, "hasCompletedInitialRun") ^ 1;
  }
  v9 = v4 & 1;
  if ((v6 & 1) != 0)

  return v9 & 1;
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_existingSettings, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_existingSettings, 0);
}

@end
