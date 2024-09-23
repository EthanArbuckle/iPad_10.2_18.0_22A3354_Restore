@implementation AVTUIStickerRecentsShowDisclosureWarning

uint64_t __AVTUIStickerRecentsShowDisclosureWarning_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesStickerRecentsDisclosureWarning"), 0);
  AVTUIStickerRecentsShowDisclosureWarning_once_enabled = result;
  return result;
}

@end
