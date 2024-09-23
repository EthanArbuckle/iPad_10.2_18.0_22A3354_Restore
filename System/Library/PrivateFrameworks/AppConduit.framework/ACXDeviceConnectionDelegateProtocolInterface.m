@implementation ACXDeviceConnectionDelegateProtocolInterface

- (ACXDeviceConnectionDelegateProtocolInterface)init
{
  ACXDeviceConnectionDelegateProtocolInterface *result;

  result = (ACXDeviceConnectionDelegateProtocolInterface *)_os_crash();
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
  WeakRetained = objc_loadWeakRetained(&interface_weakInterface_136);
  if (!WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend(v2, "interfaceProtocol");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interfaceWithProtocol:", v5);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "configureInterface:", WeakRetained);
    objc_storeWeak(&interface_weakInterface_136, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)interfaceProtocol
{
  return &unk_1EFECBE48;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_applicationsInstalled_onDeviceWithPairingID_, 0, 0);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_applicationsUpdated_onDeviceWithPairingID_, 0, 0);

}

@end
