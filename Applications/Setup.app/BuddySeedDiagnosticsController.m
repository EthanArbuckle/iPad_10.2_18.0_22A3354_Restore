@implementation BuddySeedDiagnosticsController

- (BuddySeedDiagnosticsController)init
{
  BuddySeedDiagnosticsController *v2;
  objc_super v4;
  SEL v5;
  id location;

  v5 = a2;
  location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddySeedDiagnosticsController;
  location = -[BuddyDiagnosticsController init](&v4, "init");
  objc_storeStrong(&location, location);
  if (location)
    objc_msgSend(location, "setImposeSeedPolicy:", 1);
  v2 = (BuddySeedDiagnosticsController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)setShouldAutoEnable:(BOOL)a3
{
  -[BuddyDiagnosticsController setIsSeedBuild:](self, "setIsSeedBuild:", a3);
}

- (BOOL)shouldAutoEnable
{
  return -[BuddyDiagnosticsController isSeedBuild](self, "isSeedBuild", a2, self);
}

@end
