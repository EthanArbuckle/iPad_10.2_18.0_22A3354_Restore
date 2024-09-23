@implementation SecureViewController

- (SecureViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SecureViewController;
  return -[SecureViewController init](&v3, "init");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
