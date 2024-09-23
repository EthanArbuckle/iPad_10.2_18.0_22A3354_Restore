@implementation CRCarPlayNavigationOwnersServiceInterface

void __CRCarPlayNavigationOwnersServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC4F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CRCarPlayNavigationOwnersServiceInterface_interface;
  CRCarPlayNavigationOwnersServiceInterface_interface = v0;

}

@end
