@implementation HDProfile(HeartHealthDaemonPlugin)

- (uint64_t)heartHealthProfileExtension
{
  return objc_msgSend(a1, "profileExtensionWithIdentifier:", *MEMORY[0x1E0D2FB48]);
}

@end
