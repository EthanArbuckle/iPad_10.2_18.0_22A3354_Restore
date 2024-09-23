@implementation CDCornerComplicationKeylineSize

void __CDCornerComplicationKeylineSize_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "sizeClass");
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    CDCornerComplicationKeylineSize__complicationSize_0 = _avoniaComplicationSize(v2);
    CDCornerComplicationKeylineSize__complicationSize_1 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", v2, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "screenBounds");
    objc_msgSend(v4, "setScale:forSizeClass:", objc_msgSend(v2, "sizeClass"), v5 / 162.0);
    v11 = &unk_24CF2D918;
    v10 = xmmword_21306B500;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v10, "{CGSize=dd}");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledSize:withOverrides:", v7, 77.5, 58.5);
    CDCornerComplicationKeylineSize__complicationSize_0 = v8;
    CDCornerComplicationKeylineSize__complicationSize_1 = v9;

  }
}

@end
