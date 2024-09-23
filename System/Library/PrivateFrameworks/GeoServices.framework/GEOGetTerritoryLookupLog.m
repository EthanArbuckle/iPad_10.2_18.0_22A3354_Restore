@implementation GEOGetTerritoryLookupLog

void __GEOGetTerritoryLookupLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.GeoServices", "TerritoryLookup");
  v1 = (void *)qword_1EDF51140;
  qword_1EDF51140 = (uint64_t)v0;

}

@end
