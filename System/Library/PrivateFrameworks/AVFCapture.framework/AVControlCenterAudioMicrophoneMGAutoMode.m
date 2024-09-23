@implementation AVControlCenterAudioMicrophoneMGAutoMode

uint64_t __AVControlCenterAudioMicrophoneMGAutoMode_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  AVControlCenterAudioMicrophoneMGAutoMode_sMicMGAutoMode = result;
  return result;
}

@end
