@implementation StateManagerUpdateInterval

void *GeoOfflineConfig_StateManagerUpdateInterval_Metadata_block_invoke_13()
{
  return &unk_1E1E81C28;
}

uint64_t GeoOfflineConfig_StateManagerUpdateInterval_Metadata_block_invoke_14(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 1.0)
    v2 = 1.0;
  if (v2 > 600.0)
    v2 = 600.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
