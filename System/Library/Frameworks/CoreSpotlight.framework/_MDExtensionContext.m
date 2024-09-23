@implementation _MDExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_30);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_42_0);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

@end
