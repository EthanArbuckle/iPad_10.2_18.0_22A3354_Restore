@implementation MapsAuthClientFeatureFlagsUpdateInterval

void *GeoServicesConfig_MapsAuthClientFeatureFlagsUpdateInterval_Metadata_block_invoke_372()
{
  return &unk_1E1E85E00;
}

uint64_t GeoServicesConfig_MapsAuthClientFeatureFlagsUpdateInterval_Metadata_block_invoke_373(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 1800.0)
    v2 = 1800.0;
  if (v2 > 86400.0)
    v2 = 86400.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
