@implementation NSXPCInterface(HMUserManagementRemoteProtocols)

+ (uint64_t)hm_userManagementRemoteServiceInterface
{
  return objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EE45A350);
}

+ (uint64_t)hm_userManagementRemoteHostInterface
{
  return objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EE403010);
}

@end
