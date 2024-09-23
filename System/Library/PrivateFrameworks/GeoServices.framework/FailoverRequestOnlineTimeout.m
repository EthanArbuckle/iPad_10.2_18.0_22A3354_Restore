@implementation FailoverRequestOnlineTimeout

void *GeoOfflineConfig_FailoverRequestOnlineTimeout_Metadata_block_invoke_51()
{
  return &unk_1E1E81C58;
}

uint64_t GeoOfflineConfig_FailoverRequestOnlineTimeout_Metadata_block_invoke_52(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 0.0)
    v2 = 0.0;
  if (v2 > 60.0)
    v2 = 60.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
