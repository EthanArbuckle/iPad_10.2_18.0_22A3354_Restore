@implementation BiomeLibraryLibrary

void *__BiomeLibraryLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BiomeLibrary.framework/BiomeLibrary", 2);
  BiomeLibraryLibrary_sLib = (uint64_t)result;
  return result;
}

@end
