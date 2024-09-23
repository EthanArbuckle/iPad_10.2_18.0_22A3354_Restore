@implementation BiomeStreamsLibrary

void *__BiomeStreamsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/BiomeStreams.framework/BiomeStreams", 2);
  BiomeStreamsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
