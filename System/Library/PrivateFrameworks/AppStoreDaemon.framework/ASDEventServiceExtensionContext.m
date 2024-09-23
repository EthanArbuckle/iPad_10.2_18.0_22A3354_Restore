@implementation ASDEventServiceExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_25 != -1)
    dispatch_once(&_MergedGlobals_25, &__block_literal_global_1);
  return (id)qword_1ECFFA9B0;
}

void __66__ASDEventServiceExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE384318);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFFA9B0;
  qword_1ECFFA9B0 = v0;

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECFFA9B8 != -1)
    dispatch_once(&qword_1ECFFA9B8, &__block_literal_global_42);
  return (id)qword_1ECFFA9C0;
}

void __68__ASDEventServiceExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE380240);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFFA9C0;
  qword_1ECFFA9C0 = v0;

}

@end
