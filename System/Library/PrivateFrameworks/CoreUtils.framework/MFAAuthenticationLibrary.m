@implementation MFAAuthenticationLibrary

void *__MFAAuthenticationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MFAAuthentication.framework/MFAAuthentication", 2);
  MFAAuthenticationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
