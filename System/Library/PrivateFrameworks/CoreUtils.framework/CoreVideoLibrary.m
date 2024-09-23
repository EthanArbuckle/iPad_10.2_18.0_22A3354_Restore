@implementation CoreVideoLibrary

void *__CoreVideoLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreVideo.framework/CoreVideo", 2);
  CoreVideoLibrary_sLib = (uint64_t)result;
  return result;
}

@end
