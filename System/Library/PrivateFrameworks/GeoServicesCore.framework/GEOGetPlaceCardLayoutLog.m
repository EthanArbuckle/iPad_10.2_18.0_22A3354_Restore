@implementation GEOGetPlaceCardLayoutLog

void __GEOGetPlaceCardLayoutLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "PlaceCardLayout");
  v1 = (void *)qword_1ECE24568;
  qword_1ECE24568 = (uint64_t)v0;

}

@end
