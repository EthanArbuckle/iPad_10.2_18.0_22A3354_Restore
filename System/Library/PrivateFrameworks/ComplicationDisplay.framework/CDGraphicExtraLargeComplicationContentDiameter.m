@implementation CDGraphicExtraLargeComplicationContentDiameter

void __CDGraphicExtraLargeComplicationContentDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 2);
  v5[0] = &unk_24CF2D900;
  v5[1] = &unk_24CF2D9A8;
  v6[0] = &unk_24CF2DCC0;
  v6[1] = &unk_24CF2DCC0;
  v5[2] = &unk_24CF2D918;
  v5[3] = &unk_24CF2D978;
  v6[2] = &unk_24CF2DCD0;
  v6[3] = &unk_24CF2DCE0;
  v5[4] = &unk_24CF2D990;
  v6[4] = &unk_24CF2DCE0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 120.0);
  CDGraphicExtraLargeComplicationContentDiameter__contentDiameter = v4;

}

@end
