@implementation AVTUIThumbnailCaching

uint64_t __AVTUIThumbnailCaching_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIThumbnailCaching"), 1);
  AVTUIThumbnailCaching_once_enabled = result;
  return result;
}

@end
