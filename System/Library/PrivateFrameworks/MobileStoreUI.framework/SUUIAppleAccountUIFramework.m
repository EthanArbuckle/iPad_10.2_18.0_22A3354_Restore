@implementation SUUIAppleAccountUIFramework

void *__SUUIAppleAccountUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 1);
  SUUIAppleAccountUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
