@implementation DNDRemoteAppConfigurationServiceServerInterface

void __DNDRemoteAppConfigurationServiceServerInterface_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.donotdisturb.appconfiguration.service"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE3D5EF8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v0);

  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)DNDRemoteAppConfigurationServiceServerInterface___serviceInterface;
  DNDRemoteAppConfigurationServiceServerInterface___serviceInterface = v1;

}

@end
