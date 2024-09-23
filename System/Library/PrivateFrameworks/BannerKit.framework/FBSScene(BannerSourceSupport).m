@implementation FBSScene(BannerSourceSupport)

- (id)bn_presentableUniqueIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  BNUniqueIdentifierForSceneIdentifier(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
