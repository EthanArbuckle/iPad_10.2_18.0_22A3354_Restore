@implementation DNDRemoteMonitorServerInterface

void __DNDRemoteMonitorServerInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.donotdisturb.monitor"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE3D5418);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE3D3BF8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)DNDRemoteMonitorServerInterface___monitorInterface;
  DNDRemoteMonitorServerInterface___monitorInterface = v2;

}

@end
