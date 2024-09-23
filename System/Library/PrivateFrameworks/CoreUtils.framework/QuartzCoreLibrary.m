@implementation QuartzCoreLibrary

void *__QuartzCoreLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuartzCore.framework/QuartzCore", 2);
  QuartzCoreLibrary_sLib = (uint64_t)result;
  return result;
}

void *__QuartzCoreLibrary_block_invoke_12585()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/QuartzCore.framework/QuartzCore", 2);
  QuartzCoreLibrary_sLib_12583 = (uint64_t)result;
  return result;
}

@end
