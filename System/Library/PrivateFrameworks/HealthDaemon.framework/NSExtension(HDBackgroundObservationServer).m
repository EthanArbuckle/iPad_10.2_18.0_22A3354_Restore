@implementation NSExtension(HDBackgroundObservationServer)

- (id)hd_extensionContainerBundleProxy
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CA58F0];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pluginKitProxyForIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hd_extensionContainerBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hd_extensionContainerBundleProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
