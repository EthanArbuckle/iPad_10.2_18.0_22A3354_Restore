@implementation _FAFamilyCircleRequestConnectionFactory

- (id)createServiceConnectionWithInterruptionHandler:(id)a3 invalidationHandler:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0CB3B38];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.familycircle.agent"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF9A3830);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);
  objc_msgSend(v8, "setInterruptionHandler:", v7);

  objc_msgSend(v8, "setInvalidationHandler:", v6);
  return v8;
}

@end
