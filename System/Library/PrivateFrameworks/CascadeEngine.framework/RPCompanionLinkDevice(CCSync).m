@implementation RPCompanionLinkDevice(CCSync)

- (id)CC_companionLinkDeviceIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "idsDeviceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

@end
