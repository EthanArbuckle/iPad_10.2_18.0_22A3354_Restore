@implementation GEOGetGeoCodecsDecodeLog

os_log_t __GEOGetGeoCodecsDecodeLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.VectorKit.GeoCodecs", "Decode");
  _MergedGlobals_352 = (uint64_t)result;
  return result;
}

@end
