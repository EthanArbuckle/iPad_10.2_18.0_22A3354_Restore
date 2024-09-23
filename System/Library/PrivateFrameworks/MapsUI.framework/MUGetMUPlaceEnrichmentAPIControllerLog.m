@implementation MUGetMUPlaceEnrichmentAPIControllerLog

void __MUGetMUPlaceEnrichmentAPIControllerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "MUPlaceEnrichmentAPIController");
  v1 = (void *)qword_1ED01B650;
  qword_1ED01B650 = (uint64_t)v0;

}

@end
