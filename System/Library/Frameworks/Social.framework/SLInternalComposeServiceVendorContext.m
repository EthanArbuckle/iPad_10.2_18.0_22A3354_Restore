@implementation SLInternalComposeServiceVendorContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_10 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_10, &__block_literal_global_12);
  return (id)_extensionAuxiliaryVendorProtocol___interface_11;
}

void __74__SLInternalComposeServiceVendorContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF495C38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_11;
  _extensionAuxiliaryVendorProtocol___interface_11 = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_13 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_13, &__block_literal_global_15);
  return (id)_extensionAuxiliaryHostProtocol___interface_14;
}

void __72__SLInternalComposeServiceVendorContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF495BD8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_14;
  _extensionAuxiliaryHostProtocol___interface_14 = v0;

}

- (void)shouldShowNetworkActivityIndicator:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  _SLLog(v3, 7, CFSTR("SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: %@"));
  -[SLInternalComposeServiceVendorContext _auxiliaryConnection](self, "_auxiliaryConnection", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _SLLog(v3, 7, CFSTR("SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: calling host %@"));
    objc_msgSend(v6, "shouldShowNetworkActivityIndicator:", v7, v6);
  }
  else
  {
    _SLLog(v3, 3, CFSTR("SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: had nil host. bailing."));
  }

}

void __76__SLInternalComposeServiceVendorContext_shouldShowNetworkActivityIndicator___block_invoke()
{
  uint64_t v0;

  _SLLog(v0, 3, CFSTR("SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: failed to get host %@"));
}

@end
