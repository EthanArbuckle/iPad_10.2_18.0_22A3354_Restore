@implementation NEExtensionTunnelProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3003 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3003, &__block_literal_global_3004);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3005;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2999 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2999, &__block_literal_global_62_3000);
  return (id)_extensionAuxiliaryHostProtocol_protocol_3001;
}

void __71__NEExtensionTunnelProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE418A98);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3001;
  _extensionAuxiliaryHostProtocol_protocol_3001 = v0;

}

void __73__NEExtensionTunnelProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4189D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3005;
  _extensionAuxiliaryVendorProtocol_protocol_3005 = v0;

}

- (void)didSetReasserting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NEExtensionTunnelProviderHostContext *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting reasserting %d", (uint8_t *)&v8, 0x12u);
  }

  if (v3)
    v6 = 5;
  else
    v6 = 4;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extension:didSetStatus:", self, v6);

}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NEExtensionTunnelProviderHostContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEFAULT, "%@: setting tunnel configuration", (uint8_t *)&v10, 0xCu);
  }

  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extension:didSetTunnelConfiguration:completionHandler:", self, v7, v6);

}

- (void)establishIPCWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "establishIPCWithCompletionHandler:", v4);

}

- (void)handleIPCDetached
{
  id v3;

  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionDidDetachIPC:", self);

}

@end
