@implementation AVTUIForceCameraDisclosures

uint64_t __AVTUIForceCameraDisclosures_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarForceCameraDisclosures"), 0);
  AVTUIForceCameraDisclosures_once_enabled = result;
  return result;
}

@end
