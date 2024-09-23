@implementation SLInternalComposeServiceHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __72__SLInternalComposeServiceHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF495C38);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_1);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __70__SLInternalComposeServiceHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF495BD8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

- (void)shouldShowNetworkActivityIndicator:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SLInternalComposeServiceHostContext_shouldShowNetworkActivityIndicator___block_invoke;
  block[3] = &unk_1E7590248;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__SLInternalComposeServiceHostContext_shouldShowNetworkActivityIndicator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  _SLLog(v1, 6, CFSTR("SLInternalComposeServiceHostContext shouldShowNetworkActivityIndicator: %@"));
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNetworkActivityIndicatorVisible:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));

}

@end
