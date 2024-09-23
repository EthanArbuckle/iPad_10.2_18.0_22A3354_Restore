@implementation GEOGetStateCaptureLog

void __GEOGetStateCaptureLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "StateCapture");
  v1 = (void *)qword_1ECE24480;
  qword_1ECE24480 = (uint64_t)v0;

}

@end
