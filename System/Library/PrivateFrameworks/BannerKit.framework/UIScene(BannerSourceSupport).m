@implementation UIScene(BannerSourceSupport)

- (id)bn_presentableUniqueIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_FBSScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bn_presentableUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
