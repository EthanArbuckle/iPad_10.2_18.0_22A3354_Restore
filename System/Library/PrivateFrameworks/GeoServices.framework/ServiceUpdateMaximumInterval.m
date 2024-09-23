@implementation ServiceUpdateMaximumInterval

void *GeoOfflineConfig_ServiceUpdateMaximumInterval_Metadata_block_invoke_69()
{
  return &unk_1E1E81C28;
}

uint64_t GeoOfflineConfig_ServiceUpdateMaximumInterval_Metadata_block_invoke_70(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 0.2)
    v2 = 0.2;
  if (v2 > 10.0)
    v2 = 10.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
