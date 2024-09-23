@implementation AKAuthorizationNotificationHandlerInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_9 != -1)
    dispatch_once(&XPCInterface_onceToken_9, &__block_literal_global_29);
  return (id)XPCInterface_interface_8;
}

void __59__AKAuthorizationNotificationHandlerInterface_XPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE270E18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)XPCInterface_interface_8;
  XPCInterface_interface_8 = v0;

}

@end
