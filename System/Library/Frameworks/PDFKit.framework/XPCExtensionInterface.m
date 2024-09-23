@implementation XPCExtensionInterface

+ (id)extensionInterface
{
  if (extensionInterface_onceToken != -1)
    dispatch_once(&extensionInterface_onceToken, &__block_literal_global_0);
  return (id)extensionInterface_sExtensionInterface;
}

void __43__XPCExtensionInterface_extensionInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545D5AC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)extensionInterface_sExtensionInterface;
  extensionInterface_sExtensionInterface = v0;

}

+ (id)hostInterface
{
  if (hostInterface_onceToken != -1)
    dispatch_once(&hostInterface_onceToken, &__block_literal_global_44);
  return (id)hostInterface_sHostInterface;
}

void __38__XPCExtensionInterface_hostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545F5718);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)hostInterface_sHostInterface;
  hostInterface_sHostInterface = v0;

}

@end
