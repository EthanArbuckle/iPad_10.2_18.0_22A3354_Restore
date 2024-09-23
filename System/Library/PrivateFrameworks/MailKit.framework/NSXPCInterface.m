@implementation NSXPCInterface

void __56__NSXPCInterface_Extension__MERemoteExtensiontInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254742DE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MERemoteExtensiontInterface_remoteInterface;
  MERemoteExtensiontInterface_remoteInterface = v0;

  v2 = (void *)MERemoteExtensiontInterface_remoteInterface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");

}

void __59__NSXPCInterface_Extension__MEExtensionRemoteHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254738110);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEExtensionRemoteHostInterface_interface;
  MEExtensionRemoteHostInterface_interface = v0;

}

@end
