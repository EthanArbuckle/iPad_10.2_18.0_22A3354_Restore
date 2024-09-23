@implementation CARAppHistoryServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.CarPlayApp.app-history-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_26);
  return (BSServiceInterface *)(id)interface___interface;
}

void __46__CARAppHistoryServiceSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0D03430];
  +[CARAppHistoryServiceSpecification identifier](CARAppHistoryServiceSpecification, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interfaceWithIdentifier:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE9AC6D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServer:", v2);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE9A6958);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClient:", v3);

  v4 = objc_msgSend(v6, "copy");
  v5 = (void *)interface___interface;
  interface___interface = v4;

}

@end
