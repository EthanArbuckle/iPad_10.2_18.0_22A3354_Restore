@implementation MRAVRoutingDiscoverySession

uint64_t __106__MRAVRoutingDiscoverySession_MPAVOutputDeviceRoutingDataSource___replaceOutputDevices_withOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

@end
