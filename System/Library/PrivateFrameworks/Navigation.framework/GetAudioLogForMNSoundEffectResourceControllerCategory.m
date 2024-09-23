@implementation GetAudioLogForMNSoundEffectResourceControllerCategory

void __GetAudioLogForMNSoundEffectResourceControllerCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNSoundEffectResourceController");
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v0;

}

@end
