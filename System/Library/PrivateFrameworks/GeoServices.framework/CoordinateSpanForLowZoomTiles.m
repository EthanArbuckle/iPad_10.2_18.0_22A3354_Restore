@implementation CoordinateSpanForLowZoomTiles

void *GeoOfflineConfig_CoordinateSpanForLowZoomTiles_Metadata_block_invoke_34()
{
  return &unk_1E1E81D00;
}

uint64_t GeoOfflineConfig_CoordinateSpanForLowZoomTiles_Metadata_block_invoke_35(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  if (v2 < 1.0)
    v2 = 1.0;
  if (v2 > 180.0)
    v2 = 180.0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
}

@end
