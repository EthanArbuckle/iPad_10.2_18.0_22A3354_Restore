@implementation RelevantQuantityTypes

void ___RelevantQuantityTypes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3560]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3530]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3558]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v0;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3388]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v1;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3698]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v2;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD36D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v3;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3528]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v4;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3538]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v5;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3540]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v6;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3548]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v7;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3550]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_RelevantQuantityTypes___relevantQuantityTypes;
  _RelevantQuantityTypes___relevantQuantityTypes = v10;

}

@end
