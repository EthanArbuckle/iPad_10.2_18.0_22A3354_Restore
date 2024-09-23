@implementation UINavigationController

- (void)buddy_presentAlertController:(id)a3
{
  UIViewController *v3;
  UIViewController *v4;
  UIViewController *v5;
  UIViewController *v6;
  id location[2];
  UINavigationController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[UINavigationController topViewController](v8, "topViewController");
  v4 = -[UIViewController presentedViewController](v3, "presentedViewController");

  v5 = -[UINavigationController topViewController](v8, "topViewController");
  if (v4)
  {
    v6 = -[UIViewController presentedViewController](v5, "presentedViewController");
    -[UIViewController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", location[0], 1, 0);

  }
  else
  {
    -[UIViewController presentViewController:animated:completion:](v5, "presentViewController:animated:completion:", location[0], 1, 0);
  }

  objc_storeStrong(location, 0);
}

@end
