@implementation CHSWidgetEventServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.chrono.event-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CHSWidgetEventServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_1 != -1)
    dispatch_once(&interface_onceToken_1, block);
  return (BSServiceInterface *)(id)interface___interface_1;
}

void __47__CHSWidgetEventServiceSpecification_interface__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "interfaceWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE199F08);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v4);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE1A10B8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClient:", v5);

  v6 = (void *)interface___interface_1;
  interface___interface_1 = (uint64_t)v3;

}

@end
