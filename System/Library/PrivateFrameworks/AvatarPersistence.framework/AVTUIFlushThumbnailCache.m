@implementation AVTUIFlushThumbnailCache

uint64_t __AVTUIFlushThumbnailCache_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarUIFlushThumbnailCache"), 0);
  AVTUIFlushThumbnailCache_once_enabled = result;
  return result;
}

@end
