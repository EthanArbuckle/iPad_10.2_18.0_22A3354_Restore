@implementation CoreSpeechLibrary

void *__CoreSpeechLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreSpeech.framework/CoreSpeech", 2);
  CoreSpeechLibrary_sLib = (uint64_t)result;
  return result;
}

@end
