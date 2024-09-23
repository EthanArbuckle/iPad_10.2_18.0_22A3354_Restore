@implementation IPLoadUIKitFramework

void *__IPLoadUIKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  uiKitFramework = (uint64_t)result;
  return result;
}

@end
