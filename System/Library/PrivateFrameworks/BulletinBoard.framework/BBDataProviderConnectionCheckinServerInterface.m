@implementation BBDataProviderConnectionCheckinServerInterface

void __BBDataProviderConnectionCheckinServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25499D090);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BBDataProviderConnectionCheckinServerInterface___interface;
  BBDataProviderConnectionCheckinServerInterface___interface = v0;

  v2 = (void *)BBDataProviderConnectionCheckinServerInterface___interface;
  RemoteDataProviderRegistrationInterface();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_registerServiceName_appBundleID_completion_, 0, 1);

}

@end
