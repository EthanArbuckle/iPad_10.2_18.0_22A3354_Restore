@implementation CoreUtilsLibrary

void *__CoreUtilsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 2);
  CoreUtilsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
