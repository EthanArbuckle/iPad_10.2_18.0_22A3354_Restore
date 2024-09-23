@implementation GEOPlaceExternalActionLinkExtensionParams(MUExtensionDataProviding)

- (id)appBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributionApp");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
