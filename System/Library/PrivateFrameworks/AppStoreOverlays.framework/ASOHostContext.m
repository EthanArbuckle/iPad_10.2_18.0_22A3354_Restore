@implementation ASOHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __49__ASOHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CD360);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_41);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __51__ASOHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Class;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549EA4A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E09A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setInterface:forSelector:argumentIndex:ofReply:", v2, sel_presentOverlayWithConfiguration_delegate_reply_, 1, 0);
  v3 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v4 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  Class = ASOSignpostSpanGetClass(v9, v5);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_presentOverlayWithConfiguration_delegate_reply_, 0, 0);

}

- (id)serviceContext
{
  void *v2;
  void *v3;

  -[ASOHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ASOHostContext serviceContext](self, "serviceContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentOverlayWithConfiguration:delegate:reply:", v10, v9, v8);

}

- (void)dismissOverlayWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASOHostContext serviceContext](self, "serviceContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissOverlayWithReply:", v4);

}

@end
