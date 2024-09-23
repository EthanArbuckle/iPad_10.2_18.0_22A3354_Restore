@implementation NSXPCInterface(AuthenticationServicesExtras)

+ (id)_as_credentialProviderHostInterface
{
  if (_as_credentialProviderHostInterface_onceToken != -1)
    dispatch_once(&_as_credentialProviderHostInterface_onceToken, &__block_literal_global_28);
  return (id)_as_credentialProviderHostInterface_interface;
}

+ (id)_as_credentialProviderExtensionInterface
{
  if (_as_credentialProviderExtensionInterface_onceToken != -1)
    dispatch_once(&_as_credentialProviderExtensionInterface_onceToken, &__block_literal_global_63_0);
  return (id)_as_credentialProviderExtensionInterface_interface;
}

+ (id)_as_accountModificationHostInterface
{
  if (_as_accountModificationHostInterface_onceToken != -1)
    dispatch_once(&_as_accountModificationHostInterface_onceToken, &__block_literal_global_100_0);
  return (id)_as_accountModificationHostInterface_interface;
}

+ (id)_as_accountModificationExtensionInterface
{
  if (_as_accountModificationExtensionInterface_onceToken != -1)
    dispatch_once(&_as_accountModificationExtensionInterface_onceToken, &__block_literal_global_109);
  return (id)_as_accountModificationExtensionInterface_interface;
}

@end
