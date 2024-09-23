@implementation LoadSpringBoardHome

void __LoadSpringBoardHome_block_invoke()
{
  LoadSpringBoardHome_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SpringBoardHome.framework/SpringBoardHome", 2);
  if (!LoadSpringBoardHome_frameworkLibrary)
    NSLog(CFSTR("### Failed to Soft Linked: /System/Library/PrivateFrameworks/SpringBoardHome.framework/SpringBoardHome"));
}

@end
