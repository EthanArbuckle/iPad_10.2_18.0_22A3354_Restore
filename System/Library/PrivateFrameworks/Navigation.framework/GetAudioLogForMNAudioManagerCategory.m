@implementation GetAudioLogForMNAudioManagerCategory

void __GetAudioLogForMNAudioManagerCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioManager");
  v1 = (void *)_MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v0;

}

@end
