@implementation GetAudioLogForMNAudioSessionResourceAccessCategory

void __GetAudioLogForMNAudioSessionResourceAccessCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioSessionResourceAccess");
  v1 = (void *)_MergedGlobals_41;
  _MergedGlobals_41 = (uint64_t)v0;

}

@end
