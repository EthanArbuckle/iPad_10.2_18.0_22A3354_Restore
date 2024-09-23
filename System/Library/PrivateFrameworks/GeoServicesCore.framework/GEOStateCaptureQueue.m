@implementation GEOStateCaptureQueue

void ___GEOStateCaptureQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = geo_dispatch_queue_create_with_target("com.apple.GeoServices.StateCapture", 0);
  v1 = (void *)qword_1ECE24498;
  qword_1ECE24498 = (uint64_t)v0;

}

@end
