@implementation UITabBarController(SwiftUI)

- (uint64_t)__swiftui_isInSidebarTransition
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "_isInSidebarTransition");
  else
    return 0;
}

@end
