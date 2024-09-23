@implementation CacheDeleteHostExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECE24300 != -1)
    dispatch_once(&qword_1ECE24300, &__block_literal_global_41);
  return (id)qword_1ECE24308;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_8);
  return (id)qword_1ECE242F8;
}

void __66__CacheDeleteHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6C7350);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE242F8;
  qword_1ECE242F8 = v0;

}

void __68__CacheDeleteHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6C7F08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE24308;
  qword_1ECE24308 = v0;

}

@end
