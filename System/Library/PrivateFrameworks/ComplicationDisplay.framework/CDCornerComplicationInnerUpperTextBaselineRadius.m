@implementation CDCornerComplicationInnerUpperTextBaselineRadius

void __CDCornerComplicationInnerUpperTextBaselineRadius_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "sizeClass");
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    v3 = CDCornerComplicationInnerUpperCircleRadius(v2);

    CDCornerComplicationInnerUpperTextBaselineRadius__innerUpperBaselineRadius = *(_QWORD *)&v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", v2, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = &unk_24CF2D918;
    v7[1] = &unk_24CF2D978;
    v8[0] = &unk_24CF2DE00;
    v8[1] = &unk_24CF2DE10;
    v7[2] = &unk_24CF2D990;
    v8[2] = &unk_24CF2DE10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v5, 80.5);
    CDCornerComplicationInnerUpperTextBaselineRadius__innerUpperBaselineRadius = v6;

  }
}

@end
