@implementation NSXPCInterface(CXNotificationServiceExtensionVoIPXPCClientSupport)

+ (uint64_t)cx_notificationServiceExtensionInterface
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7101C0);
}

@end
