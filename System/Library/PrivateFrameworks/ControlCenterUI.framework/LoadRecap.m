@implementation LoadRecap

void __LoadRecap_block_invoke()
{
  LoadRecap_frameworkLibrary = (uint64_t)dlopen("/System/Library/../../AppleInternal/Library/Frameworks/Recap.framework/Recap", 2);
  if (!LoadRecap_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/../../AppleInternal/Library/Frameworks/Recap.framework/Recap"));
}

void __LoadRecap_block_invoke_0()
{
  LoadRecap_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/AppleInternal/Recap.framework/Recap", 2);
  if (!LoadRecap_frameworkLibrary_0)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/AppleInternal/Recap.framework/Recap"));
}

@end
