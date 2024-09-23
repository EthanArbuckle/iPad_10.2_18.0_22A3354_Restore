@implementation LNNextActionObserverXPCInterface

void __LNNextActionObserverXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6627A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LNNextActionObserverXPCInterface_interface;
  LNNextActionObserverXPCInterface_interface = v0;

}

@end
