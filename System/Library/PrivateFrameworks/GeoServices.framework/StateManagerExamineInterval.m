@implementation StateManagerExamineInterval

void *GeoOfflineConfig_StateManagerExamineInterval_Metadata_block_invoke_11()
{
  return &unk_1E1E81CA0;
}

uint64_t GeoOfflineConfig_StateManagerExamineInterval_Metadata_block_invoke_12(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 0.2)
    v2 = 0.2;
  if (v2 > 600.0)
    v2 = 600.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
