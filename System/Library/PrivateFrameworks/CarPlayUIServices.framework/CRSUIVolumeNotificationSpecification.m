@implementation CRSUIVolumeNotificationSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.CarPlayApp.volume-notification");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x24BE383D0], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1)
    dispatch_once(&interface_onceToken_1, &__block_literal_global_15);
  return (BSServiceInterface *)(id)interface___interface_1;
}

void __49__CRSUIVolumeNotificationSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BE383A0];
  +[CRSUIVolumeNotificationSpecification identifier](CRSUIVolumeNotificationSpecification, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interfaceWithIdentifier:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setClientMessagingExpectation:", 1);
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2549CC740);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v2);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2549C5C28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClient:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface___interface_1;
  interface___interface_1 = v4;

}

@end
