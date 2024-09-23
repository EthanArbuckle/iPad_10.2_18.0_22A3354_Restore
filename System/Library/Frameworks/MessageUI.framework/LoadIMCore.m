@implementation LoadIMCore

void __LoadIMCore_block_invoke()
{
  LoadIMCore_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IMCore.framework/IMCore", 2);
  if (!LoadIMCore_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/IMCore.framework/IMCore"));
}

@end
