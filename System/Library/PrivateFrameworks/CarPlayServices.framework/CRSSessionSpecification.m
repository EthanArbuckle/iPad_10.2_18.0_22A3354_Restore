@implementation CRSSessionSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.CarPlayApp.session");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x24BE0FA38], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_2);
  return (BSServiceInterface *)(id)interface___interface_0;
}

void __36__CRSSessionSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BE0F9F8];
  +[CRSSessionSpecification identifier](CRSSessionSpecification, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interfaceWithIdentifier:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254B49090);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v2);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_254B48500);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClient:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface___interface_0;
  interface___interface_0 = v4;

}

@end
