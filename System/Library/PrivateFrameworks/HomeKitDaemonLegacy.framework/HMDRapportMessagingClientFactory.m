@implementation HMDRapportMessagingClientFactory

- (id)newCompanionLinkClient
{
  return objc_alloc_init(MEMORY[0x1E0D83900]);
}

- (id)newCompanionLinkDevice
{
  return objc_alloc_init(MEMORY[0x1E0D83908]);
}

- (id)newRapportDeviceClientWrapperWithClient:(id)a3
{
  id v3;
  HMDRapportDeviceClientWrapper *v4;

  v3 = a3;
  v4 = -[HMDRapportDeviceClientWrapper initWithClient:]([HMDRapportDeviceClientWrapper alloc], "initWithClient:", v3);

  return v4;
}

@end
