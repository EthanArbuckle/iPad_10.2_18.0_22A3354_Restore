@implementation FMFLibrary

void *__FMFLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FMF.framework/FMF", 2);
  FMFLibrary_sLib = (uint64_t)result;
  return result;
}

@end
