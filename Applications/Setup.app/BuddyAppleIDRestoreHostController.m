@implementation BuddyAppleIDRestoreHostController

+ (id)cloudConfigSkipKey
{
  return 0;
}

- (BuddyAppleIDRestoreHostController)init
{
  id v2;
  id v3;
  BuddyAppleIDRestoreHostController *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  v2 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  location[0] = objc_msgSend(v2, "primaryAccount");

  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyAppleIDRestoreHostController;
  v8 = -[BuddyAppleIDHostController initWithAccount:mode:](&v6, "initWithAccount:mode:", location[0], 1);
  v4 = (BuddyAppleIDRestoreHostController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

@end
