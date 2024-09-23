@implementation CDCornerComplicationSize

void __CDCornerComplicationSize_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "sizeClass");
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    v3 = _avoniaComplicationSize(v2);
    v5 = v4;

    CDCornerComplicationSize__complicationSize_0 = *(_QWORD *)&v3;
    CDCornerComplicationSize__complicationSize_1 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", v2, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = &unk_24CF2D918;
    v17 = xmmword_21306B4C0;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v17, "{CGSize=dd}");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v18[1] = &unk_24CF2D960;
    v16 = xmmword_21306B4D0;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v16, "{CGSize=dd}");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v18[2] = &unk_24CF2D978;
    v15 = xmmword_21306B4E0;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v15, "{CGSize=dd}");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v9;
    v18[3] = &unk_24CF2D990;
    v14 = xmmword_21306B4F0;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v14, "{CGSize=dd}");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scaledSize:withOverrides:", v11, 77.5, 61.5);
    CDCornerComplicationSize__complicationSize_0 = v12;
    CDCornerComplicationSize__complicationSize_1 = v13;

  }
}

@end
