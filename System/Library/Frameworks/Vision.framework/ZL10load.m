@implementation ZL10load

void *___ZL10load_uikitv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  load_uikit(void)::uikitHandle = (uint64_t)result;
  return result;
}

@end
