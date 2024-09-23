@implementation LSAppRemovalServiceXPCInterface

void ___LSAppRemovalServiceXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCED8F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LSAppRemovalServiceXPCInterface_interface;
  _LSAppRemovalServiceXPCInterface_interface = v0;

}

@end
