@implementation MRAVAudioOutputDeviceDataSource

+ (BOOL)compatibleWithConfiguration:(id)a3
{
  return objc_msgSend(a3, "surface") == 0;
}

- (id)createConfiguration
{
  return -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]([MRAVRoutingDiscoverySessionConfiguration alloc], "initWithEndpointFeatures:", 1);
}

- (id)createOutputContext
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[MRAVDiscoveryOutputDeviceDataSource configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("MROutputDeviceSessionIDLocal")) || !v3)
  {
    +[MRAVOutputContext sharedAudioPresentationContext](MRAVOutputContext, "sharedAudioPresentationContext");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MRAVConcreteOutputContext createOutputContextWithUniqueIdentifier:](MRAVConcreteOutputContext, "createOutputContextWithUniqueIdentifier:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)outputDeviceFromMROutputDevice:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRAVAudioOutputDeviceDataSource;
  v4 = a3;
  -[MRAVDiscoveryOutputDeviceDataSource outputDeviceFromMROutputDevice:](&v8, sel_outputDeviceFromMROutputDevice_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRAVAudioOutputDeviceDataSource isOutputDeviceGroupable:](self, "isOutputDeviceGroupable:", v4, v8.receiver, v8.super_class);

  objc_msgSend(v5, "setGroupable:", v6);
  return v5;
}

- (BOOL)isOutputDeviceGroupable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[MRAVDiscoveryOutputDeviceDataSource outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isGroupable") && (objc_msgSend(v4, "isGroupable") & 1) != 0)
  {
    v8 = 1;
  }
  else if (objc_msgSend(v7, "supportsBluetoothSharing")
         && objc_msgSend(v4, "supportsBluetoothSharing"))
  {
    if (isOutputDeviceGroupable__onceToken != -1)
      dispatch_once(&isOutputDeviceGroupable__onceToken, &__block_literal_global_42);
    v8 = isOutputDeviceGroupable____supportsWirelessSplitting != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __59__MRAVAudioOutputDeviceDataSource_isOutputDeviceGroupable___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isOutputDeviceGroupable____supportsWirelessSplitting = result;
  return result;
}

@end
