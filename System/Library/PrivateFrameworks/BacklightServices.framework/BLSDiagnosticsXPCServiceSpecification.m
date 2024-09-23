@implementation BLSDiagnosticsXPCServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.BacklightServices.diagnostics");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(MEMORY[0x1E0D03478], "utility");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1)
    dispatch_once(&interface_onceToken_1, &__block_literal_global_17);
  return (BSServiceInterface *)(id)interface___interface_1;
}

void __50__BLSDiagnosticsXPCServiceSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0D03430];
  +[BLSDiagnosticsXPCServiceSpecification identifier](BLSDiagnosticsXPCServiceSpecification, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "interfaceWithIdentifier:", v1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EEED9268);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServer:", v2);

  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)interface___interface_1;
  interface___interface_1 = v3;

}

@end
