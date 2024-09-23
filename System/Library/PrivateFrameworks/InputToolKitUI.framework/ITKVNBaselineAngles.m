@implementation ITKVNBaselineAngles

id __ITKVNBaselineAngles_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  void *v4;

  objc_msgSend(a2, "getCROutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualTextAngle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (float)-v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
