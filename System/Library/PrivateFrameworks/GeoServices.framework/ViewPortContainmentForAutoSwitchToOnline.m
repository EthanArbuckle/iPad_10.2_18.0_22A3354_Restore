@implementation ViewPortContainmentForAutoSwitchToOnline

void *GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOnline_Metadata_block_invoke_32()
{
  return &unk_1E1E85E40;
}

uint64_t GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOnline_Metadata_block_invoke_33(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 0.0)
    v2 = 0.0;
  if (v2 > 1.0)
    v2 = 1.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
