@implementation CarPlaySupportGeneralLogging

void __CarPlaySupportGeneralLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)CarPlaySupportLogSubsystem, "General");
  v1 = (void *)CarPlaySupportGeneralLogging_facility;
  CarPlaySupportGeneralLogging_facility = (uint64_t)v0;

}

@end
