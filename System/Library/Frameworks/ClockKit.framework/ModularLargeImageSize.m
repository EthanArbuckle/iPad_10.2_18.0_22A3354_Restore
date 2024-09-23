@implementation ModularLargeImageSize

double ___ModularLargeImageSize_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = &unk_24CC16D98;
  v2 = (void *)MEMORY[0x24BDD1968];
  v3 = a2;
  objc_msgSend(v2, "valueWithCGSize:", 32.0, 11.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = &unk_24CC16DB0;
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 42.0, 14.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledSize:withOverrides:", v6, 37.0, 12.0);
  v8 = v7;

  return v8;
}

@end
