@implementation MapsAuthClientFeatureFlagsTTL

void *GeoServicesConfig_MapsAuthClientFeatureFlagsTTL_Metadata_block_invoke_370()
{
  return &unk_1E1E85DF0;
}

uint64_t GeoServicesConfig_MapsAuthClientFeatureFlagsTTL_Metadata_block_invoke_371(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 3600.0)
    v2 = 3600.0;
  if (v2 > 172800.0)
    v2 = 172800.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
