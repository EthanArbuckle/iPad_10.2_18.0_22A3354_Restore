@implementation PUPickerExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_842 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_842, &__block_literal_global_843);
  return (id)_extensionAuxiliaryVendorProtocol_interface_844;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__PUPickerExtensionContext__extensionAuxiliaryHostProtocol__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_extensionAuxiliaryHostProtocol_onceToken_837 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_837, block);
  return (id)_extensionAuxiliaryHostProtocol_interface_838;
}

+ (void)setAllowedClassesForExtensionAuxiliaryHostInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__pickerDidFinishPicking_, 0, 0);

}

uint64_t __59__PUPickerExtensionContext__extensionAuxiliaryHostProtocol__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CBE88);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_extensionAuxiliaryHostProtocol_interface_838;
  _extensionAuxiliaryHostProtocol_interface_838 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setAllowedClassesForExtensionAuxiliaryHostInterface:", _extensionAuxiliaryHostProtocol_interface_838);
}

void __61__PUPickerExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CBD20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_844;
  _extensionAuxiliaryVendorProtocol_interface_844 = v0;

}

@end
