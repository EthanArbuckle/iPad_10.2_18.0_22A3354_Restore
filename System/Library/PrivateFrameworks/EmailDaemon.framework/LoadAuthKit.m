@implementation LoadAuthKit

void __LoadAuthKit_block_invoke()
{
  LoadAuthKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AuthKit.framework/AuthKit", 2);
  if (!LoadAuthKit_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/AuthKit.framework/AuthKit"));
}

@end
