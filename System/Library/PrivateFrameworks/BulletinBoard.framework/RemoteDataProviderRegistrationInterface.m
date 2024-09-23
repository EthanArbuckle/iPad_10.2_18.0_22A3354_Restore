@implementation RemoteDataProviderRegistrationInterface

void __RemoteDataProviderRegistrationInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549A1658);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)RemoteDataProviderRegistrationInterface___interface;
  RemoteDataProviderRegistrationInterface___interface = v0;

  v2 = (void *)RemoteDataProviderRegistrationInterface___interface;
  RemoteDataProviderClientProxyInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_addDataProviderWithSectionID_clientProxy_identity_completion_, 1, 0);

  v4 = (void *)RemoteDataProviderRegistrationInterface___interface;
  RemoteDataProviderServerProxyInterface();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_addDataProviderWithSectionID_clientProxy_identity_completion_, 0, 1);

}

@end
