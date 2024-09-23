@implementation LoadAppleMediaServices

void __LoadAppleMediaServices_block_invoke()
{
  LoadAppleMediaServices_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AppleMediaServices.framework/AppleMediaServices", 2);
  if (!LoadAppleMediaServices_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/AppleMediaServices.framework/AppleMediaServices"));
}

@end
