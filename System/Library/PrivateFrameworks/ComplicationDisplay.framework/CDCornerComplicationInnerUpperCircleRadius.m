@implementation CDCornerComplicationInnerUpperCircleRadius

void __CDCornerComplicationInnerUpperCircleRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_24CF2D918;
  v5[1] = &unk_24CF2D930;
  v6[0] = &unk_24CF2DDA0;
  v6[1] = &unk_24CF2DDB0;
  v5[2] = &unk_24CF2D948;
  v6[2] = &unk_24CF2DDC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 83.5);
  CDCornerComplicationInnerUpperCircleRadius__innerUpperCircleRadius = v4;

}

@end
