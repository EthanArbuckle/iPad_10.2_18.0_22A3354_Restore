@implementation SUUIAppleAccountFramework

void *__SUUIAppleAccountFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppleAccount.framework/AppleAccount", 1);
  SUUIAppleAccountFramework_sHandle = (uint64_t)result;
  return result;
}

@end
