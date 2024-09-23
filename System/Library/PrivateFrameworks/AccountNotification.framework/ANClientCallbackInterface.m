@implementation ANClientCallbackInterface

+ (id)XPCInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ANClientCallbackInterface_XPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (XPCInterface_onceToken_0 != -1)
    dispatch_once(&XPCInterface_onceToken_0, block);
  return (id)XPCInterface_sANClientCallbackXPCInterface;
}

void __41__ANClientCallbackInterface_XPCInterface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!XPCInterface_sANClientCallbackXPCInterface)
  {
    objc_msgSend(*(id *)(a1 + 32), "_buildXPCInterface");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)XPCInterface_sANClientCallbackXPCInterface;
    XPCInterface_sANClientCallbackXPCInterface = v1;

  }
}

+ (id)_buildXPCInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E022F8);
}

@end
