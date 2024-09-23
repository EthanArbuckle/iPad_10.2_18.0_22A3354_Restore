@implementation NPKTrackQRTransactionDetails

id __NPKTrackQRTransactionDetails_block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("transactionOrigin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("passStyle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = a1[5];
  v9[1] = v3;
  v9[2] = v4;
  v8[2] = CFSTR("lowPowerModeEnabled");
  v8[3] = CFSTR("familySetupMode");
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
