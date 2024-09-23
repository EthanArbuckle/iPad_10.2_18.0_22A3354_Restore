@implementation AKAnisetteProvisioningClientInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_10 != -1)
    dispatch_once(&XPCInterface_onceToken_10, &__block_literal_global_34);
  return (id)XPCInterface_interface_9;
}

void __53__AKAnisetteProvisioningClientInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE252C40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_9;
  XPCInterface_interface_9 = v0;

}

@end
