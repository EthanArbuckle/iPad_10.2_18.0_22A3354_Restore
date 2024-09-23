@implementation STPublicServiceConnection

+ (id)newConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ScreenTimeAgent"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255013B28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

@end
