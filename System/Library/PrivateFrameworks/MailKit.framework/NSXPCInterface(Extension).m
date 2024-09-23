@implementation NSXPCInterface(Extension)

+ (id)MERemoteExtensiontInterface
{
  if (MERemoteExtensiontInterface_onceToken != -1)
    dispatch_once(&MERemoteExtensiontInterface_onceToken, &__block_literal_global_8);
  return (id)MERemoteExtensiontInterface_remoteInterface;
}

+ (id)MEExtensionRemoteHostInterface
{
  if (MEExtensionRemoteHostInterface_onceToken != -1)
    dispatch_once(&MEExtensionRemoteHostInterface_onceToken, &__block_literal_global_104);
  return (id)MEExtensionRemoteHostInterface_interface;
}

@end
