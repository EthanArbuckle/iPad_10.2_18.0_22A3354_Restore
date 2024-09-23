@implementation CDRichComplicationSemiboldFontDescriptor

void __CDRichComplicationSemiboldFontDescriptor_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BEBB528];
  v10[0] = *MEMORY[0x24BEBB590];
  v8[0] = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB610]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x24BEBB5D0];
  v9[0] = v1;
  v9[1] = *MEMORY[0x24BEBB5B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BEBB548];
  v11[0] = v2;
  v11[1] = MEMORY[0x24BDBD1A8];
  v4 = *MEMORY[0x24BEBB558];
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = *MEMORY[0x24BDC4E38];
  v11[2] = &unk_24CF2DB80;
  v11[3] = &unk_24CF2D7C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorWithFontAttributes:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)CDRichComplicationSemiboldFontDescriptor_fontDescriptor;
  CDRichComplicationSemiboldFontDescriptor_fontDescriptor = v6;

}

@end
