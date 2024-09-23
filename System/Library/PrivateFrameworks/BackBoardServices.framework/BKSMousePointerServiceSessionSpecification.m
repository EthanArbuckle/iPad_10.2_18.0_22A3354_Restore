@implementation BKSMousePointerServiceSessionSpecification

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "userInteractive");
}

+ (BSServiceInterface)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BKSMousePointerServiceSessionSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, block);
  return (BSServiceInterface *)(id)interface___interface;
}

void __55__BKSMousePointerServiceSessionSpecification_interface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66560);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF5F2A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interfaceWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setServer:", v8);
  objc_msgSend(v5, "setClient:", v2);
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)interface___interface;
  interface___interface = v6;

}

+ (NSString)identifier
{
  return (NSString *)CFSTR("BKMousePointerService");
}

@end
