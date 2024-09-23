@implementation CSXPCClientFactory

- (id)clientForAudioProviding
{
  return -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 1);
}

- (id)clientForAudioSessionInfoProviding
{
  return -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 2);
}

- (id)clientForSmartSiriVolumeProviding
{
  return -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 3);
}

- (id)clientForMacOSDuckAudioDevice
{
  return -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 4);
}

- (id)clientForFallbackAudioSessionReleaseProviding
{
  return -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 6);
}

+ (id)defaultFactory
{
  if (defaultFactory_onceToken != -1)
    dispatch_once(&defaultFactory_onceToken, &__block_literal_global_8866);
  return (id)defaultFactory_defaultFactory;
}

void __36__CSXPCClientFactory_defaultFactory__block_invoke()
{
  CSXPCClientFactory *v0;
  void *v1;

  v0 = objc_alloc_init(CSXPCClientFactory);
  v1 = (void *)defaultFactory_defaultFactory;
  defaultFactory_defaultFactory = (uint64_t)v0;

}

@end
