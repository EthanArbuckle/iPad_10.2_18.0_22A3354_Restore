@implementation CoreAudioLibrary

void *__CoreAudioLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreAudio.framework/CoreAudio", 2);
  CoreAudioLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreAudioLibrary_block_invoke_691()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreAudio.framework/CoreAudio", 2);
  CoreAudioLibrary_sLib_689 = (uint64_t)result;
  return result;
}

@end
