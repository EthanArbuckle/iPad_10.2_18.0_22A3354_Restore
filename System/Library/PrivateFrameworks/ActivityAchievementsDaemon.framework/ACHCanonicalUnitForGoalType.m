@implementation ACHCanonicalUnitForGoalType

void __ACHCanonicalUnitForGoalType_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = &unk_24D15B6A8;
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = &unk_24D15B6C0;
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = &unk_24D15B6D8;
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = &unk_24D15B6F0;
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)ACHCanonicalUnitForGoalType_unitByGoalType;
  ACHCanonicalUnitForGoalType_unitByGoalType = v4;

}

@end
