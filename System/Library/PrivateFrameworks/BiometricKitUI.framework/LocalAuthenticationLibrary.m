@implementation LocalAuthenticationLibrary

void *__LocalAuthenticationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/LocalAuthentication.framework/LocalAuthentication", 2);
  LocalAuthenticationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
