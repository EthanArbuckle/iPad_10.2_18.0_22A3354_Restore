@implementation WFRunExtensionActionUIKitUserInterface

- (id)excludedActivityTypes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[16];

  v10[15] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE8F6E0];
  v10[0] = *MEMORY[0x24BE8F6C8];
  v10[1] = v2;
  v3 = *MEMORY[0x24BE8F6B8];
  v10[2] = *MEMORY[0x24BE8F6F0];
  v10[3] = v3;
  v4 = *MEMORY[0x24BE8F6F8];
  v10[4] = *MEMORY[0x24BE8F6A8];
  v10[5] = v4;
  v5 = *MEMORY[0x24BE8F698];
  v10[6] = *MEMORY[0x24BE8F6A0];
  v10[7] = v5;
  v6 = *MEMORY[0x24BE8F688];
  v10[8] = *MEMORY[0x24BE8F700];
  v10[9] = v6;
  v7 = *MEMORY[0x24BE8F6E8];
  v10[10] = *MEMORY[0x24BE8F6D0];
  v10[11] = v7;
  v8 = *MEMORY[0x24BE8F690];
  v10[12] = *MEMORY[0x24BE8F6D8];
  v10[13] = v8;
  v10[14] = *MEMORY[0x24BE01120];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 15);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
