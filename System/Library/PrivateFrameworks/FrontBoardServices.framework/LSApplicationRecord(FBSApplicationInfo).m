@implementation LSApplicationRecord(FBSApplicationInfo)

- (uint64_t)fbs_processIdentityForApplicationIdentity:()FBSApplicationInfo
{
  return objc_msgSend(MEMORY[0x1E0D87D80], "identityForLSApplicationIdentity:LSApplicationRecord:", a3, a1);
}

@end
