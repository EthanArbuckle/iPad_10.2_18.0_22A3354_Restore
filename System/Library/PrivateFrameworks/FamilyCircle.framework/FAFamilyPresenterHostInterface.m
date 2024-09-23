@implementation FAFamilyPresenterHostInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_11);
  return (id)XPCInterface_interface;
}

void __46__FAFamilyPresenterHostInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9A3890);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

}

@end
