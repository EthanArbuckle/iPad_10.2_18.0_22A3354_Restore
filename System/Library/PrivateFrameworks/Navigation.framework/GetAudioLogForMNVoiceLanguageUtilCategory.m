@implementation GetAudioLogForMNVoiceLanguageUtilCategory

void __GetAudioLogForMNVoiceLanguageUtilCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNVoiceLanguageUtil");
  v1 = (void *)_MergedGlobals_46;
  _MergedGlobals_46 = (uint64_t)v0;

}

@end
