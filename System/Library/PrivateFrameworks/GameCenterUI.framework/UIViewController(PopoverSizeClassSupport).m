@implementation UIViewController(PopoverSizeClassSupport)

- (id)_gkSourcePresentingViewController
{
  return objc_getAssociatedObject(a1, "gkSourcePresentingViewControllerKey");
}

- (void)_gkSetSourcePresentingViewController:()PopoverSizeClassSupport
{
  objc_setAssociatedObject(a1, "gkSourcePresentingViewControllerKey", a3, (void *)1);
}

- (uint64_t)_gkViewControllersForRestoringPopover
{
  return 0;
}

- (uint64_t)_gkRepresentedObject
{
  return 0;
}

- (uint64_t)_gkShouldPushViewControllerInsteadOfUsingPopoverOnCompactWidthPad
{
  return 1;
}

@end
