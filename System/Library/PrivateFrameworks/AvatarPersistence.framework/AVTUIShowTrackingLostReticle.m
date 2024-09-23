@implementation AVTUIShowTrackingLostReticle

uint64_t __AVTUIShowTrackingLostReticle_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarShowTrackingLostReticle"), 0);
  AVTUIShowTrackingLostReticle_once_enabled = result;
  return result;
}

@end
