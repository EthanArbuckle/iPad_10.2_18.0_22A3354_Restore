@implementation VCVoiceDetector

void *__VCVoiceDetector_Create_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 5);
  VCVoiceDetector_Create_libHandle = (uint64_t)result;
  return result;
}

@end
