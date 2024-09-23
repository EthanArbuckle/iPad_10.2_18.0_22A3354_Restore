@implementation SBAccessibilityGridSizeComparison

void __SBAccessibilityGridSizeComparison_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEB09D0];
  v5[0] = *MEMORY[0x24BEB0988];
  v5[1] = v0;
  v1 = *MEMORY[0x24BEB09A0];
  v5[2] = *MEMORY[0x24BEB09A8];
  v5[3] = v1;
  v2 = *MEMORY[0x24BEB09B0];
  v5[4] = *MEMORY[0x24BEB0990];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)SBAccessibilityGridSizeComparison_Items;
  SBAccessibilityGridSizeComparison_Items = v3;

}

@end
