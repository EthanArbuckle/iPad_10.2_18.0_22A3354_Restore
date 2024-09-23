@implementation _EXExtensionIdentity(MTSDeviceSetupExtensionIdentity)

- (id)containingAppBundleURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "containingBundleRecord");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
