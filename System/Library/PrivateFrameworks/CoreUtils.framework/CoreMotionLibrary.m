@implementation CoreMotionLibrary

void *__CoreMotionLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreMotion.framework/CoreMotion", 2);
  CoreMotionLibrary_sLib = (uint64_t)result;
  return result;
}

@end
