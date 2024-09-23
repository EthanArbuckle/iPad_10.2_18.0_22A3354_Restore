@implementation AVControlCenterAudioAreMicrophoneModesSupported

uint64_t __AVControlCenterAudioAreMicrophoneModesSupported_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AVControlCenterAudioAreMicrophoneModesSupported_sMicModesSupported = result;
  return result;
}

@end
