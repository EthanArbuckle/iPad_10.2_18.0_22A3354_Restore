@implementation AVFoundationLibrary

void *__AVFoundationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 2);
  AVFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AVFoundationLibrary_block_invoke_9263()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AVFoundation.framework/AVFoundation", 2);
  AVFoundationLibrary_sLib_9265 = (uint64_t)result;
  return result;
}

@end
