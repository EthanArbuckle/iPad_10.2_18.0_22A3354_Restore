@implementation DNDRemoteServiceServerInterface

void __DNDRemoteServiceServerInterface_block_invoke()
{
  Class v0;
  id *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.donotdisturb.service"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NSClassFromString(CFSTR("LNAction"));
  v1 = (id *)&protocolRef_DNDRemoteServiceServerProtocolLinkUnavailable;
  if (v0)
    v1 = (id *)&protocolRef_DNDRemoteServiceServerProtocol;
  v2 = *v1;
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)DNDRemoteServiceServerInterface___serviceInterface;
  DNDRemoteServiceServerInterface___serviceInterface = v4;

}

@end
