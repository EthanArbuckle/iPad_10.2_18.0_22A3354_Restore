@implementation STScreenTimeAgentConnection

+ (id)newConnection
{
  void *v4;
  void *v5;

  if (_os_feature_enabled_impl())
    return +[STPublicServiceConnection newConnection](STPublicServiceConnection, "newConnection");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent"), 4096);
  v5 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  return v4;
}

+ (id)newInterface
{
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255013AC8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
