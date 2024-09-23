@implementation CDGraphicCircularScaledComplicationDiameter

void __CDGraphicCircularScaledComplicationDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_24CF2D918;
  v5[1] = &unk_24CF2D960;
  v6[0] = &unk_24CF2DD80;
  v6[1] = &unk_24CF2DC50;
  v5[2] = &unk_24CF2D978;
  v5[3] = &unk_24CF2D990;
  v6[2] = &unk_24CF2DD90;
  v6[3] = &unk_24CF2DD90;
  v5[4] = &unk_24CF2D930;
  v5[5] = &unk_24CF2D948;
  v6[4] = &unk_24CF2DC50;
  v6[5] = &unk_24CF2DD90;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 34.0);
  CDGraphicCircularScaledComplicationDiameter__complicationDiameter = v4;

}

@end
