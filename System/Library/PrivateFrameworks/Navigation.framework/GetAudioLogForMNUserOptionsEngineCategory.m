@implementation GetAudioLogForMNUserOptionsEngineCategory

void __GetAudioLogForMNUserOptionsEngineCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Navigation.Audio", "MNUserOptionsEngine");
  v1 = (void *)qword_1ED0C3F98;
  qword_1ED0C3F98 = (uint64_t)v0;

}

@end
