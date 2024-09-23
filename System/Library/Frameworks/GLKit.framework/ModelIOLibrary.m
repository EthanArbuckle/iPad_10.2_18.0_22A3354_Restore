@implementation ModelIOLibrary

void *__ModelIOLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ModelIO.framework/ModelIO", 2);
  ModelIOLibrary_sLib = (uint64_t)result;
  return result;
}

@end
