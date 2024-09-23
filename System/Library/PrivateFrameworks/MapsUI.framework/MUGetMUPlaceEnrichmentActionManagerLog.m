@implementation MUGetMUPlaceEnrichmentActionManagerLog

void __MUGetMUPlaceEnrichmentActionManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MapsUI", "MUPlaceEnrichmentActionManager");
  v1 = (void *)_MergedGlobals_130;
  _MergedGlobals_130 = (uint64_t)v0;

}

@end
