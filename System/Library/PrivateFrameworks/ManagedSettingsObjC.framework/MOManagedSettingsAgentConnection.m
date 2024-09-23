@implementation MOManagedSettingsAgentConnection

+ (id)newConnection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.ManagedSettingsAgent"), 4096);
  v4 = (void *)objc_msgSend(a1, "newInterface");
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)newInterface
{
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF08EF88);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)oneTimeConnection
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  v2 = (void *)objc_msgSend(a1, "newConnection");
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __53__MOManagedSettingsAgentConnection_oneTimeConnection__block_invoke;
  v7 = &unk_1E675E388;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "setInterruptionHandler:", &v4);
  objc_msgSend(v2, "activate", v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __53__MOManagedSettingsAgentConnection_oneTimeConnection__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "setInvalidationHandler:", 0);

  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "invalidate");

  objc_destroyWeak(&to);
}

@end
