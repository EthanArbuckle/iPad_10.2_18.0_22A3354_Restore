@implementation IAPAuthenticationLibrary

void *__IAPAuthenticationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IAPAuthentication.framework/IAPAuthentication", 2);
  IAPAuthenticationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
