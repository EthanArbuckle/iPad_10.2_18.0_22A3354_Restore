@implementation HKHealthStoreEndpointInterface

void __HKHealthStoreEndpointInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EC88);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)HKHealthStoreEndpointInterface_interface;
  HKHealthStoreEndpointInterface_interface = v0;

  v2 = (void *)HKHealthStoreEndpointInterface_interface;
  HKHealthStoreServerInterface();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v3, sel_remote_serverForConfiguration_completion_, 0, 1);

}

@end
