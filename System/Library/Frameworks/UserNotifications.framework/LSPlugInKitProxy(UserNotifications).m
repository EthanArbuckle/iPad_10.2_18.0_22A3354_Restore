@implementation LSPlugInKitProxy(UserNotifications)

- (id)un_applicationBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "containingBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)un_applicationBundleURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "containingBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
