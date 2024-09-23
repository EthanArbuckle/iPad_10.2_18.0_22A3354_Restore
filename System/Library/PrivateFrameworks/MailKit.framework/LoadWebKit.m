@implementation LoadWebKit

void __LoadWebKit_block_invoke()
{
  LoadWebKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/WebKit.framework/WebKit", 2);
  if (!LoadWebKit_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/Frameworks/WebKit.framework/WebKit"));
}

@end
