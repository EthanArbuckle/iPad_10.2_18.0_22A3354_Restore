@implementation AvatarUIInit

void *___AvatarUIInit_block_invoke()
{
  void *result;

  _CKAVTAvatarStore = MEMORY[0x193FF3C18](CFSTR("AVTAvatarStore"), CFSTR("AvatarUI"));
  _CKAVTAvatarFetchRequest = MEMORY[0x193FF3C18](CFSTR("AVTAvatarFetchRequest"), CFSTR("AvatarUI"));
  _CKAVTAvatarEditorViewController = MEMORY[0x193FF3C18](CFSTR("AVTAvatarEditorViewController"), CFSTR("AvatarUI"));
  _CKAVPlayerViewController = MEMORY[0x193FF3C18](CFSTR("AVPlayerViewController"), CFSTR("AVKit"));
  _CKAVTUISetHasDisplayedSplashScreen = (_UNKNOWN *)MEMORY[0x193FF3C24]("AVTUISetHasDisplayedSplashScreen", CFSTR("AvatarUI"));
  result = (void *)MEMORY[0x193FF3C24]("AVTAvatarEditorSplashVideo", CFSTR("AvatarUI"));
  _CKAVTAvatarEditorSplashVideo = result;
  return result;
}

@end
