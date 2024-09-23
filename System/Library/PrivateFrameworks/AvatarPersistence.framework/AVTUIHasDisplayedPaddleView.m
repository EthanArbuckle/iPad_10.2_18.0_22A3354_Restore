@implementation AVTUIHasDisplayedPaddleView

uint64_t __AVTUIHasDisplayedPaddleView_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedPaddleView"), 0);
  AVTUIHasDisplayedPaddleView_once_enabled = result;
  return result;
}

@end
