@implementation RPCompanionLinkDevice(MRRapportTransportAdditions)

- (MRDeviceInfo)mrDeviceInfo
{
  MRDeviceInfo *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MRDeviceInfo);
  objc_msgSend(a1, "mediaRouteIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setDeviceUID:](v2, "setDeviceUID:", v3);

  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRDeviceInfo setName:](v2, "setName:", v4);

  return v2;
}

@end
