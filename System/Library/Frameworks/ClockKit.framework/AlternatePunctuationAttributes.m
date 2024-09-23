@implementation AlternatePunctuationAttributes

void ___AlternatePunctuationAttributes_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[2];
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BEBE188];
  v0 = *MEMORY[0x24BEBE1A0];
  v5[0] = *MEMORY[0x24BEBE1B0];
  v5[1] = v0;
  v6[0] = &unk_24CC17668;
  v6[1] = &unk_24CC17680;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_AlternatePunctuationAttributes___altPunctAttr;
  _AlternatePunctuationAttributes___altPunctAttr = v3;

}

@end
