@implementation BuddyMigrationSourceLockscreenErrorController

- (void)loadView
{
  objc_super v2;
  objc_super v3;
  SEL v4;
  BuddyMigrationSourceLockscreenErrorController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMigrationSourceLockscreenErrorController;
  -[BuddyMigrationSourceErrorController setAllowInteraction:](&v3, "setAllowInteraction:", 0);
  v2.receiver = v5;
  v2.super_class = (Class)BuddyMigrationSourceLockscreenErrorController;
  -[BuddyMigrationSourceErrorController loadView](&v2, "loadView");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
