@implementation AVFoundationLibrary

void *__AVFoundationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 2);
  AVFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
