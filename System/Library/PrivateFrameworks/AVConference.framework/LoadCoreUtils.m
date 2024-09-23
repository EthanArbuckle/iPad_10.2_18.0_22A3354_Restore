@implementation LoadCoreUtils

void __LoadCoreUtils_block_invoke()
{
  LoadCoreUtils_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 2);
  if (!LoadCoreUtils_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Link: /System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils"));
}

@end
