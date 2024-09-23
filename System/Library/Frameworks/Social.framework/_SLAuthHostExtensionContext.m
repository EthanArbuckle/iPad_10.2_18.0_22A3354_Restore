@implementation _SLAuthHostExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_5 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_5, &__block_literal_global_7);
  return (id)_extensionAuxiliaryVendorProtocol___interface_6;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_8 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_8, &__block_literal_global_10);
  return (id)_extensionAuxiliaryHostProtocol___interface_9;
}

@end
