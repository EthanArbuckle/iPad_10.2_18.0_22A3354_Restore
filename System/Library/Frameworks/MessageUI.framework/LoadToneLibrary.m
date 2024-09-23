@implementation LoadToneLibrary

void __LoadToneLibrary_block_invoke()
{
  LoadToneLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ToneLibrary.framework/ToneLibrary", 2);
  if (!LoadToneLibrary_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/ToneLibrary.framework/ToneLibrary"));
}

@end
