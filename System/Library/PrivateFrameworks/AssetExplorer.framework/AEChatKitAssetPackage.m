@implementation AEChatKitAssetPackage

- (AEChatKitAssetPackage)initWithPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AEChatKitAssetPackage *v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AEAssetPackageAssetIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AEAssetPackageDurableURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("AEAssetPackageSidecar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AEAssetPackage initWithAssetIdentifier:durableURLs:sidecar:](self, "initWithAssetIdentifier:durableURLs:sidecar:", v5, v6, v7);

  return v8;
}

@end
