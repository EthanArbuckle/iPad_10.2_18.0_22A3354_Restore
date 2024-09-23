@implementation FOAgentConnectionPrivate

+ (id)newConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.FamilyControlsAgent.private"), 4096);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newInterface
{
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E381A8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
