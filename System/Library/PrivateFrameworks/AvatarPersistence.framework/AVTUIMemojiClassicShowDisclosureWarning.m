@implementation AVTUIMemojiClassicShowDisclosureWarning

uint64_t __AVTUIMemojiClassicShowDisclosureWarning_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesMemojiClassicDisclosureWarning"), 0);
  AVTUIMemojiClassicShowDisclosureWarning_once_enabled = result;
  return result;
}

@end
