@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 2);
  v15[0] = &unk_24CFE36F0;
  v10 = vdupq_n_s64(0x4044000000000000uLL);
  v12 = v10;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v12, "{CGSize=dd}");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = &unk_24CFE3708;
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v11, "{CGSize=dd}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledSize:withOverrides:", v5, 40.0, 40.0);
  _LayoutConstants_constants_0 = v6;
  _LayoutConstants_constants_1 = v7;

  _LayoutConstants_constants_2 = 0x4039000000000000;
  v13[0] = &unk_24CFE36F0;
  v13[1] = &unk_24CFE3708;
  v14[0] = &unk_24CFE3770;
  v14[1] = &unk_24CFE3780;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v8, 4.0);
  _LayoutConstants_constants_3 = v9;

}

@end
