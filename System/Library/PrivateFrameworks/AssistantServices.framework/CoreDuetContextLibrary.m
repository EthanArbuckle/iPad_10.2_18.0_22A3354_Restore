@implementation CoreDuetContextLibrary

void *__CoreDuetContextLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreDuetContext.framework/CoreDuetContext", 2);
  CoreDuetContextLibrary_sLib = (uint64_t)result;
  return result;
}

@end
