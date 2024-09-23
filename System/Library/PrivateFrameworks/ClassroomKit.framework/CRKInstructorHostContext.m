@implementation CRKInstructorHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_38);
  return (id)_extensionAuxiliaryHostProtocol_interface;
}

void __59__CRKInstructorHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255025690);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_41);
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

void __61__CRKInstructorHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255025B68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

}

@end
