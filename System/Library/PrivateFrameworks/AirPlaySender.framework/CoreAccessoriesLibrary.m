@implementation CoreAccessoriesLibrary

void *__CoreAccessoriesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreAccessories.framework/CoreAccessories", 2);
  CoreAccessoriesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
