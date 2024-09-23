@implementation HMDRapportMessagingClientFactory

- (id)newCompanionLinkClient
{
  return objc_alloc_init(MEMORY[0x24BE7CBF0]);
}

- (id)newCompanionLinkDevice
{
  return objc_alloc_init(MEMORY[0x24BE7CBF8]);
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
