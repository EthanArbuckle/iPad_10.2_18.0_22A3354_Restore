@implementation GetAudioLogForMNAudioHardwareEngineCategory

void __GetAudioLogForMNAudioHardwareEngineCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioHardwareEngine");
  v1 = (void *)_MergedGlobals_23;
  _MergedGlobals_23 = (uint64_t)v0;

}

@end
