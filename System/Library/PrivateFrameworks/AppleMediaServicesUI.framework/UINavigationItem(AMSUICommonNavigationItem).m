@implementation UINavigationItem(AMSUICommonNavigationItem)

- (void)ams_configureWithDefaultBackground
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v2, "configureWithDefaultBackground");
  objc_msgSend(a1, "setStandardAppearance:", v2);
  objc_msgSend(a1, "setCompactAppearance:", v2);
  objc_msgSend(a1, "setScrollEdgeAppearance:", v2);

}

- (void)ams_configureWithTranslucentWhileScrollingBackground
{
  id v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v3, "configureWithDefaultBackground");
  v2 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v2, "configureWithTransparentBackground");
  objc_msgSend(a1, "setStandardAppearance:", v3);
  objc_msgSend(a1, "setCompactAppearance:", v3);
  objc_msgSend(a1, "setScrollEdgeAppearance:", v2);

}

- (void)ams_configureWithTransparentBackground
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEBD790]);
  objc_msgSend(v2, "configureWithTransparentBackground");
  objc_msgSend(a1, "setStandardAppearance:", v2);
  objc_msgSend(a1, "setCompactAppearance:", v2);
  objc_msgSend(a1, "setScrollEdgeAppearance:", v2);

}

@end
