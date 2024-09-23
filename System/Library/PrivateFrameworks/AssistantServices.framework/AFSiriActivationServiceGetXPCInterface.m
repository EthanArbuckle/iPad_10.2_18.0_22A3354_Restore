@implementation AFSiriActivationServiceGetXPCInterface

void __AFSiriActivationServiceGetXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3EE968);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFSiriActivationServiceGetXPCInterface_interface;
  AFSiriActivationServiceGetXPCInterface_interface = v0;

}

@end
