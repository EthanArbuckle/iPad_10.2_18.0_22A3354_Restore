@implementation CoreMediaLibrary

void *__CoreMediaLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 2);
  CoreMediaLibrary_sLib = (uint64_t)result;
  return result;
}

@end
