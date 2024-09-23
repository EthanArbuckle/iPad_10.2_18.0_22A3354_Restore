@implementation MOManagedSettingsAgentPublisherConnection

+ (id)newConnectionWithExportedObject:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.ManagedSettingsAgent.publisher"), 4096);
  v7 = (void *)objc_msgSend(a1, "newAgentInterface");
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  v8 = (void *)objc_msgSend(a1, "newClientInterface");
  objc_msgSend(v6, "setExportedInterface:", v8);

  objc_msgSend(v6, "setExportedObject:", v5);
  objc_msgSend(v6, "_xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_set_non_launching();

  return v6;
}

+ (id)newClientInterface
{
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF08D768);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newAgentInterface
{
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF08EF28);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
