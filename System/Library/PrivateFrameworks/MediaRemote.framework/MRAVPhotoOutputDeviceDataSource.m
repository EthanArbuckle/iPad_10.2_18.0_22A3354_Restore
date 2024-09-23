@implementation MRAVPhotoOutputDeviceDataSource

+ (BOOL)compatibleWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "surface") == 2)
  {
    objc_msgSend(v3, "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(CFSTR("MROutputDeviceSessionIDLocal"), "isEqualToString:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)createConfiguration
{
  return -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]([MRAVRoutingDiscoverySessionConfiguration alloc], "initWithEndpointFeatures:", 4);
}

- (id)createOutputContext
{
  return +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
}

@end
