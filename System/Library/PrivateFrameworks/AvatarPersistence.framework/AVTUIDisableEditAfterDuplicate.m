@implementation AVTUIDisableEditAfterDuplicate

uint64_t __AVTUIDisableEditAfterDuplicate_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesDisablEditAfterDuplicate"), 0);
  AVTUIDisableEditAfterDuplicate_once_enabled = result;
  return result;
}

@end
