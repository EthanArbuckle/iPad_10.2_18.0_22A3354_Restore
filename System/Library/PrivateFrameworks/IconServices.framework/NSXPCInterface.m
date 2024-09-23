@implementation NSXPCInterface

void __75__NSXPCInterface_ISIconCacheServiceProtocol___IS_iconCacheServiceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEB9E820);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_IS_iconCacheServiceInterface_interface;
  _IS_iconCacheServiceInterface_interface = v0;

}

@end
