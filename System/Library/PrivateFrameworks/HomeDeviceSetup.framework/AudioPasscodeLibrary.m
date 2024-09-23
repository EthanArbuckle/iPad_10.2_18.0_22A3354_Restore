@implementation AudioPasscodeLibrary

void *__AudioPasscodeLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AudioPasscode.framework/AudioPasscode", 2);
  AudioPasscodeLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AudioPasscodeLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AudioPasscode.framework/AudioPasscode", 2);
  AudioPasscodeLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
