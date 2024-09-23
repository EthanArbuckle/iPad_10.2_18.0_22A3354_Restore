@implementation FigLoadAVFDylib

void *__FigLoadAVFDylib_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 4);
  FigLoadAVFDylib_avfDylib = (uint64_t)result;
  return result;
}

@end
