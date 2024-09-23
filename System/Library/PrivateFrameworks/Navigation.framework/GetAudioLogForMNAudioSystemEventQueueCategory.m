@implementation GetAudioLogForMNAudioSystemEventQueueCategory

void __GetAudioLogForMNAudioSystemEventQueueCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioSystemEventQueue");
  v1 = (void *)_MergedGlobals_37;
  _MergedGlobals_37 = (uint64_t)v0;

}

@end
