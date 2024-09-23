@implementation GEOGetKeyBagLog

void __GEOGetKeyBagLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "KeyBag");
  v1 = (void *)qword_1ECDBBCD0;
  qword_1ECDBBCD0 = (uint64_t)v0;

}

@end
