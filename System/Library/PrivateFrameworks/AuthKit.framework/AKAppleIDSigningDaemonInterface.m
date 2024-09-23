@implementation AKAppleIDSigningDaemonInterface

+ (NSXPCInterface)XPCInterface
{
  if (XPCInterface_onceToken_5 != -1)
    dispatch_once(&XPCInterface_onceToken_5, &__block_literal_global_21);
  return (NSXPCInterface *)(id)XPCInterface_XPCInterface;
}

void __47__AKAppleIDSigningDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE26DB08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_XPCInterface;
  XPCInterface_XPCInterface = v0;

}

@end
