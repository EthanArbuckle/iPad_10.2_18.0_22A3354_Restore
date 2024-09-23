@implementation LoadCoreSpotlight

void __LoadCoreSpotlight_block_invoke()
{
  LoadCoreSpotlight_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  if (!LoadCoreSpotlight_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight"));
}

void __LoadCoreSpotlight_block_invoke_0()
{
  LoadCoreSpotlight_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight", 2);
  if (!LoadCoreSpotlight_frameworkLibrary_0)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/CoreSpotlight.framework/CoreSpotlight"));
}

@end
