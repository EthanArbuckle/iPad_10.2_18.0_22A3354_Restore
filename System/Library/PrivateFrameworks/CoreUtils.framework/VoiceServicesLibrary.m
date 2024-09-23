@implementation VoiceServicesLibrary

void *__VoiceServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/VoiceServices.framework/VoiceServices", 2);
  VoiceServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
