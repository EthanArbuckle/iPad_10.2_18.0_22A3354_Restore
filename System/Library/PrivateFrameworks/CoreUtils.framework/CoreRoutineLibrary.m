@implementation CoreRoutineLibrary

void *__CoreRoutineLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreRoutine.framework/CoreRoutine", 2);
  CoreRoutineLibrary_sLib = (uint64_t)result;
  return result;
}

@end
