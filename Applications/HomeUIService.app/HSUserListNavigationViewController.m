@implementation HSUserListNavigationViewController

- (HSUserListNavigationViewController)init
{
  HSUserListViewController *v3;
  HSUserListNavigationViewController *v4;
  objc_super v6;

  v3 = objc_alloc_init(HSUserListViewController);
  v6.receiver = self;
  v6.super_class = (Class)HSUserListNavigationViewController;
  v4 = -[HSUserManagementViewController initWithRootViewController:](&v6, "initWithRootViewController:", v3);
  if (v4)
    -[HSUserListViewController setDelegate:](v3, "setDelegate:", v4);

  return v4;
}

@end
