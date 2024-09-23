@implementation LoadicloudMCCKit

void __LoadicloudMCCKit_block_invoke()
{
  LoadicloudMCCKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/icloudMCCKit.framework/icloudMCCKit", 2);
  if (!LoadicloudMCCKit_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/icloudMCCKit.framework/icloudMCCKit"));
}

@end
