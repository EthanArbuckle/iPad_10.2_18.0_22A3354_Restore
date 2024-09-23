@implementation EKUISwiftShim

+ (BOOL)isLegacyEKUIClient
{
  return objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E70901FFFFFFFFLL) ^ 1;
}

@end
