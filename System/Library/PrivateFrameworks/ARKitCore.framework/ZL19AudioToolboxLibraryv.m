@implementation ZL19AudioToolboxLibraryv

void *___ZL19AudioToolboxLibraryv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 2);
  AudioToolboxLibrary(void)::sLib = (uint64_t)result;
  return result;
}

@end
