@implementation UIKitLibrary

void *__UIKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  UIKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
