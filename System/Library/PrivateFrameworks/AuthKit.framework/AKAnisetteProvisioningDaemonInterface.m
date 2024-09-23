@implementation AKAnisetteProvisioningDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_11 != -1)
    dispatch_once(&XPCInterface_onceToken_11, &__block_literal_global_39);
  return (id)XPCInterface_interface_10;
}

void __53__AKAnisetteProvisioningDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270ED8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_10;
  XPCInterface_interface_10 = v0;

}

@end
