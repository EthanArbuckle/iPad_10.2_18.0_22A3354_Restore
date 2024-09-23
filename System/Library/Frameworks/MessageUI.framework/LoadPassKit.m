@implementation LoadPassKit

void __LoadPassKit_block_invoke()
{
  LoadPassKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/PassKit.framework/PassKit", 2);
  if (!LoadPassKit_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/PassKit.framework/PassKit"));
}

@end
