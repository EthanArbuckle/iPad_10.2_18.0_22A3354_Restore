@implementation UINavigationBar(GKUITheme)

- (uint64_t)_gkApplyTheme:()GKUITheme
{
  return objc_msgSend(a1, "_gkApplyTheme:navbarStyle:", a3, 0);
}

@end
