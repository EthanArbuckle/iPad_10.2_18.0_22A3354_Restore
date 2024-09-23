@implementation SASyncAppMetaData(AFBundleID)

- (id)_af_preferredBundleID
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "appIdentifyingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "appIdentifyingInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
