@implementation CCSRemoteServiceServerInterface

void __CCSRemoteServiceServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DFE970);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CCSRemoteServiceServerInterface_remoteServiceServerInterface;
  CCSRemoteServiceServerInterface_remoteServiceServerInterface = v0;

}

@end
