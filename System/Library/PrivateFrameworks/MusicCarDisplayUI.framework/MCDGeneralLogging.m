@implementation MCDGeneralLogging

void __MCDGeneralLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MusicCarDisplay", "General");
  v1 = (void *)MCDGeneralLogging_facility;
  MCDGeneralLogging_facility = (uint64_t)v0;

}

@end
