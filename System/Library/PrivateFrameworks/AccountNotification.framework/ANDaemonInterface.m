@implementation ANDaemonInterface

+ (id)XPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ANDaemonInterface_XPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (XPCInterface_onceToken != -1)
    dispatch_once(&XPCInterface_onceToken, block);
  return (id)XPCInterface_sANDaemonXPCInterface;
}

void __33__ANDaemonInterface_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!XPCInterface_sANDaemonXPCInterface)
  {
    objc_msgSend(*(id *)(a1 + 32), "_buildXPCInterface");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)XPCInterface_sANDaemonXPCInterface;
    XPCInterface_sANDaemonXPCInterface = v1;

  }
}

+ (id)_buildXPCInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E02AC8);
}

@end
