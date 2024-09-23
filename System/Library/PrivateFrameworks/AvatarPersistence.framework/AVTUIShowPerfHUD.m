@implementation AVTUIShowPerfHUD

uint64_t __AVTUIShowPerfHUD_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIShowPerfHUD"), 0);
  AVTUIShowPerfHUD_once_enabled = result;
  return result;
}

@end
