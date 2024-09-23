@implementation GetAudioLogForMNAnnouncementEngineCategory

void __GetAudioLogForMNAnnouncementEngineCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNAnnouncementEngine");
  v1 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = (uint64_t)v0;

}

@end
