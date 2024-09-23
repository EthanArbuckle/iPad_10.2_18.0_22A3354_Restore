@implementation RPCompanionLinkClient(AnnounceAdditions)

- (id)activeAccessoryDevicesSupportingAnnounce
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "activeDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeAccessoryDevicesSupportingAnnounce");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)activeDevicesSupportingAnnounce
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "activeDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeDevicesSupportingAnnounce");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)activePersonalDevicesSupportingAnnounce
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "activeDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activePersonalDevicesSupportingAnnounce");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)pairedCompanion
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "activeDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pairedCompanion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
