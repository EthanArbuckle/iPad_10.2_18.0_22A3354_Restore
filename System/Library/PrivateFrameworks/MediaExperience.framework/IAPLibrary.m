@implementation IAPLibrary

void *__IAPLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IAP.framework/IAP", 2);
  IAPLibrary_sLib = (uint64_t)result;
  return result;
}

@end
