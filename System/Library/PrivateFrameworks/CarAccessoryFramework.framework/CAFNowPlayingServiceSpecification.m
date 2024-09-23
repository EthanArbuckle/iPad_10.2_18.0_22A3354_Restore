@implementation CAFNowPlayingServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.caraccessoryframework.nowplaying");
}

+ (NSString)entitlement
{
  return (NSString *)CFSTR("com.apple.private.caraccessoryframework.nowplaying");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x24BE0FA38], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_10);
  return (BSServiceInterface *)(id)interface___interface_0;
}

void __46__CAFNowPlayingServiceSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x24BE0F9F8];
  +[CAFNowPlayingServiceSpecification identifier](CAFNowPlayingServiceSpecification, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interfaceWithIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClientMessagingExpectation:", 1);
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_25682ED40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServer:", v3);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2568201F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClient:", v4);

  v5 = (void *)interface___interface_0;
  interface___interface_0 = (uint64_t)v2;

}

@end
