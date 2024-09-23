@implementation CRSIconLayoutServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.CarPlayApp.icon-layout");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x24BE0FA38], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_1);
  return (BSServiceInterface *)(id)interface___interface;
}

void __46__CRSIconLayoutServiceSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BE0F9F8];
  +[CRSIconLayoutServiceSpecification identifier](CRSIconLayoutServiceSpecification, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interfaceWithIdentifier:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254B481D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v2);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254B48600);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClient:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface___interface;
  interface___interface = v4;

}

@end
