@implementation SpeakerRecognitionLibrary

void *__SpeakerRecognitionLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SpeakerRecognition.framework/SpeakerRecognition", 2);
  SpeakerRecognitionLibrary_sLib = (uint64_t)result;
  return result;
}

@end
