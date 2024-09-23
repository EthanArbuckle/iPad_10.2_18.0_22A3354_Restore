@implementation GetAudioLogForMNAudioSystemOptionsCategory

void __GetAudioLogForMNAudioSystemOptionsCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioSystemOptions");
  v1 = (void *)_MergedGlobals_28;
  _MergedGlobals_28 = (uint64_t)v0;

}

@end
