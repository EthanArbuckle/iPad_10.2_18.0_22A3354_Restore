@implementation SoundBoardServicesLibrary

void *__SoundBoardServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SoundBoardServices.framework/SoundBoardServices", 2);
  SoundBoardServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
