@implementation CoreUtilsUILibrary

void *__CoreUtilsUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreUtilsUI.framework/CoreUtilsUI", 2);
  CoreUtilsUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
