@implementation SUUIAudioToolboxFramework

void *__SUUIAudioToolboxFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 1);
  SUUIAudioToolboxFramework_sHandle = (uint64_t)result;
  return result;
}

@end
