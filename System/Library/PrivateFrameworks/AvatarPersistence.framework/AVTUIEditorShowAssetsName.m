@implementation AVTUIEditorShowAssetsName

uint64_t __AVTUIEditorShowAssetsName_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIEditorShowAssetsName"), 0);
  AVTUIEditorShowAssetsName_once_enabled = result;
  return result;
}

@end
