@implementation NEExtensionPacketTunnelProviderHostContext

- (void)setupVirtualInterface:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupVirtualInterface:", v4);

}

- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NEExtensionPacketTunnelProviderHostContext *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "%@: fetchVirtualInterfaceTypeWithCompletionHandler", (uint8_t *)&v7, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchVirtualInterfaceTypeWithCompletionHandler:", v4);

}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  void *v19;
  id v20;
  id v21;
  id Property;
  id v23;
  uint8_t buf[4];
  NEExtensionPacketTunnelProviderHostContext *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v10 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (self)
      Property = objc_getProperty(self, v17, 64, 1);
    else
      Property = 0;
    v23 = Property;
    *(_DWORD *)buf = 138412802;
    v25 = self;
    v26 = 2112;
    v27 = v12;
    v28 = 1024;
    v29 = objc_msgSend(v23, "pid");
    _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "%@: requestSocket %@ (pid %d)", buf, 0x1Cu);

  }
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v20 = objc_getProperty(self, v18, 64, 1);
  else
    v20 = 0;
  v21 = v20;
  objc_msgSend(v19, "extension:didRequestSocket:interface:local:remote:effectivePID:completionHandler:", self, v10, v12, v15, v14, objc_msgSend(v21, "pid"), v13);

}

- (void)setAppUUIDMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppUUIDMap:", v4);

}

- (void)validateWithCompletionHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEExtensionPacketTunnelProviderHostContext;
  -[NEExtensionProviderHostContext validateWithCompletionHandler:](&v3, sel_validateWithCompletionHandler_, a3);
}

- (int)requiredEntitlement
{
  return 1;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2459 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2459, &__block_literal_global_2460);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2461;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2456 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2456, &__block_literal_global_70);
  return (id)_extensionAuxiliaryHostProtocol_protocol_2457;
}

void __77__NEExtensionPacketTunnelProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419B78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2457;
  _extensionAuxiliaryHostProtocol_protocol_2457 = v0;

}

void __79__NEExtensionPacketTunnelProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419AE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2461;
  _extensionAuxiliaryVendorProtocol_protocol_2461 = v0;

}

@end
