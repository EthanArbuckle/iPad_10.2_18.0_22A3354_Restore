@implementation SUUIAVFoundationFramework

void *__SUUIAVFoundationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", 1);
  SUUIAVFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
