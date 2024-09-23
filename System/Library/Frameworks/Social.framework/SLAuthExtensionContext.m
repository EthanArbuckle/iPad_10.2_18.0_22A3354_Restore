@implementation SLAuthExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_10);
  return (id)_extensionAuxiliaryVendorProtocol___interface_0;
}

void __59__SLAuthExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4BDC20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_0;
  _extensionAuxiliaryVendorProtocol___interface_0 = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_1_1);
  return (id)_extensionAuxiliaryHostProtocol___interface_0;
}

void __57__SLAuthExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF4BDC80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_0;
  _extensionAuxiliaryHostProtocol___interface_0 = v0;

}

@end
