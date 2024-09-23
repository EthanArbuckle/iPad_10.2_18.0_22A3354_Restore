@implementation CMCaptureLibrary

void *__CMCaptureLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CMCapture.framework/CMCapture", 2);
  CMCaptureLibrary_sLib = (uint64_t)result;
  return result;
}

@end
