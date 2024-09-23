@implementation LSAppLink(BCSAppRanker)

- (id)bundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "targetApplicationProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
