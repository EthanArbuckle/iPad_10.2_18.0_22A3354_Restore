@implementation ViewPortContainmentForAutoSwitchToOffline

void *GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOffline_Metadata_block_invoke_28()
{
  return &unk_1E1E85E50;
}

uint64_t GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOffline_Metadata_block_invoke_29(uint64_t a1, void *a2)
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
