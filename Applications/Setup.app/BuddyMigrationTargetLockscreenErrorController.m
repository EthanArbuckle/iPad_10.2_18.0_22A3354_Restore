@implementation BuddyMigrationTargetLockscreenErrorController

- (void)loadView
{
  objc_super v2;
  objc_super v3;
  SEL v4;
  BuddyMigrationTargetLockscreenErrorController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMigrationTargetLockscreenErrorController;
  -[BuddyMigrationTargetErrorController setAllowInteraction:](&v3, "setAllowInteraction:", 0);
  v2.receiver = v5;
  v2.super_class = (Class)BuddyMigrationTargetLockscreenErrorController;
  -[BuddyMigrationTargetErrorController loadView](&v2, "loadView");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
