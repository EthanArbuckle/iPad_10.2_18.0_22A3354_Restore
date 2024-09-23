@implementation AVFCaptureLibrary

void *__AVFCaptureLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AVFCapture.framework/AVFCapture", 2);
  AVFCaptureLibrary_sLib = (uint64_t)result;
  return result;
}

@end
