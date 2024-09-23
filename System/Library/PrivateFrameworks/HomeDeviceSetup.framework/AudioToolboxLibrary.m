@implementation AudioToolboxLibrary

void *__AudioToolboxLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 2);
  AudioToolboxLibrary_sLib = (uint64_t)result;
  return result;
}

@end
