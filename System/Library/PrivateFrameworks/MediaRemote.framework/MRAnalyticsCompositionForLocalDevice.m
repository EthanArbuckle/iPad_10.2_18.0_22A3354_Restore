@implementation MRAnalyticsCompositionForLocalDevice

void __MRAnalyticsCompositionForLocalDevice_block_invoke()
{
  int IsMediaRemoteDaemon;
  void *v1;
  id v2;

  IsMediaRemoteDaemon = MRProcessIsMediaRemoteDaemon();
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (IsMediaRemoteDaemon)
    +[MRDeviceInfoRequest cachedDeviceInfoForOrigin:](MRDeviceInfoRequest, "cachedDeviceInfoForOrigin:", v1);
  else
    +[MRDeviceInfoRequest deviceInfoForOrigin:](MRDeviceInfoRequest, "deviceInfoForOrigin:", v1);
  v2 = (id)objc_claimAutoreleasedReturnValue();

  MRAnalyticsCompositionForLocalDevice_localDeviceComposition = MRAnalyticsCompositionForDeviceInfo(v2);
}

@end
