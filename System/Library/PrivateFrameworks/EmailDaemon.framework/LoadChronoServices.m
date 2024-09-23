@implementation LoadChronoServices

void __LoadChronoServices_block_invoke()
{
  LoadChronoServices_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ChronoServices.framework/ChronoServices", 2);
  if (!LoadChronoServices_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/ChronoServices.framework/ChronoServices"));
}

@end
