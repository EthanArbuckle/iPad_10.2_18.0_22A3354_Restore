@implementation ViewPortCoverageForAutoSwitchToOfflineWithGrid

void *GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOfflineWithGrid_Metadata_block_invoke_24()
{
  return &unk_1E1E85E30;
}

uint64_t GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOfflineWithGrid_Metadata_block_invoke_25(uint64_t a1, void *a2)
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
