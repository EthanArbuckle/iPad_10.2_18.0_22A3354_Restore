@implementation BNPresentableContextSessionSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.bannerkit.banner-context-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D228D0], "userInteractive");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BNPresentableContextSessionSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, block);
  return (BSServiceInterface *)(id)interface___interface;
}

void __53__BNPresentableContextSessionSpecification_interface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0D228A8];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EF2423F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v4);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EF243040);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClient:", v5);

  v6 = (void *)interface___interface;
  interface___interface = (uint64_t)v3;

}

@end
