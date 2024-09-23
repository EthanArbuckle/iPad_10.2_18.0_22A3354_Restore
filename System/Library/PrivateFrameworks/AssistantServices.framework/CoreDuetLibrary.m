@implementation CoreDuetLibrary

void *__CoreDuetLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreDuet.framework/CoreDuet", 2);
  CoreDuetLibrary_sLib = (uint64_t)result;
  return result;
}

@end
