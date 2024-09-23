@implementation AVTUIUseLocalEditorModel

uint64_t __AVTUIUseLocalEditorModel_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUseLocalEditorModel"), 0);
  AVTUIUseLocalEditorModel_once_enabled = result;
  return result;
}

@end
