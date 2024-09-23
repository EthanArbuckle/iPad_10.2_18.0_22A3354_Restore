@implementation AFProviderServiceXPCInterface

void __AFProviderServiceXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE431FB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFProviderServiceXPCInterface_cachedXPCInterface;
  AFProviderServiceXPCInterface_cachedXPCInterface = v0;

}

@end
