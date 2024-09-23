@implementation CDCircularSmallComplicationDiameter

void __CDCircularSmallComplicationDiameter_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 2);
  v5[0] = &unk_24CF2D900;
  v5[1] = &unk_24CF2D918;
  v6[0] = &unk_24CF2DC40;
  v6[1] = &unk_24CF2DC50;
  v5[2] = &unk_24CF2D930;
  v5[3] = &unk_24CF2D948;
  v6[2] = &unk_24CF2DC60;
  v6[3] = &unk_24CF2DC70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 32.0);
  CDCircularSmallComplicationDiameter__diameter = v4;

}

@end
