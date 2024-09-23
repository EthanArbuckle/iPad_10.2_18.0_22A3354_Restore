@implementation NSXPCInterface(IL_Internal)

+ (id)il_messageFilterExtensionHostInterface
{
  if (il_messageFilterExtensionHostInterface_onceToken != -1)
    dispatch_once(&il_messageFilterExtensionHostInterface_onceToken, &__block_literal_global_56);
  return (id)il_messageFilterExtensionHostInterface_interface;
}

+ (id)il_messageFilterExtensionVendorInterface
{
  if (il_messageFilterExtensionVendorInterface_onceToken != -1)
    dispatch_once(&il_messageFilterExtensionVendorInterface_onceToken, &__block_literal_global_62);
  return (id)il_messageFilterExtensionVendorInterface_interface;
}

+ (id)il_classificationUIExtensionHostInterface
{
  if (il_classificationUIExtensionHostInterface_onceToken != -1)
    dispatch_once(&il_classificationUIExtensionHostInterface_onceToken, &__block_literal_global_71);
  return (id)il_classificationUIExtensionHostInterface_interface;
}

+ (id)il_classificationUIExtensionVendorInterface
{
  if (il_classificationUIExtensionVendorInterface_onceToken[0] != -1)
    dispatch_once(il_classificationUIExtensionVendorInterface_onceToken, &__block_literal_global_75);
  return (id)il_classificationUIExtensionVendorInterface_interface;
}

@end
