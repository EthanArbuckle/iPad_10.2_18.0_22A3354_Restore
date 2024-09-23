@implementation CDGraphicLargeRectangularComplicationSize

void __CDGraphicLargeRectangularComplicationSize_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = &unk_24CF2D918;
  v11[1] = &unk_24CF2D978;
  v12[0] = &unk_24CF2DCF0;
  v12[1] = &unk_24CF2DD00;
  v11[2] = &unk_24CF2D990;
  v11[3] = &unk_24CF2D930;
  v12[2] = &unk_24CF2DD00;
  v12[3] = &unk_24CF2DD10;
  v11[4] = &unk_24CF2D948;
  v12[4] = &unk_24CF2DD20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 162.0);
  v5 = v4;

  v9[0] = &unk_24CF2D918;
  v9[1] = &unk_24CF2D960;
  v10[0] = &unk_24CF2DD30;
  v10[1] = &unk_24CF2DD40;
  v9[2] = &unk_24CF2D978;
  v9[3] = &unk_24CF2D990;
  v10[2] = &unk_24CF2DD50;
  v10[3] = &unk_24CF2DD50;
  v9[4] = &unk_24CF2D930;
  v9[5] = &unk_24CF2D948;
  v10[4] = &unk_24CF2DD60;
  v10[5] = &unk_24CF2DD70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 69.0);
  v8 = v7;

  CDGraphicLargeRectangularComplicationSize__complicationSize_0 = v5;
  CDGraphicLargeRectangularComplicationSize__complicationSize_1 = v8;

}

@end
