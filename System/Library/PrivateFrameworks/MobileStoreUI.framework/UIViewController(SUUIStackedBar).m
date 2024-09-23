@implementation UIViewController(SUUIStackedBar)

- (uint64_t)SUUIStackedBar
{
  return 0;
}

- (double)SUUIStackedBarSplit
{
  void *v1;
  float v2;
  double v3;

  objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.stackedBarSplit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (void)setSUUIStackedBarSplit:()SUUIStackedBar
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.iTunesStoreUI.stackedBarSplit", v2, (void *)1);

}

@end
