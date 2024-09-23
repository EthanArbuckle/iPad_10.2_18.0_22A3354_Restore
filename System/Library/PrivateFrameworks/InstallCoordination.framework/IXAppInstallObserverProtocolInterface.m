@implementation IXAppInstallObserverProtocolInterface

- (IXAppInstallObserverProtocolInterface)init
{
  IXAppInstallObserverProtocolInterface *result;

  result = (IXAppInstallObserverProtocolInterface *)_os_crash();
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)_os_crash();
  __break(1u);
  return result;
}

+ (id)interface
{
  id v2;
  void *WeakRetained;
  void *v4;
  void *v5;

  v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&interface_weakInterface);
  if (!WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend(v2, "interfaceProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceWithProtocol:", v5);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "configureInterface:", WeakRetained);
    objc_storeWeak(&interface_weakInterface, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &unk_1EE78E090;
}

@end
