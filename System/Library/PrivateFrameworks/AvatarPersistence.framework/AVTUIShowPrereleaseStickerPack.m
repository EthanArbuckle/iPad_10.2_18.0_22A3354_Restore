@implementation AVTUIShowPrereleaseStickerPack

uint64_t __AVTUIShowPrereleaseStickerPack_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesShowPrereleaseStickerPack"), 0);
  AVTUIShowPrereleaseStickerPack_once_enabled = result;
  return result;
}

@end
