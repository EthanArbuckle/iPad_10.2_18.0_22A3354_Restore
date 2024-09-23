@implementation UIViewController(MPMoviePlayerViewController)

- (uint64_t)presentMoviePlayerViewControllerAnimated:()MPMoviePlayerViewController
{
  return objc_msgSend(a1, "presentViewController:animated:completion:", a3, 1, 0);
}

- (uint64_t)dismissMoviePlayerViewControllerAnimated
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
