@implementation AVTUIStickersShowDisclosureWarning

uint64_t __AVTUIStickersShowDisclosureWarning_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesStickersDisclosureWarning"), 0);
  AVTUIStickersShowDisclosureWarning_once_enabled = result;
  return result;
}

@end
