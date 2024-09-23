@implementation LoadIMSharedUtilities

void __LoadIMSharedUtilities_block_invoke()
{
  LoadIMSharedUtilities_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities", 2);
  if (!LoadIMSharedUtilities_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities"));
}

@end
