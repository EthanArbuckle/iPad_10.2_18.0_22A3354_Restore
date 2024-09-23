@implementation MUGetPlaceCardRevealLoggingLog

void __MUGetPlaceCardRevealLoggingLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "PlaceCardRevealLogging");
  v1 = (void *)qword_1ED01B550;
  qword_1ED01B550 = (uint64_t)v0;

}

@end
