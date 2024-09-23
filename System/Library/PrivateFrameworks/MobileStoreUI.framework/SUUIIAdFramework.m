@implementation SUUIIAdFramework

void *__SUUIIAdFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/iAd.framework/iAd", 1);
  SUUIIAdFramework_sHandle = (uint64_t)result;
  return result;
}

@end
