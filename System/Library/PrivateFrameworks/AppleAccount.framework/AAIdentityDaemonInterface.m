@implementation AAIdentityDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_1 != -1)
    dispatch_once(&XPCInterface_onceToken_1, &__block_literal_global_12);
  return (id)XPCInterface_interface_1;
}

void __41__AAIdentityDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE54EE98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_1;
  XPCInterface_interface_1 = v0;

}

@end
