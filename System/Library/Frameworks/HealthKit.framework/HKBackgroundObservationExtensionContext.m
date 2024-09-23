@implementation HKBackgroundObservationExtensionContext

void __75___HKBackgroundObservationExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3ED280);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

}

void __77___HKBackgroundObservationExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3C4158);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

}

@end
