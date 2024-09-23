@implementation LoadSharedWithYouCore

void __LoadSharedWithYouCore_block_invoke()
{
  LoadSharedWithYouCore_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/SharedWithYouCore.framework/SharedWithYouCore", 2);
  if (!LoadSharedWithYouCore_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/SharedWithYouCore.framework/SharedWithYouCore"));
}

@end
