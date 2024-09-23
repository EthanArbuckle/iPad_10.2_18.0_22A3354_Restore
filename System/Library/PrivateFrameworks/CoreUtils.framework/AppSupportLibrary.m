@implementation AppSupportLibrary

void *__AppSupportLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 2);
  AppSupportLibrary_sLib = (uint64_t)result;
  return result;
}

@end
