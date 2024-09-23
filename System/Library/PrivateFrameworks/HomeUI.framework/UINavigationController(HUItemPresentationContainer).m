@implementation UINavigationController(HUItemPresentationContainer)

- (id)hu_presentedItem
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "visibleViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hu_presentedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
